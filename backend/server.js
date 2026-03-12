require('dotenv').config();
const express = require('express');
const cors = require('cors');
const path = require('path');
const db = require('./db'); // 確保指向你合併後的 MySQL db.js

const app = express();
const PORT = process.env.PORT || 3001;

// --- 中間件設定 ---
app.use(cors());
app.use(express.json());
// 這裡假設你的前端資料夾位在專案根目錄的上一層或是同層，請根據實際結構調整
app.use(express.static(path.join(__dirname, '../frontend'))); 

// 請求日誌
app.use((req, res, next) => {
    console.log(`📨 [${new Date().toLocaleTimeString()}] ${req.method} ${req.url}`);
    next();
});

// --- API 路由 ---

// 1. 測試連線
app.get('/api/test', async (req, res) => {
    try {
        await db.query('SELECT 1');
        res.json({ message: 'MySQL API 測試成功!', database: process.env.DB_NAME });
    } catch (err) {
        res.status(500).json({ error: '資料庫連線失敗', details: err.message });
    }
});

// 2. 搜尋病患
app.get('/api/patients/search', async (req, res) => {
    const { query } = req.query;
    if (!query) return res.status(400).json({ error: '請提供搜尋條件' });

    try {
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
            WHERE p.PATIENTNAME LIKE ? 
               OR p.PATIENTIDENTITYNUMBER LIKE ?
               OR p.PATIENTID LIKE ?
        `;
        const searchTerm = `%${query}%`;
        const [rows] = await db.query(sql, [searchTerm, searchTerm, searchTerm]);
        res.json({ patients: rows });
    } catch (error) {
        console.error('❌ 搜尋失敗:', error);
        res.status(500).json({ error: '搜尋失敗' });
    }
});

// 3. 查詢病歷 (整合 Surgery, Hospitalization, Allergy, Lab)
app.get('/api/records/:patientId', async (req, res) => {
    const { patientId } = req.params;
    try {
        // 使用 Promise.all 同時執行多個查詢，效率更高
        const [surgery] = await db.query(
            `SELECT s.SURGERYNAME, s.SURGERYSITE as SURGERYPART, s.STAFFNOTES as NOTE, s.COMPLICATIONS 
             FROM SURGERYRECORDS s
             JOIN APPOINTMENTS a ON s.APPOINTMENTID = a.APPOINTMENTID
             WHERE a.PATIENTID = ?`, [patientId]
        );

        const [hosp] = await db.query(
            `SELECT h.WardArea as WARDNAME, h.BedNum as BEDNAME, h.RoomNum as BEDNUMBER, 
                    h.LengthOfStay as STAYDAYS, h.AdmissionDate as ADMISSIONDATE, h.ActualDischargeDate as DISCHARGEDATE,
                    h.AdmissionDiagnosis as ADMISSIONREASON, h.DischargeDiagnosis as DISCHARGEREASON
             FROM HOSPITALIZATIONRECORDS h
             JOIN APPOINTMENTS a ON h.AppointmentID = a.APPOINTMENTID 
             WHERE a.PATIENTID = ?`, [patientId]
        );

        const [allergy] = await db.query(
            `SELECT ALLERGEN, REACTIONSYMPTOMS as SYMPTOM, SEVERITY, ALLERGYNOTES as NOTES
             FROM ALLERGYRECORDS WHERE PATIENTID = ?`, [patientId]
        );

        const [lab] = await db.query(
            `SELECT t.TESTNAME, t.TESTDATE, t.TESTRESULT, t.TESTNOTES as SUGGESTION
             FROM TESTS t
             JOIN APPOINTMENTS a ON t.APPOINTMENTID = a.APPOINTMENTID
             WHERE a.PATIENTID = ?`, [patientId]
        );

        res.json({
            surgery: surgery[0] || null,
            hospitalization: hosp[0] || null,
            allergy: allergy[0] || null,
            labTest: lab[0] || null
        });
    } catch (err) {
        console.error('❌ 查詢病歷失敗:', err);
        res.status(500).json({ error: '查詢失敗' });
    }
});

// --- 靜態頁面路由 ---
app.get('/', (req, res) => res.sendFile(path.join(__dirname, '../frontend/patients.html')));
app.get('/patients', (req, res) => res.sendFile(path.join(__dirname, '../frontend/patients.html')));
app.get('/records', (req, res) => res.sendFile(path.join(__dirname, '../frontend/records.html')));

// 啟動伺服器
app.listen(PORT, () => {
    console.log('='.repeat(50));
    console.log(`🏥 醫院管理系統運行中: http://localhost:${PORT}`);
    console.log(`📡 測試 API: http://localhost:${PORT}/api/test`);
    console.log('='.repeat(50));
});
