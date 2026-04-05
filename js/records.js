/**
 * records.js
 * 負責醫療紀錄頁面 (Records) 的資料搜尋與模擬填充
 */

// 1. 模擬醫療紀錄資料庫
const mockMedicalRecords = {
    "A123456789": {
        name: "王小豪",
        id: "A123456789",
        // 手術記錄
        surgeryName: "急性闌尾切除術 (Appendectomy)",
        surgeryPart: "右下腹部",
        surgerySuggestion: "術後需臥床休息 3 天，避免提重物，傷口需每日消毒並保持乾燥。",
        surgeryComplications: "無明顯併發症，僅有輕微術後發燒 (37.8°C)，已退燒。",
        // 住院記錄
        hospitalWard: "一般外科病房",
        hospitalBedName: "靠窗單人床",
        hospitalBedNumber: "502-B",
        hospitalStayDays: "5 天",
        admissionDate: "2026-03-10",
        dischargeDate: "2026-03-15",
        admissionReason: "急性腹痛伴隨反彈痛、發燒，確診為急性闌尾炎。",
        dischargeReason: "發炎指標 (WBC/CRP) 恢復正常，傷口癒合良好。",
        // 過敏記錄
        allergen: "盤尼西林 (Penicillin)",
        allergySymptom: "全身性紅疹、搔癢、呼吸急促",
        allergySeverity: "嚴重 (High)",
        allergyNotes: "絕對禁止使用青黴素類抗生素，已註記於病歷封面。",
        // 檢驗檢查
        labTestName: "血液常規檢查 (CBC) / C-反應蛋白 (CRP)",
        labTestDate: "2026-03-11",
        labTestResult: "WBC: 14,500/uL (↑), CRP: 52 mg/L (↑)",
        labTestSuggestion: "符合急性感染指標，術後三日需追蹤 CRP 數值直到降至 10 以下。"
    },
    "B123456789": {
        name: "李小華",
        id: "B123456789",
        surgeryName: "腹腔鏡膽囊切除術",
        surgeryPart: "上腹部",
        surgerySuggestion: "術後採低油飲食，初期建議少量多餐，觀察是否有黃疸。",
        surgeryComplications: "無",
        hospitalWard: "內科病房",
        hospitalBedName: "走道雙人床",
        hospitalBedNumber: "305-A",
        hospitalStayDays: "3 天",
        admissionDate: "2026-04-01",
        dischargeDate: "2026-04-04",
        admissionReason: "慢性膽囊炎合併膽結石反覆發作。",
        dischargeReason: "腹腔鏡微創傷口恢復良好，可正常進食。",
        allergen: "塵蟎、海鮮 (蝦、蟹)",
        allergySymptom: "打噴嚏、流鼻涕、局部蕁麻疹",
        allergySeverity: "中等 (Medium)",
        allergyNotes: "飲食避開帶殼海鮮，住院環境需注意空氣流通。",
        labTestName: "肝功能檢查 (AST / ALT)",
        labTestDate: "2026-04-01",
        labTestResult: "AST: 38, ALT: 42 (正常上限內)",
        labTestSuggestion: "數值穩定，可正常進行全身麻醉手術。"
    }
};

document.addEventListener('DOMContentLoaded', () => {
    console.log("✅ Records 系統邏輯載入成功");

    const searchInput = document.getElementById('patientSearchInput');
    const searchBtn = document.getElementById('searchPatientBtn');
    const logoutBtn = document.getElementById('logoutBtn');

    // --- 2. 搜尋核心功能 ---
    const performSearch = (id) => {
        const keyword = id.trim().toUpperCase();
        const data = mockMedicalRecords[keyword];

        if (data) {
            fillMedicalForm(data);
            console.log(`已成功載入 ${data.name} 的詳細紀錄`);
        } else {
            alert("查無此病患紀錄，請輸入正確的身分證字號。\n(測試範例：A123456789)");
        }
    };

    // 監聽查詢按鈕
    if (searchBtn) {
        searchBtn.addEventListener('click', () => performSearch(searchInput.value));
    }

    // 支援 Enter 鍵查詢
    if (searchInput) {
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') performSearch(searchInput.value);
        });
    }

    // --- 3. URL 參數自動抓取 (連動 Patients 頁面) ---
    const urlParams = new URLSearchParams(window.location.search);
    const idFromUrl = urlParams.get('id');
    if (idFromUrl) {
        searchInput.value = idFromUrl;
        performSearch(idFromUrl);
    }

    // --- 4. 登出功能 ---
    if (logoutBtn) {
        logoutBtn.addEventListener('click', () => {
            if (confirm('確定要登出系統嗎？')) {
                localStorage.clear();
                window.location.replace('./index.html');
            }
        });
    }
});

/**
 * 5. 將資料物件填入 HTML 對應 ID 的欄位
 */
function fillMedicalForm(data) {
    // 頂部標題顯示區
    document.getElementById('patientNameDisplay').innerText = data.name;
    document.getElementById('patientIdDisplay').innerText = `Patient ID: ${data.id}`;

    // 手術記錄
    document.getElementById('surgeryName').value = data.surgeryName;
    document.getElementById('surgeryPart').value = data.surgeryPart;
    document.getElementById('surgerySuggestion').value = data.surgerySuggestion;
    document.getElementById('surgeryComplications').value = data.surgeryComplications;

    // 住院記錄
    document.getElementById('hospitalWard').value = data.hospitalWard;
    document.getElementById('hospitalBedName').value = data.hospitalBedName;
    document.getElementById('hospitalBedNumber').value = data.hospitalBedNumber;
    document.getElementById('hospitalStayDays').value = data.hospitalStayDays;
    document.getElementById('admissionDate').value = data.admissionDate;
    document.getElementById('dischargeDate').value = data.dischargeDate;
    document.getElementById('admissionReason').value = data.admissionReason;
    document.getElementById('dischargeReason').value = data.dischargeReason;

    // 過敏記錄
    document.getElementById('allergen').value = data.allergen;
    document.getElementById('allergySymptom').value = data.allergySymptom;
    document.getElementById('allergySeverity').value = data.allergySeverity;
    document.getElementById('allergyNotes').value = data.allergyNotes;

    // 檢驗檢查
    document.getElementById('labTestName').value = data.labTestName;
    document.getElementById('labTestDate').value = data.labTestDate;
    document.getElementById('labTestResult').value = data.labTestResult;
    document.getElementById('labTestSuggestion').value = data.labTestSuggestion;
}
