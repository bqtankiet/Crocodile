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
        <c:set var="top3UserByRole" value="${requestScope.top3UsersByRole}"/>
        <c:forEach var="role" items="${requestScope.roles}" varStatus="status">
            <c:set var="totalUser" value="${totalUsersByRole.get(status.index).totalUsers}"/>
            <c:set var="top3Users" value="${top3UserByRole.get(role.id)}"/>
            <div class="col-xl-4 col-lg-6 col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <!-- total -->
                            <p class="mb-0">Total ${totalUser} users</p>
                            <!-- avatars -->
                            <ul class="list-unstyled d-flex align-items-center avatar-group mb-0">
                                <c:forEach var="userRole" items="${top3Users}">
                                    <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar pull-up" aria-label="" data-bs-original-title="${userRole.fullName}">
                                        <img class="rounded-circle" src="https://ui-avatars.com/api/?name=${userRole.fullName}&background=random" alt="Avatar">
                                    </li>
                                </c:forEach>
                                <c:if test="${totalUser > 3}">
                                    <li class="avatar">
                                        <c:set var="moreCount" value="${(totalUser - top3UserByRole.size()) > 99 ? 99 : (totalUser - top3UserByRole.size())}" />
                                        <span class="avatar-initial rounded-circle pull-up text-body" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="+${moreCount}">+${moreCount}</span>
                                    </li>
                                </c:if>
                            </ul>
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
        </c:forEach><div class="col-xl-4 col-lg-6 col-md-6">
            <div class="card h-100">
                <div class="row h-100">
                    <div class="col-5">
                        <div class="d-flex align-items-end h-100 justify-content-center">
<%--                            <img src="../../assets/img/illustrations/illustration-3.png" class="img-fluid" alt="Image" width="80">--%>
                        </div>
                    </div>
                    <div class="col-7">
                        <div class="card-body text-sm-end text-center ps-sm-0">
                            <button id="btnAddRole" data-bs-target="#editRoleModal" data-bs-toggle="modal" class="btn btn-sm btn-primary mb-4 text-nowrap add-new-role waves-effect waves-light">Add New Role</button>
                            <p class="mb-0">Add role, if it does not exist</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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

    $('#btnAddRole').on("click", function() {
        loadPermissionModalContentNewRole();
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
            url: 'http://crocodile.nludemo.id.vn/admin/role-permission-modal',
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

    function loadPermissionModalContentNewRole() {
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
            url: 'http://crocodile.nludemo.id.vn/admin/role-permission-modal',
            method: 'GET',
            data: {action: "newRole"},
            success: function(html) {
                $('#permissionModalDialog').html(html);
            },
            error: function() {
                alert("Error when load permission modal content");
            }
        });
    }
</script>