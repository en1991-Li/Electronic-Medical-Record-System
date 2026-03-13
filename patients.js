// patients.js - 病患頁面功能
const API_BASE_URL = '/api';

let currentPatientId = null;
let currentUser = null;
let originalPatientData = null; 

document.addEventListener('DOMContentLoaded', function() {
    checkLoginStatus(); // 檢查登入
    
    // --- 綁定按鈕 ---
    const newPatientBtn = document.getElementById('newPatientBtn');
    const saveBtn = document.getElementById('savePatientBtn');
    const cancelBtn = document.getElementById('cancelEditBtn');
    const editBtn = document.getElementById('editPatientBtn');

    // 點擊新增病患
    if (newPatientBtn) {
        newPatientBtn.addEventListener('click', function() {
            const allInputs = document.querySelectorAll('.detail-input, .detail-select');
            allInputs.forEach(input => {
                input.value = '';
                input.disabled = false;
            });
            saveBtn.style.display = 'inline-block';
            cancelBtn.style.display = 'inline-block';
            alert('請輸入病患資料');
        });
    }

    // 點擊儲存變更 (修改成以下邏輯)
    if (saveBtn) {
        saveBtn.addEventListener('click', savePatientLocal); 
    }
});

    function checkLoginStatus() {
    const userInfo = localStorage.getItem('userInfo');
    if (!userInfo) {
        alert('請先登入！');
        window.location.href = 'index.html';
        return;
    }
    currentUser = JSON.parse(userInfo);
    const reminder = document.querySelector('.reminder-text');
    if (reminder) {
        reminder.innerHTML = `<strong>${currentUser.roleName || '人員'}您好！</strong> 員工ID: ${currentUser.employeeId}`;
    }
}

function bindEvents() {
    document.getElementById('searchBtn').addEventListener('click', searchPatient);
    document.getElementById('editPatientBtn').addEventListener('click', () => toggleEditMode(true));
    document.getElementById('cancelEditBtn').addEventListener('click', cancelEditing);
    document.getElementById('savePatientBtn').addEventListener('click', savePatient);
    document.getElementById('deletePatientBtn').addEventListener('click', deletePatient);
}

// 搜尋功能
async function searchPatient() {
    const query = document.getElementById('searchInput').value.trim();
    if (!query) return alert('請輸入搜尋內容');

    try {
        const response = await fetch(`${API_BASE_URL}/patients/${encodeURIComponent(query)}`);
        if (!response.ok) throw new Error('找不到病患資料');

        const patient = await response.json();
        fillPatientForm(patient);

        // 根據權限顯示按鈕
        document.getElementById('editPatientBtn').style.display = (['doctor', 'therapist'].includes(currentUser.role)) ? 'inline-block' : 'none';
        document.getElementById('deletePatientBtn').style.display = (currentUser.role === 'doctor') ? 'inline-block' : 'none';
    } catch (err) {
        alert(err.message);
    }
}

// 填入表單 (對應最新 HTML ID)
function fillPatientForm(p) {
    currentPatientId = p.ID_NUMBER; // 以身份證字號作為唯一辨識
    document.getElementById('patientName').value = p.NAME || '';
    document.getElementById('patientGender').value = p.GENDER || '';
    document.getElementById('patientBirth').value = p.BIRTHDATE ? p.BIRTHDATE.split('T')[0] : '';
    document.getElementById('patientIdentityNumber').value = p.ID_NUMBER || '';
    document.getElementById('patientPhone').value = p.PHONE || '';
    document.getElementById('patientBloodType').value = p.BLOOD_TYPE || '';
    document.getElementById('patientAddress').value = p.ADDRESS || '';
    document.getElementById('EmergencyPhone').value = p.EMERGENCY_PHONE || '';
    document.getElementById('patientBadHabits').value = p.BAD_HABITS || '';
    document.getElementById('patientFamilyHistory').value = p.FAMILY_HISTORY || '';
    document.getElementById('patientAllergy').value = p.ALLERGY_HISTORY || '';

    // 備份原始資料
    originalPatientData = p;
}

function toggleEditMode(isEditing) {
    const inputs = document.querySelectorAll('.detail-input, .detail-select');
    inputs.forEach(input => input.disabled = !isEditing);

    document.getElementById('editPatientBtn').style.display = isEditing ? 'none' : 'inline-block';
    document.getElementById('savePatientBtn').style.display = isEditing ? 'inline-block' : 'none';
    document.getElementById('cancelEditBtn').style.display = isEditing ? 'inline-block' : 'none';
}

function cancelEditing() {
    if (confirm('確定取消編輯？資料將還原')) {
        fillPatientForm(originalPatientData);
        toggleEditMode(false);
    }
}

function savePatientLocal() {
    const name = document.getElementById('patientName').value.trim();
    const idNumber = document.getElementById('patientIdentityNumber').value.trim();

    if (!name || !idNumber) {
        alert('姓名與身分證字號為必填項目');
        return;
    }

    // 抓取資料
    const patientData = {
        NAME: name,
        GENDER: document.getElementById('patientGender').value,
        BIRTHDATE: document.getElementById('patientBirth').value,
        ID_NUMBER: idNumber,
        PHONE: document.getElementById('patientPhone').value,
        BLOOD_TYPE: document.getElementById('patientBloodType').value,
        ADDRESS: document.getElementById('patientAddress').value,
        EMERGENCY_PHONE: document.getElementById('EmergencyPhone').value,
        BAD_HABITS: document.getElementById('patientBadHabits').value,
        FAMILY_HISTORY: document.getElementById('patientFamilyHistory').value,
        ALLERGY_HISTORY: document.getElementById('patientAllergy').value
    };

    // 存入 localStorage
    let patientList = JSON.parse(localStorage.getItem('patientList')) || [];
    
    // 如果 ID 已存在則更新，否則新增
    const index = patientList.findIndex(p => p.ID_NUMBER === idNumber);
    if (index !== -1) {
        patientList[index] = patientData;
    } else {
        patientList.push(patientData);
    }

    localStorage.setItem('patientList', JSON.stringify(patientList));

    alert('資料已成功儲存至本地瀏覽器！');
    
    // 鎖回欄位
    const inputs = document.querySelectorAll('.detail-input, .detail-select');
    inputs.forEach(input => input.disabled = true);
    document.getElementById('savePatientBtn').style.display = 'none';
    document.getElementById('cancelEditBtn').style.display = 'none';
}

async function deletePatient() {
    if (!confirm('確定要刪除此病患及其相關所有病歷嗎？')) return;
    try {
        const response = await fetch(`${API_BASE_URL}/records/${currentPatientId}`, { method: 'DELETE' });
        if (!response.ok) throw new Error('刪除失敗');
        alert('病患已成功刪除');
        window.location.reload();
    } catch (err) {
        alert(err.message);
    }
}
