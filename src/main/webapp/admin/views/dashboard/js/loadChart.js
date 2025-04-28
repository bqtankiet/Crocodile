// Cấu hình biểu đồ ApexCharts
const options = {
    series: [
        {
            name: 'Doanh thu',
            data: []
        }
    ],
    colors: ['#727cf5'],
    dataLabels: {
        enabled: false
    },
    xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        labels: {
            style: {
                fontSize: '12px',
                fontFamily: 'Helvetica, Arial, sans-serif'
            }
        }
    },
    yaxis: {
        labels: {
            formatter: function (val) {
                if (val >= 1e9) {
                    return (val / 1e9).toFixed(1) + 'b'; // Tỉ (Billion)
                } else if (val >= 1e6) {
                    return (val / 1e6).toFixed(1) + 'm'; // Triệu (Million)
                } else if (val >= 1e3) {
                    return (val / 1e3).toFixed(1) + 'k'; // Nghìn (Thousand)
                }
                return val; // Nếu giá trị nhỏ hơn 1000, trả về giá trị nguyên
            },
            style: {
                fontSize: '11px',
                fontFamily: 'Helvetica, Arial, sans-serif'
            }
        }
    },
    tooltip: {
        y: {
            formatter: function (val) {
                if (val === null || val === undefined) {
                    return "No data"; // Trường hợp không có dữ liệu
                }

                if (val >= 1e9) {
                    return (val / 1e9).toFixed(1) + "b";  // Tỉ (Billion)
                } else if (val >= 1e6) {
                    return (val / 1e6).toFixed(1) + "m";  // Triệu (Million)
                } else if (val >= 1e3) {
                    return (val / 1e3).toFixed(1) + "k";  // Nghìn (Thousand)
                }

                return val;  // Nếu giá trị nhỏ hơn 1000, trả về giá trị nguyên
            }
        }
    },
    grid: {
        borderColor: '#e0e0e0',
        strokeDashArray: 0
    },
    legend: {
        show: true,
        position: 'top',
        horizontalAlign: 'center'
    }
};

// Cấu hình cho biểu đồ đường
const lineOptions = {
    chart: {
        type: 'line',
        height: 250,
        zoom: { enabled: false }
    },
    stroke: {
        curve: 'smooth',
        width: 3
    },
    markers: {
        size: 5,
        hover: { sizeOffset: 3 }
    },
    plotOptions: {}
};

// Cấu hình cho biểu đồ cột
const barOptions = {
    chart: {
        type: 'bar',
        height: 250,
        zoom: { enabled: false }
    },
    plotOptions: {
        bar: {
            horizontal: false,
            columnWidth: '30%',
            endingShape: 'rounded'
        }
    }
};

// Khởi tạo chart
const chart = new ApexCharts(document.querySelector('#high-performing-product'), {
    ...options,
    ...lineOptions
});
chart.render();

// Hàm lấy dữ liệu từ API cho biểu đồ
async function fetchChartData(chart) {
    const loadingEl = document.createElement('div');
    loadingEl.textContent = 'Loading...';
    document.querySelector('#high-performing-product').appendChild(loadingEl);

    try {
        const response = await fetch(chartValuesUrl);
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        const data = await response.json();

        if (!Array.isArray(data) || data.length !== 12) {
            throw new Error('Invalid data format');
        }

        options.series[0].data = data;
        chart.updateSeries([{ data: options.series[0].data }]);
    } catch (error) {
        console.error('Error fetching chart data:', error);
    } finally {
        loadingEl.remove();
    }
}

export function loadChart() {
    fetchChartData(chart);

    document.getElementById('line-chart-btn').addEventListener('click', function () {
        chart.updateOptions(lineOptions, true);
    });

    document.getElementById('bar-chart-btn').addEventListener('click', function () {
        chart.updateOptions(barOptions, true);
    });
}