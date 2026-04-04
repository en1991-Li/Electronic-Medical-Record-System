// 測試載入狀況
console.log("✅ records.js 已成功載入");

document.addEventListener('DOMContentLoaded', () => {
    // 1. 取得 DOM 元素
    const searchBtn = document.getElementById('searchPatientBtn'); 
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
                localStorage.clear(); // 清除所有登入資訊
                alert('您已成功登出');
                window.location.replace('./index.html'); 
            }
        });
    }
}); // DOMContentLoaded 結束

// --- 5. 資料抓取函數 (移出監聽器外，結構更清晰) ---
async function fetchPatientData(id) {
    try {
        console.log(`正在查詢 ID: ${id} ...`);
        
        
        // 開發測試階段可先改用本地模擬資料。
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
        document.getElementById('patientIdDisplay').innerText = "Patient ID: ---";
    }
}

/**
 * 輔助函式：更新頁面欄位內容
 */
function updateRecordFields(data) {
    // 標頭資訊
    document.getElementById('patientNameDisplay').innerText = data.PatientName || "未知病患";
    document.getElementById('patientIdDisplay').innerText = `Patient ID: ${data.PatientID || '---'}`;

    // A. 手術紀錄
    document.getElementById('surgeryName').value = data.SurgeryName || "無手術紀錄";
    document.getElementById('surgeryPart').value = data.SurgerySite || "";
    document.getElementById('surgerySuggestion').value = data.SurgerySuggestion || "";
    document.getElementById('surgeryComplications').value = data.Complications || "";

    // B. 住院記錄
    document.getElementById('hospitalWard').value = data.WardName || "";
    document.getElementById('hospitalBedName').value = data.BedName || "";
    document.getElementById('hospitalBedNumber').value = data.BedNumber || "";
    document.getElementById('hospitalStayDays').value = data.StayDays || "";
    document.getElementById('admissionDate').value = formatDate(data.AdmissionDate);
    document.getElementById('dischargeDate').value = formatDate(data.DischargeDate);
    document.getElementById('admissionReason').value = data.AdmissionReason || "";
    document.getElementById('dischargeReason').value = data.DischargeReason || "";

    // C. 過敏記錄
    document.getElementById('allergen').value = data.Allergen || "無過敏紀錄";
    document.getElementById('allergySymptom').value = data.AllergySymptom || "";
    document.getElementById('allergySeverity').value = data.AllergySeverity || "";
    document.getElementById('allergyNotes').value = data.AllergyNotes || "";

    // D. 檢驗檢查紀錄
    document.getElementById('labTestName').value = data.LabTestName || "無檢驗紀錄";
    document.getElementById('labTestDate').value = formatDate(data.LabTestDate);
    document.getElementById('labTestResult').value = data.LabTestResult || "";
    document.getElementById('labTestSuggestion').value = data.LabSuggestion || "";
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
