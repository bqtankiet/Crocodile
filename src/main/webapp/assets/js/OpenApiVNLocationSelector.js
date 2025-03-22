const API_HOST = "https://provinces.open-api.vn";
const ENDPOINTS = {
    provinces: "/api/p/",
    districts: "/api/d/",
    wards: "/api/w/"
};

class LocationSelector {
    constructor(container) {
        this.container = container;
        this.elements = {
            provinceInput: document.getElementById("provinceInput"),
            provinceList: document.getElementById("provinceList"),
            districtInput: document.getElementById("districtInput"),
            districtList: document.getElementById("districtList"),
            wardInput: document.getElementById("wardInput"),
            wardList: document.getElementById("wardList"),
            homeAddressInput: document.getElementById("homeAddressInput")
        };
        this.initialize();
    }

    initialize() {
        this.elements.districtInput.disabled = true;
        this.elements.wardInput.disabled = true;
        this.fetchAndRender(ENDPOINTS.provinces, this.elements.provinceList);
        this.setupEventListeners();
    }

    setupEventListeners() {
        this.container.addEventListener('mousedown', (event) => {
            const option = event.target.closest('option');
            if (!option) return;
            this.handleOptionClick(option);
        });
        self = this;
        [this.elements.provinceInput, this.elements.districtInput, this.elements.wardInput]
            .forEach(input => {
                input.addEventListener("keydown", function(event){
                   if(event.key === "Enter") {
                       const option = input.parentElement.querySelector("option.active");
                       alert("Selected: " + option.textContent);
                       self.handleOptionClick(option);
                   }
                });
                input.addEventListener("input", function (event) {
                   input.parentElement.querySelectorAll("option").forEach(o => {
                       o.classList.remove("active");
                   });
                });
            });
    }

    handleOptionClick(option) {
        const {type, code} = option.dataset;

        switch (type) {
            case 'tỉnh':
                this.handleProvinceSelection(code);
                break;
            case 'huyện':
                this.handleDistrictSelection(code);
                break;
            case 'xã':
                this.handleWardSelection(code);
                break;
        }
    }

    handleProvinceSelection(code) {
        this.resetInputs(this.elements.districtInput, this.elements.wardInput);
        this.elements.districtInput.disabled = false;
        this.elements.wardInput.disabled = true;
        this.elements.homeAddressInput.disabled = true;
        this.fetchAndRender(
            `${ENDPOINTS.provinces}${code}?depth=2`,
            this.elements.districtList,
            'districts'
        );
    }

    handleDistrictSelection(code) {
        this.resetInputs(this.elements.wardInput);
        this.elements.wardInput.disabled = false;
        this.elements.homeAddressInput.disabled = true;
        this.fetchAndRender(
            `${ENDPOINTS.districts}${code}?depth=2`,
            this.elements.wardList,
            'wards'
        );
    }

    handleWardSelection(code) {
        this.elements.homeAddressInput.disabled = false;
    }

    async fetchAndRender(endpoint, datalistElement, dataType = '') {
        try {
            console.log(`Fetching data: ${API_HOST + endpoint}`);
            const response = await fetch(`${API_HOST + endpoint}`);
            const data = await response.json();
            const items = dataType ? data[dataType] : data;
            this.renderDatalist(items, datalistElement);
        } catch (error) {
            console.error(`Error fetching data from: ${API_HOST + endpoint}`, error);
        }
    }

    renderDatalist(items, datalistElement) {
        datalistElement.innerHTML = '';
        const fragment = document.createDocumentFragment();

        items.forEach(item => {
            const option = this.createOption(item);
            fragment.appendChild(option);
        });

        datalistElement.appendChild(fragment);
    }

    createOption(item) {
        const option = document.createElement('option');
        option.dataset.code = item.code;
        option.dataset.type = item.division_type;
        option.value = `${item.name} ${item.codename.replaceAll('_', ' ')}`;
        option.textContent = item.name;
        return option;
    }

    resetInputs(...inputs) {
        inputs.forEach(input => input.value = '');
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', function () {
    new LocationSelector(document.getElementById("openApiVnLocationSelector"));
});

