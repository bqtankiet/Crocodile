<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="table-responsive scrollbar">
    <table class="table table-dashboard mb-0 table-borderless fs-small border-200">
        <thead class="bg-light">
        <tr>
            <th class="text-900">Sản phẩm mua nhiều</th>
            <th class="text-900 text-end">Đã bán</th>
            <th class="text-900 pe-x1 text-end" style="width: 8rem">Chiếm tỷ lệ (%)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${requestScope.topSaleProducts}">
            <tr class="border-bottom border-200">
                <td>
                    <div class="d-flex align-items-center position-relative"><img
                            class="rounded-1 border border-200" src="${product.image}"
                            width="60" alt="">
                        <div class="flex-1 ms-3">
                            <h6 class="mb-1 fw-semi-bold">
                                <a class="text-1100 stretched-link" href="#!">${product.name}</a>
                            </h6>
                                <%--                  <a class="fw-semi-bold mb-0 text-500">Xem sản phẩm</a>--%>
                        </div>
                    </div>
                </td>
                <td class="align-middle text-end fw-semi-bold">${product.saleAmount}</td>
                <td class="align-middle pe-x1">
                    <div class="d-flex align-items-center">
                        <div class="progress me-3 rounded-3 bg-200" style="height: 5px; width:80px;"
                             role="progressbar" aria-valuenow="39" aria-valuemin="0"
                             aria-valuemax="100">
                            <div class="progress-bar rounded-pill"
                                 style="width: ${product.salePercent}%;"></div>
                        </div>
                        <div class="fw-semi-bold ms-2">${product.salePercent}%</div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        <!-- Giữ nguyên các dòng khác -->
        </tbody>
    </table>
</div>