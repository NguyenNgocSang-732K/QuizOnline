<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ attribute name="title" type="java.lang.String" required="true"
              rtexprvalue="true" %>
<%@ attribute name="content" fragment="true" %>

<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from learnplus.frontendmatter.com/instructor-account-edit.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Jun 2018 08:40:58 GMT -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Instructor - Edit account</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Simplebar -->
    <link type="text/css"
          href="${pageContext.request.contextPath}/resources/admin/assets/vendor/simplebar.css"
          rel="stylesheet">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
          crossorigin="anonymous">

    <!-- Material Design Icons  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">

    <!-- Material Design Components  -->
    <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">

    <!-- Roboto Web Font -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en"
            rel="stylesheet">

    <!-- MDK -->
    <link type="text/css"
          href="${pageContext.request.contextPath}/resources/admin/assets/vendor/material-design-kit.css"
          rel="stylesheet">

    <!-- Sidebar Collapse -->
    <link type="text/css"
          href="${pageContext.request.contextPath}/resources/admin/assets/vendor/sidebar-collapse.min.css"
          rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css"
          href="${pageContext.request.contextPath}/resources/admin/assets/css/style.css"
          rel="stylesheet">

<%--    Simple Pagination--%>
    <link href="${pageContext.request.contextPath}/resources/admin/assets/css/simplePagination.css"
          rel="stylesheet">
</head>

<body>

<div class="d-flex flex-column h-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand navbar-dark bg-primary m-0">

        <!-- Toggle sidebar -->
        <button class="navbar-toggler d-block" data-toggle="sidebar"
                type="button">
            <span class="material-icons">menu</span>
        </button>

        <!-- Brand -->
        <a href="${pageContext.request.contextPath}/dashboard/index"
           class="navbar-brand"><i class="material-icons">school</i>
            LearnPlus</a>

        <div class="navbar-spacer"></div>

        <!-- Menu -->
        <ul class="nav navbar-nav">
            <!-- User dropdown -->
            <li class="nav-item dropdown"><a
                    class="nav-link active dropdown-toggle" data-toggle="dropdown"
                    href="#" role="button"><img
                    src="${pageContext.request.contextPath}/resources/admin/assets/images/people/50/guy-6.jpg"
                    alt="Avatar" class="rounded-circle" width="40"></a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="instructor-account-edit.html">
                        <i class="material-icons">edit</i> Profile
                    </a> <a class="dropdown-item" href="instructor-profile.html"> <i
                        class="material-icons">person</i> Profile Details
                </a> <a class="dropdown-item" href="guest-login.html"> <i
                        class="material-icons">lock</i> Logout
                </a>
                </div>
            </li>
            <!-- // END User dropdown -->
        </ul>
    </nav>
    <!-- // END Navbar -->

    <div class="mdk-drawer-layout js-mdk-drawer-layout flex"
         data-fullbleed data-push data-has-scrolling-region>
        <div
                class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
            <jsp:invoke fragment="content"></jsp:invoke>
        </div>
        <div class="mdk-drawer js-mdk-drawer" id="default-drawer">
            <div class="mdk-drawer__content ">
                <div
                        class="sidebar sidebar-left sidebar-light sidebar-transparent-sm-up o-hidden">
                    <div class="sidebar-p-y" data-simplebar
                         data-simplebar-force-enabled="true">
                        <div class="sidebar-heading">APPLICATIONS</div>
                        <ul class="sidebar-menu">
                            <li class="sidebar-menu-item"><a
                                    class="sidebar-menu-button" href="instructor-dashboard.html">
                                <i
                                        class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i>
                                Instructor
                            </a></li>
                        </ul>
                        <div class="sidebar-heading">Management</div>
                        <ul class="sidebar-menu">
                            <li class="sidebar-menu-item"><a
                                    class="sidebar-menu-button" href="instructor-statement.html">
                                <i
                                        class="sidebar-menu-icon sidebar-menu-icon--left material-icons">receipt</i>
                                Students
                            </a></li>
                            <li class="sidebar-menu-item"><a
                                    class="sidebar-menu-button" href="instructor-courses.html">
                                <i
                                        class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i>
                                Courses
                            </a></li>
                            <li class="sidebar-menu-item"><a
                                    class="sidebar-menu-button"
                                    href="${pageContext.request.contextPath}/admin/questions">
                                <i
                                        class="sidebar-menu-icon sidebar-menu-icon--left material-icons">help</i>
                                Questions
                            </a></li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- jQuery -->
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery.min.js"></script>

<!-- Bootstrap -->
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/vendor/popper.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap.min.js"></script>

<!-- Simplebar -->
<!-- Used for adding a custom scrollbar to the drawer -->
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/vendor/simplebar.js"></script>

<!-- MDK -->
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/vendor/dom-factory.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/vendor/material-design-kit.js"></script>

<!-- Sidebar Collapse -->
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/vendor/sidebar-collapse.js"></script>
<!-- Simple Pagination  -->
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/simplePagination.js"></script>
</body>

<!-- App JS -->
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/js/main.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/common/js/pagination.js"></script>

<!-- Material Design Components  -->
<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>



<!-- Mirrored from learnplus.frontendmatter.com/instructor-account-edit.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Jun 2018 08:40:59 GMT -->

</html>
