class Combobox {
    constructor(comboboxElement, options = {}) {
        // Kiểm tra DOM
        if (!comboboxElement) {
            throw new Error("Combobox element is required");
        }

        // DOM Elements
        this.combobox = comboboxElement;
        this.input = comboboxElement.querySelector(".combobox-input");
        this.list = comboboxElement.querySelector(".combobox-list");

        // Kiểm tra các phần tử cần thiết
        if (!this.input || !this.list) {
            throw new Error("Combobox initialization failed: missing input or list");
        }

        // Options với giá trị mặc định
        this.options = {
            debounceTime: 200,     // Thời gian debounce cho input
            onItemSelected: null,  // Callback khi chọn item
            ...options             // Ghi đè bởi options người dùng truyền vào
        };

        // State
        this.currentFocus = -1;
        this.oldValue = "";
        this.items = Array.from(this.list.children); // Cache danh sách item

        // Khởi tạo
        this.init();
    }

    // Khởi tạo combobox
    init() {
        this.setupListeners();
    }

    // Thiết lập các sự kiện
    setupListeners() {
        // Sự kiện mousedown trên list
        this.list.addEventListener("mousedown", (event) => {
            const item = event.target.closest(".combobox-item");
            if (item) this.handleSelectItem(item);
        });

        // Sự kiện focus
        this.input.addEventListener("focus", () => this.handleFocus());

        // Sự kiện blur
        this.input.addEventListener("blur", () => this.handleShowHideList(false));

        // Sự kiện input với debounce
        // this.input.addEventListener("input", this.debounce(() => {
        //     this.resetActiveState();
        //     this.handleShowHideList(true);
        //     this.showSuggestionItems(this.input.value);
        //     this.currentFocus = -1;
        // }, this.options.debounceTime));

        this.input.addEventListener("input", () => {
            this.handleShowHideList(true);
            this.showSuggestionItems(this.input.value);
            this.currentFocus = -1;
        });

        // Sự kiện change
        this.input.addEventListener("change", () => {
            this.rollBackIfChangeNotValid(this.oldValue, this.input.value);
        });

        // Sự kiện keydown
        this.input.addEventListener("keydown", (event) => this.handleKeyDown(event));
    }

    // Xử lý khi input được focus
    handleFocus() {
        this.oldValue = this.input.value;
        this.handleShowHideList(true);
    }

    // Xử lý sự kiện keydown
    handleKeyDown(event) {
        switch (event.key) {
            case "Enter":
                event.preventDefault();
                this.handleEnterKey();
                break;
            case "ArrowUp":
                event.preventDefault();
                this.handleUpDown(-1);
                break;
            case "ArrowDown":
                event.preventDefault();
                this.handleUpDown(1);
                break;
        }
    }

    // Xử lý khi nhấn Enter
    handleEnterKey() {
        const activeItem = this.list.querySelector(".combobox-item.active");
        if (activeItem) {
            this.handleSelectItem(activeItem);
            this.handleShowHideList(false);
        }
    }

    // Chọn item và gọi callback
    handleSelectItem(item) {
        if (!item) return;
        this.input.value = item.textContent;
        this.handleShowHideList(false);
        if (typeof this.options.onItemSelected === "function") {
            this.options.onItemSelected(item); // Callback với giá trị và DOM element
        }
    }

    // Di chuyển focus lên/xuống trong danh sách gợi ý
    handleUpDown(direction) {
        const visibleItems = this.getVisibleItems();
        if (visibleItems.length === 0) return;
        this.currentFocus = (this.currentFocus + direction + visibleItems.length) % visibleItems.length;
        this.resetActiveState();
        visibleItems[this.currentFocus].classList.add("active");
        visibleItems[this.currentFocus].scrollIntoView({ block: "nearest" });
    }

    // Hiển thị/ẩn danh sách combobox
    handleShowHideList(show) {
        this.list.style.display = show ? "block" : "none";
    }

    // Lọc và hiển thị gợi ý dựa trên từ khóa
    showSuggestionItems(keyword) {
        const listItems = Array.from(this.list.children);
        const upperKeyword = keyword.trim().toUpperCase();
        listItems.forEach((item) => {
            const isMatch = item.textContent.toUpperCase().includes(upperKeyword);
            item.style.display = isMatch ? "block" : "none";
        });
    }

    // Lấy danh sách item đang hiển thị
    getVisibleItems() {
        const itemList = Array.from(this.list.children);
        return itemList.filter((item) => item.style.display !== "none");
    }

    // Xóa trạng thái active của tất cả item
    resetActiveState() {
        const itemList = Array.from(this.list.children);
        itemList.forEach((item) => item.classList.remove("active"));
    }

    // Rollback nếu giá trị mới không hợp lệ
    rollBackIfChangeNotValid(oldValue, newValue) {
        const itemList = Array.from(this.list.children);
        const isValid = itemList.some((item) => item.textContent === newValue);
        this.input.value = isValid ? newValue : oldValue;
    }

    // Hàm debounce để tối ưu input
    // debounce(func, wait) {
    //     let timeout;
    //     return (...args) => {
    //         clearTimeout(timeout);
    //         timeout = setTimeout(() => func.apply(this, args), wait);
    //     };
    // }
}