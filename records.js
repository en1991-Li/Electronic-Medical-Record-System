document.addEventListener('DOMContentLoaded', () => {
    const searchBtn = document.getElementById('searchPatientBtn');
    const searchInput = document.getElementById('patientSearchInput');
    const logoutBtn = document.getElementById('logoutBtn');

    // 監聽按鈕點擊
    searchBtn.addEventListener('click', () => {
        const patientId = searchInput.value.trim();
        if (!patientId) return alert("請輸入查詢 ID 或身分證字號");
        fetchPatientData(patientId);
    });

    // 支援 Enter 鍵查詢
    searchInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            const patientId = searchInput.value.trim();
            if (patientId) fetchPatientData(patientId);
        }
    });
});

if (logoutBtn) {
        logoutBtn.addEventListener('click', function() {
            // 1. 彈出確認視窗
            if (confirm('確定要登出系統嗎？')) {
                // 2. 清除登入狀態 (Session 或 LocalStorage)
                localStorage.removeItem('isLoggedIn');
                localStorage.removeItem('userToken'); // 如果你有存 Token
                localStorage.removeItem('employeeId'); // 清除員工 ID

                // 3. 跳轉回登入頁面
                alert('您已成功登出');
                window.location.href = 'index.html';
            }
        });
    }
});

async function fetchPatientData(id) {
    try {
        const response = await fetch(`/api/patients/${id}`);
        
        if (!response.ok) {
            if (response.status === 404) throw new Error('查無此病患紀錄');
            throw new Error('伺服器連線失敗');
        }

        const data = await response.json();
        console.log("接收到的完整資料：", data);

        // --- 1. 更新上方病患標頭 (使用 innerText) ---
        document.getElementById('patientNameDisplay').innerText = data.PatientName || "未知病患";
        document.getElementById('patientIdDisplay').innerText = `Patient ID: ${data.PatientID || '---'}`;

        // --- 2. 手術記錄 (使用 value) ---
        document.getElementById('surgeryName').value = data.SurgeryName || "無手術紀錄";
        document.getElementById('surgeryPart').value = data.SurgerySite || ""; // 對應 SQL 的 SurgerySite
        document.getElementById('surgerySuggestion').value = data.SurgerySuggestion || "";
        document.getElementById('surgeryComplications').value = data.Complications || ""; // 對應 SQL 的 Complications

        // --- 3. 住院記錄 (使用 value) ---
        document.getElementById('hospitalWard').value = data.HospitalWard || "";
        document.getElementById('hospitalBedName').value = data.hospitalBedName || "";
        document.getElementById('hospitalBedNumber').value = data.hospitalBedNumber || "";
        document.getElementById('hospitalStayDays').value = data.hospitalStayDays || "";
        document.getElementById('admissionReason').value = data.admissionReason || "";
        document.getElementById('dischargeReason').value = data.dischargeReason || "";

        // 處理住院日期 (格式化為 YYYY-MM-DD)
        document.getElementById('admissionDate').value = formatDate(data.AdmissionDate);
        document.getElementById('dischargeDate').value = formatDate(data.DischargeDate);

        // --- 4. 過敏記錄 (使用 value) ---
        document.getElementById('allergen').value = data.Allergen || "無紀錄";
        document.getElementById('allergySymptom').value = data.AllergySymptom || ""; // 對應 SQL 的 ReactionSymptoms
        document.getElementById('allergySeverity').value = data.AllergySeverity || ""; // 對應 SQL 的 Severity
        document.getElementById('allergyNotes').value = data.AllergyNotes || "";

        // --- 5. 檢驗檢查紀錄 (使用 value) ---
        document.getElementById('labTestName').value = data.TestName || "無檢驗紀錄";
        document.getElementById('labTestResult').value = data.TestResult || "";
        document.getElementById('labTestSuggestion').value = data.TestSuggestion || ""; // 對應 SQL 的 TestNotes
        document.getElementById('labTestDate').value = formatDate(data.TestDate);

    } catch (error) {
        console.error("發生錯誤:", error);
        alert(error.message);
        // 出錯時清空標頭
        document.getElementById('patientNameDisplay').innerText = "查詢失敗";
    }
}

/**
 * 輔助函式：將 SQL 日期字串格式化為 <input type="text"> 可讀的 YYYY-MM-DD
 */
function formatDate(dateString) {
    if (!dateString) return "";
    const date = new Date(dateString);
    if (isNaN(date.getTime())) return dateString; // 如果本來就是文字則直接回傳
    return date.toISOString().split('T')[0];
}
