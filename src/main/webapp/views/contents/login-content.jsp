<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="page">
    <div id="HEADER"></div>
    <!-- Form đăng nhập -->
    <div class="container-fluid d-flex flex-wrap justify-content-center align-items-center gap-4 py-5">
        <!-- phần logo -->
        <div class="mb-4">
            <img src="https://www.crocodileinternational.com/img/crocodile-logo-1609222037.jpg"
                 class="img-fluid"
                 style="max-width: 100%; height: auto;"
                 alt="Logo">
        </div>
        <!-- phần đăng nhậpp    -->
        <div class="card shadow p-4 " style="width: 28rem">
            <h3 class="text-center mb-4">Đăng Nhập</h3>
            <form id="loginForm" class="d-grid gap-4">
                <input class="form-control" type="text" id="username" placeholder="Nhập tài khoản" required>
                <input class="form-control" type="password" id="password" placeholder="Nhập mật khẩu" required>
                <button type="submit" class="btn custom-btn-primary btn-block w-100 p-2">Đăng Nhập</button>
                <div class="d-flex justify-content-between mt-2 ">
                    <a href="forget_passW.html" class="custom-text-primary text-decoration-none">Quên Mật Khẩu </a>
                    <a href="#" class="custom-text-primary text-decoration-none">Đăng Nhập Bằng SMS</a>
                </div>
                <div class="d-flex align-items-center justify-content-center">
                    <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                    <div class="px-2" style="color: #ccc">HOẶC</div>
                    <div style="height: 1px; background-color: #dbdbdb; width: 100%"></div>
                </div>
                <div class="d-flex gap-3 justify-content-between mt-3">
                    <a href="https://www.facebook.com/v21.0/dialog/oauth?
  client_id=1495682341127039
  &redirect_uri=http://localhost:8080/crocodile/FaceBookLogin" target="_blank"
                       class="d-flex flex-grow-1 align-items-center justify-content-center text-decoration-none border p-2">
                        <div class="custom-icon" style="--size: 2rem">
                            <!-- Icon Facebook -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 48 48">
                                <path fill="#039be5" d="M24 5A19 19 0 1 0 24 43A19 19 0 1 0 24 5Z"></path>
                                <path fill="#fff"
                                      d="M26.572,29.036h4.917l0.772-4.995h-5.69v-2.73c0-2.075,0.678-3.915,2.619-3.915h3.119v-4.359c-0.548-0.074-1.707-0.236-3.897-0.236c-4.573,0-7.254,2.415-7.254,7.917v3.323h-4.701v4.995h4.701v13.729C22.089,42.905,23.032,43,24,43c0.875,0,1.729-0.08,2.572-0.194V29.036z"></path>
                            </svg>
                        </div>
                        <span class="text-black ps-1">Facebook</span>
                    </a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/crocodile/user&response_type=code&client_id=572037439735-e41fphcdpbjji4a7he5ol43jrff6raki.apps.googleusercontent.com&approval_prompt=force"
                       target="_blank"
                       class="d-flex flex-grow-1 align-items-center justify-content-center text-decoration-none border
                    p-2">
                        <div class="custom-icon" style="--size: 2rem">
                            <!-- Icon Google -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 48 48">
                                <path fill="#fbc02d"
                                      d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12	s5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24s8.955,20,20,20	s20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path>
                                <path fill="#e53935"
                                      d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039	l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path>
                                <path fill="#4caf50"
                                      d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36	c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path>
                                <path fill="#1565c0"
                                      d="M43.611,20.083L43.595,20L42,20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571	c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
                            </svg>
                        </div>
                        <span class="text-black ps-1">Google</span>
                    </a>
                </div>
                <div>
                    <p class="text-center">Bạn Chưa Có Tài Khoản? <a href="signup.html"
                                                                     class="custom-text-primary ">Đăng
                        Ký </a> Ngay</p>
                </div>
            </form>
            <div id="message" class="mt-3"></div>
        </div>
    </div>
</div>
