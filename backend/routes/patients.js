const express = require('express');
const router = express.Router();
const db = require('../database');
const { authenticate, authorize } = require('../middleware/auth');

// 測試路由 - 確認路由是否正常
router.get('/test', (req, res) => {
  console.log('✅ /api/patients/test 路由正常');
  res.json({ message: 'Patients API 工作正常', status: 'success' });
});

// 搜尋病患
router.get('/search', authenticate, async (req, res) => {
  const { query } = req.query;

  console.log('🎯 收到搜尋請求，條件:', query);

  if (!query) {
    return res.status(400).json({ error: '請提供搜尋條件' });
  }

  let connection;
  try {
    console.log('🔗 連接資料庫...');
    connection = await db.getConnection();
    console.log('✅ 資料庫連線成功');

    const sql = `
      SELECT 
        p.PATIENTID as PATIENT_ID,
        p.PATIENTNAME as NAME,
        p.PATIENTGENDER as GENDER,
        DATE_FORMAT(p.PATIENTBIRTH, '%Y-%m-%d') as BIRTHDAY,
        p.BLOODTYPE as BLOOD_TYPE,
        p.PATIENTPHONE as PHONE,
        p.PATIENTADDRESS as ADDRESS,
        p.PATIENTIDENTITYNUMBER as ID_NUMBER,
        p.EMERGENCYPHONE as EMERGENCY_CONTACT,
        r.FAMILYHISTORY as FAMILY_HISTORY,
        r.HABITS as BAD_HABITS,
        r.ALLERGYHISTORY as ALLERGY
      FROM PATIENTS p
      LEFT JOIN RECORDS r ON p.PATIENTID = r.PATIENTID
      WHERE p.PATIENTNAME LIKE :query 
         OR p.PATIENTIDENTITYNUMBER LIKE :query
         OR p.PATIENTID LIKE :query
    `;

    const result = await connection.execute(sql, {
      query: `%${query}%`
    }, { outFormat: oracledb.OUT_FORMAT_OBJECT });

    console.log('✅ 查詢成功，找到', result.rows.length, '筆資料');

    res.json({ patients: result.rows });

  } catch (error) {
    console.error('❌ 搜尋病患失敗:', error);
    res.status(500).json({ error: '搜尋失敗: ' + error.message });
  } finally {
    if (connection) {
      try {
        await db.closeConnection(connection);
      } catch (closeError) {
        console.error('關閉連線錯誤:', closeError);
      }
    }
  }
});

