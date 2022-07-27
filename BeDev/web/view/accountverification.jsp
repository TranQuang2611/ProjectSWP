<%-- 
    Document   : 404
    Created on : May 18, 2022, 10:03:33 AM
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
        <title>Account Verification</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
    </head>

    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <section class="error-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <div class="newsletter-area">
                                <h4 class="font-title--md">You have a message.</h4>
                                <p class="mt-2 mb-lg-4 mb-3">
                                    ${mess}
                                </p>
                                <div class="text-center">
                                    <a class="btn btn-lg btn-primary text-white" href="SignIn">SignIn now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- News Letter Ends Here -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>