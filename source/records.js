console.log('✅✅✅ 正在執行 MySQL 版 records.js 檔案 ✅✅✅');

const express = require('express');
const router = express.Router();
const db = require('../database'); // 確保你的 database.js 已配置為 mysql2
const { authenticate } = require('../middleware/auth');

// GET /api/records/:patientId - 查詢特定病患的所有病歷
router.get('/:patientId', authenticate, async (req, res) => {
    const { patientId } = req.params;

    try {
        console.log(`🔍 查詢病患 ${patientId} 的 MySQL 病歷記錄...`);

        // 使用 Promise.all 平行查詢 (MySQL 使用 ? 作為參數占位符)
        const [surgeryRows, hospRows, allergyRows, labRows] = await Promise.all([
            // 1. 手術記錄 (假設表名為 SURGERYRECORDS)
            db.query(
                `SELECT s.SurgeryName as SURGERYNAME, s.SurgeryPart as SURGERYPART, 
                        s.Instructions as SUGGESTION, s.Complications as COMPLICATIONS
                 FROM SURGERYRECORDS s
                 JOIN APPOINTMENTS a ON s.AppointmentID = a.APPOINTMENTID
                 WHERE a.PATIENTID = ?`, [patientId]
            ),
            // 2. 住院記錄
            db.query(
                `SELECT h.WardArea as WARDNAME, h.BedNum as BEDNAME, h.RoomNum as BEDNUMBER,
                        h.LengthOfStay as STAYDAYS, h.AdmissionDate as ADMISSIONDATE, 
                        h.ActualDischargeDate as DISCHARGEDATE,
                        h.AdmissionDiagnosis as ADMISSIONREASON, h.DischargeDiagnosis as DISCHARGEREASON
                 FROM hospitalizationrecords h
                 JOIN appointments a ON h.AppointmentID = a.AppointmentID
                 WHERE a.PatientID = ?`, [patientId]
            )
            
            // 3. 過敏記錄 (修正欄位名稱以匹配 SQL)
            db.query(
                    `SELECT Allergen, ReactionSymptoms as SYMPTOM, Severity, AllergyNotes as NOTES
                     FROM allergyrecords 
                     WHERE PatientID = ?`, [patientId]
                ),
            // 4. 檢驗記錄
            db.query(
                `SELECT t.TESTNAME, t.TESTDATE, t.TESTRESULT, t.TESTNOTES as SUGGESTION
                 FROM TESTS t
                 JOIN APPOINTMENTS a ON t.APPOINTMENTID = a.APPOINTMENTID
                 WHERE a.PATIENTID = ?`, [patientId]
            )
        ]);

        // mysql2 回傳格式為 [rows, fields]，所以取第一個元素
        const result = {
            surgery: surgeryRows[0][0] || null,
            hospitalization: hospRows[0][0] || null,
            allergy: allergyRows[0][0] || null,
            labTest: labRows[0][0] || null
        };

        if (Object.values(result).every(val => val === null)) {
            return res.status(404).json({ message: '找不到該病患的任何病歷記錄' });
        }

        res.json(result);
    } catch (err) {
        console.error('❌ MySQL 查詢失敗:', err);
        res.status(500).json({ error: '伺服器內部錯誤' });
    }
});

// DELETE /api/records/:patientId
router.delete('/:patientId', authenticate, async (req, res) => {
    const { patientId } = req.params;
    const connection = await db.getConnection(); // 獲取連線以支持 Transaction

    try {
        await connection.beginTransaction();
        console.log(`🗑️ 正在刪除病患 ${patientId} 的 MySQL 記錄...`);

        // 子查詢刪除模式
        const subQuery = `SELECT APPOINTMENTID FROM APPOINTMENTS WHERE PATIENTID = ?`;

        await connection.query(`DELETE FROM SURGERYRECORDS WHERE AppointmentID IN (${subQuery})`, [patientId]);
        await connection.query(`DELETE FROM HOSPITALIZATIONRECORDS WHERE AppointmentID IN (${subQuery})`, [patientId]);
        await connection.query(`DELETE FROM TESTS WHERE AppointmentID IN (${subQuery})`, [patientId]);
        await connection.query(`DELETE FROM ALLERGYRECORDS WHERE PATIENTID = ?`, [patientId]);

        await connection.commit();
        res.json({ success: true, message: 'MySQL 數據刪除成功' });
    } catch (err) {
        await connection.rollback();
        console.error('❌ 刪除失敗:', err);
        res.status(500).json({ error: '刪除過程出錯' });
    } finally {
        connection.release();
    }
});

module.exports = router;
