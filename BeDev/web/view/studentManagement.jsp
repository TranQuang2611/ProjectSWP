<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <div class="row">
                                    <div class="col-md-10">
                                        <h5 class="m-0 font-weight-bold text-primary">List student</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                            Add new student
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Student ID</th>
                                                <th>Name</th>
                                                <th>CashInWallet</th>
                                                <th>imageURL</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="student" items="${studentsList}">
                                                <tr>
                                                    <td>${student.studentID}</td>
                                                    <td>${student.name}</td>
                                                    <td>${student.cashInWallet}</td>
                                                    <td><img style="width: 200px; height: auto; border-radius: 20px;" src="${student.imageURL}"></td>
                                                    <td>
                                                        <a onclick="changeInfoModalEdit('${student.studentID}', '${student.name}', '${student.cashInWallet}', '${student.imageURL}')" 
                                                           data-toggle="modal" data-target="#editModal">Edit</a>
                                                        |
                                                        <a href="/BeDev/admin/beexpert?studentId=${student.studentID}">BeExpert</a>
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
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Add new Modal-->
        <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add new chapter</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="/BeDev/admin/addnewstudent" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                            </div>
                            <div class="form-group">
                                <label for="name">Student Name</label>
                                <input type="text" class="form-control" id="name" name="studentName" placeholder="Enter student name" required>
                            </div>
                            <div class="form-group">
                                <label for="cashInWallet">Cash In Wallet</label>
                                <input type="number" name="cashInWallet" class="form-control" id="cashInWallet" value="50000">
                            </div>
                            <div class="form-group">
                                <img id="playlist--img" style="width: 200px; height: auto; border-radius: 20px;" />
                            </div>
                            <div class="form-group">
                                <label for="file-upload123" class="custom-file-upload">
                                    <input id="file-upload123" type="file" name="file" required />
                                    <svg xmlns="http://www.w3.org/2000/svg" style="fill: #fff" width="24" height="24" viewBox="0 0 24 24"><path d="M19.479 10.092c-.212-3.951-3.473-7.092-7.479-7.092-4.005 0-7.267 3.141-7.479 7.092-2.57.463-4.521 2.706-4.521 5.408 0 3.037 2.463 5.5 5.5 5.5h13c3.037 0 5.5-2.463 5.5-5.5 0-2.702-1.951-4.945-4.521-5.408zm-7.479-1.092l4 4h-3v4h-2v-4h-3l4-4z" /></svg>
                                    Upload student image
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <p class="text-danger" id="addmess"></p>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

        <!-- Edit Modal-->
        <!-- The Modal -->
        <div class="modal fade" id="editModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit student</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="/BeDev/admin/editstudent" method="POST" enctype="multipart/form-data">
                            <input type="hidden" id="student-id" name="studentId">
                            <div class="form-group">
                                <label for="student-name">Student Name</label>
                                <input type="text" class="form-control" id="student-name" name="studentName" placeholder="Enter student name" required>
                            </div>
                            <div class="form-group">
                                <label for="cashInWallet2">Cash In Wallet</label>
                                <input type="number" name="cashInWallet2" class="form-control" id="cashInWallet2">
                            </div>
                            <div class="form-group">
                                <img id="playlist--img2" style="width: 200px; height: auto; border-radius: 20px;" />
                            </div>
                            <div class="form-group">
                                <label for="file-upload123edit" class="custom-file-upload">
                                    <input id="file-upload123edit" type="file" name="file" />
                                    <svg xmlns="http://www.w3.org/2000/svg" style="fill: #fff" width="24" height="24" viewBox="0 0 24 24"><path d="M19.479 10.092c-.212-3.951-3.473-7.092-7.479-7.092-4.005 0-7.267 3.141-7.479 7.092-2.57.463-4.521 2.706-4.521 5.408 0 3.037 2.463 5.5 5.5 5.5h13c3.037 0 5.5-2.463 5.5-5.5 0-2.702-1.951-4.945-4.521-5.408zm-7.479-1.092l4 4h-3v4h-2v-4h-3l4-4z" /></svg>
                                    Upload course image
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
        <div class="alert alert-success alert-dismissible fade show" style="position: absolute; top: 100px; right: 20px; display: none"  role="alert" id="editSuccessAlert">
            Edit student successfully.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="alert alert-danger alert-dismissible fade show" style="position: absolute; top: 100px; right: 20px; display: none"  role="alert" id="editFailedAlert">
            Edit student failed.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="alert alert-success alert-dismissible fade show" style="position: absolute; top: 100px; right: 20px; display: none"  role="alert" id="addChapterSuccessAlert">
            Add student successfully.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="alert alert-danger alert-dismissible fade show" style="position: absolute; top: 100px; right: 20px; display: none"  role="alert" id="addChapterFailedAlert">
            Add student failed.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
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
        <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>

        <%@include file="footer.jsp" %>
        <script>
                                                            function changeInfoModalEdit(studentId, studenName, cash, image) {
                                                                $('#student-id').val(studentId)
                                                                $('#student-name').val(studenName)
                                                                $('#cashInWallet2').val(cash)
                                                                $('#playlist--img2').attr("src", image);
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

                                                            function openAddStudentFailedAlert() {

                                                                $('#addStudentSuccessAlert').hide();
                                                                $('#addStudentFailedAlert').show();
                                                                setTimeout(() => {
                                                                    $('#addStudentFailedAlert').hide();
                                                                }, 2500);
                                                            }

                                                            function openAddStudentSuccessAlert() {

                                                                $('#addStudentFailedAlert').hide();
                                                                $('#addStudentSuccessAlert').show();
                                                                setTimeout(() => {
                                                                    $('#addStudentSuccessAlert').hide();
                                                                }, 2500);
                                                            }

                                                            function openEditStudentFailedAlert() {

                                                                $('#editSuccessAlert').hide();
                                                                $('#editFailedAlert').show();
                                                                setTimeout(() => {
                                                                    $('#editFailedAlert').hide();
                                                                }, 2500);
                                                            }

                                                            function openEditStudentSuccessAlert() {

                                                                $('#editFailedAlert').hide();
                                                                $('#editSuccessAlert').show();
                                                                setTimeout(() => {
                                                                    $('#editSuccessAlert').hide();
                                                                }, 2500);
                                                            }
                                                            $('#file-upload123').change(() => {
                                                                var img = $('#file-upload123')["0"].files["0"]
                                                                $("#playlist--img").attr("src", URL.createObjectURL(img));
                                                            });
                                                            $('#file-upload123edit').change(() => {
                                                                var img = $('#file-upload123edit')["0"].files["0"]
                                                                $("#playlist--img2").attr("src", URL.createObjectURL(img));
                                                            });
                                                            $(document).ready(function () {
            ${addStudent == null ? "" : addStudent == "success" ? "openAddStudentSuccessAlert()" : addCourse == "failed" ? "openAddStudentFailedAlert()" : ""}
            ${editStudent == null ? "" : editStudent == "success" ? "openEditStudentSuccessAlert()" : editCourse == "failed" ? "openEditStudentFailedAlert()" : ""}
                                                            });
        </script>
    </body>
</html>