// main.js
import {loadChart} from './loadChart.js';
import {loadStats} from "./loadStats.js";
import {loadTopSaleProducts} from "./loadTopSaleProducts.js";
import {loadNewProducts} from "./loadNewProducts.js";

// Khởi tạo các chức năng khi DOM sẵn sàng
document.addEventListener('DOMContentLoaded', () => {
    loadChart();
    loadStats();
    loadTopSaleProducts();
    loadNewProducts()
});