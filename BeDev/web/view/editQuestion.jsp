<%-- 
    Document   : editQuestion
    Created on : Jul 17, 2022, 4:26:09 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Edit Question</title>
        <link rel="stylesheet" href="/BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="/BeDev/view/dist/images/favicon/favicon.png" />
        <%@include file="/view/adminLink/adminHeader.jsp" %>

    </head>
    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <div class="row">
                <div style="display: flex;justify-content: center">
                    <div class="white-bg" style="width: 50%">
                        <div class="students-info-form">
                            <h6 class="font-title--card">Edit Question</h6>
                            <form method="post" accept-charset="utf-8">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label for="fname">Question ID</label>
                                        <input type="text" class="form-control" name="quesID" value="${question.getQuestionID()}" id="fname" readonly="" >
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="fname">Quiz ID</label>
                                    <input type="text" class="form-control" name="qid" value="${question.getQuiz().getQuizID()}" id="fname" readonly="" >
                                </div>
                            </div>
                            <div class="row g-3" style="padding-bottom: 20px">
                                <div class="col-12">
                                    <label for="email">Content</label>
                                    <br>
                                    <textarea class="form-control" name="content" cols="80" rows="5" style="width: 100%" required="">${question.getContent()}</textarea>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="email">Explaination</label>
                                    <br>                                  
                                    <textarea class="form-control" name="explain" cols="80" rows="5" style="width: 100%">${question.getExplanation()}</textarea>
                                </div>
                            </div>    
                            <div class="d-flex justify-content-lg-between justify-content-center mt-2">
                                <a class="button button-lg button--primary" href="ManageQuestion?qid=${question.getQuiz().getQuizID()}" >Return</a>
                                <button class="button button-lg button--primary" type="button" data-toggle="modal" data-target="#logoutModal" onclick="saveChange()">Save Changes</button>                          
                            </div>    
                            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete?</h5>
                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="modal-body" id="confirmQuestion">Do you want to delete this ?</div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">No</button>
                                            <button id="deleteThis" type="submit" class="btn btn-primary">Yes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            function saveChange() {
                $('#exampleModalLabel').text("Confirm");
                $('#confirmQuestion').text('Do you want to save ?');
            }
        </script>
    </body>
</html>
