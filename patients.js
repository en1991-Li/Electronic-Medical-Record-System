/**
 * patients.js 
 * 功能：搜尋病患、切換編輯模式、模擬資料管理
 */

// 1. 模擬資料庫
const mockPatientData = {
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
        familyHistory: "父親有高血壓病史",
        medicalHistory: "yes",
        allergy: "盤尼西林 (Penicillin)"
    }
};

// 用來暫存目前的資料，以便取消編輯時還原
let currentLoadedData = null;

document.addEventListener('DOMContentLoaded', () => {
    console.log("✅ Patients 系統載入成功");

    // 取得主要按鈕與元素
    const searchBtn = document.getElementById('searchBtn');
    const searchInput = document.getElementById('patientSearchInput');
    const editBtn = document.getElementById('editPatientBtn');
    const saveBtn = document.getElementById('savePatientBtn');
    const cancelBtn = document.getElementById('cancelEditBtn');
    const logoutBtn = document.getElementById('logoutBtn');

    // --- 2. 搜尋按鈕功能 ---
    if (searchBtn) {
        searchBtn.addEventListener('click', () => {
            const keyword = searchInput.value.trim().toUpperCase();
            const data = mockPatientData[keyword];

            if (data) {
                currentLoadedData = data; // 存入暫存
                fillPatientForm(data);
                console.log("資料填充完成");
            } else {
                alert("查無此身分證字號，請試試輸入：A123456789");
            }
        });
    }

    // --- 3. 編輯模式切換 ---
    if (editBtn) {
        editBtn.addEventListener('click', () => {
            if (!currentLoadedData) {
                alert("請先搜尋並載入病患資料後再進行編輯");
                return;
            }
            toggleEditMode(true);
        });
    }

    // --- 4. 儲存與取消功能 ---
    if (saveBtn) {
        saveBtn.addEventListener('click', () => {
            alert("資料儲存成功！(此為模擬訊息)");
            toggleEditMode(false);
        });
    }

    if (cancelBtn) {
        cancelBtn.addEventListener('click', () => {
            if (confirm("確定要放棄修改嗎？")) {
                fillPatientForm(currentLoadedData); // 還原原始資料
                toggleEditMode(false);
            }
        });
    }

    // --- 5. 登出功能 ---
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
 * 切換表單編輯狀態
 * @param {boolean} isEditMode - 是否為編輯模式
 */
function toggleEditMode(isEditMode) {
    const inputs = document.querySelectorAll('.detail-input, .detail-select');
    const editBtn = document.getElementById('editPatientBtn');
    const saveBtn = document.getElementById('savePatientBtn');
    const cancelBtn = document.getElementById('cancelEditBtn');

    // 鎖定/解鎖所有輸入框
    inputs.forEach(input => input.disabled = !isEditMode);

    // 切換按鈕顯示狀態
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
 * 將資料填入 HTML 欄位
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
