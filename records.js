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
        
        if (!response.ok) throw new Error('查無資料');

        const data = await response.json();
        console.log("抓到的完整資料：", data); // 先在 F12 Console 確認資料內容

        // --- 1. 更新上方標頭 (使用 .innerText) ---
        document.getElementById('patientNameDisplay').innerText = data.PatientName || "未知姓名";
        document.getElementById('patientIdDisplay').innerText = `Patient ID: ${data.PatientID || '---'}`;

        // --- 2. 更新下方格子 (因為你的 HTML 是 <textarea> 或 <input>，要用 .value) ---
        
        // 過敏記錄區 (範例：把血型或備註塞進去看看)
        if (document.getElementById('allergen')) {
            document.getElementById('allergen').value = data.BloodType ? `血型：${data.BloodType}` : "無紀錄";
        }
        
        if (document.getElementById('allergySymptom')) {
            document.getElementById('allergySymptom').value = `聯絡電話：${data.PatientPhone || "無"}`;
        }

        if (document.getElementById('allergyNotes')) {
            document.getElementById('allergyNotes').value = `地址：${data.PatientAddress || "無"}`;
        }

        // --- 3. 處理日期 ---
        if (data.PatientBirth && document.getElementById('labTestDate')) {
            const date = new Date(data.PatientBirth).toLocaleDateString();
            document.getElementById('labTestDate').value = date;
        }

        alert("查詢成功！已更新畫面。");

    } catch (error) {
        console.error("錯誤：", error);
        alert("查詢出錯：" + error.message);
    }
}
