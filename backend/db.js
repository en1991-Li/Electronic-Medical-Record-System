require('dotenv').config(); // 載入 .env 檔案中的變數
const mysql = require('mysql2');

// 建立連線池 (Pool)
const pool = mysql.createPool({
    host: process.env.DB_HOST,         // 從 .env 讀取
    user: process.env.DB_USER,         // 從 .env 讀取
    password: process.env.DB_PASSWORD, // 從 .env 讀取
    database: process.env.DB_NAME,     // 從 .env 讀取
    port: process.env.DB_PORT || 3306, // 若無設定則預設 3306
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// 使用 Promise 版本
const promisePool = pool.promise();

// 測試連線是否成功
pool.getConnection((err, connection) => {
    if (err) {
        console.error('❌ 資料庫連線失敗:', err.message);
    } else {
        console.log(`✅ 成功連結至 MySQL 資料庫 (${process.env.DB_NAME})`);
        connection.release();
    }
});

module.exports = promisePool;
