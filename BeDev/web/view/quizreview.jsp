<%-- 
    Document   : quizreview
    Created on : Jun 7, 2022, 9:17:51 PM
    Author     : admin
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
        <title>Quiz Review</title>
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
                        <a class="logo-image" href="index.html">
                            <img src="../BeDev/view/dist/images/logo/logo.png" alt="Logo" />
                        </a>
                        <div class="topic-info">
                            <div class="topic-info-arrow">
                                <a href="RecordController?qid=${qid}">
                                    <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M15.5 19.5L8.5 12.5L15.5 5.5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    </svg>
                                </a>
                            </div>
                            <div class="topic-info-text">
                                <h6 class="font-title--xs"><a href="RecordController?qid=${qid}">Return</a></h6>
                                <div class="lesson-hours">
                                </div>
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
                <c:choose>
                    <c:when test="${quizRecord.getGrade() * 10 >= quizRecord.getPassRate()}">
                        <div style="background-color: #defae1; padding: 50px;">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <svg style="color: rgb(29, 124, 80)" aria-hidden="true" fill="none" focusable="false" height="30" viewBox="0 0 20 20" width="30" class="css-md7hvk"><path d="M10 1a9 9 0 100 18 9 9 0 000-18zM8.36 14.63l-4-4L5.8 9.24l2.56 2.56L14.2 6l1.42 1.42-7.26 7.21z" fill="currentColor"></path></svg>
                                        </div>
                                        <div class="col-md-10">
                                            <h2 style="font-weight: 650">You passed!</h2>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px;">
                                        <div class="col-md-1">
                                        </div>
                                        <div class="col-md-10">
                                            <h5>
                                                <span style=" padding-right: 20px;">
                                                    <span style="font-weight: 620;">Grade received</span> 
                                                    <span style="color: rgb(29, 124, 80);" > <fmt:formatNumber type="number" maxFractionDigits="1" value="${quizRecord.getGrade()*10}" />%</span>
                                                </span> 
                                                <span>To pass <fmt:formatNumber type = "number" value = "${quizRecord.getPassRate()}"/>% or higher</span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="container d-flex h-100">
                                        <div class="row justify-content-center align-self-center">
                                            <a href="Quiz?qid=${qid}&courseID=${courseID}" class="btn btn-primary btn-lg text-white">Back</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div style="background-color: #fadcdf; padding: 50px;">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <svg style="color: rgb(211, 0, 1);" aria-hidden="true" fill="none" focusable="false" height="30" viewBox="0 0 20 20" width="30" class="css-1hltn8p"><path d="M18.9 17.25L10.67 1.91a.75.75 0 00-1.34 0L1.1 17.25a.84.84 0 00.67 1.25h16.46a.84.84 0 00.67-1.25zM9 6.05h2v6.63H9V6.05zm1 10.74a1.25 1.25 0 110-2.5 1.25 1.25 0 010 2.5z" fill="currentColor"></path></svg>
                                        </div>
                                        <div class="col-md-10">
                                            <h2 style="font-weight: 650">Try again once you are ready</h2>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px;">
                                        <div class="col-md-1">
                                        </div>
                                        <div class="col-md-10">
                                            <h5>
                                                <span style=" padding-right: 20px;">
                                                    <span style="font-weight: 620;">Grade received</span> 
                                                    <span style="color: rgb(211, 0, 1);" > <fmt:formatNumber type="number" maxFractionDigits="1" value="${quizRecord.getGrade()*10}" />%</span>

                                                </span> 
                                                <span>To pass <fmt:formatNumber type = "number" value = "${quizRecord.getPassRate()}"/>% or higher</span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="container d-flex h-100">
                                        <div class="row justify-content-center align-self-center">
                                            <a href="QuizHandle?qid=${qid}?cid=${courseID}" class="btn btn-primary btn-lg text-white">Try again</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <br><br><br>
                <h2>Quiz: ${quizRecord.getQuizName()}</h2>
                <br>
                <span style="padding-right: 5px;"><strong>Total grade </strong></span><span>10</span>
                <br><br><br><br>

                <%int questionOrder = 1;%>
                <!-- vong for cho question -->
                <c:forEach items="${questionList}" var="question">
                    <div style="padding-bottom: 45px;">
                        <!-- hien thi question-->
                        <c:if test="${question.getNumberTrueOption() == 1}">
                            <p style="font-size: 18px;"><strong><%=questionOrder%>.</strong> ${question.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;")} </p>
                        </c:if>

                        <c:if test="${question.getNumberTrueOption() != 1}">
                            <p style="font-size: 18px;"><strong><%=questionOrder%>.</strong> ${question.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;")} ( Select ${question.getNumberTrueOption()} answer) </p>
                        </c:if>

                        <!-- bien dem cau hoi-->
                        <%questionOrder++;%>
                        <ul class="p-1">
                            <!-- hiển thị option và checked câu trả lời của student-->
                            <c:forEach items="${question.getCompareList()}" var="option">
                                <li class="list-group-item border-0">
                                    <div class="form-check">                    
                                        <input class="form-check-input" name="${question.getQuestionID()}" type="${(question.getNumberTrueOption() == 1) ? "radio" : "checkbox"}" style="margin-right: 10px;" ${question.getAnswerList().contains(option) ? "checked" : "disabled"} > 
                                        ${option.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;")}   
                                        <c:if test="${option.getAnswerOption()!=0}">
                                            <c:if test="${!option.isTrue()}">
                                                <div style="background-color: rgb(253, 245, 245); padding: 10px; margin-left: -30px; margin-top: 10px;">
                                                    <div class="row" style="color: rgb(211, 0, 1); font-weight: 600;">
                                                        <div class="col-md-1">
                                                            <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-181" class="css-1hltn8p"><path fill-rule="evenodd" clip-rule="evenodd" d="M10 1.5a8.5 8.5 0 100 17 8.5 8.5 0 000-17zM.5 10a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.646 14.354l-8-8 .708-.708 8 8-.708.708z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M14.354 6.354l-8 8-.708-.708 8-8 .708.708z" fill="currentColor"></path></svg>
                                                        </div>
                                                        <div class="col-md-10 d-flex">
                                                            <p class="justify-content-center align-self-center" style="margin-right: 10px">Incorrect</p>                                               
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${option.isTrue()}">
                                                <div style="background-color: rgb(247, 251, 249); padding: 10px; margin-left: -30px; margin-top: 10px;">
                                                    <div class="row" style="color: rgb(29, 124, 80); font-weight: 600;" >
                                                        <div class="col-md-1">
                                                            <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-39" class="css-md7hvk"><path fill-rule="evenodd" clip-rule="evenodd" d="M10 1.5a8.5 8.5 0 100 17 8.5 8.5 0 000-17zM.5 10a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M14.384 7.32l-5.35 6.42-3.388-3.386.708-.708 2.612 2.613 4.65-5.58.768.641z" fill="currentColor"></path></svg>    
                                                        </div>
                                                        <div class="col-md-10 d-flex">
                                                            <p class="justify-content-center align-self-center" style="margin-right: 10px">Correct</p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-1"></div>
                                                        <div class="col-md-10 mt-2">

                                                            <p>Explanation: ${question.getExplanation().equals("") ? "None" : question.getExplanation()}</p>                                               
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>  
                        <!-- Kiểm tra đúng sai câu trả lời của student-->
                        
                        <c:if test="${question.getNumberAnswer()==0}">
                            <div style="background-color: rgb(253, 245, 245); padding: 10px; margin-left: -30px; margin-top: 10px;">
                                <div class="row" style="color: rgb(211, 0, 1); font-weight: 600;">
                                    <div class="col-md-1">
                                        <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-181" class="css-1hltn8p"><path fill-rule="evenodd" clip-rule="evenodd" d="M10 1.5a8.5 8.5 0 100 17 8.5 8.5 0 000-17zM.5 10a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.646 14.354l-8-8 .708-.708 8 8-.708.708z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M14.354 6.354l-8 8-.708-.708 8-8 .708.708z" fill="currentColor"></path></svg>
                                    </div>
                                    <div class="col-md-10 d-flex">
                                        <p class="justify-content-center align-self-center" style="margin-right: 10px">Incorrect</p>                                               
                                        <p> ( You don't have answer ) </p>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${question.getNumberAnswer()<question.getNumberTrueOption() && question.getNumberAnswer()!=0}">
                            <div style="background-color: rgb(253, 245, 245); padding: 10px; margin-left: -30px; margin-top: 10px;">
                                <div class="row" style="color: rgb(211, 0, 1); font-weight: 600;">
                                    <div class="col-md-1">
                                        <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-181" class="css-1hltn8p"><path fill-rule="evenodd" clip-rule="evenodd" d="M10 1.5a8.5 8.5 0 100 17 8.5 8.5 0 000-17zM.5 10a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.646 14.354l-8-8 .708-.708 8 8-.708.708z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M14.354 6.354l-8 8-.708-.708 8-8 .708.708z" fill="currentColor"></path></svg>
                                    </div>
                                    <div class="col-md-10 d-flex">
                                        <p class="justify-content-center align-self-center" style="margin-right: 10px"></p>                                               
                                        <p> Not enough answer  </p>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Course Description Ends Here -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
