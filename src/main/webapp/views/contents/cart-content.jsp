<%@ page import="vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url var="homeURL" value="<%=UrlProperties.home()%>"/>
<c:url var="cartURL" value="<%=UrlProperties.cart()%>"/>
<c:url var="urlCheckout" value="<%=UrlProperties.checkout()%>"/>

<fmt:setLocale value="vi_VN"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div id="page" class="layout-default ">
    <div id="CONTENT" class="h-100">
        <div id="liveAlertPlaceholder" class="fixed-top"></div>
        <script>
            const alertPlaceholder = document.getElementById('liveAlertPlaceholder')

            // Hàm để thêm alert
            const appendAlert = (message, type) => {
                const wrapper = document.createElement('div')
                wrapper.innerHTML = [
                    `<div class="alert alert-` + type + ` alert-dismissible" role="alert">`,
                    `   <div class="text-center fw-semibold">` + message + `</div>`,
                    '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
                    '</div>'
                ].join('')

                alertPlaceholder.append(wrapper)

                // Tự động ẩn alert sau 5 giây
                setTimeout(() => {
                    wrapper.remove()  // Loại bỏ alert sau 5 giây
                }, 5000)  // 5000ms = 5s
            }

            const liveMessage = sessionStorage.getItem('liveMessage');
            const messageType = sessionStorage.getItem('liveMessageType');
            if (liveMessage) {
                appendAlert(liveMessage, messageType);
                sessionStorage.removeItem('liveMessage');
                sessionStorage.removeItem('liveMessageType');
            }
        </script>

        <!-------------------- Breadcrumb -------------------->
        <div class="container">
            <nav style="--bs-breadcrumb-divider: '>'">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${homeURL}">Trang Chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                </ol>
            </nav>
            <hr>
        </div>
        <c:choose>
            <c:when test="${empty sessionScope.cart}">
                <div class="d-flex justify-content-center align-items-center">
                    <div class="alert alert-warning text-center shadow-lg p-5" role="alert"
                         style="max-width: 600px; width: 100%;">
                        <h3 class="mb-4">Giỏ hàng trống!</h3>
                        <p class="mb-4">Chưa có sản phẩm nào trong giỏ hàng. Hãy mua sắm ngay nào!</p>
                        <a href="${homeURL}" class="btn custom-btn-primary btn-lg">Về trang chủ</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
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
                            <table class="table text-center table-hover" id="cartTable">
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
                                <c:forEach items="${sessionScope.cart.items}" var="item">
                                    <c:set var="productVariant" value="${item.productVariant}"/>
                                    <tr>
                                            <%--   Sản phẩm ở đây--%>
                                        <th scope="row" class="align-middle text-start">
                                            <div class="d-flex align-items-center">
                                                <div class="form-check float-start mx-3">
                                                    <input type="checkbox" class="product-check form-check-input"
                                                           name="selectedIds" value="${productVariant.id}"
                                                           aria-label="">
                                                </div>
                                                <div class="ratio ratio-1x1" style="width: 6rem">
                                                    <img src="${productVariant.product.image}" class="rounded-1" alt="">
                                                </div>
                                                <div class="ms-4 col-6">
                                                    <p class="mb-2 line-clamp-2"
                                                       style="height: fit-content">${productVariant.product.name}</p>
                                                    <c:if test="${productVariant.pOption1 != null}">
                                                        <p class="fw-normal">${productVariant.pOption1.key}: ${productVariant.pOption1.value}

                                                            <c:if test="${productVariant.pOption2 != null}">
                                                                , ${productVariant.pOption2.key}: ${productVariant.pOption2.value}
                                                            </c:if>
                                                        </p>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </th>
                                        <td class="align-middle">
                                            <p class="mb-0 fw-semibold product-price">
                                                <fmt:formatNumber value="${productVariant.product.price}"
                                                                  type="currency" currencySymbol="₫"
                                                                  groupingUsed="true"/>
                                                    <%--                                        <fmt:formatNumber value="${productVariant.product.price}" type="number" pattern="#,##0" />--%>
                                                    <%--                                        <sup>₫</sup>--%>
                                            </p>
                                        </td>
                                        <td class="align-middle">

                                            <div class="quantity-control input-group justify-content-center"
                                                 data-min="1"
                                                 data-max="200">
                                                <button type="button" class="decrement btn btn-secondary">-</button>
                                                <input type="number" name="quantity"
                                                       class="quantity-input form-control text-center"
                                                       aria-label="quantity"
                                                       style="max-width: 6ch;" value="${item.quantity}"
                                                       data-id="${productVariant.id}"
                                                       data-action="update">
                                                <button type="button" class="increment btn btn-secondary">+</button>
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <p class="mb-0 fw-semibold product-total-price">
                                                <fmt:formatNumber value="${item.caculatePrice()}" type="currency"
                                                                  currencySymbol="₫" groupingUsed="true"/>
                                                    <%--                                        <fmt:formatNumber value="${item.caculatePrice()}" type="number" pattern="#,##0" /> <sup>₫</sup>--%>
                                            </p>
                                        </td>
                                        <td class="align-middle">
                                            <button class="removeBtn btn btn-outline-danger px-2 custom-icon mx-auto"
                                                    data-id="${productVariant.id}" data-action="remove">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor"
                                                     class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                    <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"></path>
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
                            <h5>Tổng thanh toán
                                <c:if test="${sessionScope.cart.totalQuantity > 0}">
                                    <span class="[ count-products ]"
                                          id="myProductCount">(${sessionScope.cart.totalQuantity} sản phẩm)</span>
                                </c:if>
                            </h5>
                            <div class="text-danger fw-medium">
                    <span id="totalPayment" class="fs-5 fw-bold">
                        <fmt:formatNumber value="${sessionScope.cart.totalPrice}" type="number" pattern="#,##0"/>
                            <sup>₫</sup>
                    </span>

                            </div>
                        </div>
                        <a class="btn custom-btn-primary ms-auto px-5 py-2 fw-medium orderBtn"
                           type="button">Đặt Mua</a>
                    </div>
                </div>
                <div style="height: 150px"></div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    // Chức năng chọn tất cả
    $("#selectAll").on("click", function () {
        $(".product-check").prop("checked", this.checked);
        $(".product-check").trigger('change');
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

<script>
    $(document).ready(function () {
        $('.quantity-input').on('input', function () {

            const idVariant = $(this).data('id');
            const action = $(this).data('action');
            const quantity = $(this).val();

            // --------------------update total amount realtime--------------------
            const $row = $(this).closest('tr');
            const productPrice = $row.find(".product-price").text().replace(/[₫,\.]/g, '').trim();
            const totalPrice = parseFloat(productPrice) * quantity;
            const formattedPrice = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(totalPrice);
            $row.find('.product-total-price').html(formattedPrice);

            // tong tien trong cart
            let totalAmountCart = 0;
            $('.product-total-price').each(function () {
                const productPrice = $(this).text().replace(/[₫,\.]/g, '').trim();
                totalAmountCart += parseFloat(productPrice);
            });

            const formattedPriceCart = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(totalAmountCart);
            $('.totalAmountCart').html(formattedPriceCart)
            // -------------------- update total amount realtime--------------------

            $.ajax({
                url: '${cartURL}',
                method: 'POST',
                data: {
                    action: action,
                    idVariant: idVariant,
                    quantity: quantity
                },
                success: function (response) {
                    console.log('Đã cập nhật số lượng ');
                    updateTotal();
                },
                error: function (xhr, status, error) {
                    console.error('Lỗi khi gửi dữ liệu: ', error);
                }
            });
        });
    });

    function updateTotal() {
        console.log("execute updateTotal");
        let totalAmount = 0;
        let productCount = 0;

        // Duyệt qua từng hàng sản phẩm trong bảng
        $('#cartTable tbody tr').each(function () {
            const $checkbox = $(this).find('.product-check'); // Lấy checkbox
            const isChecked = $checkbox.prop('checked'); // Kiểm tra xem checkbox có được chọn không

            if (isChecked) {
                productCount++;
                // Lấy giá sản phẩm
                const productPrice = parseFloat($(this).find('.product-price').text().replace(/[₫,\.]/g, '').trim());

                // Lấy số lượng sản phẩm
                const quantity = parseInt($(this).find('.quantity-input').val());

                // Tính tổng tiền cho sản phẩm này
                const totalPrice = productPrice * quantity;

                // Cộng vào tổng tiền
                totalAmount += totalPrice;
            }
        });
        console.log(totalAmount)

        // Cập nhật tổng tiền cho giỏ hàng
        $('#totalPayment').text(totalAmount.toLocaleString('vi-VN') + '₫');

        // Cập nhật tổng số sản phẩm cần thanh toán
        $('#myProductCount').text('(' + productCount + ' sản phẩm)');
    }
</script>

<script>
    $(document).on('click', '.removeBtn', function (event) {
        event.preventDefault();
        const idVariant = $(this).data('id');
        const action = $(this).data('action');

        $.ajax({
            url: "${cartURL}",
            type: "POST",
            data: {
                action: action,
                idVariant: idVariant
            },
            success: function (response) {
                sessionStorage.setItem('liveMessage', 'Xóa sản phẩm khỏi giỏ hàng thành công!');
                sessionStorage.setItem('liveMessageType', 'success');
                window.location.reload();
                // appendAlert('Thêm vào giỏ hàng thành công!', 'success')
                // alert("Thêm vào giỏ hàng thành công!");
            },
            error: function (xhr, status, error) {
                if (xhr.status === 404) {
                    alert("Không tìm thấy endpoint " + "${cartURL}");
                } else {
                    sessionStorage.setItem('liveMessage', 'Xóa sản phảm thất bại!');
                    sessionStorage.setItem('liveMessageType', 'danger');
                    window.location.reload();
                }
                console.error("Error:", error);
            }
        })

    });
</script>

<script>
    $(document).on('click', '.orderBtn', function (event) {
        const selectedIds = [];
        $("input[name='selectedIds']:checked").each(function () {
            selectedIds.push($(this).val());
        });

        <%--if (selectedIds.length > 0) {--%>
        <%--    $.ajax({--%>
        <%--        url: "${urlCheckout}",--%>
        <%--        type: "GET",--%>
        <%--        data: {--%>
        <%--            selectedIds: selectedIds.join(','),--%>
        <%--        },--%>
        <%--        success: function(response) {--%>

        <%--        },--%>
        <%--        error: function(xhr, status, error) {--%>

        <%--        }--%>
        <%--    });--%>
        <%--} else {--%>
        <%--    window.location.reload();--%>
        <%--    sessionStorage.setItem('liveMessage', 'Vui lòng chọn ít nhất 1 sản phẩm!');--%>
        <%--    sessionStorage.setItem('liveMessageType', 'danger');--%>
        <%--    event.preventDefault();--%>
        <%--}--%>

        if (selectedIds.length > 0) {
            let items = [];
            $('#cartTable tbody tr').each(function () {
                const $checkbox = $(this).find('.product-check'); // Lấy checkbox
                const isChecked = $checkbox.prop('checked'); // Kiểm tra xem checkbox có được chọn không

                if (isChecked) {
                    // Lấy id variant
                    const variantId = parseInt($(this).find("input[name='selectedIds']:checked").val());
                    // Lấy số lượng sản phẩm
                    const quantity = parseInt($(this).find('.quantity-input').val());
                    items.push({
                        variantId: variantId,
                        quantity: quantity
                    });
                }
            });
            console.log(items);
            $.ajax({
                url: "http://localhost:8080/checkout/v2",
                type: "POST",
                data: JSON.stringify({ items }),
                success: function (response) {
                    console.log('Request successful:', response);
                    window.location.href = 'http://localhost:8080/checkout/v2';
                },
                error: function (xhr, status, error) {
                    console.error('Request failed:', status, error);
                    if (xhr.status === 406) {
                        Swal.fire({
                            icon: 'error',
                            title: "Thất bại",
                            text: "Có một số vấn đề với giỏ hàng của bạn. Vui lòng kiểm tra và thử lại sau.",
                            confirmButtonText: 'OK'
                        });
                    }
                }
            });

        } else {
            window.location.reload();
            sessionStorage.setItem('liveMessage', 'Vui lòng chọn ít nhất 1 sản phẩm!');
            sessionStorage.setItem('liveMessageType', 'danger');
            event.preventDefault();
        }

    });
</script>

<script>
    $(document).ready(function () {
        // Hàm tính lại tổng tiền

        // Lắng nghe sự kiện thay đổi trên checkbox
        $('.product-check').on('change', function () {
            updateTotal(); // Cập nhật tổng tiền khi checkbox thay đổi
        });

        $('.selectAll').on('change', function () {
            updateTotal(); // Cập nhật tổng tiền khi checkbox thay đổi
        });

        // Lắng nghe sự kiện thay đổi trên ô nhập số lượng (nếu có)
        $('.quantity-input').on('change', function () {
            updateTotal(); // Cập nhật tổng tiền khi số lượng thay đổi
        });

        // Gọi hàm tính toán tổng tiền khi trang được tải lần đầu
        updateTotal();
    });
</script>