// 儲存了所有後端有效的醫療人員ID列表
const validMedicalIds = [
    "35102", "36215", "37488", "40756", "41839", "42922", 
    "45188", "48737", "49920", "51103", "52286", "53469", 
    "54652", "57018", "58101", "59284", "61650"
];

// 醫療人員角色對照表
const medicalRoles = {
    "36215": "doctor", "40756": "doctor", "45188": "doctor", 
    "49920": "doctor", "54652": "doctor", "59284": "doctor",
    "35102": "nurse", "37488": "nurse", "42922": "nurse", 
    "51103": "nurse", "53469": "nurse", "58101": "nurse",
    "41839": "pharmacist", "48737": "pharmacist", "57018": "pharmacist", "61650": "pharmacist",
    "52286": "therapist"
};

// 角色名稱對照表(將英文轉為中文名稱)
const roleNames = {
    "doctor": "醫師",
    "nurse": "護理師", 
    "pharmacist": "藥師",
    "therapist": "治療師"
};

// 從瀏覽器的localStorage中獲取已註冊的使用者資料
let users = JSON.parse(localStorage.getItem('medicalUsers')) || [];

// 事件監聽器
document.addEventListener('DOMContentLoaded', function() {

    // 表單驗證函數
    function validateForm(id, pwd, isLogin = false) {
        const errors = {
            id: '',
            pwd: ''
        };

        // 檢查使用者ID是否為空、是否存在於validMedicalIds（必須是有效的醫療人員ID）
        if (!id) {
            errors.id = '此處為必填！';
        } else if (!validMedicalIds.includes(id)) {
            errors.id = '無效的醫療人員ID！';
        }

        // 檢查密碼是否為空、是否存在於validMedicalIds（必須與ID完全相同）
        if (!pwd) {
            errors.pwd = '此處為必填！';
        } else if (pwd !== id) {
            errors.pwd = '密碼需與ID相同！';
        }
        // 返回一個包含錯誤訊息的物件
        return errors;
    }

    // 顯示錯誤消息和紅框
    function showErrors(errors, prefix) {
        // 清除所有錯誤樣式
        const idInput = document.getElementById(`${prefix}Id`);
        const pwdInput = document.getElementById(`${prefix}Pwd`);

        if (idInput) idInput.classList.remove('error-border');
        if (pwdInput) pwdInput.classList.remove('error-border');

        // 設置錯誤消息
        const idError = document.getElementById(`${prefix}IdError`);
        const pwdError = document.getElementById(`${prefix}PwdError`);

        if (idError) idError.textContent = errors.id || '';
        if (pwdError) pwdError.textContent = errors.pwd || '';

        // 添加紅框樣式
        if (errors.id && idInput) {
            idInput.classList.add('error-border');
        }
        if (errors.pwd && pwdInput) {
            pwdInput.classList.add('error-border');
        }
    }

    // 控制註冊彈窗和"尚未註冊"提示視窗的顯示
    function showNotRegisteredModal() {
        const existingModal = document.getElementById('notRegisteredModal');
        if (existingModal) {
            existingModal.remove();
        }

        const modal = document.createElement('div');
        modal.id = 'notRegisteredModal';
        modal.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        `;

        const modalContent = document.createElement('div');
        modalContent.style.cssText = `
            background: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            max-width: 400px;
            width: 90%;
            animation: modalAppear 0.3s ease-out;
        `;

        const messageElement = document.createElement('p');
        messageElement.textContent = '您尚未註冊，請先註冊再登入！';
        messageElement.style.cssText = `
            margin-bottom: 20px;
            font-size: 16px;
            color: #333;
            line-height: 1.5;
        `;

        const buttonContainer = document.createElement('div');
        buttonContainer.style.cssText = `
            display: flex;
            justify-content: center;
            gap: 10px;
        `;

        const confirmButton = document.createElement('button');
        confirmButton.textContent = '前往註冊';
        confirmButton.style.cssText = `
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        `;

        confirmButton.addEventListener('mouseenter', function() {
            this.style.backgroundColor = '#45a049';
        });

        confirmButton.addEventListener('mouseleave', function() {
            this.style.backgroundColor = '#4CAF50';
        });

        confirmButton.addEventListener('click', function() {
            modal.remove();
            showRegisterModal();
        });

        const cancelButton = document.createElement('button');
        cancelButton.textContent = '取消';
        cancelButton.style.cssText = `
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        `;

        cancelButton.addEventListener('click', function() {
            modal.remove();
        });

        buttonContainer.appendChild(confirmButton);
        buttonContainer.appendChild(cancelButton);
        modalContent.appendChild(messageElement);
        modalContent.appendChild(buttonContainer);
        modal.appendChild(modalContent);
        document.body.appendChild(modal);
    }

    // 顯示註冊視窗
    function showRegisterModal() {
        const modal = document.getElementById('registerModal');
        if (modal) {
            modal.style.display = 'flex';
            clearForm('reg');
        }
    }

    // 隱藏註冊視窗
    function hideRegisterModal() {
        const modal = document.getElementById('registerModal');
        if (modal) {
            modal.style.display = 'none';
        }
    }

    // 清除表單和錯誤樣式
    function clearForm(prefix) {
        const idInput = document.getElementById(`${prefix}Id`);
        const pwdInput = document.getElementById(`${prefix}Pwd`);

        if (idInput) idInput.value = '';
        if (pwdInput) pwdInput.value = '';

        if (idInput) idInput.classList.remove('error-border');
        if (pwdInput) pwdInput.classList.remove('error-border');

        showErrors({id: '', pwd: ''}, prefix);
    }

    // 檢查是否為未註冊用戶
    function checkIfIdNotRegistered(id) {
        return !users.some(u => u.id === id);
    }

    // 檢查登入憑證
    function checkLoginCredentials(id, pwd) {
        return users.some(u => u.id === id && u.pwd === pwd);
    }

    // 獲取使用者角色
    function getUserRole(id) {
        return medicalRoles[id] || null;
    }

    // 獲取角色名稱
    function getRoleName(role) {
        return roleNames[role] || '使用者';
    }

    // 登入成功後跳轉到 Patients 頁面
    function loginSuccess(id) {
        const role = getUserRole(id);
        const roleName = getRoleName(role);

        // 儲存使用者資訊到 localStorage
        const userInfo = {
            employeeId: id,
            role: role,
            roleName: roleName
        };

        localStorage.setItem('userInfo', JSON.stringify(userInfo));

        alert(`登入成功！歡迎 ${roleName}！`);
        clearForm('login');

        // 跳轉到 Patients 頁面
        window.location.href = 'patients.html';
    }

    // === 登入按鈕事件 ===
    const loginBtn = document.getElementById('loginBtn');
    if (loginBtn) {
        loginBtn.addEventListener('click', function() {
            const id = document.getElementById('loginId').value;
            const pwd = document.getElementById('loginPwd').value;

            const errors = validateForm(id, pwd, true);
            showErrors(errors, 'login');

            if (errors.id || errors.pwd) {
                return;
            }

            // 登入邏輯流程：
            // 1. 先檢查ID是否已註冊
            if (checkIfIdNotRegistered(id)) {
                showNotRegisteredModal();
                return;
            }

            // 2. 檢查密碼是否正確
            if (checkLoginCredentials(id, pwd)) {
                loginSuccess(id);
            } else {
                const loginErrors = {
                    id: '',
                    pwd: '密碼錯誤，請再試一次'
                };
                showErrors(loginErrors, 'login');
            }
        });
    }

    // === 註冊按鈕事件 ===
    const registerBtn = document.getElementById('registerBtn');
    if (registerBtn) {
        registerBtn.addEventListener('click', function() {
            const id = document.getElementById('regId').value;
            const pwd = id; // 密碼自動設置為ID
            document.getElementById('regPwd').value = pwd;

            const errors = validateForm(id, pwd, false);
            showErrors(errors, 'reg');

            if (!errors.id && !errors.pwd) {
                // 檢查ID是否已被使用
                const idExists = users.some(u => u.id === id);

                if (idExists) {
                    const duplicateErrors = {
                        id: 'ID已有人使用！請重新輸入！',
                        pwd: ''
                    };
                    showErrors(duplicateErrors, 'reg');
                    return;
                }

                // 如果都沒有錯誤，進行註冊
                users.push({ id, pwd });
                localStorage.setItem('medicalUsers', JSON.stringify(users));
                alert('註冊成功！');
                clearForm('reg');
                hideRegisterModal();

                // 註冊成功後自動填入登入表單
                document.getElementById('loginId').value = id;
            }
        });
    }

    // 顯示註冊視窗按鈕
    const showRegisterBtn = document.getElementById('showRegisterBtn');
    if (showRegisterBtn) {
        showRegisterBtn.addEventListener('click', function() {
            showRegisterModal();
        });
    }

    // 取消註冊按鈕
    const cancelRegisterBtn = document.getElementById('cancelRegisterBtn');
    if (cancelRegisterBtn) {
        cancelRegisterBtn.addEventListener('click', function() {
            hideRegisterModal();
        });
    }

    // 點擊視窗外部關閉
    const registerModal = document.getElementById('registerModal');
    if (registerModal) {
        registerModal.addEventListener('click', function(e) {
            if (e.target === this) {
                hideRegisterModal();
            }
        });
    }

    // 導覽按鈕
    const navButtons = document.querySelectorAll('.navbar button');
    if (navButtons.length > 0) {
        navButtons.forEach(button => {
            button.addEventListener('click', function() {
                document.querySelectorAll('.navbar button').forEach(btn => {
                    btn.classList.remove('active');
                });
                this.classList.add('active');

                const buttonText = this.textContent;
                switch(buttonText) {
                    case 'Login':
                        window.location.href = 'index.html';
                        break;
                    case 'Patients':
                        // 檢查是否已登入
                        const userInfo = localStorage.getItem('userInfo');
                        if (userInfo) {
                            window.location.href = 'patients.html';
                        } else {
                            alert('請先登入系統！');
                            window.location.href = 'index.html';
                        }
                        break;
                    case 'Records':
                        window.location.href = 'records.html';
                        break;
                    case 'Schedules':
                        window.location.href = 'schedules.html';
                        break;
                    case 'MedicalResourceUsage':
                        window.location.href = 'resources.html';
                        break;
                }
            });
        });
    }

    // 自動檢查登入狀態，如果已登入則跳轉到 Patients
    const userInfo = localStorage.getItem('userInfo');
    if (userInfo && window.location.pathname.includes('index.html')) {
        window.location.href = 'patients.html';
    }
});
