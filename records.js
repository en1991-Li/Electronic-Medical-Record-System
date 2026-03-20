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
        // 呼叫你的 Node.js API
        const response = await fetch(`/api/patients/${id}`);
        
        if (!response.ok) {
            if (response.status === 404) throw new Error('查無此病患紀錄');
            throw new Error('伺服器連線失敗');
        }

        const data = await response.json();

        // --- 開始填入資料 ---
        
        // 1. 更新上方標頭
        document.getElementById('patientNameDisplay').innerText = data.PatientName;
        document.getElementById('patientIdDisplay').innerText = `Patient ID: ${data.PatientID}`;

        // 2. 更新過敏記錄 (舉例，請對照你的資料庫欄位名)
        // 假設你資料庫有這些欄位，如果沒有，會顯示 "無"
        document.getElementById('allergen').value = data.Allergen || "無紀錄";
        document.getElementById('allergySymptom').value = data.AllergySymptom || "無";
        
        // 3. 更新基本資料或其他欄位
        // 注意：HTML 裡的 <textarea> 和 <input> 要用 .value 賦值，而不是 .innerText
        if(data.BloodType) {
            document.getElementById('allergyNotes').value = `血型：${data.BloodType}`;
        }

        // 提示成功
        console.log("資料加載成功:", data);

    } catch (error) {
        console.error("錯誤詳情:", error);
        alert(error.message);
        // 清空顯示
        document.getElementById('patientNameDisplay').innerText = "查詢失敗";
    }
}
