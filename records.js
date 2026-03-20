document.addEventListener('DOMContentLoaded', () => {
    const searchBtn = document.getElementById('searchPatientBtn');
    const searchInput = document.getElementById('patientSearchInput');

    // 監聽查詢按鈕點擊
    searchBtn.addEventListener('click', () => {
        const patientId = searchInput.value.trim();
        if (!patientId) {
            alert("請輸入身分證字號或病歷號");
            return;
        }
        fetchPatientData(patientId);
    });

    // 支援按下 Enter 鍵查詢
    searchInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') fetchPatientData(searchInput.value.trim());
    });
});

async function fetchPatientData(id) {
    try {
        const response = await fetch(`/api/patients/${id}`);
        if (!response.ok) throw new Error('找不到病患');
        const data = await response.json();

        // 1. 基本資料 (innerText)
        document.getElementById('patientNameDisplay').innerText = data.PatientName;
        document.getElementById('patientIdDisplay').innerText = `Patient ID: ${data.PatientID}`;

        // 2. 手術紀錄 (value)
        document.getElementById('surgeryName').value = data.SurgeryName || "無手術紀錄";
        document.getElementById('surgeryPart').value = data.SurgerySite || ""; 
        document.getElementById('surgeryComplications').value = data.Complications || ""; 

        // 3. 住院紀錄 (value)
        document.getElementById('hospitalWard').value = data.HospitalWard || "未住院";
        document.getElementById('hospitalBedName').value = data.hospitalBedName || "";
        document.getElementById('hospitalBedNumber').value = data.hospitalBedNumber || "";
        document.getElementById('hospitalStayDays').value = data.hospitalStayDays || "0";
        document.getElementById('admissionReason').value = data.admissionReason || "";
        document.getElementById('dischargeReason').value = data.dischargeReason || "";

        // 日期處理
 if (data.AdmissionDate) {
    document.getElementById('admissionDate').value = new Date(data.AdmissionDate).toISOString().split('T')[0];
}
 if (data.DischargeDate) {
    document.getElementById('dischargeDate').value = new Date(data.DischargeDate).toISOString().split('T')[0];
}
        // 4. 過敏紀錄 (value)
        document.getElementById('allergen').value = data.Allergen || "無過敏紀錄";
        document.getElementById('allergySymptom').value = data.AllergySymptom || "";

        // 5. 檢驗檢查紀錄 (對應你 HTML 裡的 id)
if (data.TestName) {
    document.getElementById('TestName').value = data.TestName;
    document.getElementById('TestResult').value = data.TestResult || "尚無結果";
    document.getElementById('TestSuggestion').value = data.TestSuggestion || "無特別建議";
    
    // 處理檢驗日期
    if (data.TestDate) {
        const testDate = new Date(data.TestDate).toISOString().split('T')[0];
        document.getElementById('TestDate').value = testDate;
    }
} else {
    document.getElementById('TestName').value = "無檢驗紀錄";
}
    } catch (error) {
        alert(error.message);
    }
}
