<%-- 
    Document   : 404
    Created on : May 18, 2022, 10:03:33 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>404</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
    </head>

    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <!-- 404 Area Starts Here -->
            <section class="error-area overflow-hidden">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6 text-center text-lg-start order-2 order-lg-0">
                            <div class="error-area-start">
                                <h2 class="font-title--md">Page Not Found</h2>
                                <p class="font-para--lg">
                                    Something went wrong. It's look like the link is broken or the page is removed.
                                </p>
                                <a href="index.html" class="button button-lg button--primary">Go Home</a>
                            </div>
                        </div>
                        <div class="col-lg-6 order-1 order-lg-0">
                            <div class="image">
                                <img src="../BeDev/view/dist/images/banner/banner-image-04.jpg" alt="img" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="error-area-shape">
                    <img src="../BeDev/view/dist/images/404/shape01.png" alt="shape" class="img-fluid shape-01" />
                    <img src="../BeDev/view/dist/images/404/shape02.png" alt="shape" class="img-fluid shape-02" />
                </div>
            </section>
            <!-- 404 Area Ends Here -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>