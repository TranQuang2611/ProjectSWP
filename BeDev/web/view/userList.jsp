<%-- 
    Document   : manageQuiz
    Created on : Jul 19, 2022, 10:45:51 PM
    Author     : ADMIN
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
                    <a class="nav-link" href="/BeDev/admin/UserList">
                        <i class="fa-solid fa-user"></i>
                        <span>User Management</span></a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="/BeDev/admin/student">
                        <i class="fa-solid fa-user-graduate"></i>
                        <span>Student Management</span></a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="/BeDev/admin/expert">
                        <i class="fa-solid fa-user-tie"></i>
                        <span>Expert Management</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/BeDev/admin/AdminDashboard">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Dashboard</span></a>
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
                            <div class="card-header py-3 row">
                                <h6 class="m-0 font-weight-bold text-primary col-md-8">List User </h6>
                                
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>UserId</th>    
                                                <th>Email</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listAccount}" var="a">
                                                <c:if test="${a.role.roleID!=1}">
                                                    <tr>
                                                    <td>${a.accountID}</td>
                                                    <td>${a.email}</td>
                                                    <td>${a.role.roleName}</td>
                                                    <td  onclick="changeStatus(${a.isStatus()}, '${a.accountID}', '${a.email}')">${a.isStatus()==true ? "<span class=\"badge badge-success\" data-toggle=\"modal\" data-target=\"#logoutModal\">Active</span>" : "<span class=\"badge badge-danger\" data-toggle=\"modal\" data-target=\"#logoutModal\">Inactive</span>"}</td>
                                                </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                        <h5 class="modal-title" id="header-status"></h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" id="modal-body-status"></div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn" id="btn-change-status" onclick="submitChangeStatus()"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Quiz</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" id="modal-body-delete"></div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-danger" onclick="deleteQuiz()">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <!-- Bootstrap core JavaScript-->
        <script src="/BeDev/view/dist/vendor/jquery/jquery.min.js"></script>
        <script src="/BeDev/view/dist/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                            let editor2;
                            var currentStatus, accountID;
                            function changeStatus(status, accountId, email) {
                                currentStatus = status;
                                accountID = accountId;
                                if (status) {
                                    $('#header-status').text("Inactive");
                                    $('#modal-body-status').text(`Do you want to inactive account ` + email);
                                    $('#btn-change-status').removeClass("btn-success").addClass("btn-danger").text("Inactive");
                                } else {
                                    $('#header-status').text("Active");
                                    $('#modal-body-status').text(`Do you want to active acoount ` + email);
                                    $('#btn-change-status').removeClass("btn-danger").addClass("btn-success").text("Active");
                                }
                            }

                            function submitChangeStatus() {
                                $.post("/BeDev/admin/ChangeStatusAccount", {accountID: accountID}, (response) => {
                                    $('#logoutModal').modal('toggle');
                                    if (response == "success") {
                                        showMessage(response, "Change status successfully", true);
                                    } else {
                                        showMessage(response, "Change status failed", false);
                                    }
                                });
                            }


                            function changeInfoModalDelete(quizId, quizName) {
                                quizID = quizId;;
                                $('#modal-body-delete').text(`Do you want to delete quiz ` + quizName);
                            }

                            function showMessage(status, message, reload) {
                                swal({
                                    title: status == "success" ? "Success" : "Error",
                                    text: message,
                                    icon: status == "success" ? "success" : "error",
                                    button: "OK",
                                    allowOutsideClick: false,
                                    allowEscapeKey: false,
                                    allowEnterKey: false
                                }).then(function () {
                                    if (reload) {
                                        if (status == "success") {
                                            window.location.reload();
                                        }
                                    }
                                });
                            }
                            
                            


        </script>
    </body>

</html>
