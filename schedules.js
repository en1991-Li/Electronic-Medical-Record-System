// 測試用：如果這行有彈出，代表檔案載入成功
alert("JS 檔案已成功載入！");

const API_BASE_URL = 'https://your-backend-on-render.com/api'; 
const IS_LOCAL_DEMO = true; 

document.addEventListener('DOMContentLoaded', function() {
    // 1. 取得所有按鈕與輸入欄位
    const searchBtn = document.getElementById('searchScheduleBtn');
    const addBtn = document.getElementById('addScheduleBtn');
    const deleteBtn = document.getElementById('deleteScheduleBtn');
    const searchInput = document.getElementById('searchPatientId');
    const logoutBtn = document.getElementById('logoutBtn');

    // 2. 查詢功能
    if (searchBtn) {
        searchBtn.addEventListener('click', function() {
            const patientId = searchInput.value.trim();
            if (!patientId) return alert('請輸入 Patient ID 進行查詢');

            if (IS_LOCAL_DEMO) {
                alert(`正在查詢病患 ${patientId} 的排程...`);
                mockFillData(patientId);
            } else {
                fetchScheduleFromServer(patientId);
            }
        });
    }

    // 3. 新增排程功能
    if (addBtn) {
        addBtn.addEventListener('click', function() {
            const data = getFormData();
            if (!data.staffId || !data.deptId) {
                return alert('請填寫完整的科別 ID 與 員工編號！');
            }

            if (IS_LOCAL_DEMO) {
                console.log('新增資料：', data);
                alert('✅ 排程新增成功！');
            }
        });
    }

    // 4. 刪除排程功能
    if (deleteBtn) {
        deleteBtn.addEventListener('click', function() {
            const staffId = document.getElementById('staffId').value;
            if (!staffId) return alert('請先輸入要刪除的排程員工編號');

            if (confirm(`確定要刪除員工 ${staffId} 的這項排程嗎？`)) {
                alert('🗑️ 排程已刪除成功！');
                clearForm();
            }
        });
    }

    // 5. 登出功能 
    // 登出邏輯建議統寫法
if (logoutBtn) {
    logoutBtn.addEventListener('click', function() {
        if (confirm('確定要登出系統嗎？')) {
            // 必須清除「所有」相關的 Key
            localStorage.removeItem('isLoggedIn');
            localStorage.removeItem('userInfo');
            localStorage.removeItem('employeeId');
            localStorage.removeItem('userToken');

            alert('您已成功登出');
            // 使用 replace 替換掉歷史紀錄，防止按「上一頁」又跑回去
            window.location.replace('./index.html'); 
        }
    });
}
    
// --- 輔助函數：獲取表單所有欄位資料 ---
function getFormData() {
    return {
        deptId: document.getElementById('deptId').value,
        deptName: document.getElementById('deptName').value,
        deptDesc: document.getElementById('deptDesc').value,
        staffName: document.getElementById('staffName').value,
        staffGender: document.getElementById('staffGender').value,
        staffTitle: document.getElementById('staffTitle').value,
        staffExp: document.getElementById('staffExperience').value,
        date: document.getElementById('scheduleDate').value,
        staffId: document.getElementById('staffId').value,
        timeSlot: document.getElementById('scheduleTimeSlot').value
    };
}

// --- 輔助函數：清空表單 ---
function clearForm() {
    const inputs = document.querySelectorAll('.schedule-input, .schedule-textarea, .schedule-select');
    inputs.forEach(input => input.value = '');
    document.getElementById('searchPatientId').value = '';
}

// --- 模擬資料填充 ---
function mockFillData(id) {
    document.getElementById('deptId').value = 'D01';
    document.getElementById('deptName').value = '復健科';
    document.getElementById('deptDesc').value = '提供物理治療與職能治療服務。';
    document.getElementById('staffName').value = '王小明';
    document.getElementById('staffGender').value = 'M';
    document.getElementById('staffTitle').value = '物理治療師';
    document.getElementById('staffExperience').value = '5';
    document.getElementById('scheduleDate').value = '2026-04-01';
    document.getElementById('staffId').value = 'S889';
    document.getElementById('scheduleTimeSlot').value = 'morning';
}
