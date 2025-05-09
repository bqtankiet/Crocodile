// utils.js

// Hàm định dạng số liệu
export function formatCurrency(value) {
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND', maximumFractionDigits: 0 }).format(value);
}

export function formatNumber(value) {
    return new Intl.NumberFormat('vi-VN').format(value);
}

export function getBaseUrl() {
    return "";
}