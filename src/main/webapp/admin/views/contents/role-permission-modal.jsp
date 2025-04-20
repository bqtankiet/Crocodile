<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    table {
        caption-side: bottom;
        border-collapse: collapse;
    }
</style>
<div class="modal-content">
    <div class="modal-header">
        <h1 class="modal-title fs-5 w-100 text-center" id="exampleModalLabel">Edit Role</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <form id="roleForm" method="POST" action="<c:url value="/admin/role-permission/update"/>">
        <div class="modal-body" style="padding: 1.5rem 3rem">
            <!-- role name -->
            <input type="text" id="modalRoleName" name="roleName" class="form-control"
                   placeholder="Enter a role name" tabindex="-1" value="${requestScope.roleName}">
            <input type="text" id="modalRoleId" name="roleId" value="${requestScope.roleId}" hidden="hidden"/>
            <br>
            <!-- permissions -->
            <table class="table table-flush-spacing">
                <tbody>
                <c:forEach var="scope" items="${requestScope.allPermsMap.keySet()}">
                    <tr>
                        <td class="text-nowrap fw-medium">${scope}</td>
                        <td>
                            <div class="d-flex justify-content-end">
                                <c:forEach var="perm" items="${requestScope.allPermsMap[scope]}">
                                    <div class="form-check me-4 me-lg-12">
                                        <input class="form-check-input" type="checkbox"
                                               id="${scope}-${perm.action}"
                                               name="permissions"
                                               value="${perm.id}"
                                               <c:if test="${requestScope.checkedPermsMap[scope] != null && requestScope.checkedPermsMap[scope].contains(perm)}">checked</c:if>
                                        >
                                        <label class="form-check-label" style="min-width: 6ch"
                                               for="${scope}-${perm.action}">
                                                ${perm.action}
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="btnSubmit">Save changes</button>
        </div>
    </form>
</div>
<!-- Toast Container Nằm ở trang JSP chính -->
<script>
    $(document).ready(function () {
        $('#btnSubmit').click(function (e) {
            e.preventDefault();

            const form = $('#roleForm');
            const url = form.attr('action');
            const formData = form.serialize();

            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                success: function (response, status, xhr) {
                    if (xhr.status === 200) {
                        showToast("Update successful!", "success");
                        setTimeout(() => location.reload(), 1500);
                    } else {
                        showToast("An unexpected error occurred.", "danger");
                    }
                },
                error: function (xhr) {
                    let message = "Update failed!";
                    if (xhr.status === 400) {
                        message = "Update failed!";
                    }
                    showToast(message, "danger");
                }
            });
        });

        function showToast(message, type) {
            const toastEl = document.getElementById('roleToast');
            const toastMessage = document.getElementById('toastMessage');

            toastEl.className = `toast align-items-center text-white bg-`+type+` border-0 shadow`;
            toastMessage.innerText = message;

            const toast = new bootstrap.Toast(toastEl);
            toast.show();
        }
    });
</script>

