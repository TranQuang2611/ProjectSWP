<%-- 
    Document   : editOption
    Created on : Jul 18, 2022, 1:08:36 PM
    Author     : quang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="/BeDev/view/dist/images/favicon/favicon.png" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <%@include file="/view/adminLink/adminHeader.jsp" %>
    </head>
    <body onload="loader()">
        <jsp:include page="header.jsp"></jsp:include>
            <div class="row">
                <div style="display: flex;justify-content: center">
                    <div class="white-bg" style="width: 50%">
                        <div class="students-info-form">
                            <h6 class="font-title--card">Edit Option</h6>

                            <div class="row g-3" style="padding-top: 50px">
                                <div class="col-12">
                                    <label for="fname">Question ID</label>
                                    <input type="text" class="form-control" name="quesID" value="${question.getQuestionID()}" id="fname" readonly="" >
                            </div>
                        </div>
                        <div class="row g-3" style="padding-top: 20px">
                            <div class="col-12">
                                <label for="email">Question Content</label>
                                <br>
                                <textarea readonly="" class="form-control" cols="80" rows="5" style="width: 100%">${question.getContent()}</textarea>
                            </div>
                        </div>
                        <form method="post" accept-charset="utf-8">
                            <div class="row g-3" style="padding-top: 20px">
                                <div class="col-12">
                                    <div>
                                        <label for="email" style="padding-right: 50px">Option List</label>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                            Create Option
                                        </button>
                                        <input name="quesID" value="${question.getQuestionID()}" type="hidden">
                                        <input name="check" value="${check}" type="hidden">
                                    </div>
                                    <br>
                                    <ul>
                                        <c:forEach items="${listOption}" var="op">
                                            <li style="padding-bottom: 40px">
                                                <input style="color: ${op.isTrue() == true ? "green" : "red"}" type="text" id="${op.getOptionID()}" class="form-control" readonly="" name="content" value="${op.getContent()}">
                                                <a onclick="editOption('${op.getOptionID()}')" class="btn" type="button"><i class="icon-edit" ></i> Edit</a>
                                                <c:if test="${op.isTrue()==true}">                                         
                                                    <c:if test="${check!=null}">
                                                        <a type="button" class="btn" data-toggle="modal" data-target="#123" onclick="setStatus(${op.isTrue()},${check!=null?"1":"0"},${question.getQuestionID()},${op.getOptionID()})" ><i class="icon-edit"></i> Set isFalse</a>
                                                    </c:if>
                                                    <c:if test="${check==null}">
                                                        <a type="button" class="btn" data-toggle="modal" data-target="#123" onclick="setStatus(${op.isTrue()},${check!=null?"1":"0"},${question.getQuestionID()},${op.getOptionID()})"><i class="icon-edit"></i> Set isFalse</a>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${op.isTrue()==false}">
                                                    <c:if test="${check!=null}">
                                                        <a type="button" class="btn" data-toggle="modal" data-target="#123" onclick="setStatus(${op.isTrue()},${check!=null?"1":"0"},${question.getQuestionID()},${op.getOptionID()})"><i class="icon-edit"></i> Set isTrue</a>
                                                    </c:if>
                                                    <c:if test="${check==null}">
                                                        <a type="button" class="btn" data-toggle="modal" data-target="#123" onclick="setStatus(${op.isTrue()},${check!=null?"1":"0"},${question.getQuestionID()},${op.getOptionID()})"><i class="icon-edit"></i> Set isTrue</a>
                                                    </c:if>                                                 
                                                </c:if>
                                                <c:if test="${check!=null}"> 
                                                    <a class="btn" href="SetUpOption?quesID=${question.getQuestionID()}&opID=${op.getOptionID()}&action=delete&check=true" onclick="return confirm('Do you want to delete this option ?')"><i class="icon-edit"></i> Delete</a>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                    </ul>

                                </div>
                            </div>
                            <div class="d-flex justify-content-lg-between justify-content-center mt-2">
                                <a class="button button-lg button--primary" href="ManageQuestion?qid=${question.getQuiz().getQuizID()}">Return</a>
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
                                            <button id="deleteThis" class="btn btn-primary" type="submit">Yes</button>
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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form action="AddOption" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Create Option</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">                               
                            <label>Content</label>                           
                            <input type="text" class="form-control" name="content" required="">
                            <input name="quesID" value="${question.getQuestionID()}" type="hidden">
                            <input name="check" value="${check}" type="hidden">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" value="true" id="1" name="status" required="" checked="">
                                <label class="form-check-label" for="flexCheckDefault">
                                    isTrue
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" value="false" id="2" name="status" required="">
                                <label class="form-check-label" for="flexCheckDefault">
                                    isFalse
                                </label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Create</button>
                        </div>
                    </form>   
                </div>
            </div>
        </div>
        <div class="modal fade" id="123" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmSet"></h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" id="confirmOption"></div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">No</button>
                        <a id="yesButton" href="" class="btn btn-primary">Yes</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
                                    function editOption(id) {
                                        $("#" + id).removeAttr("readonly");
                                    }
                                    function saveChange() {
                                        $('#exampleModalLabel').text("Confirm");
                                        $('#confirmQuestion').text('Do you want to save ?');
                                    }
                                    function setStatus(status, check, quesID, opID) {
                                        $('#confirmSet').text('Set Status');
                                        if (status) {
                                            $('#confirmOption').text('Do you want to set this option isFalse ?');
                                            if (check == "1") {
                                                document.getElementById("yesButton").href = "SetUpOption?quesID=" + quesID + "&opID=" + opID + "&action=false&check=true";
                                            } else {
                                                document.getElementById("yesButton").href = "SetUpOption?quesID=" + quesID + "&opID=" + opID + "&action=false";
                                            }
                                        } else {
                                            $('#confirmOption').text('Do you want to set this option isTrue ?');
                                            if (check == "1") {
                                                document.getElementById("yesButton").href = "SetUpOption?quesID=" + quesID + "&opID=" + opID + "&action=true&check=true";
                                            } else {
                                                document.getElementById("yesButton").href = "SetUpOption?quesID=" + quesID + "&opID=" + opID + "&action=true";
                                            }
                                        }
                                    }
        </script>
    </body>
</html>
