<%-- 
    Document   : addListQuestion
    Created on : Jul 25, 2022, 6:56:39 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Create Question</title>
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
                            <h6 class="font-title--card">Create Question</h6>
                            <form method="post" accept-charset="utf-8">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label for="fname">Quiz ID</label>
                                        <input type="text" class="form-control" name="qid" value="${quiz.getQuizID()}" id="fname" readonly="" >
                                </div>
                            </div>
                            <div class="row g-3" style="padding-bottom: 20px">
                                <div class="col-12">
                                    <label for="email">Quiz name</label>
                                    <br>
                                    <textarea class="form-control" cols="80" rows="5" style="width: 100%" readonly="">${quiz.getQuizName()}</textarea>
                                </div>
                            </div>
                            <div class="row g-3" style="padding-bottom: 20px">
                                <div class="col-12">
                                    <label for="email">Format</label>
                                    <br>                                  
                                    <textarea class="form-control" cols="80" rows="5" style="width: 100%;color: red" readonly="">You must write question with this following :
                                    Question1 ? /// Question2 ? /// Question3  ? ///                                                                      
                                    Example : 
                                    JavaScript là ngôn ngữ xử lí ở đâu ? /// Biên dịch cú pháp sau: <strong>Quantrimang</strong> ? /// 
                                    </textarea>
                                </div>
                            </div> 
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="email">Content of question</label>
                                    <br>                                  
                                    <textarea class="form-control" name="content" cols="80" rows="5" style="width: 100%" required=""></textarea>
                                </div>
                            </div>
                            <div class="d-flex justify-content-lg-between justify-content-center mt-2">
                                <a class="button button-lg button--primary" href="/BeDev/expert/ManageQuestion?qid=" >Return</a>
                                <button class="button button-lg button--primary" type="button" data-toggle="modal" data-target="#logoutModal" onclick="saveChange()">Save Changes</button>                          
                            </div>    
                            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Save</h5>
                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="modal-body" id="confirmQuestion">Do you want to save and add question ?</div>
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
        <%@include file="/view/adminLink/adminScript.jsp" %>       
        <script>
            function saveChange() {
                $('#exampleModalLabel').text("Confirm");
                $('#confirmQuestion').text('Do you want to save and add question ?');
            }
        </script>
    </body>
</html>
