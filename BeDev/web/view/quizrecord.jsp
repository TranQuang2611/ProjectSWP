<%-- 
    Document   : quizrecord
    Created on : Jun 5, 2022, 3:06:55 PM
    Author     : admin
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Quiz Record</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
    </head>
    <body onload="loader()">
        <div class="loader">
            <span class="loader-spinner">Loading...</span>
        </div>
        <header class="bg-transparent">
            <div class="container-fluid">
                <div class="coursedescription-header">
                    <div class="coursedescription-header-start">
                        <a class="logo-image" href="index.html">
                            <img src="../BeDev/view/dist/images/logo/logo.png" alt="Logo" />
                        </a>
                        <div class="topic-info">
                            <div class="topic-info-arrow">
                                <a href="Quiz?qid=${qid}">
                                    <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M15.5 19.5L8.5 12.5L15.5 5.5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    </svg>
                                </a>
                            </div>
                            <div class="topic-info-text">
                                <h6 class="font-title--xs"><a href="Quiz?qid=${qid}">${quizRecord.getQuizName()}</a></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="d-flex justify-content-center" style="margin-bottom: 300px">
            <div class="col-10">
                <table class="table">
                    <thead class="bg-primary text-white">
                        <tr class="text-center">
                            <th scope="col">STT</th>
                            <th scope="col">Grade</th>
                            <th scope="col">Correct Answer</th>
                            <th scope="col">Time Attended</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                                               
                        <c:forEach begin="0" end="${listRecord.size()-1}" step="1" var="i" >
                            <tr class="text-center">
                                <th>${i+1}</th>
                                <td scope="row"><fmt:formatNumber type="number" maxFractionDigits="2" value="${listRecord.get(i).getGrade()}" /></td>  
                                <td> ${listRecord.get(i).getNumberCorrectAnswer()} /  ${listRecord.get(i).getNumberQuestion()}</td>
                                <td>${listRecord.get(i).getTimeAttended().toString().substring(0, 10)} &emsp; ${listRecord.get(i).getTimeAttended().toString().substring(11,19)}</td>
                                <td><a href="QuizReview?rid=${listRecord.get(i).getRecordID()}&qid=${listRecord.get(i).getQuizID()}">View Detail</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
