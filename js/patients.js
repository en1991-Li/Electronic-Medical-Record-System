/**
 * patients.js 
 * 功能：搜尋、編輯、重新整理、新增與刪除病患（模擬功能）
 */

// 1. 模擬資料庫
const mockPatientData = {
    "A123456789": {
        name: "王小豪",
        gender: "M",
        birth: "1985-05-20",
        idNumber: "A123456789",
        phone: "0912-345-678",
        bloodType: "O",
        address: "台北市大安區敦化南路一段 100 號",
        emergencyPhone: "0922-111-222",
        badHabits: "偶爾吸菸",
        familyHistory: "父親有高血壓病史",
        medicalHistory: "yes",
        allergy: "盤尼西林"
    },
    "B123456789": {
        name: "李小華",
        gender: "F",
        birth: "1992-11-05",
        idNumber: "B123456789",
        phone: "0933-888-999",
        bloodType: "A",
        address: "台中市西屯區台灣大道三段 99 號",
        emergencyPhone: "04-2345-6789",
        badHabits: "無",
        familyHistory: "無特殊遺傳病史",
        medicalHistory: "none",
        allergy: "海鮮過敏、塵蟎"
    }
};

let currentLoadedData = null;

document.addEventListener('DOMContentLoaded', () => {
    console.log("✅ Patients 系統功能已全面載入");

    // 取得所有按鈕元素
    const searchBtn = document.getElementById('searchBtn');
    const searchInput = document.getElementById('patientSearchInput');
    const refreshBtn = document.getElementById('refreshBtn');
    const newPatientBtn = document.getElementById('newPatientBtn');
    const deletePatientBtn = document.getElementById('deletePatientBtn');
    const editBtn = document.getElementById('editPatientBtn');
    const saveBtn = document.getElementById('savePatientBtn');
    const cancelBtn = document.getElementById('cancelEditBtn');
    const logoutBtn = document.getElementById('logoutBtn');

    // --- 2. 搜尋功能 ---
    if (searchBtn) {
        searchBtn.addEventListener('click', () => {
            const keyword = searchInput.value.trim().toUpperCase();
            const data = mockPatientData[keyword];
            if (data) {
                currentLoadedData = data;
                fillPatientForm(data);
                console.log(`已找到病患：${data.name}`);
            } else {
                alert("查無此身分證字號。\n測試範例：\n1. 王小豪 (A123456789)\n2. 李小華 (B223344556)");
            }
        });
    }

    // --- 3. 重新整理按鈕 ---
    if (refreshBtn) {
        refreshBtn.addEventListener('click', () => {
            if (confirm("確定要重新整理並清空目前畫面嗎？")) {
                searchInput.value = "";
                clearForm();
                currentLoadedData = null;
                toggleEditMode(false);
                console.log("頁面已重置");
            }
        });
    }

    // --- 4. 新增病患按鈕 ---
    if (newPatientBtn) {
        newPatientBtn.addEventListener('click', () => {
            clearForm(); // 清空欄位
            currentLoadedData = {}; // 給予空物件代表新資料
            toggleEditMode(true); // 直接進入編輯模式
            document.getElementById('patientName').focus(); // 聚焦到第一個欄位
            alert("已開啟新增模式，請填寫病患資料後按下儲存。");
        });
    }

    // --- 5. 刪除病患按鈕 ---
    if (deletePatientBtn) {
        deletePatientBtn.addEventListener('click', () => {
            if (!currentLoadedData || !currentLoadedData.idNumber) {
                alert("請先搜尋出特定病患後再執行刪除。");
                return;
            }
            if (confirm(`確定要刪除病患 ${currentLoadedData.name} 的所有資料嗎？此動作無法復原。`)) {
                alert("資料已從模擬資料庫中移除。");
                clearForm();
                currentLoadedData = null;
                searchInput.value = "";
            }
        });
    }

    // --- 6. 編輯、儲存與取消 ---
    if (editBtn) {
        editBtn.addEventListener('click', () => {
            if (!currentLoadedData) {
                alert("請先搜尋病患資料後再編輯");
                return;
            }
            toggleEditMode(true);
        });
    }

    if (saveBtn) {
        saveBtn.addEventListener('click', () => {
            alert("資料儲存成功！");
            toggleEditMode(false);
        });
    }

    if (cancelBtn) {
        cancelBtn.addEventListener('click', () => {
            if (currentLoadedData && currentLoadedData.name) {
                fillPatientForm(currentLoadedData);
            } else {
                clearForm();
            }
            toggleEditMode(false);
        });
    }

    // --- 7. 登出 ---
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
 * 工具函數：清空表單所有欄位
 */
function clearForm() {
    const inputs = document.querySelectorAll('.detail-input, .detail-select');
    inputs.forEach(input => input.value = "");
}

/**
 * 工具函數：切換編輯狀態
 */
function toggleEditMode(isEditMode) {
    const inputs = document.querySelectorAll('.detail-input, .detail-select');
    const editBtn = document.getElementById('editPatientBtn');
    const saveBtn = document.getElementById('savePatientBtn');
    const cancelBtn = document.getElementById('cancelEditBtn');

    inputs.forEach(input => input.disabled = !isEditMode);

    if (isEditMode) {
        editBtn.style.display = "none";
        saveBtn.style.display = "inline-block";
        cancelBtn.style.display = "inline-block";
    } else {
        editBtn.style.display = "inline-block";
        saveBtn.style.display = "none";
        cancelBtn.style.display = "none";
    }
}

/**
 * 工具函數：填入資料
 */
function fillPatientForm(data) {
    document.getElementById('patientName').value = data.name || "";
    document.getElementById('patientGender').value = data.gender || "";
    document.getElementById('patientBirth').value = data.birth || "";
    document.getElementById('patientIdentityNumber').value = data.idNumber || "";
    document.getElementById('patientPhone').value = data.phone || "";
    document.getElementById('patientBloodType').value = data.bloodType || "";
    document.getElementById('patientAddress').value = data.address || "";
    document.getElementById('EmergencyPhone').value = data.emergencyPhone || "";
    document.getElementById('patientBadHabits').value = data.badHabits || "";
    document.getElementById('patientFamilyHistory').value = data.familyHistory || "";
    document.getElementById('patientMedicalHistory').value = data.medicalHistory || "";
    document.getElementById('patientAllergy').value = data.allergy || "";
}
