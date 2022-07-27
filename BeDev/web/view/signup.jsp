<%-- 
    Document   : signup
    Created on : May 18, 2022, 10:09:53 AM
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
        <title>Sign Up</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
    </head>

    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <!-- SignUp Area Starts Here -->
            <section class="signup-area overflow-hidden" style="height: 800px;">
                <div class="container">
                    <div class="row align-items-center justify-content-md-center">
                        <div class="col-lg-5 order-2 order-lg-0">
                            <div class="signup-area-textwrapper">
                                <h2 class="font-title--md mb-0">Sign Up</h2>
                                <p class="mt-2 mb-lg-4 mb-3">Already have account? <a href="SignIn" class="text-black-50">Sign In</a></p>
                                <form action="SignUp" method="POST" id="signup-form">
                                    <div class="form-element" id="nameInput">
                                        <div class="form-alert">
                                            <label for="name">Full Name</label>
                                            <span id="nameAlert" class="d-none">Your name cannot be null</span>
                                        </div>
                                        <div class="form-alert-input">
                                            <input onblur="checkName()" type="text" placeholder="Your Name" id="name" name="name" />
                                        </div>
                                    </div>
                                    <div class="form-element"  id="emailInput">
                                        <div class="form-alert">
                                            <label for="email">Email</label>
                                            <span id="emailAlert" class="d-none" >Please enter a valid email</span>
                                        </div>
                                        <div class="form-alert-input">
                                            <input onblur="checkEmail()" type="email" placeholder="youremail@gmail.com" id="email" name="email" />
                                        </div>
                                    </div>
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
                                    <div class="form-element text-center">
                                        <div>${success}</div>
                                        <div>${failed}</div>
                                    </div>
                                    <div class="form-element">
                                        <button onclick="submitForm()" class="button button-lg button--primary w-100">Sign UP</button>
                                    </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-7 order-1 order-lg-0">
                        <div class="signup-area-image">
                            <img width="500" style="margin-left: 120px;" src="../BeDev/view/dist/images/banner/banner-image-01.png" alt="Banner Image" class="img-fluid" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- SignUp Area Ends Here -->
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            function checkName() {
                var name = document.getElementById("name").value;
                if (name.trim() === "") {
                    warning("name");
                } else {
                    success("name");
                }
            }

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

            function checkConfirmPassword() {
                var confirmPassword = document.getElementById("confirm-password").value;
                var password = document.getElementById("password").value;
                if (confirmPassword.trim() === password.trim() && confirmPassword.trim() !== "") {
                    success("confirmPass");
                } else {
                    warning("confirmPass");
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
