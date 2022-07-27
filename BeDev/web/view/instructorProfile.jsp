<%-- 
    Document   : instructorProfile
    Created on : May 18, 2022, 10:09:05 AM
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
        <title>Instructor profile</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
    </head>

    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Breadcrumb Starts Here -->

            <!-- Instructor Courses Starts Here -->
            <section class="section instructor-courses">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="instructor-courses-instructor">
                                <div class="instructor-image mx-auto text-center">
                                    <img src="${expert.getImg()}" alt="Instructor" />
                                </div>
                                <div class="instructor-info text-center">
                                    <h5 class="font-title--sm">${expert.getExpertName()}</h5>
                                    <p class="text-secondary mb-3"> Instructor</p>

                                </div>
                                <div class="instructor-course-info d-flex justify-content-center">


                                    <div class="instructor-course-info-courses">
                                        <div class="icon d-flex align-items-center justify-content-center">
                                            <svg width="32" height="28" viewBox="0 0 32 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M2 1.75H10.4C11.8852 1.75 13.3096 2.32361 14.3598 3.34464C15.41 4.36567 16 5.75049 16 7.19444V26.25C16 25.167 15.5575 24.1284 14.7699 23.3626C13.9822 22.5969 12.9139 22.1667 11.8 22.1667H2V1.75Z"
                                                stroke="currentColor"
                                                stroke-width="3"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                />
                                            <path
                                                d="M30 1.75H21.6C20.1148 1.75 18.6904 2.32361 17.6402 3.34464C16.59 4.36567 16 5.75049 16 7.19444V26.25C16 25.167 16.4425 24.1284 17.2302 23.3626C18.0178 22.5969 19.0861 22.1667 20.2 22.1667H30V1.75Z"
                                                stroke="currentColor"
                                                stroke-width="3"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                />
                                            </svg>
                                        </div>
                                        <div class="text text-center">
                                            <h6>${count}</h6>
                                            <p>Courses</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="about-instructor">
                                    <h6>About Instructor</h6>
                                    <p>
                                        ${expert.getDescription()}
                                    </p>
                                </div>


                            </div>
                        </div>
                        <div class="col-lg-8 mt-4 mt-lg-0">
                            <div class="instructor-tabs">
                                <ul class="nav nav-pills instructor-tabs-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="pills-courses-tab" data-bs-toggle="pill" data-bs-target="#pills-courses" type="button" role="tab" aria-selected="true">Courses</button>
                                    </li>

                                </ul>
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-courses" role="tabpanel" aria-labelledby="pills-courses-tab">
                                        <div class="row">
                                        <c:forEach var="co" items="${listCourse}">
                                                <div class="col-md-6 mb-4">
                                                    <div class="contentCard contentCard--course">
                                                        <div class="contentCard-top">
                                                            <a href="CourseDetails?courseID=${co.getCourseID()}" ><img src="${co.getCourseImage()}" alt="images" class="img-fluid" /></a>
                                                        </div>
                                                        <div class="contentCard-bottom">
                                                            <h5>
                                                                <a href="CourseDetails?courseID=${co.getCourseID()}" class="font-title--card">${co.getCourseName()}</a>
                                                            </h5>
                                                            <div class="contentCard-info d-flex align-items-center justify-content-between">
                                                                <a href="#" class="contentCard-user d-flex align-items-center">
<!--                                                                    <img src="${ex.getImg()}" alt="client-image" class="rounded-circle" />
                                                                    <p class="font-para--md">${co.getExpert().getExpertName()}</p>-->
                                                                </a>
                                                                <div class="price">
                                                                    <span><fmt:formatNumber type = "number" value = "${co.getMoney()}"/> VND</span>
                                                                    <del>$95</del>
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
                                                                        <img src="../BeDev/view/dist/images/icon/book.png" alt="location" />
                                                                    </div>
                                                                    <span>${co.getNumberLesson()} Lesson</span>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>                                         
                                        </div>
                                        
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Instructor Courses Ends Here -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
