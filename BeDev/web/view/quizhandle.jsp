<%-- 
    Document   : watch
    Created on : May 18, 2022, 10:10:42 AM
    Author     : ACER
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Quiz Handle</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
    </head>

    <body onload="loader()">
        <div class="loader">
            <span class="loader-spinner">Loading...</span>
        </div>

        <!-- Header Starts Here -->
        <header class="bg-transparent">
            <div class="container-fluid">
                <div class="coursedescription-header">
                    <div class="coursedescription-header-start">
                        <a class="logo-image" href="HomeControl">
                            <img src="../BeDev/view/dist/images/logo/logo.png" alt="Logo" />
                        </a>
                        <div class="topic-info">
                            <div class="topic-info-arrow">
                                <a href="Quiz?qid=${quiz.getQuizID()}&courseID=${courseID}">
                                    <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M15.5 19.5L8.5 12.5L15.5 5.5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    </svg>
                                </a>
                            </div>
                            <div class="topic-info-text">
                                <h6 class="font-title--xs">Return to quiz view</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Ends Here -->

        <!-- Course Description Starts Here -->
        <div class="container-fluid">
            <div class="container mb-100">
                <br><br>
                <h2>Quiz: ${quiz.getQuizName()}</h2>
                <br>
                <span style="padding-right: 5px;"><strong>Total grade </strong></span><span>10</span>
                <br><br><br><br>
                <%int questionOrder = 1;%>
                <form action="QuizHandle?qid=${quiz.getQuizID()}&cid=${courseID}" method="POST">
                    <%questionOrder = 1;%>
                    <c:forEach items="${questionList}" var="question">
                        <div style="padding-bottom: 45px;">
                            <p style="font-size: 18px;"><strong><%=questionOrder%>.</strong> ${question.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;")} </p>
                            <%questionOrder++;%>
                            <ul class="p-1">
                                <c:forEach items="${question.getOptionList()}" var="option">
                                    <li class="list-group-item border-0">
                                        <div class="form-check">
                                            <input class="form-check-input" value="${option.getOptionID()}" id="${option.getOptionID()}" name="${question.getQuestionID()}" 
                                                   type="${question.isMultipleChoice() ? "checkbox" : "radio"}" style="margin-right: 10px"> 
                                            <label for="${option.getOptionID()}">${option.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;")}</label>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:forEach>
                    <div class="text-center">
                        <button class="btn btn-primary btn-lg text-white">Submit quiz</button>
                    </div>
                </form>
                <div class="text-danger text-center">
                    ${mess}
                </div>
            </div>
        </div>
        <!-- Course Description Ends Here -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
