<%-- 
    Document   : manageQuestions
    Created on : Jul 17, 2022, 1:13:50 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Custom fonts for this template -->
        <link href="/BeDev/view/dist/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="/BeDev/view/dist/main.css" />
        <!-- Custom styles for this template -->
        <link href="/BeDev/view/dist/css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="/BeDev/view/dist/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <style>
            .modal-lg {
                max-width: 60% !important;
            }

            input[type="file"] {
                display: none;
            }

            .custom-file-upload {
                border: 1px solid cornflowerblue;
                display: inline-block;
                padding: 6px 12px;
                cursor: pointer;
                color: #fff;
                border-radius: 10px;
                background-color: cornflowerblue;
            }

            .ck-editor__editable[role="textbox"] {
                /* editing area */
                min-height: 200px;
            }
        </style>
    </head>
    <body id="page-top" onload="loader()">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Divider -->
                <hr class="sidebar-divider my-0">


                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Menu
                </div>
                <li class="nav-item">
                    <a class="nav-link" href="/BeDev/expert/course">
                        <i class="fa-solid fa-book-open"></i>
                        <span>Course Manage</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/BeDev/expert/ExpertDashboard">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Dashboard</span></a>
                </li>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Manage Question</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Manage Question</h6>
                            <a class="collapse-item" href="/BeDev/expert/AddListQuestion?qid=${quiz.getQuizID()}">Create Question</a>
                            <a class="collapse-item" href="/BeDev/expert/ManageQuestion?qid=${quiz.getQuizID()}">Manage Question</a>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
            <!-- End of Sidebar -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="header.jsp" %>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">List question of Quiz #${quiz.getQuizID()} :  ${quiz.getQuizName()}</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Question ID</th>
                                                <th>Content</th>
                                                <th>Explanation</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="ques" items="${listQuestion}">
                                                <tr>
                                                    <td>${ques.getQuestionID()}</td>
                                                    <td>${ques.getContent()}</td>
                                                    <td>${ques.getExplanation() != "" ? ques.getExplanation() : ""}</td>
                                                    <td>${ques.isStatus()==true ? "<span class=\"badge badge-success\">Active</span>" : "<span class=\"badge badge-danger\">Inactive</span>"}</td>
                                                    <td>
                                                        <c:if test="${ques.isStatus()==true}">
                                                            <a href="" data-toggle="modal" data-target="#logoutModal" onclick="changeStatus(${ques.isStatus()},${qid},${ques.getQuestionID()})">Inactive</a>                                                                          
                                                        </c:if>
                                                        <c:if test="${ques.isStatus()==false}">
                                                            <a href="" data-toggle="modal" data-target="#logoutModal" onclick="changeStatus(${ques.isStatus()},${qid},${ques.getQuestionID()})">Active | </a>
                                                        </c:if>
                                                        |
                                                        <a href="/BeDev/expert/EditQuestion?qid=${qid}&quesID=${ques.getQuestionID()}">Edit</a>
                                                        |                                                  
                                                        <c:if test="${ques.getCheckQuestionCompleted()==0}">
                                                            <a href="/BeDev/expert/EditOption?quesID=${ques.getQuestionID()}&check=true">Edit Option</a>
                                                        </c:if> 
                                                        <c:if test="${ques.getCheckQuestionCompleted()>0}">
                                                            <a href="/BeDev/expert/EditOption?quesID=${ques.getQuestionID()}">Edit Option</a>
                                                        </c:if>
                                                        <c:if test="${ques.getCheckQuestionCompleted()==0}">
                                                            |
                                                            <a data-toggle="modal" data-target="#logoutModal" href="#" onclick="deleteQues(${ques.getQuestionID()},${qid})">Delete</a>           
                                                        </c:if>                                                         
                                                    </td>
                                                </tr>


                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
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
                        <a id="deleteThis" class="btn btn-primary" href="">Yes</a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>



        <!-- Bootstrap core JavaScript-->
        <script src="/BeDev/view/dist/vendor/jquery/jquery.min.js"></script>
        <script src="/BeDev/view/dist/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="/BeDev/view/dist/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="/BeDev/view/dist/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="/BeDev/view/dist/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="/BeDev/view/dist/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="/BeDev/view/dist/js/demo/datatables-demo.js"></script>

        <script>
                                                                function deleteQues(quesID) {
                                                                    document.getElementById("deleteThis").href = "/BeDev/expert/ChangeStatus?qid=${qid}&quesID=" + quesID + "&action=Delete";
                                                                }
                                                                function changeStatus(status, qid, quesID) {
                                                                    if (status) {
                                                                        $('#exampleModalLabel').text("Inactive");
                                                                        $('#confirmQuestion').text("Do you want to Inactice this question");
                                                                        document.getElementById("deleteThis").href = "/BeDev/expert/ChangeStatus?qid=" + qid + "&quesID=" + quesID + "&action=Inactive";
                                                                    } else {
                                                                        $('#exampleModalLabel').text("Actice");
                                                                        $('#confirmQuestion').text("Do you want to Actice this question");
                                                                        document.getElementById("deleteThis").href = "/BeDev/expert/ChangeStatus?qid=" + qid + "&quesID=" + quesID + "&action=Active";
                                                                    }
                                                                }
        </script>

    </body>
</html>
