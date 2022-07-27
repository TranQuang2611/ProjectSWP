<%-- 
    Document   : courseDetails
    Created on : May 18, 2022, 10:07:38 AM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Course details</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
    </head>
    <style>

        body .edit:hover{
            text-decoration: underline;
        }
        body .star-widget input{
            display: none;
        }

        .star-widget label{
            font-size: 40px;
            color: #444;
            padding: 10px;
            float: right;
            transition: all 0.2s ease;
        }
        input:not(:checked) ~ label:hover,
        input:not(:checked) ~ label:hover ~ label{
            color: #fd4;
        }
        input:checked ~ label{
            color: #fd4;
        }
        input#rate-5:checked ~ label{
            color: #fe7;
            text-shadow: 0 0 20px #952;
        }

        .modal-body{
            display: flex;
            justify-content: center;
        }
        .wrapper-ratestar{
            display: inline-block;
        }

    </style>
    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Breadcrumb Starts Here -->
            <section class="section event-sub-section">
                <div class="container">
                    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                        <ol class="breadcrumb align-items-center bg-transparent p-0 mb-0">
                            <li class="breadcrumb-item">
                                <a href="/BeDev/HomeControl" class="fs-6 text-secondary">Home</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/BeDev/CourseList" class="fs-6 text-secondary">Course</a>
                            </li>
                            <li class="breadcrumb-item fs-6 text-secondary d-none d-lg-inline-block" aria-current="page">
                            ${course.courseName}
                        </li>
                    </ol>
                </nav>
                <div class="row event-sub-section-main">
                    <div class="col-lg-8">
                        <h3 class="font-title--sm">
                            ${course.courseName}
                        </h3>
                        <div class="created-by d-flex align-items-center">
                            <div class="created-by-image me-3">
                                <img src="${course.getExpert().getImg()}" alt="" />
                            </div>
                            <div class="created-by-text">
                                <p>Created by</p>
                                <h6><a href="ExpertProfile?id=${course.getExpert().getExpertID()}">${course.getExpert().getExpertName()}</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="icon-with-date d-flex align-items-lg-center">
                            <div class="icon-with-date-start d-flex align-items-center">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M9.94438 2.34287L11.7457 5.96656C11.8359 6.14934 12.0102 6.2769 12.2124 6.30645L16.2452 6.88901C16.4085 6.91079 16.5555 6.99635 16.6559 7.12701C16.8441 7.37201 16.8153 7.71891 16.5898 7.92969L13.6668 10.7561C13.5183 10.8961 13.4522 11.1015 13.4911 11.3014L14.1911 15.2898C14.2401 15.6204 14.0145 15.93 13.684 15.9836C13.5471 16.0046 13.4071 15.9829 13.2826 15.9214L9.69082 14.0384C9.51037 13.9404 9.29415 13.9404 9.1137 14.0384L5.49546 15.9315C5.1929 16.0855 4.82267 15.9712 4.65778 15.6748C4.59478 15.5551 4.57301 15.419 4.59478 15.286L5.29479 11.2975C5.32979 11.0984 5.26368 10.8938 5.11901 10.753L2.18055 7.92735C1.94099 7.68935 1.93943 7.30201 2.17821 7.06246C2.17899 7.06168 2.17977 7.06012 2.18055 7.05935C2.27932 6.9699 2.40066 6.91001 2.5321 6.88668L6.56569 6.30412C6.76713 6.27223 6.94058 6.14623 7.03236 5.96345L8.83215 2.34287C8.90448 2.19587 9.03281 2.08309 9.18837 2.03176C9.3447 1.97965 9.51582 1.99209 9.66282 2.06598C9.78337 2.12587 9.88215 2.22309 9.94438 2.34287Z"
                                    stroke="#FF7A1A"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    />
                                </svg>
                                <p class="font-para--md">${course.averageStar}</p>
                            </div>
                        </div>
                        <div class="icon-with-date d-flex align-items-lg-cente mb-0">
                            <div class="icon-with-date-start d-flex align-items-center">
                                <svg width="19" height="18" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M1 9C1 9 4 3 9.25 3C14.5 3 17.5 9 17.5 9C17.5 9 14.5 15 9.25 15C4 15 1 9 1 9Z" stroke="#1089FF" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" />
                                <path
                                    d="M9.25 11.25C10.4926 11.25 11.5 10.2426 11.5 9C11.5 7.75736 10.4926 6.75 9.25 6.75C8.00736 6.75 7 7.75736 7 9C7 10.2426 8.00736 11.25 9.25 11.25Z"
                                    stroke="#1089FF"
                                    stroke-width="1.8"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    />
                                </svg>
                                <p class="font-para--md">${course.numberRegister} Enrolled</p>
                            </div>
                            <div class="icon-with-date-end d-flex align-items-center">
                                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M1.5 2.25H6C6.79565 2.25 7.55871 2.56607 8.12132 3.12868C8.68393 3.69129 9 4.45435 9 5.25V15.75C9 15.1533 8.76295 14.581 8.34099 14.159C7.91903 13.7371 7.34674 13.5 6.75 13.5H1.5V2.25Z"
                                    stroke="#00AF91"
                                    stroke-width="1.8"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    />
                                <path
                                    d="M16.5 2.25H12C11.2044 2.25 10.4413 2.56607 9.87868 3.12868C9.31607 3.69129 9 4.45435 9 5.25V15.75C9 15.1533 9.23705 14.581 9.65901 14.159C10.081 13.7371 10.6533 13.5 11.25 13.5H16.5V2.25Z"
                                    stroke="#00AF91"
                                    stroke-width="1.8"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    />
                                </svg>
                                <p class="font-para--md">${course.numberLesson} Lesson</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Ends Here -->

        <!-- Event Info Starts Here -->
        <section class="section event-info">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="course-overview">
                            <div class="course-overview-image">
                                <img src="${course.courseImage}" alt="img" />
                            </div>
                            <ul class="nav course-overview-nav nav-pills mb-3" id="pills-tab" role="tablist" style="width: 500px !important;">

                                <li class="nav-item" role="presentation">
                                    <button
                                        class="nav-link active font-para--lg"
                                        id="pills-courseoverview-tab"
                                        data-bs-toggle="pill"
                                        data-bs-target="#pills-courseoverview"
                                        type="button"
                                        role="tab"
                                        aria-controls="pills-courseoverview"
                                        aria-selected="true"
                                        >
                                        Overview
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link font-para--lg" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">
                                        Curriculum
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button
                                        class="nav-link font-para--lg"
                                        id="pills-c-instructor-tab"
                                        data-bs-toggle="pill"
                                        data-bs-target="#pills-c-instructor"
                                        type="button"
                                        role="tab"
                                        aria-controls="pills-c-instructor"
                                        aria-selected="false"
                                        >
                                        Expert
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button
                                        class="nav-link font-para--lg"
                                        id="pills-course-review-tab"
                                        data-bs-toggle="pill"
                                        data-bs-target="#pills-review"
                                        type="button"
                                        role="tab"
                                        aria-controls="pills-course-review-tab"
                                        aria-selected="false"
                                        >
                                        Review
                                    </button>
                                </li>
                                <!--rate area-->
                                <c:if test="${isEnroll}">
                                    <li class="nav-item" role="presentation">
                                        <button
                                            class="nav-link font-para--lg"
                                            id="pills-c-instructor-tab"
                                            data-bs-toggle="pill"
                                            data-bs-target="#pills-rating"
                                            type="button"
                                            role="tab"
                                            aria-controls="pills-rating-tab"
                                            aria-selected="false"
                                            >
                                            Rating
                                        </button>
                                    </li>
                                </c:if>
                            </ul>
                            <div class="tab-content course-overview-content" id="pills-tabContentTwo">
                                <div class="tab-pane fade show active" id="pills-courseoverview" role="tabpanel" aria-labelledby="pills-courseoverview-tab">
                                    <!-- Course Overview Starts Here -->
                                    <div class="row course-overview-main mt-4">
                                        <div class="course-overview-main-item">
                                            <h6 class="font-title--card">Description</h6>
                                            <p class="mb-3 font-para--lg">
                                                ${course.description}
                                            </p>
                                        </div>
                                        <div class="course-overview-main-item">
                                            <h6 class="font-title--card">Category</h6>
                                            <c:forEach items="${categoryOfCourse}" var="category">
                                                <p class="bullets-line font-para--lg">${category.categoryName}</p>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <!-- Course Overview Ends Here -->
                                </div>
                                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile">
                                    <!-- Course Curriculum Area Starts Here -->
                                    <div class="row">
                                        <div class="course-curriculum-area">
                                            <!-- for1 -->
                                            <c:forEach items="${listChapter}" var="chapter">
                                                <div class="curriculum-area">
                                                    <div class="curriculum-area-top" role="button" data-bs-toggle="collapse" data-bs-target="#chapter${chapter.chapterID}" aria-expanded="false" aria-controls="collapse1">
                                                        <div class="curriculum-area-top-start">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                                            <path d="M15.8332 7.08337L9.99984 12.9167L4.1665 7.08337" stroke="#42414B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                            </svg>
                                                            <p class="font-para--lg">${chapter.position}. ${chapter.chapterName}</p>
                                                        </div>
                                                        <div class="curriculum-area-top-end">
                                                            <div class="total-lesson">
                                                                <svg width="18" height="19" viewBox="0 0 18 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M1.5 2.75H6C6.79565 2.75 7.55871 3.06607 8.12132 3.62868C8.68393 4.19129 9 4.95435 9 5.75V16.25C9 15.6533 8.76295 15.081 8.34099 14.659C7.91903 14.2371 7.34674 14 6.75 14H1.5V2.75Z"
                                                                    stroke="#00AF91"
                                                                    stroke-width="1.8"
                                                                    stroke-linecap="round"
                                                                    stroke-linejoin="round"
                                                                    />
                                                                <path
                                                                    d="M16.5 2.75H12C11.2044 2.75 10.4413 3.06607 9.87868 3.62868C9.31607 4.19129 9 4.95435 9 5.75V16.25C9 15.6533 9.23705 15.081 9.65901 14.659C10.081 14.2371 10.6533 14 11.25 14H16.5V2.75Z"
                                                                    stroke="#00AF91"
                                                                    stroke-width="1.8"
                                                                    stroke-linecap="round"
                                                                    stroke-linejoin="round"
                                                                    />
                                                                </svg>
                                                                <p>${chapter.lessons.size()} Lesson</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="curriculum-area-bottom collapse" id="chapter${chapter.chapterID}">
                                                        <!-- for2 -->
                                                        <c:forEach items="${chapter.lessons}" var="lesson">
                                                            <div class="curriculum-description">
                                                                <div class="curriculum-description-start">
                                                                    <p>
                                                                        <a href="#">
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
                                                                                class="feather feather-play-circle"
                                                                                >
                                                                            <circle cx="12" cy="12" r="10"></circle>
                                                                            <polygon points="10 8 16 12 10 16 10 8"></polygon>
                                                                            </svg>
                                                                        </a>
                                                                        <a href="LessonView?courseID=${course.courseID}&lessonID=${lesson.lessonID}">${lesson.position}. ${lesson.lessonName}</a>
                                                                    </p>
                                                                </div>
                                                                <div class="curriculum-description-end">
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
                                                                        class="feather feather-lock"
                                                                        >
                                                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <c:if test="${chapter.quiz.quizID != 0}">
                                                            <div class="curriculum-description">
                                                                <div class="curriculum-description-start">
                                                                    <p>
                                                                        <a href="#">
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
                                                                                class="feather feather-activity">
                                                                            <polyline points="20 6 9 17 4 12"></polyline>
                                                                            </svg>
                                                                        </a>
                                                                        <a href="#">${chapter.quiz.position}. ${chapter.quiz.quizName}</a>
                                                                    </p>
                                                                </div>
                                                                <div class="curriculum-description-end">
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
                                                                        class="feather feather-lock"
                                                                        >
                                                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <!-- Course Curriculum Area Ends Here -->
                                </div>
                                <div class="tab-pane fade" id="pills-c-instructor" role="tabpanel" aria-labelledby="pills-c-instructor-tab">
                                    <!-- Course Details Instructor Starts Here -->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="course-instructor">
                                                <div class="course-instructor-info">
                                                    <div class="instructor-image">
                                                        <img src="${course.getExpert().img}" alt="Expert" />
                                                    </div>
                                                    <div class="instructor-text">
                                                        <h6 class="font-title--xs mb-0">
                                                            <a href="ExpertProfile?id=${course.getExpert().getExpertID()}">${course.getExpert().expertName}</a>
                                                        </h6>
                                                        <div class="d-flex align-items-center instructor-text-bottom">
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="lead-p font-para--lg">
                                                    Description of expert:
                                                </p>
                                                <p class="font-para--md">
                                                    ${course.getExpert().description}
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="pills-rating" role="tabpanel" aria-labelledby="pills-rating-tab">
                                    <!--rate area-->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form action="RateCourse" method="post">
                                                <div class="star-widget">
                                                    <div class="wrapper-ratestar" style="">
                                                        <input type="radio" name="rate" id="rate-5" value="5" <c:if test="${ rate.star==5}">checked=""</c:if>>
                                                            <label for="rate-5" class="fas fa-star"></label>
                                                            <input type="radio" name="rate" id="rate-4" value="4" <c:if test="${ rate.star==4}">checked=""</c:if>>
                                                            <label for="rate-4" class="fas fa-star"></label>
                                                            <input type="radio" name="rate" id="rate-3" value="3" <c:if test="${ rate.star==3}">checked=""</c:if>>
                                                            <label for="rate-3" class="fas fa-star"></label>
                                                            <input type="radio" name="rate" id="rate-2" value="2" <c:if test="${ rate.star==2}">checked=""</c:if>>
                                                            <label for="rate-2" class="fas fa-star"></label>
                                                            <input type="radio" name="rate" id="rate-1" value="1" <c:if test="${rate.star==1}">checked=""</c:if>>
                                                            <label for="rate-1" class="fas fa-star"></label>
                                                        </div>
                                                        <div class="textarea form-group" style="margin-bottom: 20px; margin-top: 20px">
                                                            <textarea class="form-control" style="width: 100%;" cols="30" placeholder="Describe your experience.." name="contentRate"  > <c:if test="${rate!=null}">${rate.content}</c:if></textarea>
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="button button-lg button--primary w-20">
                                                        Rate
                                                    </button>
                                                <c:if test="${rate!=null}">
                                                    <a style="float: right" href="deleteRate">Delete Rate</a>
                                                </c:if>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- Course Details Instructor Ends Here -->
                                </div>
                                <div class="tab-pane fade show course-review-content" id="pills-review" role="tabpanel" aria-labelledby="pills-review">
                                    <!-- Course Details Review Starts Here -->
                                    <div class="tab-content" id="pills-tabContent">
                                        <div class="tab-pane fade show active" id="pills-pills-review" role="tabpanel" aria-labelledby="pills-pills-review">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="instructor-rating-area d-flex">
                                                        <div class="rating-number">
                                                            <h2>${avgStar}</h2>
                                                            <div class="rating-icon">
                                                                <ul class="list-inline">
                                                                    <c:forEach begin="1" end="${avgStar}">
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                            <p>Course Rating</p>
                                                        </div>
                                                        <div class="ms-lg-4 rating-range">
                                                            <div class="rating-range-item d-flex align-items-center">
                                                                <div class="rating-range-item-ratings">
                                                                    <ul class="list-inline">
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="rating-range-item-bar">
                                                                    <div class="rating-width" style="width: ${percentStarFive}%;"></div>
                                                                </div>
                                                                <div class="rating-range-item-percent">
                                                                    <p>${percentStarFive}%</p>
                                                                </div>
                                                            </div>
                                                            <div class="rating-range-item d-flex align-items-center four-star">
                                                                <div class="rating-range-item-ratings">
                                                                    <ul class="list-inline">
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="rating-range-item-bar">
                                                                    <div class="rating-width" style="width: ${percentStarFour}%;"></div>
                                                                </div>
                                                                <div class="rating-range-item-percent">
                                                                    <p>${percentStarFour}%</p>
                                                                </div>
                                                            </div>
                                                            <div class="rating-range-item d-flex align-items-center three-star">
                                                                <div class="rating-range-item-ratings">
                                                                    <ul class="list-inline">
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="rating-range-item-bar">
                                                                    <div class="rating-width" style="width: ${percentStarThree}%;"></div>
                                                                </div>
                                                                <div class="rating-range-item-percent">
                                                                    <p>${percentStarThree}%</p>
                                                                </div>
                                                            </div>
                                                            <div class="rating-range-item d-flex align-items-center two-star">
                                                                <div class="rating-range-item-ratings">
                                                                    <ul class="list-inline">
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="rating-range-item-bar">
                                                                    <div class="rating-width" style="width: ${percentStarTwo}%;"></div>
                                                                </div>
                                                                <div class="rating-range-item-percent">
                                                                    <p>${percentStarTwo}%</p>
                                                                </div>
                                                            </div>
                                                            <div class="rating-range-item d-flex align-items-center one-star">
                                                                <div class="rating-range-item-ratings">
                                                                    <ul class="list-inline">
                                                                        <li class="list-inline-item">
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
                                                                                class="feather feather-star"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                        <li class="list-inline-item">
                                                                            <svg
                                                                                class="fill-star"
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="24"
                                                                                height="24"
                                                                                viewBox="0 0 24 24"
                                                                                fill="none"
                                                                                stroke="currentColor"
                                                                                stroke-width="2"
                                                                                stroke-linecap="round"
                                                                                stroke-linejoin="round"
                                                                                >
                                                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                            </svg>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="rating-range-item-bar">
                                                                    <div class="rating-width" style="width: ${percentStarOne}%;"></div>
                                                                </div>
                                                                <div class="rating-range-item-percent">
                                                                    <p>${percentStarOne}%</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="students-feedback">
                                                        <div class="students-feedback-heading">
                                                            <h5 class="font-title--card">Students Feedback <span>(${listRate.size()})</span></h5>
                                                        </div>
                                                        <c:forEach items="${listRate}" var="rate">
                                                            <div class="students-feedback-item">
                                                                <div class="feedback-rating">
                                                                    <div class="feedback-rating-start">
                                                                        <div class="image">
                                                                            <img src="${rate.student.imageURL}" alt="Image" />
                                                                        </div>
                                                                        <div class="text">
                                                                            <h6 class="font-para--md">
                                                                                <a href="#">${rate.student.name}</a>
                                                                            </h6>
                                                                        </div>
                                                                    </div>
                                                                    <div class="feedback-rating-end">
                                                                        <ul class="testimonial__item-star d-flex align-items-center">
                                                                            <c:forEach begin="1" end="${rate.star}">
                                                                                <li>
                                                                                    <svg
                                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                                        width="24"
                                                                                        height="24"
                                                                                        viewBox="0 0 24 24"
                                                                                        fill="currentColor"
                                                                                        stroke="currentColor"
                                                                                        stroke-width="2"
                                                                                        stroke-linecap="round"
                                                                                        stroke-linejoin="round"
                                                                                        class="feather feather-star"
                                                                                        >
                                                                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                                                    </svg>
                                                                                </li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <p class="font-para--md">
                                                                    ${rate.content}
                                                                </p>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Course Details Review Ends Here -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mt-4 mt-lg-0">
                        <div class="courseCard--wrapper">
                            <div class="cart">
                                <div class="cart__price">
                                    <div class="current-price">
                                        <h3 class="font-title--sm">${course.money} VND</h3>
                                    </div>
                                </div>
                                <div class="cart__checkout-process">
                                    <c:if test="${isEnroll == false && student == null}">
                                        <button type="button" class="button button-lg button--primary w-100" onclick="forwardLogin()">
                                            Enroll
                                        </button>
                                    </c:if>
                                    <c:if test="${isEnroll == false && student != null}">
                                        <c:if test="${listChapter.size() == 0}">
                                            <button type="button" class="button button-lg button--primary w-100">
                                                This course doesn't have any lesson. Comeback later
                                            </button>
                                        </c:if>
                                        <c:if test="${listChapter.size() > 0}">
                                            <c:if test="${course.money > 0}">
                                                <button type="button" class="button button-lg button--primary w-100" data-toggle="modal" data-target="#buyModal">
                                                    Enroll
                                                </button>
                                            </c:if>
                                            <c:if test="${course.money == 0}">
                                                <button type="submit" class="button button-lg button--primary w-100" onclick="executePayment(${course.courseID})">
                                                    Enroll for free
                                                </button>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${isEnroll == true}">
                                        <form action="LessonView">
                                            <input name="courseID" value="${course.courseID}" hidden="">
                                            <c:if test="${listChapter.size() > 0}">
                                                <input name="lessonID" value="${listChapter.get(0).lessons.get(0).lessonID}" hidden="">
                                                <button type="submit" class="button button-lg button--primary w-100">
                                                    Watch
                                                </button>
                                            </c:if>
                                            <c:if test="${listChapter.size() == 0}">
                                                <button type="button" class="button button-lg button--primary w-100">
                                                    This course doesn't have any lesson. Comeback later
                                                </button>
                                            </c:if>

                                        </form>
                                    </c:if>
                                </div>
                                <div class="cart__share-content">
                                    <h6 class="font-title--card">Share This Course</h6>
                                    <ul class="social-icons social-icons--outline">
                                        <li>
                                            <a href="#">
                                                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M17.9507 5.29205C17.9086 4.33564 17.7539 3.67812 17.5324 3.10836C17.3038 2.50359 16.9522 1.96213 16.4915 1.51201C16.0414 1.05489 15.4963 0.699691 14.8986 0.474702C14.3255 0.253147 13.6714 0.0984842 12.715 0.0563159C11.7515 0.0105764 11.4456 0 9.00174 0C6.55791 0 6.25202 0.0105764 5.29204 0.0527447C4.33563 0.0949129 3.67811 0.249713 3.1085 0.471131C2.50358 0.699691 1.96213 1.05132 1.51201 1.51201C1.05489 1.96213 0.699827 2.50716 0.474701 3.10493C0.253147 3.67812 0.098484 4.33207 0.0563158 5.28848C0.0105764 6.25203 0 6.55792 0 9.00176C0 11.4456 0.0105764 11.7515 0.0527446 12.7115C0.0949128 13.6679 0.249713 14.3254 0.471267 14.8952C0.699827 15.4999 1.05489 16.0414 1.51201 16.4915C1.96213 16.9486 2.50715 17.3038 3.10493 17.5288C3.67811 17.7504 4.33206 17.905 5.28861 17.9472C6.24845 17.9895 6.55448 17.9999 8.99831 17.9999C11.4421 17.9999 11.748 17.9895 12.708 17.9472C13.6644 17.905 14.3219 17.7504 14.8916 17.5288C16.1012 17.0611 17.0577 16.1047 17.5254 14.8952C17.7468 14.322 17.9016 13.6679 17.9437 12.7115C17.9859 11.7515 17.9965 11.4456 17.9965 9.00176C17.9965 6.55792 17.9929 6.25203 17.9507 5.29205ZM16.3298 12.6411C16.2911 13.5202 16.1434 13.9949 16.0203 14.3114C15.7179 15.0956 15.0955 15.7179 14.3114 16.0204C13.9949 16.1434 13.5168 16.2911 12.6411 16.3297C11.6917 16.372 11.407 16.3824 9.00531 16.3824C6.60365 16.3824 6.31534 16.372 5.36937 16.3297C4.4903 16.2911 4.01559 16.1434 3.69913 16.0204C3.3089 15.8761 2.9537 15.6476 2.66539 15.3487C2.3665 15.0568 2.13794 14.7052 1.99372 14.315C1.87065 13.9985 1.72299 13.5202 1.68439 12.6447C1.64209 11.6953 1.63165 11.4104 1.63165 9.00876C1.63165 6.60709 1.64209 6.31878 1.68439 5.37295C1.72299 4.49387 1.87065 4.01917 1.99372 3.7027C2.13794 3.31234 2.3665 2.95727 2.66896 2.66883C2.9607 2.36994 3.31233 2.14138 3.7027 1.99729C4.01917 1.87422 4.49744 1.72656 5.37294 1.68783C6.32235 1.64566 6.60722 1.63508 9.00875 1.63508C11.414 1.63508 11.6987 1.64566 12.6447 1.68783C13.5238 1.72656 13.9985 1.87422 14.3149 1.99729C14.7052 2.14138 15.0604 2.36994 15.3487 2.66883C15.6476 2.96071 15.8761 3.31234 16.0203 3.7027C16.1434 4.01917 16.2911 4.49731 16.3298 5.37295C16.372 6.32236 16.3826 6.60709 16.3826 9.00876C16.3826 11.4104 16.372 11.6917 16.3298 12.6411Z"
                                                    fill="currentColor"
                                                    ></path>
                                                <path
                                                    d="M9.00188 4.37744C6.44912 4.37744 4.37793 6.44849 4.37793 9.00139C4.37793 11.5543 6.44912 13.6253 9.00188 13.6253C11.5548 13.6253 13.6258 11.5543 13.6258 9.00139C13.6258 6.44849 11.5548 4.37744 9.00188 4.37744ZM9.00188 12.0008C7.34578 12.0008 6.00244 10.6576 6.00244 9.00139C6.00244 7.34515 7.34578 6.00195 9.00188 6.00195C10.6581 6.00195 12.0013 7.34515 12.0013 9.00139C12.0013 10.6576 10.6581 12.0008 9.00188 12.0008Z"
                                                    fill="currentColor"
                                                    ></path>
                                                <path
                                                    d="M14.8876 4.19521C14.8876 4.79133 14.4043 5.27469 13.808 5.27469C13.2119 5.27469 12.7285 4.79133 12.7285 4.19521C12.7285 3.59894 13.2119 3.11572 13.808 3.11572C14.4043 3.11572 14.8876 3.59894 14.8876 4.19521Z"
                                                    fill="currentColor"
                                                    ></path>
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M17.9955 18.0002V17.9994H18V11.3979C18 8.16841 17.3047 5.68066 13.5292 5.68066C11.7142 5.68066 10.4962 6.67666 9.99896 7.62091H9.94646V5.98216H6.3667V17.9994H10.0942V12.0489C10.0942 10.4822 10.3912 8.96716 12.3315 8.96716C14.2432 8.96716 14.2717 10.7552 14.2717 12.1494V18.0002H17.9955Z"
                                                    fill="currentColor"
                                                    ></path>
                                                <path d="M0.296875 5.98291H4.02888V18.0002H0.296875V5.98291Z" fill="currentColor"></path>
                                                <path
                                                    d="M2.1615 0C0.96825 0 0 0.96825 0 2.1615C0 3.35475 0.96825 4.34325 2.1615 4.34325C3.35475 4.34325 4.323 3.35475 4.323 2.1615C4.32225 0.96825 3.354 0 2.1615 0V0Z"
                                                    fill="currentColor"
                                                    ></path>
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <svg width="18" height="15" viewBox="0 0 18 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M18 1.73137C17.3306 2.025 16.6174 2.21962 15.8737 2.31412C16.6388 1.85737 17.2226 1.13962 17.4971 0.2745C16.7839 0.69975 15.9964 1.00013 15.1571 1.16775C14.4799 0.446625 13.5146 0 12.4616 0C10.4186 0 8.77387 1.65825 8.77387 3.69113C8.77387 3.98363 8.79862 4.26487 8.85938 4.53262C5.7915 4.383 3.07687 2.91263 1.25325 0.67275C0.934875 1.22513 0.748125 1.85738 0.748125 2.538C0.748125 3.816 1.40625 4.94887 2.38725 5.60475C1.79437 5.5935 1.21275 5.42138 0.72 5.15025C0.72 5.1615 0.72 5.17613 0.72 5.19075C0.72 6.984 1.99912 8.4735 3.6765 8.81662C3.37612 8.89875 3.04875 8.93812 2.709 8.93812C2.47275 8.93812 2.23425 8.92463 2.01038 8.87512C2.4885 10.3365 3.84525 11.4109 5.4585 11.4457C4.203 12.4279 2.60888 13.0196 0.883125 13.0196C0.5805 13.0196 0.29025 13.0061 0 12.969C1.63462 14.0231 3.57188 14.625 5.661 14.625C12.4515 14.625 16.164 9 16.164 4.12425C16.164 3.96112 16.1584 3.80363 16.1505 3.64725C16.8829 3.1275 17.4982 2.47837 18 1.73137Z"
                                                    fill="currentColor"
                                                    ></path>
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <svg width="18" height="14" viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    fill-rule="evenodd"
                                                    clip-rule="evenodd"
                                                    d="M16.0427 0.885481C16.8137 1.09312 17.4216 1.70094 17.6291 2.47204C18.0148 3.88048 17.9999 6.81629 17.9999 6.81629C17.9999 6.81629 17.9999 9.73713 17.6293 11.1457C17.4216 11.9167 16.8138 12.5246 16.0427 12.7321C14.6341 13.1029 8.99996 13.1029 8.99996 13.1029C8.99996 13.1029 3.38048 13.1029 1.95721 12.7174C1.18611 12.5098 0.57829 11.9018 0.37065 11.1309C0 9.73713 0 6.80146 0 6.80146C0 6.80146 0 3.88048 0.37065 2.47204C0.578153 1.70108 1.20094 1.07829 1.95707 0.870787C3.36565 0.5 8.99983 0.5 8.99983 0.5C8.99983 0.5 14.6341 0.5 16.0427 0.885481ZM11.8913 6.80154L7.20605 9.50006V4.10303L11.8913 6.80154Z"
                                                    fill="currentColor"
                                                    ></path>
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <svg width="9" height="18" viewBox="0 0 9 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.3575 2.98875H9.00075V0.12675C8.71725 0.08775 7.74225 0 6.60675 0C4.2375 0 2.6145 1.49025 2.6145 4.22925V6.75H0V9.9495H2.6145V18H5.82V9.95025H8.32875L8.727 6.75075H5.81925V4.5465C5.82 3.62175 6.069 2.98875 7.3575 2.98875Z"
                                                    fill="currentColor"
                                                    ></path>
                                                </svg>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Event Info Ends Here -->
        <c:if test="${relatedCourse.size() > 0}">
            <section class="section new-course-feature section--bg-offwhite-five">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <h2 class="font-title--md text-center">Related Course</h2>
                        </div>
                        <div class="row">
                            <div class="col-12 position-relative px-0 mx-0">
                                <div class="new__courses">
                                    <c:forEach items="${relatedCourse}" var="course" begin="0" end="3">
                                        <div class="contentCard contentCard--course contentCard--space">
                                            <div class="contentCard-top">
                                                <a href="CourseDetails?courseID=${course.courseID}"><img src="${course.courseImage}" alt="images" class="img-fluid" /></a>
                                            </div>
                                            <div class="contentCard-bottom">
                                                <h5>
                                                    <a href="CourseDetails?courseID=${course.courseID}" class="font-title--card">${course.courseName}</a>
                                                </h5>
                                                <div class="contentCard-info d-flex align-items-center justify-content-between">
                                                    <a href="ExpertProfile?id=${course.getExpert().getExpertID()}" class="contentCard-user d-flex align-items-center">
                                                        <img src="${course.getExpert().img}" style="height: 20px" alt="client-image" class="rounded-circle" />
                                                        <p class="font-para--md">Brandon Dias</p>
                                                    </a>
                                                    <div class="price">
                                                        <span>${course.money}</span>
                                                    </div>
                                                </div>
                                                <div class="contentCard-more">
                                                    <div class="d-flex align-items-center">
                                                        <div class="icon">
                                                            <img src="../BeDev/view/dist/images/icon/star.png" alt="star" />
                                                        </div>
                                                        <span>${course.averageStar}</span>
                                                    </div>
                                                    <div class="eye d-flex align-items-center">
                                                        <div class="icon">
                                                            <img src="../BeDev/view/dist/images/icon/eye.png" alt="eye" />
                                                        </div>
                                                        <span>${course.numberRegister}</span>
                                                    </div>
                                                    <div class="book d-flex align-items-center">
                                                        <div class="icon">
                                                            <img src="../BeDev/view/dist/images/icon/book.png" alt="location" />
                                                        </div>
                                                        <span>${course.numberLesson} Lesson</span>
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
            </section>
        </c:if>
        <!-- Event Info Ends Here -->
        <div class="modal fade" id="buyModal">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Payment</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        You need payment to continue learning.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary text-white"  onclick="executePayment(${course.courseID})">Pay</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

            <script>
                            function executePayment(courseID) {
                                $.post("/BeDev/EnrollCourse?courseID=" + courseID, (result) => {
                                    if (result == 'success') {
                                        showMessage("success", "Payment successfully. Click OK to learn now.", true)
                                    } else {
                                        showMessage("Error", result, false);
                                    }
                                });
                            }
                            function showMessage(status, message, forward) {
                                swal({
                                    title: status == "success" ? "Success" : "Error",
                                    text: message,
                                    icon: status == "success" ? "success" : "error",
                                    button: "OK",
                                    allowOutsideClick: false,
                                    allowEscapeKey: false,
                                    allowEnterKey: false
                                }).then(function () {
                                    if (forward) {
                                        window.location.href = "/BeDev/LessonView?courseID=${course.courseID}&lessonID=${listChapter.size() > 0 ? listChapter.get(0).lessons.size() > 0 ? listChapter.get(0).lessons.get(0).lessonID : 0 : 0}";
                                    }
                                });
                            }

                            function forwardLogin() {
                                window.location.href = "/BeDev/SignIn";
                            }
        </script>
    </body>
</html>
