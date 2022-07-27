<%-- 
    Document   : verify
    Created on : May 18, 2022, 10:10:33 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Verify</title>
        <link rel="stylesheet" href="dist/main.css" />
        <link rel="icon" type="image/png" href="dist/images/favicon/favicon.png" />
    </head>

    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Email Verification Area Starts Here -->
            <section class="section signup-area signin-area verify section-padding overflow-hidden" style="height: 100vh;">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-5 order-2 order-lg-0">
                            <h2 class="font-title--md mb-0">Verify your email</h2>
                            <p class="mt-2 mb-lg-4 mb-3 text-secondary">
                                Please enter the 6 digit code sent to your email
                            </p>
                            <form action="#" class="mt-35">
                                <div class="form-element">
                                    <div class="verification d-flex align-items-center justify-content-between">
                                        <input type="text" placeholder="-" class="border-lowBlack text-center rounded-0 rounded-start" maxlength="1" />
                                        <input type="text" placeholder="-" class="border-lowBlack text-center rounded-0" maxlength="1" />
                                        <input type="text" placeholder="-" class="border-lowBlack text-center rounded-0" maxlength="1" />
                                        <input type="text" placeholder="-" class="border-lowBlack text-center rounded-0" maxlength="1" />
                                        <input type="text" placeholder="-" class="border-lowBlack text-center rounded-0" maxlength="1" />
                                        <input type="text" placeholder="-" class="border-lowBlack text-center rounded-0 rounded-end" maxlength="1" />
                                    </div>
                                </div>
                                <div class="form-element">
                                    <button type="submit" class="button button-lg button--primary w-100">Confirm</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-7 order-1 order-lg-0">
                            <div class="signup-area-image verify__image">
                                <img src="dist/images/signup/Illustration.png" alt="Illustration Image" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>