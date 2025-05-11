const API_CONFIG = {
    BASE_URL: 'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data',
    ENDPOINTS: {
        PROVINCE: '/province',
        DISTRICT: '/district',
        WARD: '/ward'
    },
    TOKEN: 'e1823376-0a5f-11f0-9f28-eacfdef119b3',
    HEADERS: {
        'Content-Type': 'application/json',
        'Token': 'e1823376-0a5f-11f0-9f28-eacfdef119b3'
    }
};

// Generic API fetch function
async function fetchData(endpoint, method = 'GET', body = null) {
    try {
        const response = await fetch(`${API_CONFIG.BASE_URL}${endpoint}`, {
            method,
            headers: API_CONFIG.HEADERS,
            body: body ? JSON.stringify(body) : null
        });
        const json = await response.json();
        return json.data;
    } catch (error) {
        console.error(`Error fetching ${endpoint}:`, error);
        throw error;
    }
}

// Generic render function
function renderItems(items, selector, nameKey, idKey) {
    const comboboxList = document.querySelector(selector);
    comboboxList.innerHTML = ''; // Clear existing content

    items.forEach(item => {
        const li = document.createElement('li');
        li.className = 'combobox-item';
        li.textContent = item[nameKey];
        li.setAttribute('data-id', item[idKey]);
        comboboxList.appendChild(li);
    });
}

// Province functions
async function fetchAndRenderProvinces(selector) {
    const provinces = await fetchData(API_CONFIG.ENDPOINTS.PROVINCE);
    renderItems(provinces.slice(1), selector, 'ProvinceName', 'ProvinceID');
}

// District functions
async function fetchAndRenderDistricts(selector, provinceId) {
    const districts = await fetchData(
        API_CONFIG.ENDPOINTS.DISTRICT,
        'POST',
        { province_id: provinceId }
    );
    renderItems(districts, selector, 'DistrictName', 'DistrictID');
}

// Ward functions
async function fetchAndRenderWards(selector, districtId) {
    const wards = await fetchData(
        API_CONFIG.ENDPOINTS.WARD,
        'POST',
        { district_id: districtId }
    );
    renderItems(wards, selector, 'WardName', 'WardCode');
}

// Usage example:
// fetchAndRenderProvinces('#province-selector');
// fetchAndRenderDistricts('#district-selector', provinceId);
// fetchAndRenderWards('#ward-selector', districtId);