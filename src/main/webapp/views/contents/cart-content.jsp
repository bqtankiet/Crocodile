<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="page" class="layout-default ">

    <div id="CONTENT" class="h-100">
        <!-------------------- Breadcrumb -------------------->
        <div class="container">
            <nav style="--bs-breadcrumb-divider: '>'">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home.html">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                </ol>
            </nav>
            <hr>
        </div>

        <form action="http://localhost:8080/crocodile/cart" method="post">
            <input type="text" name="idProduct" value="1">
            <input type="text" name="quantity" value="3">
            <button type="submit">them vao gio hang</button>
        </form>
        <div class="container d-flex justify-content-center align-items-center">
            <div class="col">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="fw-bold mb-0">Chi tiết giỏ hàng</h3>
                    <button id="removeAllBtn" class="btn btn-outline-secondary ms-auto">Xóa mục đã chọn</button>
                </div>
                <div class="form-check d-flex align-items-center ms-4">
                    <input type="checkbox" class="form-check-input my-0 me-2" aria-label="" id="selectAll">
                    <label for="selectAll">Chọn tất cả</label>
                </div>
                <div class="table-responsive">
                    <table class="table text-center table-hover">
                        <thead>
                        <tr>
                            <th scope="col" class="col">Sản phẩm</th>
                            <th scope="col" class="col-2">Đơn giá</th>
                            <th scope="col" class="col-2">Số lượng</th>
                            <th scope="col" class="col-2">Thành tiền</th>
                            <th scope="col" class="col-1">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.cart.item}" var="cart">
                            <tr>
                                    <%--   Sản phẩm ở đây--%>
                                <th scope="row" class="align-middle text-start">
                                    <div class="d-flex align-items-center">
                                        <div class="form-check float-start mx-3">
                                            <input type="checkbox" class="product-check form-check-input" aria-label="">
                                        </div>
                                        <div class="ratio ratio-1x1" style="width: 6rem">
                                            <img src="${cart.product.image}" class="rounded-1" alt="">
                                        </div>
                                        <div class="ms-4 col-6">
                                            <p class="mb-2 line-clamp-2" style="height: fit-content">${cart.product.name}</p>
                                            <p class="fw-normal">Phân loại: Da trơn</p>
                                        </div>
                                    </div>
                                </th>
                                <td class="align-middle">
                                    <p class="mb-0 fw-semibold product-price">
                                        <fmt:formatNumber value="${cart.product.price}" type="number" pattern="#,##0" />
                                        <sup>₫</sup>
                                    </p>
                                </td>
                                <td class="align-middle">
                                    <div class="quantity-control input-group justify-content-center" data-min="1"
                                         data-max="200">
                                        <button type="button" class="decrement btn btn-secondary">-</button>
                                        <input type="number" name="quantity"
                                               class="quantity-input form-control text-center" aria-label="quantity"
                                               style="max-width: 6ch;" value="${cart.quantity}">
                                        <button type="button" class="increment btn btn-secondary">+</button>
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <p class="mb-0 fw-semibold product-price">
                                        <fmt:formatNumber value="${cart.product.price * cart.quantity}"
                                                          type="number" pattern="#,##0" /> <sup>₫</sup>
                                    </p>
                                </td>
                                <td class="align-middle">
                                    <button class="removeBtn btn btn-outline-danger px-2 custom-icon mx-auto">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                            <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="fixed-bottom shadow-lg bg-light">
            <div class="container d-flex align-items-center rounded-2 p-4 px-5">
                <div>
                    <h5>Tổng thanh toán <span>(<span class="[ count-products ]">1</span> sản phẩm)</span></h5>
                    <div class="text-danger fw-medium">
                        <span class="fs-5 fw-bold">
                            <fmt:formatNumber value="${sessionScope.cart.total}" type="number" pattern="#,##0" />
                            <sup>₫</sup>
                        </span>

                    </div>
                </div>
                <a class="btn custom-btn-primary ms-auto px-5 py-2 fw-medium" type="button" href="checkout.html">Đặt
                    Mua</a>
            </div>
        </div>

        <div style="height: 150px"></div>
    </div>
</div>

<script>
    // Chức năng chọn tất cả
    $("#selectAll").on("click", function () {
        $(".product-check").prop("checked", this.checked);
        toggleRemoveAllButton();
    });

    // Chức năng xóa từng sản phẩm
    $(".removeBtn").on("click", function () {
        $(this).closest("tr").remove();
        toggleRemoveAllButton();
    });

    // Chức năng xóa tất cả sản phẩm đã chọn
    $("#removeAllBtn").on("click", function () {
        $(".product-check:checked").closest("tr").remove();
        toggleRemoveAllButton();
    });

    // Kiểm tra trạng thái checkbox để bật/tắt nút xóa tất cả
    $(".product-check, #selectAll").on("change", function () {
        $(".product-check:checked").closest("tr").addClass("table-secondary");
        $(".product-check:not(:checked)").closest("tr").removeClass("table-secondary");
        toggleRemoveAllButton();
    });

    // Hàm bật/tắt nút xóa tất cả dựa trên trạng thái checkbox
    function toggleRemoveAllButton() {
        const hasChecked = $(".product-check:checked").length > 0;
        $removeAllBtn = $("#removeAllBtn");
        $removeAllBtn.prop("disabled", !hasChecked);
        if (hasChecked) {
            $removeAllBtn.removeClass("btn-outline-secondary")
            $removeAllBtn.addClass("btn-outline-danger");
        } else {
            $("#selectAll").prop("checked", false);
            $removeAllBtn.removeClass("btn-outline-danger");
            $removeAllBtn.addClass("btn-outline-secondary");
        }
    }

    // Gọi hàm kiểm tra trạng thái nút xóa tất cả khi trang được tải
    $(document).ready(function () {
        toggleRemoveAllButton();
    });
</script>
