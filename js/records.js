/**
 * records.js
 * 負責病歷紀錄頁面的模擬資料搜尋與自動填充
 */

// 1. 擴充模擬資料庫 (包含多位病患以供測試)
const mockMedicalRecords = {
    "A123456789": {
        PatientName: "王小豪",
        PatientID: "A123456789",
        SurgeryName: "急性闌尾切除術",
        SurgerySite: "右下腹部",
        SurgerySuggestion: "術後需臥床休息 3 天，避免搬運重物，定期更換敷料。",
        Complications: "無明顯併發症，僅輕微術後發燒",
        WardName: "一般外科病房 502",
        BedName: "靠窗位",
        BedNumber: "B1",
        StayDays: "5",
        AdmissionDate: "2026-03-10",
        DischargeDate: "2026-03-15",
        AdmissionReason: "急性腹痛伴隨發燒（闌尾炎）",
        DischargeReason: "傷口癒合良好，發炎指標恢復正常",
        Allergen: "盤尼西林 (Penicillin)",
        AllergySymptom: "皮膚紅疹、呼吸急促",
        AllergySeverity: "High",
        AllergyNotes: "禁止使用所有青黴素類藥物",
        LabTestName: "血液常規檢查 (CBC) / CRP",
        LabTestDate: "2026-03-11",
        LabTestResult: "WBC: 12,500 (偏高), CRP: 45 (陽性)",
        LabSuggestion: "符合急性感染特徵，建議抗生素治療"
    },
    "B123456789": {
        PatientName: "李小華",
        PatientID: "B123456789",
        SurgeryName: "腹腔鏡膽囊切除術",
        SurgerySite: "上腹部",
        SurgerySuggestion: "術後採低油飲食，觀察是否有黃疸現象。",
        Complications: "無",
        WardName: "一般外科病房 305",
        BedName: "走道位",
        BedNumber: "A2",
        StayDays: "3",
        AdmissionDate: "2026-04-01",
        DischargeDate: "2026-04-04",
        AdmissionReason: "慢性膽囊炎反覆發作",
        DischargeReason: "術後恢復順利",
        Allergen: "塵蟎、海鮮",
        AllergySymptom: "打噴嚏、流鼻涕",
        AllergySeverity: "Low",
        AllergyNotes: "日常護理注意通風即可",
        LabTestName: "肝功能檢查 (AST/ALT)",
        LabTestDate: "2026-04-01",
        LabTestResult: "AST: 35, ALT: 40 (正常範圍)",
        LabSuggestion: "肝功能數值正常，可安排手術"
    }
};

document.addEventListener('DOMContentLoaded', () => {
    console.log("✅ Records 系統載入成功");

    const searchInput = document.getElementById('patientID'); // 搜尋框
    const searchBtn = document.querySelector('.btn-search'); // 搜尋按鈕
    const logoutBtn = document.getElementById('logoutBtn');

    // --- 2. 核心功能：搜尋並填充 ---
    const performSearch = (id) => {
        const keyword = id.trim().toUpperCase();
        const data = mockMedicalRecords[keyword];

        if (data) {
            updateRecordFields(data);
            console.log(`成功載入 ${data.PatientName} 的病歷資料`);
        } else {
            alert("查無此病患 ID，請試試：A123456789");
        }
    };

    // 監聽按鈕點擊
    if (searchBtn) {
        searchBtn.addEventListener('click', () => {
            performSearch(searchInput.value);
        });
    }

    // 支援 Enter 鍵搜尋
    if (searchInput) {
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') performSearch(searchInput.value);
        });
    }

    // --- 3. 自動抓取網址參數 (從 Patients 頁面連動過來) ---
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
 * 5. 根據資料物件填充所有 HTML 欄位
 */
function updateRecordFields(data) {
    // 病患基本資料
    document.getElementById('PatientName').value = data.PatientName;
    document.getElementById('PatientID_Display').value = data.PatientID; // 注意：對應你的 HTML ID

    // 手術紀錄
    document.getElementById('SurgeryName').value = data.SurgeryName;
    document.getElementById('SurgerySite').value = data.SurgerySite;
    document.getElementById('SurgerySuggestion').value = data.SurgerySuggestion;
    document.getElementById('Complications').value = data.Complications;

    // 住院資訊
    document.getElementById('WardName').value = data.WardName;
    document.getElementById('BedName').value = data.BedName;
    document.getElementById('BedNumber').value = data.BedNumber;
    document.getElementById('StayDays').value = data.StayDays;
    document.getElementById('AdmissionDate').value = data.AdmissionDate;
    document.getElementById('DischargeDate').value = data.DischargeDate;
    document.getElementById('AdmissionReason').value = data.AdmissionReason;
    document.getElementById('DischargeReason').value = data.DischargeReason;

    // 過敏與檢驗
    document.getElementById('Allergen').value = data.Allergen;
    document.getElementById('AllergySymptom').value = data.AllergySymptom;
    document.getElementById('AllergySeverity').value = data.AllergySeverity;
    document.getElementById('AllergyNotes').value = data.AllergyNotes;
    document.getElementById('LabTestName').value = data.LabTestName;
    document.getElementById('LabTestDate').value = data.LabTestDate;
    document.getElementById('LabTestResult').value = data.LabTestResult;
    document.getElementById('LabSuggestion').value = data.LabSuggestion;
}
