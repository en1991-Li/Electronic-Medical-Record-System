// 測試載入狀況
console.log("✅ resources.js 已成功載入");

const API_BASE_URL = 'https://your-backend-on-render.com/api';
const IS_LOCAL_DEMO = true; 

document.addEventListener('DOMContentLoaded', function() {
    // 1. 取得 DOM 元素
    const searchBtn = document.getElementById('searchUsageBtn');
    const addBtn = document.getElementById('addUsageBtn');
    const deleteBtn = document.getElementById('deleteUsageBtn');
    const searchInput = document.getElementById('usageSearchInput');
    const logoutBtn = document.getElementById('logoutBtn');

    // 2. 查詢功能 (依據 Usage ID)
    if (searchBtn) {
        searchBtn.addEventListener('click', function() {
            const usageId = searchInput.value.trim();
            if (!usageId) return alert('請輸入 Usage ID 進行查詢');

            if (IS_LOCAL_DEMO) {
                console.log(`查詢 Usage ID: ${usageId}`);
                mockFetchUsage(usageId);
            } else {
                // 未來串接後端：fetchUsageFromServer(usageId);
            }
        });
    }

    // 3. 新增紀錄功能
    if (addBtn) {
        addBtn.addEventListener('click', function() {
            const data = getResourceFormData();
            
            if (!data.patientId || !data.resourceName) {
                return alert('請至少填寫病患 ID 與資源名稱！');
            }

            if (IS_LOCAL_DEMO) {
                console.log('新增資源紀錄：', data);
                alert('✅ 醫療器材使用紀錄新增成功！');
            }
        });
    }

    // 4. 刪除紀錄功能
    if (deleteBtn) {
        deleteBtn.addEventListener('click', function() {
            const usageId = searchInput.value.trim();
            if (!usageId) return alert('請先輸入要刪除的 Usage ID');

            if (confirm(`確定要刪除這筆序號為 ${usageId} 的使用紀錄嗎？`)) {
                if (IS_LOCAL_DEMO) {
                    alert('🗑️ 紀錄已成功刪除！');
                    clearResourceForm();
                }
            }
        });
    }

    // 5. 登出功能
if (logoutBtn) {
    logoutBtn.addEventListener('click', function() {
        if (confirm('確定要登出系統嗎？')) {
            localStorage.clear(); // 清除所有登入快取
            alert('您已成功登出');
            
            // 使用 replace 可以防止使用者登出後點擊「回上一頁」重新進入系統
            window.location.replace('./index.html'); 
        }
    });
   }
});

/**
 * 輔助函數：獲取表單所有資料
 */
function getResourceFormData() {
    return {
        patientId: document.getElementById('patientId').value,
        deptId: document.getElementById('deptId').value,
        resourceName: document.getElementById('resourceName').value,
        resourceType: document.getElementById('resourceType').value,
        useDate: document.getElementById('useDate').value,
        useTime: document.getElementById('useTime').value,
        useNotes: document.getElementById('useNotes').value
    };
}

/**
 * 輔助函數：清空所有欄位
 */
function clearResourceForm() {
    const allInputs = document.querySelectorAll('.res-input');
    allInputs.forEach(input => input.value = '');
    document.getElementById('usageSearchInput').value = '';
}

/**
 * 模擬查詢結果 (Demo 用)
 */
function mockFetchUsage(id) {
    alert(`成功找到紀錄：${id}`);
    
    document.getElementById('patientId').value = 'P12345';
    document.getElementById('deptId').value = 'D05';
    document.getElementById('resourceName').value = '電動輪椅';
    document.getElementById('resourceType').value = '輔具';
    document.getElementById('useDate').value = '2026-04-04';
    document.getElementById('useTime').value = '14:30';
    document.getElementById('useNotes').value = '病患於院內短暫借用。';
}
