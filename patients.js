// patients.js - 病患頁面功能
const API_BASE_URL = '/api';

let currentPatientId = null;
let currentUser = null;
let originalPatientData = null; 

document.addEventListener('DOMContentLoaded', function() {
    // 1. 取得按鈕元素
    const newPatientBtn = document.getElementById('newPatientBtn');
    const allInputs = document.querySelectorAll('.detail-input, .detail-select');
    const saveBtn = document.getElementById('savePatientBtn');
    const cancelBtn = document.getElementById('cancelEditBtn');

    // 2. 點擊「新增病患」時的反應
    if (newPatientBtn) {
        newPatientBtn.addEventListener('click', function() {
            // 清空所有欄位
            allInputs.forEach(input => {
                input.value = '';
                input.disabled = false; // 解鎖輸入框，讓你可以打字
            });

            // 顯示「儲存」和「取消」按鈕，隱藏「新增」按鈕
            saveBtn.style.display = 'inline-block';
            cancelBtn.style.display = 'inline-block';
            newPatientBtn.style.disabled = true; 
            
            alert('請開始輸入新病患資料');
            document.getElementById('patientName').focus(); // 自動跳轉到姓名欄位
        });
    }

    // 3. 點擊「取消編輯」
    if (cancelBtn) {
        cancelBtn.addEventListener('click', function() {
            allInputs.forEach(input => {
                input.disabled = true; // 重新鎖定
            });
            saveBtn.style.display = 'none';
            cancelBtn.style.display = 'none';
        });
    }
});

document.addEventListener('DOMContentLoaded', function() {
    const saveBtn = document.getElementById('savePatientBtn');
    const allInputs = document.querySelectorAll('.detail-input, .detail-select');

    if (saveBtn) {
        saveBtn.addEventListener('click', function() {
            // 1. 抓取目前輸入框的所有資料
            const newPatientData = {
                name: document.getElementById('patientName').value,
                gender: document.getElementById('patientGender').value,
                birth: document.getElementById('patientBirth').value,
                idNumber: document.getElementById('patientIdentityNumber').value,
                phone: document.getElementById('patientPhone').value,
                bloodType: document.getElementById('patientBloodType').value,
                address: document.getElementById('patientAddress').value,
                emergencyPhone: document.getElementById('EmergencyPhone').value,
                badHabits: document.getElementById('patientBadHabits').value,
                familyHistory: document.getElementById('patientFamilyHistory').value,
                medicalHistory: document.getElementById('patientMedicalHistory').value,
                allergy: document.getElementById('patientAllergy').value
            };

            // 2. 簡單驗證：姓名跟身分證不能是空的
            if (!newPatientData.name || !newPatientData.idNumber) {
                alert('姓名與身分證字號為必填項目！');
                return;
            }

            // 3. 儲存到 localStorage (模擬資料庫存檔)
            // 先抓出舊資料，再把新資料塞進去
            let patientList = JSON.parse(localStorage.getItem('patientList')) || [];
            patientList.push(newPatientData);
            localStorage.setItem('patientList', JSON.stringify(patientList));

            // 4. 存檔成功後的反應
            alert('病患資料已成功儲存！');

            // 5. 將欄位重新鎖定 (Disabled) 並隱藏儲存按鈕
            allInputs.forEach(input => input.disabled = true);
            saveBtn.style.display = 'none';
            document.getElementById('cancelEditBtn').style.display = 'none';
            document.getElementById('editPatientBtn').style.display = 'inline-block';
        });
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

// 在 savePatient 函數中加入驗證邏輯
async function savePatient() {
    // 簡單驗證範例
    const name = document.getElementById('patientName').value.trim();
    const phone = document.getElementById('patientPhone').value.trim();

    if (!name || !phone) {
        alert('姓名與電話為必填項目');
        return;
    }

    const updatedData = {
        name: name,
        gender: document.getElementById('patientGender').value,
        birth: document.getElementById('patientBirth').value,
        phone: phone,
        address: document.getElementById('patientAddress').value,
        emergency_phone: document.getElementById('EmergencyPhone').value,
        bad_habits: document.getElementById('patientBadHabits').value,
        family_history: document.getElementById('patientFamilyHistory').value,
        allergy: document.getElementById('patientAllergy').value
    };

    // 顯示儲存中狀態 (進階優化)
    const saveBtn = document.getElementById('savePatientBtn');
    const originalBtnText = saveBtn.innerText;
    saveBtn.innerText = '儲存中...';
    saveBtn.disabled = true;

    try {
        const response = await fetch(`${API_BASE_URL}/patients/${currentPatientId}`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(updatedData)
        });

        if (!response.ok) throw new Error('更新失敗');

        alert('資料更新成功');
        // 更新備份資料，避免下次取消時還原成舊版
        originalPatientData = { ...originalPatientData, ...updatedData }; 
        toggleEditMode(false);
    } catch (err) {
        alert(err.message);
    } finally {
        saveBtn.innerText = originalBtnText;
        saveBtn.disabled = false;
    }
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
