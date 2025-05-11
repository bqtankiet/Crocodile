function fetchOrderItems(id) {
    $.ajax({
        url: `http://crocodile.nludemo.id.vn/api/admin/order/items?id=${id}`,
        dataType: 'json',
        method: 'GET',
        success: function (data) {
            console.log(data);
            renderOrderItems(data);
        },
        error: function () {
            alert("Lấy danh sách đơn hàng thất bại tại endpoint: /api/admin/order/items");
        }
    });


    function renderOrderItems(data) {
        for (let i = 0; i < data.length; i++) {
            const productItem = data[i];

            let options = [];
            if (productItem.o1Key && productItem.o1Value) {
                options.push(`${productItem.o1Key}: ${productItem.o1Value}`);
            }
            if (productItem.o2Key && productItem.o2Value) {
                options.push(`${productItem.o2Key}: ${productItem.o2Value}`);
            }
            let optionsText = options.join(', ');

            // chèn tr html vô table
            let html = `
                    <tr class="">
                        <%--Mã sản phẩm--%>
                        <td class="align-middle text-start"> ${productItem.id} </td>
                        <%--Tên Sản phẩm--%>
                        <td class="align-middle text-start py-3">
                            <div class="">
                                <p class="mb-2 line-clamp-2" style="height: fit-content">${productItem.name}</p>
                                <p class="variant-options fw-normal m-0 text-muted">${optionsText}</p>

                            </div>
                        </td>
                        <%--Đơn giá--%>
                        <td class="align-middle">
                            <p class="mb-0 product-price">${numeral(productItem.unitPrice).format('0,0') + " ₫"}</p>
                        </td>
                        <%--Số lượng--%>
                        <td class="align-middle">${productItem.amount}</td>
                        <%--Thành tiền--%>
                        <td class="align-middle">
                            <p class="mb-0 product-total-price">${numeral(productItem.total).format('0,0') + " ₫"}</p>
                        </td>
                        <%--Thao tác--%>
                        <td class="align-middle">
                            <button class="removeBtn btn btn-outline-danger px-2 custom-icon mx-auto"
                                    data-id="?" data-action="remove">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                     fill="currentColor"
                                     class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                    <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"></path>
                                </svg>
                            </button>
                        </td>
                    </tr>
                `;
            $('#product-list').append($(html));
        }
    }
}