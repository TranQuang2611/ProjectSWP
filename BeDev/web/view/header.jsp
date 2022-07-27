<%-- 
    Document   : header
    Created on : May 18, 2022, 10:13:43 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="loader">
    <span class="loader-spinner">Loading...</span>
</div>
<!-- Header Starts Here -->
<header>
    <style>
        .dropbtn {
            background-color: #1089FF;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {background-color: #ddd;}

        .dropdown:hover .dropdown-content {display: block;}

        /*        .dropdown:hover .dropbtn {background-color: #3e8e41;}*/
    </style>
    <nav class="navbar navbar-expand-xl navbar-light bg-transparent">
        <div class="container">
            <!-- Logo -->
            <a class="navbar-brand" href="HomeControl">
                <img src="/BeDev/view/dist/images/logo/logo.png" alt="Logo" class="img-fluid" />
            </a>
            <button class="menu-icon-container">
                <span class="menu-icon"></span>
            </button>
            <!-- Navbar Item -->
            <div class="collapse navbar-collapse d-none d-xl-block d-none d-xl-block" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/BeDev/HomeControl">
                            Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/BeDev/CourseList">
                            Course
                        </a>
                    </li>
                    `
                    <c:if test="${sessionScope.account!=null && sessionScope.admin!=null}">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/BeDev/admin/AdminDashboard">Admin Dashboard</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account!=null && sessionScope.expert!=null}">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/BeDev/expert/ExpertDashboard">Expert Dashboard</a>
                        </li>
                    </c:if>
                </ul>
                <div class="d-flex align-items-center justify-content-between rightContent">
                    <form class="header__Search-form" id="searchForm">
                        <button type="button" class="border-0 bg-transparent header__Search-button" onclick="openSearch()">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <circle cx="9.19522" cy="9.19518" r="7.61714" stroke="#35343E" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></circle>
                                <path d="M15.0493 15.4866L18.3493 18.778" stroke="#35343E" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
                            </svg>
                        </button>
                        <div id="myOverlay" class="overlay">
                            <span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
                            <div class="overlay-content">
                                <div>
                                    <input type="text" placeholder="Search.." name="search" />
                                    <button type="button">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="24"
                                            height="24"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            stroke="#ffff"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            class="feather feather-search"
                                            >
                                            <circle cx="11" cy="11" r="8"></circle>
                                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <c:if test="${sessionScope.account==null}">
                        <a href="/BeDev/SignIn" class="button button--text">Sign in</a>
                        <a href="/BeDev/SignUp" class="button button--dark">Sign Up</a>
                    </c:if>
                    <c:if test="${sessionScope.account!=null && sessionScope.student!=null}">
                        <div class="dropdown">
                            <button class="dropbtn" type="button" >
                                ${sessionScope.student.name}
                            </button>
                            <div class="dropdown-content" >
                                <a class="dropdown-item" href="/BeDev/Profile">My Profile</a>
                                <a class="dropdown-item" href="/BeDev/ChangePassword">Change password</a>
                                <a class="dropdown-item" href="/BeDev/LogOut">Logout</a>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account!=null && sessionScope.expert!=null}">
                        <div class="dropdown">
                            <button class="dropbtn" type="button" >
                                ${sessionScope.expert.expertName}
                            </button>
                            <div class="dropdown-content" >
                                <a class="dropdown-item" href="/BeDev/Profile">My Profile</a>
                                <a class="dropdown-item" href="/BeDev/ChangePassword">Change password</a>
                                <a class="dropdown-item" href="/BeDev/LogOut">Logout</a>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account!=null && sessionScope.admin!=null}">
                        <div class="dropdown">
                            <button class="dropbtn" type="button" >
                                ${sessionScope.admin.name}
                            </button>
                            <div class="dropdown-content" >
                                <a class="dropdown-item" href="/BeDev/Profile">My Profile</a>
                                <a class="dropdown-item" href="/BeDev/ChangePassword">Change password</a>
                                <a class="dropdown-item" href="/BeDev/LogOut">Logout</a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>

            <div class="navbar-mobile">
                <div>
                    <div class="navbar-mobile__top">
                        <a href="index.html">
                            <img src="../BeDev/view/dist/images/logo/logo.png" alt="Logo" class="img-fluid" />
                        </a>
                        <div>
                            <button class="navbar-mobile--cross">
                                <svg width="20" height="19" viewBox="0 0 20 19" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M14.5967 4.59668L5.40429 13.7891" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                    <path d="M5.40332 4.59668L14.5957 13.7891" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="navbar-mobile__menu">
                        <ul class="navbar-mobile__menu-list">
                            <li class="navbar-mobile__menu-item">
                                <a href="HomeControl">
                                    <span class="navbar-mobile__menu-link"> Home </span>
                                </a>
                            </li>
                            <li class="navbar-mobile__menu-item">
                                <a href="CourseSearch">
                                    <span class="navbar-mobile__menu-link"> Courses </span>
                                </a>
                            </li>
                            <li class="navbar-mobile__menu-item">
                                <a href="about.html">
                                    <span class="navbar-mobile__menu-link"> About </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
