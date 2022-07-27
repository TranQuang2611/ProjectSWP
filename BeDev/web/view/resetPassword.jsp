<%-- 
    Document   : resetPassword
    Created on : May 18, 2022, 10:09:18 AM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Reset password</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
    </head>

    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Reset Password Area Starts Here -->
            <section class="section signup-area signin-area section-padding overflow-hidden" style="height: 100vh;">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-5 order-2 order-lg-0">
                            <h2 class="font-title--md mb-3">Reset Password</h2>
                            <form action="ResetPassword" method="POST" id="reset-form">
                            <c:if test="${sessionScope.step == null || sessionScope.step == 1}">
                                <div class="form-element"  id="emailInput">
                                    <div class="form-alert">
                                        <label for="email">Email</label>
                                        <span id="emailAlert" class="d-none" >Please enter a valid email</span>
                                    </div>
                                    <div class="form-alert-input">
                                        <input onblur="checkEmail()" type="email" placeholder="youremail@gmail.com" id="email" name="email" />
                                    </div>
                                </div>
                                <div class="form-element text-center">
                                    <div>${mess}</div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.step == 2}">
                                <div class="form-element"  id="verifycodeInput">
                                    <div class="form-alert">
                                        <label for="email">Verify Code</label>
                                        <span id="verifycodeAlert" class="d-none" >Please enter a valid code</span>
                                    </div>
                                    <div class="form-alert-input">
                                        <input onblur="checkCode('${sessionScope.verifycode}')" type="text" placeholder="Your verify code" id="verifycode" name="verifycode" />
                                    </div>
                                </div>
                                <div class="form-element text-center">
                                    <div>${mess}</div>
                                </div>
                            </c:if> 
                            <c:if test="${sessionScope.step == 3}">
                                <div class="form-element" id="passInput">
                                    <div class="form-alert">
                                        <label for="password">password</label>
                                        <span id="passAlert" class="d-none">Your password cannot be null</span>
                                    </div>
                                    <div class="form-alert-input">
                                        <input type="password" placeholder="Type here..." id="password" onblur="checkPassword()" name="password" />
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
                                <div class="form-element" id="confirmPassInput">
                                    <div class="form-alert">
                                        <label for="confirm-password">Confirm password</label>
                                        <span id="confirmPassAlert" class="d-none" >Confirm password must be the same as password.</span>
                                    </div>
                                    <div class="form-alert-input">
                                        <input type="password" placeholder="Type here..." id="confirm-password" onblur="checkConfirmPassword()"/>
                                        <div class="form-alert-icon" onclick="showPassword('confirm-password', this)">
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
                            </c:if>
                            <div class="form-element">
                                <button type="button" onclick="submitForm('${sessionScope.step}', '${sessionScope.verifycode}')" class="button button-lg button--primary w-100">Reset Password</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-7 order-1 order-lg-0">
                        <div class="signup-area-image">
                            <img width="500" style="margin-left: 120px;" src="../BeDev/view/dist/images/banner/banner-image-01.png" alt="Banner Image" class="img-fluid" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Reset Password Area Ends Here -->
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

            function checkCode(code) {
                var verifycode = document.getElementById("verifycode").value;
                if (verifycode == code) {
                    success("verifycode");
                } else {
                    warning("verifycode");
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

            function checkPassword() {
                var password = document.getElementById("password").value;
                if (password.trim() !== "") {
                    success("pass");
                } else {
                    warning("pass");
                }
            }

            function checkConfirmPassword() {
                var confirmPassword = document.getElementById("confirm-password").value;
                var password = document.getElementById("password").value;
                if (confirmPassword.trim() === password.trim() && confirmPassword.trim() !== "") {
                    success("confirmPass");
                } else {
                    warning("confirmPass");
                }
            }

            function submitForm(step, code) {
                console.log(step);
                if (step == '' || step == '1') {
                    var email = document.getElementById("email").value.trim();
                    console.log(email);
                    if (validateEmail(email) && email !== "") {
                        document.getElementById("reset-form").submit();
                    }
                } else if (step == 2) {
                    var verifycode = document.getElementById("verifycode").value;
                    if (verifycode == code) {
                        document.getElementById("reset-form").submit();
                    }
                } else if (step == 3) {
                    var confirmPassword = document.getElementById("confirm-password").value.trim();
                    var password = document.getElementById("password").value.trim();
                    if (password !== "" && confirmPassword === password) {
                        document.getElementById("reset-form").submit();
                    }
                }
            }
        </script>
    </body>
</html>