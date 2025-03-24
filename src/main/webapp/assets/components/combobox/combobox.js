class ComboBoxLoader {
    constructor(containerSelector = '.combo-box') {
        this.containers = document.querySelectorAll(containerSelector);
        this.initialize();
    }

    initialize() {
        this.containers.forEach(container => {
            const comboBox = new ComboBox(container);
            comboBox.setup();
        });
    }
}

class ComboBox {
    constructor(container) {
        this.container = container;
        this.input = container.querySelector('input');
        this.datalist = container.querySelector('datalist');
        this.currentFocus = -1;
    }

    setup() {
        this.disableDefaultAutocomplete();
        this.attachEventListeners();
    }

    disableDefaultAutocomplete() {
        this.input.autocomplete = "off";
        // this.input.list = "";
    }

    attachEventListeners() {
        this.input.addEventListener('focus', () => this.showSuggestions());
        this.input.addEventListener('blur', () => this.hideSuggestions());
        this.input.addEventListener('input', () => this.filterSuggestions());
        this.input.addEventListener('keydown', (e) => this.handleKeyboard(e));
        this.container.addEventListener('mousedown', (e) => this.handleOptionClick(e));
    }

    showSuggestions() {
        if (this.datalist.options.length > 0) {
            this.datalist.style.display = "block";
        }
    }

    hideSuggestions() {
        this.datalist.style.display = "none";
    }

    filterSuggestions() {
        const options = this.datalist.options;
        const searchText = this.input.value.toUpperCase();
        let hasSuggestions = false;

        // Array.from(this.datalist.options).forEach(option => {
        //     const isMatch = option.value.toUpperCase().includes(searchText);
        //     option.style.display = isMatch ? "block" : "none";
        //     if (isMatch) hasSuggestions = true;
        // });

        for (let option of options) {
            if (option.value.toUpperCase().includes(searchText)) {
                option.style.display = "block";
                hasSuggestions = true;
            } else {
                option.style.display = "none";
            }
        }

        this.datalist.style.display = hasSuggestions ? "block" : "none";
        this.currentFocus = -1; // Reset focus when filtering
    }

    handleOptionClick(event) {
        const option = event.target.closest("option");
        if (option) {
            event.preventDefault();
            this.input.value = option.textContent;
            this.hideSuggestions();
        }
    }

    handleKeyboard(event) {
        const options = this.getVisibleOptions();

        switch (event.key) {
            case 'ArrowDown':
                event.preventDefault();
                this.navigate(1, options);
                break;
            case 'ArrowUp':
                event.preventDefault();
                this.navigate(-1, options);
                break;
            case 'Enter':
                event.preventDefault();
                this.selectCurrentOption(options);
                break;
        }
    }

    getVisibleOptions() {
        return Array.from(this.datalist.options).filter(
            option => option.style.display !== "none"
        );
    }

    navigate(direction, options) {
        this.removeActive(options);
        this.currentFocus = (this.currentFocus + direction + options.length) % options.length;
        this.addActive(options);
    }

    selectCurrentOption(options) {
        if (this.currentFocus > -1 && options[this.currentFocus]) {
            this.input.value = options[this.currentFocus].textContent;
            this.hideSuggestions();
        }
    }

    addActive(options) {
        if (options.length && this.currentFocus >= 0) {
            options[this.currentFocus].classList.add("active");
            this.scrollToOption(options[this.currentFocus]);
        }
    }

    removeActive(options) {
        options.forEach(option => option.classList.remove("active"));
    }

    scrollToOption(option) {
        option.scrollIntoView({block: "nearest"});
    }
}

// Usage
document.addEventListener('DOMContentLoaded', () => {
    new ComboBoxLoader('.combo-box');
});