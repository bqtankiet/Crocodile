<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Modal -->
<div class="modal-content border-0 shadow-sm">
    <div class="modal-header bg-primary text-white">
        <h1 class="modal-title fs-5 text-white pb-2" id="exampleModalLabel">Thêm mã giảm giá</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" aria-label="Đóng modal"></button>
    </div>
    <div class="modal-body p-4">
        <div id="formMessages"></div>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <form id="discountForm" novalidate>
            <input type="hidden" name="action" value="create">
            <div class="row g-4">
                <!-- Cột trái: Thông tin mã và giá trị -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="code" class="form-label fw-semibold">Mã giảm giá <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="code" name="code" placeholder="VD: SUMMER10" required
                               aria-describedby="codeHelp" pattern="[A-Za-z0-9]{4,20}">
                        <div id="codeHelp" class="form-text">Mã từ 4-20 ký tự, chỉ chứa chữ và số.</div>
                        <div class="invalid-feedback">Vui lòng nhập mã hợp lệ (4-20 ký tự, chữ và số).</div>
                    </div>
                    <div class="mb-3">
                        <label for="type" class="form-label fw-semibold">Loại giảm giá <span class="text-danger">*</span></label>
                        <select class="form-select" id="type" name="type" required aria-describedby="typeHelp">
                            <option value="" disabled selected>Chọn loại giảm giá</option>
                            <option value="PERCENTAGE">Phần trăm</option>
                            <option value="FIXED">Số tiền cố định</option>
                        </select>
                        <div id="typeHelp" class="form-text">Chọn loại mã: phần trăm hoặc số tiền cố định.</div>
                        <div class="invalid-feedback">Vui lòng chọn loại giảm giá.</div>
                    </div>
                    <div class="mb-3">
                        <label for="value" class="form-label fw-semibold">Giá trị <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="number" step="0.01" min="0" class="form-control" id="value" name="value" required
                                   placeholder="VD: 10" aria-describedby="valueHelp">
                            <span class="input-group-text" id="valueUnit"></span>
                        </div>
                        <div id="valueHelp" class="form-text">Nhập giá trị giảm (VD: 10% hoặc 100,000 VNĐ).</div>
                        <div class="invalid-feedback">Vui lòng nhập giá trị hợp lệ (lớn hơn 0).</div>
                    </div>
                    <div class="mb-3" id="maxDiscountGroup">
                        <label for="maxDiscount" class="form-label fw-semibold">Giảm tối đa (VNĐ)</label>
                        <input type="number" step="0.01" min="0" class="form-control" id="maxDiscount" name="maxDiscount"
                               placeholder="VD: 100000" aria-describedby="maxDiscountHelp">
                        <div id="maxDiscountHelp" class="form-text">Giới hạn giá trị giảm tối đa cho mã phần trăm.</div>
                        <div class="invalid-feedback">Vui lòng nhập giá trị hợp lệ (lớn hơn 0).</div>
                    </div>
                </div>
                <!-- Cột phải: Ngày giờ và giới hạn -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="startDate" class="form-label fw-semibold">Ngày bắt đầu <span class="text-danger">*</span></label>
                        <input type="datetime-local" class="form-control" id="startDate" name="startDate" required
                               aria-describedby="startDateHelp">
                        <div id="startDateHelp" class="form-text">Chọn thời điểm mã bắt đầu có hiệu lực.</div>
                        <div class="invalid-feedback">Vui lòng chọn ngày bắt đầu.</div>
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label fw-semibold">Ngày hết hạn <span class="text-danger">*</span></label>
                        <input type="datetime-local" class="form-control" id="endDate" name="endDate" required
                               aria-describedby="endDateHelp">
                        <div id="endDateHelp" class="form-text">Chọn thời điểm mã hết hiệu lực.</div>
                        <div class="invalid-feedback">Vui lòng chọn ngày hết hạn.</div>
                    </div>
                    <div class="mb-3">
                        <label for="maxUses" class="form-label fw-semibold">Số lượng <span class="text-danger">*</span></label>
                        <input type="number" min="1" class="form-control" id="maxUses" name="maxUses" required
                               placeholder="VD: 100" aria-describedby="maxUsesHelp">
                        <div id="maxUsesHelp" class="form-text">Số lần tối đa mã có thể được sử dụng.</div>
                        <div class="invalid-feedback">Vui lòng nhập số lần sử dụng hợp lệ (lớn hơn 0).</div>
                    </div>
                    <div class="mb-3">
                        <label for="minOrderValue" class="form-label fw-semibold">Đơn hàng tối thiểu (VNĐ) <span class="text-danger">*</span></label>
                        <input type="number" step="0.01" min="0" class="form-control" id="minOrderValue" name="minOrderValue"
                               placeholder="VD: 500000" value="500000" required aria-describedby="minOrderValueHelp">
                        <div id="minOrderValueHelp" class="form-text">Giá trị đơn hàng tối thiểu để áp dụng mã.</div>
                        <div class="invalid-feedback">Vui lòng nhập giá trị hợp lệ (lớn hơn 0).</div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="button" id="submitForm" class="btn btn-primary">Lưu mã giảm giá</button>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Toggle maxDiscount field based on type
        const typeSelect = document.getElementById('type');
        const maxDiscountGroup = document.getElementById('maxDiscountGroup');
        const valueUnit = document.getElementById('valueUnit');
        const form = document.getElementById('discountForm');
        const submitButton = document.getElementById('submitForm');
        const messagesDiv = document.getElementById('formMessages');

        function updateForm() {
            const isPercentage = typeSelect.value === 'PERCENTAGE';
            maxDiscountGroup.style.display = isPercentage ? 'block' : 'none';
            if (!isPercentage) {
                document.getElementById('maxDiscount').value = '';
            }
            valueUnit.textContent = isPercentage ? '%' : 'VNĐ';
        }

        updateForm();
        typeSelect.addEventListener('change', updateForm);

        // Set default start date to now
        const now = new Date();
        document.getElementById('startDate').value = now.toISOString().slice(0, 16);

        // Handle form submission with AJAX
        submitButton.addEventListener('click', function () {
            if (!form.checkValidity()) {
                form.classList.add('was-validated');
                return;
            }

            const startDate = new Date(document.getElementById('startDate').value);
            const endDate = new Date(document.getElementById('endDate').value);
            const value = parseFloat(document.getElementById('value').value);

            if (startDate >= endDate) {
                messagesDiv.innerHTML = `
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Ngày hết hạn phải sau ngày bắt đầu.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>`;
                return;
            }
            if (value <= 0) {
                messagesDiv.innerHTML = `
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Giá trị giảm phải lớn hơn 0.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>`;
                return;
            }

            const formData = new FormData(form);
            fetch('${pageContext.request.contextPath}/admin/discount-codes', {
                method: 'POST',
                body: formData
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        messagesDiv.innerHTML = `
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            Tạo mã giảm giá thành công!
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>`;
                        form.reset();
                        updateForm();
                        document.getElementById('startDate').value = new Date().toISOString().slice(0, 16);
                    } else {
                        messagesDiv.innerHTML = `
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            ${data.error || 'Lỗi khi tạo mã giảm giá.'}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>`;
                    }
                })
                .catch(error => {
                    messagesDiv.innerHTML = `
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Lỗi hệ thống: ${error.message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>`;
                });
        });

        // Client-side validation
        form.addEventListener('submit', function (event) {
            event.preventDefault();
            form.classList.add('was-validated');
        });
    });
</script>