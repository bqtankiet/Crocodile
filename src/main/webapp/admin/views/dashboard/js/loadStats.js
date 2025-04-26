import {formatCurrency, formatNumber} from './utils.js';
export function loadStats() {
    const url = statValuesUrl;
    const revenueContainer = document.querySelector('#revenue-container');
    const ordersContainer = document.querySelector('#orders-container');
    const customersContainer = document.querySelector('#customers-container');
    fetch(url)
        .then(response => response.json())
        .then(data => {
            revenueContainer.innerHTML = renderStat(data.revenue.amount, data.revenue.percent);
            ordersContainer.innerHTML = renderStat(data.orders.amount, data.orders.percent);
            customersContainer.innerHTML = renderStat(data.customers.amount, data.customers.percent);
        });
}

function renderStat(amount, percent) {
    return `
        <h3 class="mt-3 mb-3"> ${formatCurrency(amount)}</h3>
        <p class="mb-0 text-muted">
            <span class="me-2 ${percent > 0 ? 'text-success' : 'text-danger'}">
                <i class="bx ${percent > 0 ? 'bxs-up-arrow' : 'bxs-down-arrow'}"></i>
                ${percent.toFixed(2)}%
            </span>
            <span class="text-nowrap">So với tháng trước</span>
        </p>`;
}