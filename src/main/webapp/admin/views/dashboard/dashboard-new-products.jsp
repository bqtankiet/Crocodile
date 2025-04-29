<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="table-responsive scrollbar rounded-lg">
  <table class="table table-dashboard mb-0 table-borderless fs-small border-200">
    <thead class="bg-light">
    <tr>
      <th class="text-900">Sản phẩm mới</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${requestScope.newProducts}">
      <tr class="border-bottom border-200">
        <td>
          <div class="d-flex align-items-center position-relative"><img
                  class="rounded-1 border border-200" src="${p.image}"
                  width="60" alt="">
            <div class="flex-1 ms-3">
              <h6 class="mb-1 fw-semi-bold"><a class="text-1100 stretched-link" href="#!">${p.name}</a></h6>
              <a class="fw-semi-bold mb-0 text-500" href="#!">Xem thêm</a>
            </div>
          </div>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