// 更新病患資料 - 使用 PUT 方法
router.put('/:id', authenticate, async (req, res) => {
  const { id } = req.params;
  const patientData = req.body;

  console.log('📝 更新病患資料，ID:', id);
  console.log('📦 更新資料:', patientData);

  // 驗證必要欄位
  const requiredFields = ['name', 'gender', 'birthday', 'id_number'];
  const missingFields = requiredFields.filter(field => !patientData[field]);

  if (missingFields.length > 0) {
    return res.status(400).json({ 
      error: '缺少必要欄位', 
      missing: missingFields 
    });
  }

  let connection;
  try {
    connection = await db.getConnection();
    connection.autoCommit = false;

    console.log('🔄 更新 PATIENTS 表...');
    // 1. 更新 PATIENTS 表
    const updatePatientSql = `
      UPDATE PATIENTS SET 
        PATIENTNAME = ?,
        PATIENTGENDER = :gender,
        PATIENTBIRTH = STR_TO_DATE(:birthday, 'YYYY-MM-DD'),
        BLOODTYPE = :blood_type,
        PATIENTPHONE = :phone,
        PATIENTADDRESS = :address,
        PATIENTIDENTITYNUMBER = :id_number,
        EMERGENCYPHONE = :emergency_contact
      WHERE PATIENTID = :patient_id
    `;

    const patientResult = await connection.execute(updatePatientSql, {
      name: patientData.name,
      gender: patientData.gender,
      birthday: patientData.birthday,
      blood_type: patientData.blood_type || null,
      phone: patientData.phone || null,
      address: patientData.address || null,
      id_number: patientData.id_number,
      emergency_contact: patientData.emergency_contact || null,
      patient_id: id
    });

    console.log('✅ PATIENTS 表更新成功，影響行數:', patientResult.rowsAffected);

    // 2. 更新或插入 RECORDS 表
    console.log('🔄 處理 RECORDS 表...');
    const checkRecordSql = 'SELECT COUNT(*) as count FROM RECORDS WHERE PATIENTID = :patient_id';
    const recordResult = await connection.execute(checkRecordSql, { patient_id: id }, { outFormat: oracledb.OUT_FORMAT_OBJECT });

    const recordCount = recordResult.rows[0].COUNT;
    console.log('📊 RECORDS 表記錄數:', recordCount);

    if (recordCount > 0) {
      // 更新現有記錄
      const updateRecordSql = `
        UPDATE RECORDS SET 
          FAMILYHISTORY = :family_history,
          HABITS = :bad_habits,
          ALLERGYHISTORY = :allergy
        WHERE PATIENTID = :patient_id
      `;

      const recordUpdateResult = await connection.execute(updateRecordSql, {
        family_history: patientData.family_history || null,
        bad_habits: patientData.bad_habits || null,
        allergy: patientData.allergy || null,
        patient_id: id
      });

      console.log('✅ RECORDS 表更新成功，影響行數:', recordUpdateResult.rowsAffected);

    } else {
  // 插入新記錄
  console.log('🆕 插入新 RECORDS 記錄...');

  // 🚨 先檢查 RECORDS 表的完整結構
  console.log('🔍 檢查 RECORDS 表結構...');
  const tableStructure = await connection.execute(
    `SELECT column_name, data_type, nullable 
     FROM user_tab_columns 
     WHERE table_name = 'RECORDS' 
     ORDER BY column_id`,
    {},
    { outFormat: oracledb.OUT_FORMAT_OBJECT }
  );

  console.log('📊 RECORDS 表完整結構:');
  tableStructure.rows.forEach(col => {
    console.log(`   ${col.COLUMN_NAME} (${col.DATA_TYPE}) - NULLABLE: ${col.NULLABLE}`);
  });

  // 查詢最大的 RECORDSID
  const maxIdResult = await connection.execute(
    'SELECT NVL(MAX(RECORDSID), 0) + 1 as NEW_ID FROM RECORDS', 
    {}, 
    { outFormat: oracledb.OUT_FORMAT_OBJECT }
  );

  const newRecordsId = maxIdResult.rows[0].NEW_ID;
  console.log('🆔 新 RECORDSID:', newRecordsId);

  // 🚨 根據實際表結構動態建立 INSERT 語句
  const columns = [];
  const values = [];
  const bindParams = {};

  // 必填欄位
  columns.push('RECORDSID'); values.push(':records_id'); bindParams.records_id = newRecordsId;
  columns.push('PATIENTID'); values.push(':patient_id'); bindParams.patient_id = id;
  columns.push('APPOINTMENTID'); values.push(':appointment_id'); bindParams.appointment_id = 1; // 固定值

  // 可選欄位
  columns.push('FAMILYHISTORY'); values.push(':family_history'); bindParams.family_history = patientData.family_history || null;
  columns.push('HABITS'); values.push(':bad_habits'); bindParams.bad_habits = patientData.bad_habits || null;
  columns.push('ALLERGYHISTORY'); values.push(':allergy'); bindParams.allergy = patientData.allergy || null;

  const insertRecordSql = `
    INSERT INTO RECORDS (${columns.join(', ')})
    VALUES (${values.join(', ')})
  `;

  console.log('🔍 最終 INSERT SQL:', insertRecordSql);
  console.log('🔍 綁定參數:', bindParams);

  const recordInsertResult = await connection.execute(insertRecordSql, bindParams);

  console.log('✅ RECORDS 表插入成功，影響行數:', recordInsertResult.rowsAffected);
}

    // 提交交易
    await connection.commit();
    console.log('✅ 病患資料更新成功');

    res.json({ 
      success: true,
      message: '病患資料更新成功', 
      patient_id: id
    });

  } catch (error) {
    // 回滾交易
    if (connection) {
      try {
        await connection.rollback();
        console.log('🔙 交易已回滾');
      } catch (rollbackError) {
        console.error('回滾失敗:', rollbackError);
      }
    }
    console.error('❌ 更新病患失敗:', error);
    res.status(500).json({ 
      error: '更新失敗',
      details: error.message 
    });
  } finally {
    if (connection) {
      try {
        connection.autoCommit = true;
        await db.closeConnection(connection);
      } catch (closeError) {
        console.error('關閉連線錯誤:', closeError);
      }
    }
  }
});

