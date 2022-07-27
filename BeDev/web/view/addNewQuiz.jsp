<%-- 
    Document   : addNewQuiz
    Created on : Jul 22, 2022, 1:40:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Student profile</title>
        <link rel="stylesheet" href="/BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="/BeDev/view/dist/images/favicon/favicon.png" />
    </head>
    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <div class="row">
                <div style="display: flex;justify-content: center">
                    <div class="white-bg" style="width: 50%">
                        <div class="students-info-form">
                            <h6 class="font-title--card">Add new quiz for chapter: ${chapter.chapterName}  </h6>
                        <form method="post" action="AddNewQuiz">
                            <input type="hidden" name="chapterID" value="${chapter.chapterID}">
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="email">Quiz Name</label>
                                    <br>
                                    <textarea class="form-control" name="quizName" cols="80" rows="5" style="width: 100%" required=""></textarea>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="email">PassRate</label>
                                    <br>                                  
                                    <input type="text" class="form-control" name="passRate"  id="passRate" >
                                </div>
                            </div>   
                            
                            <div class="d-flex justify-content-lg-end justify-content-center mt-2">
                                <button style="background-color: blue" class="button button-lg but ton--primary" type="submit" ">Add new</button>
                            </div>
                        </form>
                                <h3></h3>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
