<%-- 
    Document   : signin
    Created on : May 18, 2022, 10:09:39 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Sign In</title>
        <link rel="stylesheet" href="/BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="/BeDev/view/dist/images/favicon/favicon.png" />
    </head>

    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <!-- SignIn Area Starts Here -->
            <section class="section signup-area signin-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-5 order-2 order-xl-0">
                            <div class="signup-area-textwrapper">
                                <h2 class="font-title--md mb-0">Sign in</h2>
                                <p class="mt-2 mb-lg-4 mb-3">Don't have account? <a href="SignUp" class="text-black-50">Sign up</a></p>
                                <form action="SignIn" method="post">
                                    <div class="form-element"  id="emailInput">
                                        <div class="form-alert">
                                            <label for="email">Email</label>
                                            <span id="emailAlert" class="d-none" >Please enter a valid email</span>
                                        </div>
                                        <div class="form-alert-input">
                                            <input onblur="checkEmail()" type="email" placeholder="Youremail@gmail.com" id="email" name="email" />
                                        </div>
                                    </div>
                                    <div class="form-element" id="passInput">
                                        <div class="d-flex justify-content-between">
                                            <label for="confirm-password">Password</label>
                                            <a href="/BeDev/ResetPassword" class="text-primary fs-6">Reset Password</a>
                                        </div>
                                        <div class="form-alert-input">
                                            <input type="password" placeholder="Type here." id="password" onblur="checkPassword()" name="password" />
                                            <div class="form-alert-icon" onclick="showPassword('password', this)">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    stroke-width="2"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    class="feather feather-eye"
                                                    >
                                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                                <circle cx="12" cy="12" r="3"></circle>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="color: red">
                                    ${mess}
                                </div>
                                <div class="form-element">
                                    <button type="submit" class="button button-lg button--primary w-100">Sign in</button>
                                </div>

                            </form>
                        </div>
                    </div>
                    <div class="col-xl-7 order-1 order-xl-0">
                        <div class="signup-area-image">
                            <img width="500" style="margin-left: 120px;" src="/BeDev/view/dist/images/banner/banner-image-01.png" alt="Illustration Image" class="img-fluid" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>


            const validateEmail = (email) => {
                return email.match(
                        /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                        );
            };

            function checkEmail() {
                var email = document.getElementById("email").value;
                if (validateEmail(email)) {
                    success("email");
                } else {
                    warning("email");
                }
            }

            function checkPassword() {
                var password = document.getElementById("password").value;
                if (password.trim() !== "") {
                    success("pass");
                } else {
                    warning("pass");
                }
            }



            function warning(type) {
                var alert = document.getElementById(type + "Input");
                alert.classList.remove("success");
                alert.classList.add("error");
                var text = document.getElementById(type + "Alert");
                text.classList.remove("d-none");
            }

            function success(type) {
                var alert = document.getElementById(type + "Input");
                alert.classList.remove("error");
                alert.classList.add("success");
                var text = document.getElementById(type + "Alert");
                text.classList.add("d-none");
            }

            function submitForm() {
                var name = document.getElementById("name").value.trim();
                var email = document.getElementById("email").value.trim();
                var confirmPassword = document.getElementById("confirm-password").value.trim();
                var password = document.getElementById("password").value.trim();

                if (name !== "" && validateEmail(email) && password !== "" && confirmPassword === password) {
                    document.getElementById("signup-form").submit();
                }
            }
        </script>
    </body>
</html>