// 刪除病患 - 使用 DELETE 方法
router.delete('/:id', authenticate, async (req, res) => {
  const { id } = req.params;

  console.log('🗑️ 刪除病患，ID:', id);

  // 檢查權限
  const allowedRoles = ['doctor', '醫師', 'DR', 'Doctor'];
  if (!allowedRoles.includes(req.user.role)) {
    return res.status(403).json({ 
      error: '權限不足，只有醫生可以刪除病患資料' 
    });
  }

  let connection;
  try {
    connection = await db.getConnection();
    connection.autoCommit = false;

    console.log('🔍 檢查病患是否存在...');
    const checkPatientSql = 'SELECT COUNT(*) as count FROM PATIENTS WHERE PATIENTID = :patient_id';
    const patientResult = await connection.execute(checkPatientSql, { patient_id: id }, { outFormat: oracledb.OUT_FORMAT_OBJECT });

    const patientCount = patientResult.rows[0].COUNT;
    console.log('   - 病患存在檢查結果:', patientCount);

    if (patientCount === 0) {
      return res.status(404).json({ error: '找不到要刪除的病患' });
    }

    // 步驟1: 刪除病歷相關表記錄
    console.log('🔄 刪除病歷相關記錄...');

    // 1.1 刪除手術記錄
    const deleteSurgerySql = 'DELETE FROM SURGERYRECORDS WHERE APPOINTMENTID IN (SELECT APPOINTMENTID FROM APPOINTMENTS WHERE PATIENTID = :patient_id)';
    const surgeryResult = await connection.execute(deleteSurgerySql, { patient_id: id });
    console.log('✅ SURGERYRECORDS 表刪除成功，影響行數:', surgeryResult.rowsAffected);

    // 1.2 刪除住院記錄
    const deleteHospSql = 'DELETE FROM HOSPITALIZATIONRECORDS WHERE "AppointmentID" IN (SELECT APPOINTMENTID FROM APPOINTMENTS WHERE PATIENTID = :patient_id)';
    const hospResult = await connection.execute(deleteHospSql, { patient_id: id });
    console.log('✅ HOSPITALIZATIONRECORDS 表刪除成功，影響行數:', hospResult.rowsAffected);

    // 1.3 刪除檢驗記錄
    const deleteTestsSql = 'DELETE FROM TESTS WHERE APPOINTMENTID IN (SELECT APPOINTMENTID FROM APPOINTMENTS WHERE PATIENTID = :patient_id)';
    const testsResult = await connection.execute(deleteTestsSql, { patient_id: id });
    console.log('✅ TESTS 表刪除成功，影響行數:', testsResult.rowsAffected);

    // 1.4 刪除過敏記錄
    const deleteAllergySql = 'DELETE FROM ALLERGYRECORDS WHERE PATIENTID = :patient_id';
    const allergyResult = await connection.execute(deleteAllergySql, { patient_id: id });
    console.log('✅ ALLERGYRECORDS 表刪除成功，影響行數:', allergyResult.rowsAffected);

    // 步驟2: 刪除 RECORDS 表相關記錄
    console.log('🔄 刪除 RECORDS 表相關記錄...');
    const deleteRecordsSql = 'DELETE FROM RECORDS WHERE PATIENTID = :patient_id';
    const recordsResult = await connection.execute(deleteRecordsSql, { patient_id: id });
    console.log('✅ RECORDS 表刪除成功，影響行數:', recordsResult.rowsAffected);

    // 步驟3: 刪除 APPOINTMENTS 表相關記錄
    console.log('🔄 刪除 APPOINTMENTS 表相關記錄...');
    const deleteAppointmentsSql = 'DELETE FROM APPOINTMENTS WHERE PATIENTID = :patient_id';
    const appointmentsResult = await connection.execute(deleteAppointmentsSql, { patient_id: id });
    console.log('✅ APPOINTMENTS 表刪除成功，影響行數:', appointmentsResult.rowsAffected);

    // 步驟4: 最後才刪除 PATIENTS 表的主記錄
    console.log('🔄 刪除 PATIENTS 表記錄...');
    const deletePatientSql = 'DELETE FROM PATIENTS WHERE PATIENTID = :patient_id';
    const patientDeleteResult = await connection.execute(deletePatientSql, { patient_id: id });
    console.log('✅ PATIENTS 表刪除成功，影響行數:', patientDeleteResult.rowsAffected);

    await connection.commit();
    console.log('✅ 病患及其所有相關資料刪除成功');

    res.json({ 
      success: true,
      message: '病患及其所有相關資料已刪除成功',
      deleted_patient_id: id,
      deleted_records: {
        surgery: surgeryResult.rowsAffected,
        hospitalization: hospResult.rowsAffected,
        tests: testsResult.rowsAffected,
        allergy: allergyResult.rowsAffected,
        records: recordsResult.rowsAffected,
        appointments: appointmentsResult.rowsAffected
      }
    });

  } catch (error) {
    if (connection) {
      try {
        await connection.rollback();
        console.log('🔙 交易已回滾');
      } catch (rollbackError) {
        console.error('回滾失敗:', rollbackError);
      }
    }
    console.error('❌ 刪除病患失敗:', error);
    res.status(500).json({ 
      error: '刪除失敗',
      details: error.message 
    });
  } finally {
    if (connection) {
      try {
        connection.autoCommit = true;
        await db.closeConnection(connection);
      } catch (closeError) {
        console.error('關閉連線錯誤:', closeError);
      }
    }
  }
});

module.exports = router;
