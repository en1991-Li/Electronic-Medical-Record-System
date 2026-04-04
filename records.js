// 測試載入狀況
console.log("✅ records.js 已成功載入");

document.addEventListener('DOMContentLoaded', () => {
    // 1. 取得 DOM 元素
    const searchBtn = document.getElementById('searchScheduleBtn'); // 檢查 HTML 裡 ID 是否為這個
    const searchInput = document.getElementById('patientSearchInput');
    const logoutBtn = document.getElementById('logoutBtn');

    // 2. 搜尋按鈕點擊監聽
    if (searchBtn) {
        searchBtn.addEventListener('click', () => {
            const patientId = searchInput.value.trim();
            if (!patientId) return alert("請輸入查詢 ID 或身分證字號");
            fetchPatientData(patientId);
        });
    }

    // 3. 支援 Enter 鍵查詢
    if (searchInput) {
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                const patientId = searchInput.value.trim();
                if (patientId) fetchPatientData(patientId);
            }
        });
    }

    // 4. 登出功能
if (logoutBtn) {
    logoutBtn.addEventListener('click', function() {
        if (confirm('確定要登出系統嗎？')) {
            localStorage.removeItem('isLoggedIn');
            localStorage.removeItem('userInfo');
            localStorage.removeItem('employeeId');
            localStorage.removeItem('userToken');

            alert('您已成功登出');
            // 使用 replace 替換掉歷史紀錄，防止按「上一頁」又跑回去
            window.location.replace('./index.html'); 
        }
    });
}
    
// --- 5. 資料抓取函數  ---
async function fetchPatientData(id) {
    try {
        // 如果目前是 Demo 階段，可以先用 mock 資料測試
        const response = await fetch(`/api/patients/${id}`);
        
        if (!response.ok) {
            if (response.status === 404) throw new Error('查無此病患紀錄');
            throw new Error('伺服器連線失敗');
        }

        const data = await response.json();
        console.log("接收到的完整資料：", data);

        // 更新畫面欄位
        updateRecordFields(data);

    } catch (error) {
        console.error("發生錯誤:", error);
        alert("查詢失敗：" + error.message);
        document.getElementById('patientNameDisplay').innerText = "查詢失敗";
    }
}

/**
 * 輔助函式：更新頁面欄位內容
 */
function updateRecordFields(data) {
    // 標頭
    document.getElementById('patientNameDisplay').innerText = data.PatientName || "未知病患";
    document.getElementById('patientIdDisplay').innerText = `Patient ID: ${data.PatientID || '---'}`;

    // 手術紀錄
    document.getElementById('surgeryName').value = data.SurgeryName || "無手術紀錄";
    document.getElementById('surgeryPart').value = data.SurgerySite || "";
    document.getElementById('surgerySuggestion').value = data.SurgerySuggestion || "";
    document.getElementById('surgeryComplications').value = data.Complications || "";

    // 住院日期
    document.getElementById('admissionDate').value = formatDate(data.AdmissionDate);
    document.getElementById('dischargeDate').value = formatDate(data.DischargeDate);
    
}

/**
 * 輔助函式：格式化日期 YYYY-MM-DD
 */
function formatDate(dateString) {
    if (!dateString) return "";
    const date = new Date(dateString);
    if (isNaN(date.getTime())) return dateString;
    return date.toISOString().split('T')[0];
}
