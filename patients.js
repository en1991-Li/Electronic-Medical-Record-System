/**
 * patients.js
 * 模擬病患詳細資料與表單操作邏輯
 */

// 1. 模擬病患資料庫
const mockPatientDetails = {
    "A123456789": {
        name: "王小明",
        gender: "M",
        birth: "1985-05-20",
        idNumber: "A123456789",
        phone: "0912-345-678",
        bloodType: "O",
        address: "台北市大安區敦化南路一段 100 號",
        emergencyPhone: "0922-111-222",
        badHabits: "偶爾吸菸 (一天約 5 根)",
        familyHistory: "父親有高血壓與糖尿病病史",
        medicalHistory: "yes",
        allergy: "盤尼西林 (Penicillin)"
    },
    "B223344556": {
        name: "李小華",
        gender: "F",
        birth: "1992-11-05",
        idNumber: "B223344556",
        phone: "0933-888-999",
        bloodType: "A",
        address: "台中市西屯區台灣大道三段 99 號",
        emergencyPhone: "04-2345-6789",
        badHabits: "無",
        familyHistory: "無特殊遺傳病史",
        medicalHistory: "none",
        allergy: "塵蟎、海鮮過敏"
    }
};

document.addEventListener('DOMContentLoaded', () => {
    console.log("✅ Patients 模擬系統載入成功");

    // 取得 DOM 元素
    const searchBtn = document.getElementById('searchBtn'); // 對應 HTML 的「搜尋」按鈕
    const searchInput = document.getElementById('patientSearchInput'); // 對應搜尋框
    const logoutBtn = document.getElementById('logoutBtn');
    const editBtn = document.getElementById('editPatientBtn'); // 對應「編輯資料」按鈕

    // --- 2. 搜尋邏輯 ---
    if (searchBtn) {
        searchBtn.addEventListener('click', () => {
            const keyword = searchInput.value.trim().toUpperCase();
            
            if (!keyword) {
                alert("請輸入病患姓名或身分證字號 (例如: A123456789)");
                return;
            }

            // 尋找資料 (這裡支援用 ID 搜尋)
            const data = mockPatientDetails[keyword];

            if (data) {
                fillPatientForm(data);
                console.log(`已找到病患：${data.name}`);
            } else {
                alert("查無此病患資料。您可以試試搜尋範例 ID：A123456789");
            }
        });
    }

    // --- 3. 編輯模式切換 ---
    if (editBtn) {
        editBtn.addEventListener('click', () => {
            const inputs = document.querySelectorAll('.detail-input, .detail-select');
            const saveBtn = document.getElementById('savePatientBtn');
            const cancelBtn = document.getElementById('cancelEditBtn');
            
            const isCurrentlyDisabled = inputs[0].disabled;

            // 切換輸入框狀態
            inputs.forEach(input => input.disabled = !isCurrentlyDisabled);

            // 切換按鈕文字與顯示隱藏
            if (isCurrentlyDisabled) {
                // 進入編輯模式
                editBtn.style.display = "none";
                if(saveBtn) saveBtn.style.display = "inline-block";
                if(cancelBtn) cancelBtn.style.display = "inline-block";
            }
        });
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

    // 支援按下 Enter 鍵直接搜尋
    if (searchInput) {
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') searchBtn.click();
        });
    }
});

/**
 * 5. 將模擬資料填入 HTML 表單欄位
 */
function fillPatientForm(data) {
    document.getElementById('patientName').value = data.name;
    document.getElementById('patientGender').value = data.gender;
    document.getElementById('patientBirth').value = data.birth;
    document.getElementById('patientIdentityNumber').value = data.idNumber;
    document.getElementById('patientPhone').value = data.phone;
    document.getElementById('patientBloodType').value = data.bloodType;
    document.getElementById('patientAddress').value = data.address;
    document.getElementById('EmergencyPhone').value = data.emergencyPhone;
    document.getElementById('patientBadHabits').value = data.badHabits;
    document.getElementById('patientFamilyHistory').value = data.familyHistory;
    document.getElementById('patientMedicalHistory').value = data.medicalHistory;
    document.getElementById('patientAllergy').value = data.allergy;
}
