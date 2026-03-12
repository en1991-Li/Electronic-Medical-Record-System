const express = require('express');
const router = express.Router();
const db = require('../db'); // 確保指向你合併後的 MySQL db.js

// 簡化登入（實際應該用密碼驗證）
router.post('/login', async (req, res) => {
    const { staffId } = req.body;

    if (!staffId) {
        return res.status(400).json({ error: '請提供員工編號' });
    }

    try {
        // MySQL 查詢語法：使用 ? 作為佔位符
        const sql = 'SELECT STAFFID, STAFFNAME, STAFFROLE FROM STAFF WHERE STAFFID = ?';
        const [rows] = await db.query(sql, [staffId]);

        // 檢查是否有找到使用者
        if (rows.length === 0) {
            return res.status(401).json({ error: '使用者不存在' });
        }

        const user = rows[0];

        // 回傳使用者資訊
        res.json({
            message: '登入成功',
            user: {
                staffId: user.STAFFID,
                username: user.STAFFNAME,
                role: user.STAFFROLE
            }
        });

    } catch (error) {
        console.error('❌ 登入失敗:', error.message);
        res.status(500).json({ error: '伺服器內部錯誤，登入失敗' });
    }
    // 注意：使用 mysql2 pool.promise() 不需要手動關閉連線，Pool 會自動管理
});

module.exports = router;
