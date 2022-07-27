<%-- 
    Document   : courseSearch
    Created on : May 18, 2022, 10:07:59 AM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Course Search</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
    </head>

    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Breadcrumb Starts Here -->
            <div class="event-sub-section event-sub-section--spaceY eventsearch-sub-section">
                <div class="container">
                    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                        <ol class="breadcrumb align-items-center bg-transparent p-0 mb-0">
                            <li class="breadcrumb-item">
                                <a href="HomeControl" class="fs-6 text-secondary">Home</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="#" class="fs-6 text-secondary">Courses list</a>
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- Breadcrumb Ends Here -->

            <!-- Event Search Starts Here -->
            <section class="section event-search">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 mx-auto">
                            <div class="event-search-bar">
                                <form action="CourseListSearch">
                                    <div class="form-input-group">
                                        <input type="text" class="form-control" placeholder="Search Course..." name="search" required=""/>
                                        <button class="button button-lg button--primary" type="submit" id="button-addon2">
                                            Search
                                        </button>
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
                                            class="feather feather-search"
                                            >
                                        <circle cx="11" cy="11" r="8"></circle>
                                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                        </svg>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 d-none d-lg-block">
                            <div class="accordion sidebar-filter" id="sidebarFilter">
                                <!-- Category  -->
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="categoryAcc">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#categoryCollapse" aria-expanded="true" aria-controls="categoryCollapse">
                                            category
                                        </button>
                                    </h2>
                                    <div id="categoryCollapse" class="accordion-collapse collapse show" aria-labelledby="categoryAcc" data-bs-parent="#sidebarFilter">
                                        <div class="accordion-body">
                                        <c:forEach items="${listCategory}" var="category">
                                            <div class="accordion-body__item">
                                                <div class="check-box">
                                                    <a href="CourseListCategory?categoryID=${category.categoryID}"> ${category.categoryName} </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <!-- Price  -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        Price
                                    </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#sidebarFilter">
                                    <div class="accordion-body">
                                        <div class="price-range">
                                            <div>
                                                <div class="price-range-block">
                                                    <form class="d-flex price-range-block__inputWrapper" action="CourseListPrice">
                                                        <input
                                                            name="lowPrice"
                                                            <c:if test="${lowPrice == null}">
                                                                value="0"
                                                            </c:if>
                                                            <c:if test="${lowPrice != null}">
                                                                value="${lowPrice}"
                                                            </c:if>
                                                            type="number"
                                                            min="0"
                                                            max="1000000"
                                                            oninput="validity.valid||(value='0');"
                                                            id="min_price"
                                                            class="price-range-field"
                                                            required=""
                                                            style="width: 105px; height: 50px; border-radius: 4px; padding: 15px;"
                                                            />
                                                        <span>to</span>
                                                        <input
                                                            name="highPrice"
                                                            <c:if test="${highPrice == null}">
                                                                value="100000"
                                                            </c:if>
                                                            <c:if test="${highPrice != null}">
                                                                value="${highPrice}"
                                                            </c:if>
                                                            type="number"
                                                            min="0"
                                                            max="1000000"
                                                            oninput="validity.valid||(value='5000');"
                                                            id="max_price"
                                                            class="price-range-field"
                                                            required=""
                                                            style="width: 125px; height: 50px; padding: 15px; border-radius: 4px;"
                                                            />
                                                        <button class="angle-btn">
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
                                                                class="feather feather-chevron-right"
                                                                >
                                                            <polyline points="9 18 15 12 9 6"></polyline>
                                                            </svg>
                                                        </button>
                                                    </form>
                                                    <div id="slider-range" class="price-filter-range"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Rating  -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="ratingAcc">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ratingCollapse" aria-expanded="false" aria-controls="ratingCollapse">
                                        Rating
                                    </button>
                                </h2>
                                <div id="ratingCollapse" class="accordion-collapse collapse" aria-labelledby="ratingAcc" data-bs-parent="#sidebarFilter">
                                    <div class="accordion-body">
                                        <div class="accordion-body__item">
                                            <div class="check-box">
                                                <a href="CourseListStar?star=1"> 1 Star and higher </a>
                                            </div>
                                        </div>
                                        <div class="accordion-body__item">
                                            <div class="check-box">
                                                <a href="CourseListStar?star=2"> 2 Star and higher </a>
                                            </div>
                                        </div>
                                        <div class="accordion-body__item">
                                            <div class="check-box">
                                                <a href="CourseListStar?star=3"> 3 Star and higher </a>
                                            </div>
                                        </div>
                                        <div class="accordion-body__item">
                                            <div class="check-box">
                                                <a href="CourseListStar?star=4"> 4 Star and higher </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="event-search-results">
                            <div class="event-search-results-heading">
                                <div class="nice-select" tabindex="0">
                                    <span class="current"> View </span>
                                    <ul class="list">
                                        <li data-value="4" class="option selected focus">
                                            <a href="${url}&numberProduct=4">4 Product</a>
                                        </li>
                                        <li data-value="6" class="option">
                                            <a href="${url}&numberProduct=6">6 Product</a>
                                        </li>
                                        <li data-value="8" class="option">
                                            <a href="${url}&numberProduct=8">8 Product</a>
                                        </li>
                                    </ul>
                                </div>
                                <p>${listCourse.size()} results found.</p>
                            </div>
                        </div>
                        <div class="row event-search-content">
                            <c:forEach items="${listCourse}" var="course" begin="${(pagePosition - 1) * numberProduct}" end="${pagePosition * numberProduct - 1}">
                                <div class="col-md-6 mb-4">
                                    <div class="contentCard contentCard--course">
                                        <div class="contentCard-top">
                                            <a href="CourseDetails?courseID=${course.courseID}"><img src="${course.courseImage}" alt="images" class="img-fluid" /></a>
                                        </div>
                                        <div class="contentCard-bottom">
                                            <h5>
                                                <a href="CourseDetails?courseID=${course.courseID}" class="font-title--card">${course.courseName}</a>
                                            </h5>
                                            <div class="contentCard-info d-flex align-items-center justify-content-between">
                                                <a href="ExpertProfile?id=${course.getExpert().getExpertID()}" class="contentCard-user d-flex align-items-center">
                                                    <img src="${course.getExpert().getImg()}" style="height: 30px" alt="client-image" class="rounded-circle" />
                                                    <p class="font-para--md">${course.getExpert().getExpertName()}</p>
                                                </a>
                                                <div class="price">
                                                    <span>${course.getMoney()} VND</span>
                                                </div>
                                            </div>
                                            <div class="contentCard-more">
                                                <div class="d-flex align-items-center">
                                                    <div class="icon">
                                                        <img src="../BeDev/view/dist/images/icon/star.png" alt="star" />
                                                    </div>
                                                    <span>
                                                        ${course.averageStar}
                                                    </span>
                                                </div>
                                                <div class="eye d-flex align-items-center">
                                                    <div class="icon">
                                                        <img src="../BeDev/view/dist/images/icon/eye.png" alt="eye" />
                                                    </div>                                                   
                                                    <span>${course.getNumberRegister()} Register</span>                                                                                                    
                                                </div>
                                                <div class="book d-flex align-items-center">
                                                    <div class="icon">
                                                        <img src="../BeDev/view/dist/images/icon/book.png" alt="location" />
                                                    </div>
                                                    <span>${course.getNumberLesson()} Lesson</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="pagination-group mt-lg-5 mt-2 d-flex justify-content-center">
                            <c:if test="${pagePosition > 1}">
                                <a href="${url}&pagePosition=${pagePosition-1}&numberProduct=${numberProduct}" class="p_prev">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="9.414" height="16.828" viewBox="0 0 9.414 16.828">
                                    <path data-name="Icon feather-chevron-left" d="M20.5,23l-7-7,7-7" transform="translate(-12.5 -7.586)" fill="none" stroke="#1a2224" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                                    </svg>
                                </a>
                            </c:if>
                            <c:forEach begin="1" end="${pageMax}" var="number">
                                <a href="${url}&pagePosition=${number}&numberProduct=${numberProduct}" 
                                   class="cdp_i <c:if test="${number == pagePosition}"> active </c:if> ">
                                    ${number}
                                </a>
                            </c:forEach>
                            <c:if test="${pagePosition < pageMax}">
                                <a href="${url}&pagePosition=${pagePosition+1}&numberProduct=${numberProduct}" class="p_next">
                                    <svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M1.5 1L8.5 8L1.5 15" stroke="#35343E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
