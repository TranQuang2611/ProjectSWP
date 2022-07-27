<%-- 
    Document   : home
    Created on : May 18, 2022, 10:08:38 AM
    Author     : Admin
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Home</title>
    <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
    <link rel="icon" type="image/png" href="dist/images/favicon/favicon.png" />
    <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
</head>

<body onload="loader()">
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Banner Starts Here -->
    <section class="main-banner" style="background-image: url(../BeDev/view/dist/images/banner/banner.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 mb-lg-0 order-2 order-lg-0 d-flex align-items-center">
                    <div class="banner-two-start">
                        <h1 class="font-title--lg">Learn with Expert Anytime Anywhere.</h1>
                        <p>
                            Our mision is to help people to find the best course online and learn with expert anytime,
                            anywhere.
                        </p>
                        <form action="CourseListSearch">
                            <div class="banner-input">
                                <div class="main-input">
                                    <input name="search" type="text" placeholder="what do you want to learn today..." />
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-search">
                                        <circle cx="11" cy="11" r="8"></circle>
                                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                    </svg>
                                </div>
                                <div class="search-button">
                                    <button class="button button-lg button--primary">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 order-1 order-lg-0">
                    <div class="main-banner-end">
                        <img src="../BeDev/view/dist/images/banner/banner-image-01.png" alt="image" class="img-fluid" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Browse Categories Starts Here -->
    <section class="section browse-categories">
        <div class="container">
            <h2 class="font-title--md text-center mb-0">Browse Course with Top Categories</h2>
            <div class="browse-categories__wrapper position-relative">
                <div class="categories--box">
                    <c:forEach var="cat" items="${c}">
                        <div class="browse-categories-item default-item-one">
                            <div class="browse-categories-item-icon">
                                <div class="categories-one default-categories">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="2050px" height="2050px"
                                        viewBox="0 0 2050 2050" data-name="Layer 2" id="Layer_2">
                                        <defs>
                                            <style>
                                                .cls-1 {
                                                    fill: #4d4c78;
                                                }

                                                .cls-2 {
                                                    fill: #67baeb;
                                                }

                                                .cls-3 {
                                                    fill: #46a1f8;
                                                }

                                                .cls-4 {
                                                    fill: #c8c2e9;
                                                }

                                                .cls-5 {
                                                    fill: #f4c23f;
                                                }

                                                .cls-6 {
                                                    fill: #f4a93f;
                                                }

                                                .cls-7 {
                                                    fill: #b9b1e0;
                                                }

                                                .cls-8 {
                                                    fill: #dfdafd;
                                                }

                                                .cls-9 {
                                                    fill: #fad564;
                                                }

                                                .cls-10 {
                                                    fill: #83d0fb;
                                                }
                                            </style>
                                        </defs>
                                        <title />
                                        <rect class="cls-1" height="179.72" width="164.3" x="942.9" y="1406.3" />
                                        <path class="cls-2"
                                            d="M781.8,453.7h-586a42.5,42.5,0,0,0-42.5,42.5V1543.4a42.5,42.5,0,0,0,42.5,42.6H942.9V1484.5a43.6,43.6,0,0,0-.3-5.1L824,491.2A42.5,42.5,0,0,0,781.8,453.7Z" />
                                        <path class="cls-2"
                                            d="M1318.9,487.4l-210.8,990.2a43.2,43.2,0,0,0-1,8.8V1586h747.1a42.5,42.5,0,0,0,42.5-42.6V496.2a42.5,42.5,0,0,0-42.5-42.5H1360.5A42.4,42.4,0,0,0,1318.9,487.4Z" />
                                        <path class="cls-3"
                                            d="M1326,453.7,1107.1,1481.9v-75.6H942.9v75.6L819.5,453.7H225.7V1557.9l42.8-17.6a978.3,978.3,0,0,1,725.5-7.6l31,12.5,31-12.5a978.3,978.3,0,0,1,725.5,7.6l42.8,17.6V453.7Z" />
                                        <path class="cls-4"
                                            d="M1025,1511.6h0a1010.1,1010.1,0,0,0-768.3,0h0V365.9h0a1009.2,1009.2,0,0,1,768.3,0h0Z" />
                                        <path class="cls-5"
                                            d="M1614.4,1676.2l-52.3-43.6-52.2,43.6c-17.7,14.8-44.7,2.2-44.7-20.9V1359.2H1659v296.1C1659,1678.4,1632.1,1691,1614.4,1676.2Z" />
                                        <path class="cls-6"
                                            d="M1465.2,1468.3a966.5,966.5,0,0,1,193.8,30.8V1359.2H1465.2Z" />
                                        <path class="cls-4"
                                            d="M1025,1511.6h0a1010.1,1010.1,0,0,1,768.3,0h0V365.9h0a1009.2,1009.2,0,0,0-768.3,0h0Z" />
                                        <path class="cls-7"
                                            d="M320.7,423.2V342.1c-21.5,7.2-42.9,15.1-64,23.8h0V1511.6h0a1094.9,1094.9,0,0,1,768.3,0h0V1390.3l-6.9-2.3C601.4,1251.9,320.7,861.5,320.7,423.2Z" />
                                        <path class="cls-7"
                                            d="M1089,423.2V342.1q-32.4,10.8-64,23.8h0V1511.6h0a1094.9,1094.9,0,0,1,768.3,0h0V1390.3l-6.9-2.3C1369.6,1251.9,1089,861.5,1089,423.2Z" />
                                        <path class="cls-7"
                                            d="M383.3,598.9a20,20,0,0,1-6.9-38.8,747.5,747.5,0,0,1,516.9,0,20,20,0,1,1-13.8,37.6,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,383.3,598.9Z" />
                                        <path class="cls-7"
                                            d="M383.3,810.9a20,20,0,0,1-6.9-38.8,746,746,0,0,1,516.9,0,20,20,0,1,1-13.8,37.5,706.7,706.7,0,0,0-489.3,0A18.7,18.7,0,0,1,383.3,810.9Z" />
                                        <path class="cls-7"
                                            d="M383.3,1022.8a20,20,0,0,1-6.9-38.7,746,746,0,0,1,516.9,0,20,20,0,1,1-13.8,37.5,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,383.3,1022.8Z" />
                                        <path class="cls-7"
                                            d="M383.3,1234.8a20,20,0,0,1-6.9-38.8,747.5,747.5,0,0,1,516.9,0,20,20,0,1,1-13.8,37.6,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,383.3,1234.8Z" />
                                        <path class="cls-7"
                                            d="M1654.7,598.9a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,0,1-13.8-37.6,747.5,747.5,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <path class="cls-7"
                                            d="M1654.7,810.9a18.7,18.7,0,0,1-6.9-1.3,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.5,746,746,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <path class="cls-7"
                                            d="M1654.7,1022.8a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.5,746,746,0,0,1,516.9,0,20,20,0,0,1-6.9,38.7Z" />
                                        <path class="cls-7"
                                            d="M1654.7,1234.8a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.6,747.5,747.5,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <path class="cls-8"
                                            d="M1665.7,581.9a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,0,1-13.8-37.6,747.5,747.5,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <path class="cls-8"
                                            d="M1665.7,793.9a18.7,18.7,0,0,1-6.9-1.3,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.5,746,746,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <path class="cls-8"
                                            d="M1665.7,1005.8a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.5,746,746,0,0,1,516.9,0,20,20,0,0,1-6.9,38.7Z" />
                                        <path class="cls-8"
                                            d="M1665.7,1217.8a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.6,747.5,747.5,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <path class="cls-8"
                                            d="M394.3,581.9a20,20,0,0,1-6.9-38.8,747.5,747.5,0,0,1,516.9,0,20,20,0,1,1-13.8,37.6,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,394.3,581.9Z" />
                                        <path class="cls-8"
                                            d="M394.3,793.9a20,20,0,0,1-6.9-38.8,746,746,0,0,1,516.9,0,20,20,0,1,1-13.8,37.5,706.7,706.7,0,0,0-489.3,0A18.7,18.7,0,0,1,394.3,793.9Z" />
                                        <path class="cls-8"
                                            d="M394.3,1005.8a20,20,0,0,1-6.9-38.7,746,746,0,0,1,516.9,0,20,20,0,1,1-13.8,37.5,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,394.3,1005.8Z" />
                                        <path class="cls-8"
                                            d="M394.3,1217.8a20,20,0,0,1-6.9-38.8,747.5,747.5,0,0,1,516.9,0,20,20,0,1,1-13.8,37.6,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,394.3,1217.8Z" />
                                        <path class="cls-1"
                                            d="M1660.7,588.9a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,0,1-13.8-37.6,747.5,747.5,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <path class="cls-1"
                                            d="M1660.7,800.9a18.7,18.7,0,0,1-6.9-1.3,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.5,746,746,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <path class="cls-1"
                                            d="M1660.7,1012.8a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.5,746,746,0,0,1,516.9,0,20,20,0,0,1-6.9,38.7Z" />
                                        <path class="cls-1"
                                            d="M1660.7,1224.8a20.9,20.9,0,0,1-6.9-1.2,706.7,706.7,0,0,0-489.3,0,20,20,0,1,1-13.8-37.6,747.5,747.5,0,0,1,516.9,0,20,20,0,0,1-6.9,38.8Z" />
                                        <rect class="cls-8" height="545.11" rx="40.8" ry="40.8" width="81.6" x="1711.6"
                                            y="425.3" />
                                        <rect class="cls-8" height="352.73" rx="29" ry="29" width="58" x="967"
                                            y="482.3" />
                                        <path class="cls-1"
                                            d="M389.3,588.9a20,20,0,0,1-6.9-38.8,747.5,747.5,0,0,1,516.9,0,20,20,0,1,1-13.8,37.6,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,389.3,588.9Z" />
                                        <path class="cls-1"
                                            d="M389.3,800.9a20,20,0,0,1-6.9-38.8,746,746,0,0,1,516.9,0,20,20,0,1,1-13.8,37.5,706.7,706.7,0,0,0-489.3,0A18.7,18.7,0,0,1,389.3,800.9Z" />
                                        <path class="cls-1"
                                            d="M389.3,1012.8a20,20,0,0,1-6.9-38.7,746,746,0,0,1,516.9,0,20,20,0,1,1-13.8,37.5,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,389.3,1012.8Z" />
                                        <path class="cls-1"
                                            d="M389.3,1224.8a20,20,0,0,1-6.9-38.8,747.5,747.5,0,0,1,516.9,0,20,20,0,1,1-13.8,37.6,706.7,706.7,0,0,0-489.3,0A20.9,20.9,0,0,1,389.3,1224.8Z" />
                                        <rect class="cls-9" height="105.38" rx="19.8" ry="19.8" width="39.5" x="1619.5"
                                            y="1549.9" />
                                        <rect class="cls-10" height="449.76" rx="19.1" ry="19.1" width="38.2" x="1858.5"
                                            y="581.9" />
                                    </svg>
                                </div>
                            </div>
                            <div class="browse-categories-item-text">
                                <h6 class="font-title--card"><a
                                        href="CourseListCategory?categoryID=${cat.getCategoryID()}">${cat.getCategoryName()}</a>
                                </h6>
                                <p>${cat.getNumberCourse()} Courses</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="CourseList" class="button button-lg button--primary">Browse all Courses</a>
                </div>
            </div>
        </div>
        <div class="browse-categories-shape">
            <img src="../BeDev/view/dist/images/shape/dots/dots-img-11.png" alt="shape" class="img-fluid shape-01" />
            <img src="../BeDev/view/dist/images/shape/line01.png" alt="shape" class="img-fluid shape-02" />
        </div>
    </section>

    <!--  Popular Courses Starts Here -->
    <section class="section section--bg-offwhite-three featured-popular-courses main-popular-course">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="featured-popular-courses-heading d-flex align-content-center justify-content-between">
                        <div class="main-heading">
                            <h3 class="font-title--md">Our Popular Courses</h3>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-all" role="tabpanel"
                        aria-labelledby="pills-all-tab">
                        <div class="row">
                            <c:forEach var="co" items="${courseList}">
                                <div class="col-xl-4 col-md-6">
                                    <div class="contentCard contentCard--course">
                                        <div class="contentCard-top">
                                            <a href="CourseDetails?courseID=${co.getCourseID()}"><img src=${co.getCourseImage()} alt="images"
                                                    class="img-fluid" /></a>
                                        </div>
                                        <div class="contentCard-bottom">
                                            <h5>
                                                <a href="CourseDetails?courseID=${co.getCourseID()}"
                                                    class="font-title--card">${co.getCourseName()}</a>
                                            </h5>
                                            <div
                                                class="contentCard-info d-flex align-items-center justify-content-between">
                                                <a href="ExpertProfile?id=${co.getExpert().getExpertID()}"
                                                    class="contentCard-user d-flex align-items-center">
                                                    <img src="${co.getExpert().getImg()}" height="20px" width="20px"
                                                        alt="loading" class="rounded-circle" />
                                                    <p class="font-para--md">${co.getExpert().getExpertName()}</p>

                                                </a>
                                                <div class="price">

                                                    <span>
                                                        <fmt:formatNumber type="number" value="${co.getMoney()}" />
                                                        VND</span>

                                                </div>
                                            </div>
                                            <div class="contentCard-more">
                                                <div class="d-flex align-items-center">
                                                    <div class="icon">
                                                        <img src="../BeDev/view/dist/images/icon/star.png" alt="star" />
                                                    </div>
                                                    <span>4.5</span>
                                                </div>
                                                <div class="eye d-flex align-items-center">
                                                    <div class="icon">
                                                        <img src="../BeDev/view/dist/images/icon/eye.png" alt="eye" />
                                                    </div>
                                                    <span>${co.getNumberRegister()} Register</span>
                                                </div>
                                                <div class="book d-flex align-items-center">
                                                    <div class="icon">
                                                        <img src="../BeDev/view/dist/images/icon/book.png"
                                                            alt="location" />
                                                    </div>
                                                    <span>${co.getNumberLesson()} Lesson</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <a href="CourseList" class="button button-lg button--primary">Browse all Courses</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="featured-popular-courses-shape">
            <img src="../BeDev/view/dist/images/shape/dots/dots-img-12.png" alt="Shape" class="img-fluid dot-06" />
            <img src="../BeDev/view/dist/images/shape/triangel.png" alt="Shape" class="img-fluid dot-07" />
        </div>
    </section>

    <!--  Learning Rules Starts Here -->
    <section class="section learning-rules">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 order-2 order-lg-0">
                    <div class="learning-rules-starts">
                        <h2 class="font-title--md">
                            Bea Dev <br class="d-none d-md-block" />
                            Learning Steps
                        </h2>
                        <div class="learning-rules__wrapper">
                            <div class="learning-rules-item">
                                <div class="item-number"><span>01.</span></div>
                                <div class="item-text">
                                    <h6>Enroll Course</h6>

                                </div>
                            </div>
                            <div class="learning-rules-item">
                                <div class="item-number"><span>02.</span></div>
                                <div class="item-text">
                                    <h6>Learning Lesson</h6>
                                </div>
                            </div>
                            <div class="learning-rules-item">
                                <div class="item-number"><span>03.</span></div>
                                <div class="item-text">
                                    <h6>Do Quiz</h6>

                                </div>
                            </div>
                        </div>
                        <a href="CourseList" class="button button-lg button--primary">Start Learning</a>
                    </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-0">
                    <div class="learning-rules-ends">
                        <img src="../BeDev/view/dist/images/hero/hero-img-01.jpg" alt="img" class="img-fluid" />
                        <div class="learning-rules-ends-circle">
                            <img src="../BeDev/view/dist/images/shape/l03.png" alt="shape" class="img-fluid" />
                        </div>
                        <div class="earning-rules-ends-shape">
                            <img src="../BeDev/view/dist/images/shape/l04.png" alt="shape" class="img-fluid shape-1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="learning-rules-shape">
            <img src="../BeDev/view/dist/images/shape/dots/dots-img-16.png" alt="shape" class="img-fluid shape-01" />
            <img src="../BeDev/view/dist/images/shape/l02.png" alt="shape" class="img-fluid shape-02" />
        </div>
    </section>

    <!--  About Services Starts Here -->


    <!-- Best Instructors Starts Here -->
    <section class="section best-instructor-featured overflow-hidden main-instructor-featured">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 position-relative">
                    <h3 class="text-center mb-40 font-title--md">Our Expert</h3>
                    <div class="ourinstructor__wrapper mt-lg-5 mt-0">
                        <div class="ourinstructor-active">
                            <c:forEach var="ex" items="${expertList}">
                                <div class="mentor">
                                    <div class="mentor__img">
                                        <img src="${ex.getImg()}" alt="Mentor image" />
                                    </div>
                                    <div class="mentor__title">
                                        <h6>
                                            <a href="ExpertProfile?id=${ex.getExpertID()}"
                                                tabindex="0">${ex.getExpertName()}</a>
                                        </h6>
                                        <p>Instructor</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-instructor-featured-shape">
            <img src="../BeDev/view/dist/images/shape/dots/dots-img-14.png" alt="shape" class="img-fluid shape01" />
            <img src="../BeDev/view/dist/images/shape/triangel2.png" alt="shape" class="img-fluid shape02" />
        </div>
    </section>



    <!--              Main Become Instructor Starts Here 
                    <section class="section main-become-instructor">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="main-become-instructor-item me-12">
                                        <div class="main-image">
                                            <img src="../BeDev/view/dist/images/event/image01.png" alt="image" class="img-fluid" />
                                        </div>
                                        <div class="main-text">
                                            <h6 class="font-title--sm">Become an Instructor</h6>
                                            <p>
                                                Praesent ultricies nulla ac congue bibendum. Aliquam tempor euismod purus posuere gravida. Praesent augue sapien, vulputate eu imperdiet eget, tempor at enim.
                                            </p>
                                            <div class="text-center">
                                                <a href="become-instructor.html" class="green-btn">Apply as Instructor</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="main-become-instructor-item ms-12 mb-0">
                                        <div class="main-image">
                                            <img src="../BeDev/view/dist/images/event/image02.png" alt="image" class="img-fluid" />
                                        </div>
                                        <div class="main-text">
                                            <h6 class="font-title--sm">Use Eduguard For Business</h6>
                                            <p>
                                                Praesent ultricies nulla ac congue bibendum. Aliquam tempor euismod purus posuere gravida. Praesent augue sapien, vulputate eu imperdiet eget, tempor at enim.
                                            </p>
                                            <div class="text-center">
                                                <a href="#" class="green-btn">Get Eduguard For Business</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="main-become-instructor-shape">
                            <img src="../BeDev/view/dist/images/shape/line03.png" alt="shape" class="img-fluid" />
                        </div>
                    </section>-->

    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>