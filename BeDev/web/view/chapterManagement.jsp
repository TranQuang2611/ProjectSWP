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
                    <a class="nav-link" href="/BeDev/expert/course">
                        <i class="fa-solid fa-book-open"></i>
                        <span>Course Manage</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/BeDev/expert/ExpertDashboard">
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
                            <div class="card-header py-3">
                                <div class="row">
                                    <div class="col-md-10">
                                        <h5 class="m-0 font-weight-bold text-primary">List chapter</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                            Add new chapter
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Chapter ID</th>
                                                <th>Name</th>
                                                <th>Course Name</th>
                                                <th>Position</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                                <th>Management</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="chapter" items="${chaptersList}">
                                                <tr>
                                                    <td>${chapter.chapterID}</td>
                                                    <td>${chapter.chapterName}</td>
                                                    <td>${chapter.course.courseName}</td>
                                                    <td>${chapter.position}</td>
                                                    <td id="chapter-status-${chapter.chapterID}" onclick="changeStatus(${chapter.status}, '${chapter.chapterID}', '${chapter.chapterName}')">${chapter.status ==true ? "<span class=\"badge badge-success\" data-toggle=\"modal\" data-target=\"#logoutModal\">Active</span>" : "<span class=\"badge badge-danger\" data-toggle=\"modal\" data-target=\"#logoutModal\">Inactive</span>"}</td>
                                                    <td>
                                                        <a onclick="changeInfoModalEdit('${chapter.chapterID}', '${chapter.chapterName}', ${chapter.position}, ${chapter.status})" 
                                                           data-toggle="modal" data-target="#editModal">Edit</a>
                                                        |
                                                        <a onclick="changeInfoModalDelete('${chapter.chapterID}', '${chapter.chapterName}')" data-toggle="modal" data-target="#deleteModal">Delete</a>

                                                    </td>
                                                    <td>
                                                        <div><a href="/BeDev/expert/lesson?chapterId=${chapter.chapterID}">Lesson</a></div>
                                                        <div><a href="/BeDev/expert/ManageQuiz?chapterId=${chapter.chapterID}">Quiz</a></div>
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
                        <h5 class="modal-title">Delete Chapter</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" id="modal-body-delete"></div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-danger" onclick="deleteChapter()" id="delete-chapter-id">Delete</a>
                    </div>
                </div>
            </div>
        </div>

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
                        <form action="/BeDev/expert/addnewchapter" method="POST">
                            <input type="hidden" id="course-id" name="courseId" value="${courseId}">
                            <div class="form-group">
                                <label for="name">Chapter Name</label>
                                <input type="text" class="form-control" id="name" name="chapterName" placeholder="Enter chapter name" required>
                            </div>
                            <div class="form-group">
                                <label for="position">Position</label>
                                <input type="number" name="position" class="form-control" id="position" value="1" min="1">
                            </div>
                            <div class="form-check">
                                <input type="checkbox" name="status" class="form-check-input" id="exampleCheck1" value="active" checked>
                                <label class="form-check-label" for="exampleCheck1">Active</label>
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
                        <h4 class="modal-title">Edit chapter</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="/BeDev/expert/editchapter" method="POST">
                            <input type="hidden" id="course-id" name="courseId" value="${courseId}">
                            <input type="hidden" id="chapter-id" name="chapterId">
                            <div class="form-group">
                                <label for="chapter-name">Chapter Name</label>
                                <input type="text" class="form-control" id="chapter-name" name="chapterName" placeholder="Enter chapter name" required>
                            </div>
                            <div class="form-group">
                                <label for="position">Position</label>
                                <input type="number" name="position" class="form-control" id="chapter-position" min="1">
                            </div>
                            <div class="form-check">
                                <input type="checkbox" name="status" class="form-check-input" id="chapter-status" value="active" checked>
                                <label class="form-check-label" for="chapter-status">Active</label>
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
            Edit chapter successfully.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="alert alert-danger alert-dismissible fade show" style="position: absolute; top: 100px; right: 20px; display: none"  role="alert" id="editFailedAlert">
            Edit chapter failed.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="alert alert-success alert-dismissible fade show" style="position: absolute; top: 100px; right: 20px; display: none"  role="alert" id="addChapterSuccessAlert">
            Add chapter successfully.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="alert alert-danger alert-dismissible fade show" style="position: absolute; top: 100px; right: 20px; display: none"  role="alert" id="addChapterFailedAlert">
            Add chapter failed.
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
                            var currentStatus, chapterID;
                            function changeStatus(status, chapterId, chapterName) {
                                currentStatus = status;
                                chapterID = chapterId;
                                if (status) {
                                    $('#header-status').text("Inactive");
                                    $('#modal-body-status').text(`Do you want to inactive chapter ` + chapterName);
                                    $('#btn-change-status').removeClass("btn-success").addClass("btn-danger").text("Inactive");
                                } else {
                                    $('#header-status').text("Active");
                                    $('#modal-body-status').text(`Do you want to active chapter ` + chapterName);
                                    $('#btn-change-status').removeClass("btn-danger").addClass("btn-success").text("Active");
                                }
                            }
                            function submitChangeStatus() {
                                $.post("/BeDev/expert/changechapterstatus", {chapterId: chapterID, status: currentStatus}, (response) => {
                                    $('#logoutModal').modal('toggle');
                                    if (response == "success") {
                                        showMessage(response, "Change status successfully", true);
                                    } else {
                                        showMessage(response, "Change status failed", false);
                                    }
                                });
                            }

                            function changeInfoModalEdit(chapterId, chapterName, position, status) {
                                $('#chapter-id').val(chapterId)
                                $('#chapter-name').val(chapterName)
                                $('#chapter-position').val(position)
                                $('#chapter-status').prop('checked', status);
                            }

                            function changeInfoModalDelete(chapterId, courseName) {
                                chapterID = chapterId;
                                $('#modal-body-delete').text(`Do you want to delete chapter ` + courseName);
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
                            function deleteChapter() {
                                $.ajax({
                                    url: '/BeDev/expert/deletechapter?chapterId=' + chapterID,
                                    type: 'POST',
                                    success: function (result) {
                                        if (result == 'success') {
                                            showMessage(result, "Delete chapter successfully", true);
                                        } else {
                                            showMessage(result, result, false);
                                        }
                                    }
                                });
                            }

                            function openAddChapterFailedAlert() {

                                $('#addChapterSuccessAlert').hide();
                                $('#addChapterFailedAlert').show();
                                setTimeout(() => {
                                    $('#addChapterFailedAlert').hide();
                                }, 2500);
                            }

                            function openAddChapterSuccessAlert() {

                                $('#addChapterFailedAlert').hide();
                                $('#addChapterSuccessAlert').show();
                                setTimeout(() => {
                                    $('#addChapterSuccessAlert').hide();
                                }, 2500);
                            }

                            function openEditChapterFailedAlert() {

                                $('#editSuccessAlert').hide();
                                $('#editFailedAlert').show();
                                setTimeout(() => {
                                    $('#editFailedAlert').hide();
                                }, 2500);
                            }

                            function openEditChapterSuccessAlert() {

                                $('#editFailedAlert').hide();
                                $('#editSuccessAlert').show();
                                setTimeout(() => {
                                    $('#editSuccessAlert').hide();
                                }, 2500);
                            }
                            $(document).ready(function () {
            ${addChapter == null ? "" : addChapter == "success" ? "openAddChapterSuccessAlert()" : addChapter == "failed" ? "openAddChapterFailedAlert()" : ""}
            ${editChapter == null ? "" : editChapter == "success" ? "openEditChapterSuccessAlert()" : editChapter == "failed" ? "openEditChapterFailedAlert()" : ""}
                            });
        </script>
    </body>
</html>