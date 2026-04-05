/**
 * patients.js
 * 負責處理病患列表的顯示、搜尋與跳轉功能
 */

// 1. 模擬病患資料庫 (Mock Data)
const mockPatients = [
    { id: "A001", name: "王小明", gender: "男", age: 45, department: "心臟內科", status: "住院中" },
    { id: "A002", name: "李小美", gender: "女", age: 62, department: "一般外科", status: "已出院" },
    { id: "A003", name: "張大衛", gender: "男", age: 28, department: "骨科", status: "住院中" },
    { id: "A004", name: "趙小鳳", gender: "女", age: 35, department: "婦產科", status: "住院中" },
    { id: "A005", name: "陳大文", gender: "男", age: 50, department: "心臟內科", status: "已出院" }
];

document.addEventListener('DOMContentLoaded', () => {
    console.log("✅ patients.js 已成功載入");

    const patientTableBody = document.getElementById('patientTableBody');
    const searchInput = document.getElementById('patientSearchInput');
    const logoutBtn = document.getElementById('logoutBtn');

    // --- 2. 初始化：渲染所有病患 ---
    renderPatients(mockPatients);

    // --- 3. 搜尋過濾功能 ---
    if (searchInput) {
        searchInput.addEventListener('input', (e) => {
            const keyword = e.target.value.toLowerCase();
            const filteredData = mockPatients.filter(p => 
                p.name.toLowerCase().includes(keyword) || 
                p.id.toLowerCase().includes(keyword) ||
                p.department.includes(keyword)
            );
            renderPatients(filteredData);
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
});

/**
 * 5. 渲染表格函數
 * @param {Array} data - 要顯示的病患陣列
 */
function renderPatients(data) {
    const tableBody = document.getElementById('patientTableBody');
    if (!tableBody) return;

    tableBody.innerHTML = ""; // 先清空表格

    if (data.length === 0) {
        tableBody.innerHTML = `<tr><td colspan="6" style="text-align:center;">查無相關病患資料</td></tr>`;
        return;
    }

    data.forEach(patient => {
        const tr = document.createElement('tr');
        
        // 根據狀態設定不同的 Badge 顏色
        const statusClass = patient.status === "住院中" ? "status-in" : "status-out";

        tr.innerHTML = `
            <td>${patient.id}</td>
            <td><strong>${patient.name}</strong></td>
            <td>${patient.gender} / ${patient.age}</td>
            <td>${patient.department}</td>
            <td><span class="status-badge ${statusClass}">${patient.status}</span></td>
            <td><button class="btn-view-detail" onclick="viewDetail('${patient.id}')">查看病歷</button></td>
        `;
        tableBody.appendChild(tr);
    });
}

/**
 * 6. 查看詳情（跳轉至 Records 頁面）
 * @param {string} id - 病患 ID
 */
function viewDetail(id) {
    // 將 ID 傳遞給 records 頁面 (透過 URL 參數)
    window.location.href = `./records.html?id=${id}`;
}
