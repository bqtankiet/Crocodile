<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    table {
        caption-side: bottom;
        border-collapse: collapse;
    }
</style>
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <!-- Button trigger modal -->
        <div class="row g-4">
        <c:set var="totalUsersByRole" value="${requestScope.totalUsersByRole}"/>
        <c:forEach var="role" items="${requestScope.roles}" varStatus="status">
            <div class="col-xl-4 col-lg-6 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <!-- total -->
                            <p class="mb-0">Total ${totalUsersByRole.get(status.index).totalUsers} users</p>
                            <!-- avatars -->
<%--                            <ul class="list-unstyled d-flex align-items-center avatar-group mb-0">--%>
<%--                                <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar pull-up" aria-label="Vinnie Mostowy" data-bs-original-title="Vinnie Mostowy">--%>
<%--                                    <img class="rounded-circle" src="../../assets/img/avatars/5.png" alt="Avatar">--%>
<%--                                </li>--%>
<%--                                <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar pull-up" aria-label="Allen Rieske" data-bs-original-title="Allen Rieske">--%>
<%--                                    <img class="rounded-circle" src="../../assets/img/avatars/12.png" alt="Avatar">--%>
<%--                                </li>--%>
<%--                                <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar pull-up" aria-label="Julee Rossignol" data-bs-original-title="Julee Rossignol">--%>
<%--                                    <img class="rounded-circle" src="../../assets/img/avatars/6.png" alt="Avatar">--%>
<%--                                </li>--%>
<%--                                <li class="avatar">--%>
<%--                                    <span class="avatar-initial rounded-circle pull-up text-body" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="3 more">+3</span>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="role-heading">
                                <h5 class="mb-1">${role.name}</h5>
                                <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#editRoleModal" data-id="${role.id}" class="role-edit-modal btn-edit-role">
                                    <p class="mb-0">Edit Role</p>
                                </a>
                            </div>
                            <a href="javascript:void(0);" class="text-secondary"><i class="icon-base ri ri-file-copy-line icon-22px"></i></a>
                        </div>
                    </div>
                </div>
            </div>
<%--            <button type="button" class="btn btn-primary btn-permission" data-id="${role.id}" data-bs-toggle="modal" data-bs-target="#editRoleModal">--%>
<%--                ${role.name}--%>
<%--            </button>--%>
        </c:forEach>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="editRoleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" id="permissionModalDialog">
            </div>
        </div>
    </div>
</div>
<script>
    $(document).on("click", ".btn-edit-role", function () {
        const roleId = $(this).data("id");
        loadPermissionModalContent(roleId);
    });

    function loadPermissionModalContent(roleId) {
        // Hiện spinner trong khi chờ response
        $('#permissionModalDialog').html(`
            <div class="d-flex align-items-center justify-content-center w-100">
                <div class="text-center my-4">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        `);
        $.ajax({
            url: 'http://localhost:8080/crocodile/admin/role-permission-modal',
            method: 'GET',
            data: {roleId: roleId},
            success: function(html) {
                $('#permissionModalDialog').html(html);
            },
            error: function() {
                alert("Error when load permission modal content");
            }
        });
    }
</script>