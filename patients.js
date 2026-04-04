// patients.js - 病患頁面功能
const API_BASE_URL = '/api';

let currentPatientId = null;
let currentUser = null;
let originalPatientData = null; 

document.addEventListener('DOMContentLoaded', function() {
    checkLoginStatus(); // 檢查登入

    // --- 綁定按鈕變數 ---
    const newPatientBtn = document.getElementById('newPatientBtn');
    const saveBtn = document.getElementById('savePatientBtn');
    const cancelBtn = document.getElementById('cancelEditBtn');
    const editBtn = document.getElementById('editPatientBtn');
    const searchBtn = document.getElementById('searchBtn');
    const logoutBtn = document.getElementById('logoutBtn');
    const refreshBtn = document.getElementById('refreshBtn');
    const deleteBtn = document.getElementById('deletePatientBtn');

    // 1. 搜尋功能
    if (searchBtn) {
        searchBtn.addEventListener('click', searchPatient);
    }

    // 2. 點擊「新增病患」
    if (newPatientBtn) {
        newPatientBtn.addEventListener('click', function() {
            const allInputs = document.querySelectorAll('.detail-input, .detail-select');
            allInputs.forEach(input => {
                input.value = '';
                input.disabled = false;
            });
            saveBtn.style.display = 'inline-block';
            cancelBtn.style.display = 'inline-block';
            editBtn.style.display = 'none'; 
            alert('請輸入病患資料');
        });
    }

    // 3. 點擊「編輯資料」
    if (editBtn) {
        editBtn.addEventListener('click', () => toggleEditMode(true));
    }

    // 4. 點擊「儲存變更」
    if (saveBtn) {
        saveBtn.addEventListener('click', savePatientLocal); 
    }

    // 5. 點擊「取消編輯」
    if (cancelBtn) {
        cancelBtn.addEventListener('click', function() {
            if (confirm('確定取消？資料將還原')) {
                const inputs = document.querySelectorAll('.detail-input, .detail-select');
                inputs.forEach(input => input.disabled = true);
                saveBtn.style.display = 'none';
                cancelBtn.style.display = 'none';
                if (originalPatientData) fillPatientFormLocal(originalPatientData);
                toggleEditMode(false);
            }
        });
    }

    // 6. 登出功能
    if (logoutBtn) {
        logoutBtn.addEventListener('click', function() {
            if (confirm('確定要登出系統嗎？')) {
                localStorage.clear(); // 清除所有資料最保險
                alert('您已成功登出');
                window.location.replace('./index.html'); 
            }
        });
    }
    
    // 7. 重新整理
    if (refreshBtn) {
        refreshBtn.addEventListener('click', () => location.reload());
    }

    // 8. 刪除按鈕
    if (deleteBtn) {
        deleteBtn.addEventListener('click', deletePatientLocal);
    }
}); // DOMContentLoaded 結束

// --- 核心函數區 ---

function checkLoginStatus() {
    const userInfo = localStorage.getItem('userInfo');
    if (!userInfo) {
        alert('請先登入！');
        window.location.replace('./index.html');
        return;
    }
    currentUser = JSON.parse(userInfo);
    const reminder = document.querySelector('.reminder-text');
    if (reminder) {
        reminder.innerHTML = `<strong>${currentUser.roleName || '人員'}您好！</strong> 員工ID: ${currentUser.employeeId}`;
    }
}

function searchPatient() {
    const query = document.getElementById('searchInput').value.trim().toLowerCase();
    if (!query) return alert('請輸入搜尋內容');

    const patientList = JSON.parse(localStorage.getItem('patientList')) || [];
    const foundPatient = patientList.find(p => 
        (p.NAME && p.NAME.toLowerCase().includes(query)) || 
        (p.ID_NUMBER && p.ID_NUMBER.toLowerCase() === query)
    );

    if (foundPatient) {
        fillPatientFormLocal(foundPatient);
        // 角色權限控管
        if (currentUser) {
            const editBtn = document.getElementById('editPatientBtn');
            const deleteBtn = document.getElementById('deletePatientBtn');
            if (editBtn) editBtn.style.display = (['doctor', 'therapist'].includes(currentUser.role)) ? 'inline-block' : 'none';
            if (deleteBtn) deleteBtn.style.display = (currentUser.role === 'doctor') ? 'inline-block' : 'none';
        }
    } else {
        alert('找不到該病患資料');
    }
}

function fillPatientFormLocal(p) {
    currentPatientId = p.ID_NUMBER;
    document.getElementById('patientName').value = p.NAME || '';
    document.getElementById('patientGender').value = p.GENDER || '';
    document.getElementById('patientBirth').value = p.BIRTHDATE || '';
    document.getElementById('patientIdentityNumber').value = p.ID_NUMBER || '';
    document.getElementById('patientPhone').value = p.PHONE || '';
    document.getElementById('patientBloodType').value = p.BLOOD_TYPE || '';
    document.getElementById('patientAddress').value = p.ADDRESS || '';
    document.getElementById('EmergencyPhone').value = p.EMERGENCY_PHONE || '';
    document.getElementById('patientBadHabits').value = p.BAD_HABITS || '';
    document.getElementById('patientFamilyHistory').value = p.FAMILY_HISTORY || '';
    document.getElementById('patientAllergy').value = p.ALLERGY_HISTORY || '';
    originalPatientData = { ...p };
}

function toggleEditMode(isEditing) {
    const inputs = document.querySelectorAll('.detail-input, .detail-select');
    inputs.forEach(input => input.disabled = !isEditing);

    document.getElementById('editPatientBtn').style.display = isEditing ? 'none' : 'inline-block';
    document.getElementById('savePatientBtn').style.display = isEditing ? 'inline-block' : 'none';
    document.getElementById('cancelEditBtn').style.display = isEditing ? 'inline-block' : 'none';
}

function savePatientLocal() {
    const name = document.getElementById('patientName').value.trim();
    const idNumber = document.getElementById('patientIdentityNumber').value.trim();

    if (!name || !idNumber) {
        alert('姓名與身分證字號為必填項目');
        return;
    }

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

    let patientList = JSON.parse(localStorage.getItem('patientList')) || [];
    const index = patientList.findIndex(p => p.ID_NUMBER === idNumber);
    
    if (index !== -1) {
        patientList[index] = patientData;
    } else {
        patientList.push(patientData);
    }

    localStorage.setItem('patientList', JSON.stringify(patientList));
    alert('資料已成功儲存！');
    toggleEditMode(false);
}

function deletePatientLocal() {
    if (!currentPatientId) {
        alert('請先搜尋病患');
        return;
    }

    if (confirm(`確定要刪除病患（ID：${currentPatientId}）嗎？`)) {
        let patientList = JSON.parse(localStorage.getItem('patientList')) || [];
        const updatedList = patientList.filter(p => p.ID_NUMBER !== currentPatientId);
        localStorage.setItem('patientList', JSON.stringify(updatedList));
        alert('病患資料已刪除');
        location.reload();
    }
}
