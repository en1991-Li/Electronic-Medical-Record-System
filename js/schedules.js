/**
 * schedules.js
 * 負責處理排程頁面的查詢、資料顯示與登出功能
 */

// 1. 模擬資料庫 (Mock Data) - 供 Demo 演示使用
const mockSchedules = {
    "P001": {
        deptId: "CARD-01",
        deptName: "心臟內科",
        deptDesc: "專注於心血管疾病診治，包含高血壓、心律不整及冠狀動脈疾病之長期追蹤與手術評估。",
        staffName: "李小恩",
        staffGender: "M",
        staffTitle: "主治醫師",
        staffExperience: "12 年",
        scheduleDate: "2026-04-01",
        staffId: "STF-882",
        scheduleSlot: "morning"
    },
    "P002": {
        deptId: "SURG-05",
        deptName: "一般外科",
        deptDesc: "提供各類腹腔手術、創傷處理及門診手術諮詢。",
        staffName: "陳志明",
        staffGender: "M",
        staffTitle: "副院長",
        staffExperience: "25 年",
        scheduleDate: "2026-04-02",
        staffId: "STF-102",
        scheduleSlot: "afternoon"
    }
};

document.addEventListener('DOMContentLoaded', () => {
    console.log("✅ schedules.js 已成功載入");

    // --- 2. 取得 DOM 元素 ---
    const searchBtn = document.getElementById('scheduleSearchBtn');
    const searchInput = document.getElementById('scheduleSearchInput');
    const logoutBtn = document.getElementById('logoutBtn');

    // --- 3. 查詢按鈕點擊事件 ---
    if (searchBtn) {
        searchBtn.addEventListener('click', () => {
            const patientId = searchInput.value.trim().toUpperCase();
            if (!patientId) {
                alert("請輸入 Patient ID (例如: P001)");
                return;
            }
            fetchScheduleData(patientId);
        });
    }

    // --- 4. 支援 Enter 鍵查詢 ---
    if (searchInput) {
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                searchBtn.click();
            }
        });
    }

    // --- 5. 登出功能 (導覽列按鈕) ---
    if (logoutBtn) {
        logoutBtn.addEventListener('click', () => {
            if (confirm('確定要登出系統嗎？')) {
                localStorage.clear(); // 清除登入快取
                alert('您已成功登出');
                window.location.replace('./index.html'); // 跳轉回登入首頁
            }
        });
    }
});

/**
 * 6. 資料抓取與填充函數
 * @param {string} id - 病患 ID
 */
async function fetchScheduleData(id) {
    try {
        console.log(`正在查詢 ID: ${id} ...`);

        // 模擬網路延遲效果 (0.5秒)
        setTimeout(() => {
            // 檢查模擬資料庫中是否有該 ID，若無則提供預設資料 P001
            const data = mockSchedules[id] || mockSchedules["P001"];

            // --- 開始填充欄位 ---
            
            // 第一欄：科別
            document.getElementById('deptId').value = data.deptId;
            document.getElementById('deptName').value = data.deptName;
            document.getElementById('deptDesc').value = data.deptDesc;

            // 第二欄：員工基本資料
            document.getElementById('staffName').value = data.staffName;
            document.getElementById('staffGender').value = data.staffGender;
            document.getElementById('staffTitle').value = data.staffTitle;
            document.getElementById('staffExperience').value = data.staffExperience;

            // 第三欄：時間排程
            document.getElementById('scheduleDate').value = data.scheduleDate;
            document.getElementById('staffId').value = data.staffId;
            document.getElementById('scheduleSlot').value = data.scheduleSlot;

            console.log("✅ 資料已成功更新至畫面");
            
            // 若為預設資料，給予提示
            if (!mockSchedules[id]) {
                alert(`查無 ID "${id}"，已為您顯示範例排程資料。`);
            }

        }, 500);

    } catch (error) {
        console.error("發生錯誤:", error);
        alert("查詢發生未知錯誤");
    }
}

/**
 * 7. 底部動作按鈕 (確認登記/取消重填) 的簡易監聽
 */
document.addEventListener('click', (e) => {
    if (e.target.classList.contains('btn-action-green')) {
        alert("登記資料已成功傳送至伺服器！");
    }
    if (e.target.classList.contains('btn-action-red')) {
        if(confirm("確定要清空所有欄位嗎？")) {
            const inputs = document.querySelectorAll('.form-item input, .form-item textarea, .form-item select');
            inputs.forEach(input => input.value = "");
        }
    }
});
