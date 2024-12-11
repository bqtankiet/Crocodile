<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <%
        String username = request.getAttribute("username") != null ? (String) request.getAttribute("username") : "";
        String error = request.getAttribute("error") != null ? (String) request.getAttribute("error") : "";
    %>
</head>
<body>
<% if (error != null && !error.isEmpty()) { %>
<div class="alert alert-danger w-100 text-center" role="alert">
    <%= error %>
</div>
<% } %>
<div class="container vh-100 d-flex justify-content-center align-items-center">
    <div class="card p-4 shadow-lg" style="width: 100%; max-width: 400px;">
        <h3 class="text-center mb-4">Login</h3>
        <form action="login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">User name</label>
                <input type="text" class="form-control" id="email" name="username" placeholder="Enter username"
                       value="<%= username %>">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
            <div class="mt-3 text-center">
                <a href="#" class="text-muted">Forgot password?</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
