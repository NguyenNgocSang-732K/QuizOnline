<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ attribute name="title" type="java.lang.String" required="true"
	rtexprvalue="true"%>
<%@ attribute name="content" fragment="true"%>
<%@ taglib prefix="auth"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="mytag" uri="mytag" %>

<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from learnplus.frontendmatter.com/instructor-account-edit.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Jun 2018 08:40:58 GMT -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${title }</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Simplebar -->
    <link type="text/css"
          href="${pageContext.request.contextPath}/resources/admin/assets/vendor/simplebar.css"
          rel="stylesheet">

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<!-- Material Design Icons  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Material Design Components  -->
<link
	href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css"
	rel="stylesheet">

<!-- Roboto Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en"
	rel="stylesheet">

    <!-- RichText Editor -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/richtext.min.css">

    <!-- Common Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/common/css/constant.css">

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
          
    <link href="${pageContext.request.contextPath}/resources/admin/account/manageExam.css"
         rel="stylesheet">
         
    <link href="${pageContext.request.contextPath}/resources/admin/account/manageSubject.css"
		 rel="stylesheet">
  	<link rel="stylesheet"
       href="${pageContext.request.contextPath}/resources/admin/account/manageQuestion.css">
       
       
<link rel="stylesheet"
       href="${pageContext.request.contextPath}/resources/admin/account/FreeStyle.css">
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
			<a href="${pageContext.request.contextPath}/dashboard"
				class="navbar-brand"><i class="material-icons">school</i>
				LearnPlus</a>

			<div class="navbar-spacer"></div>

        <!-- Menu -->
        <ul class="nav navbar-nav">
            <!-- User dropdown -->
            <li class="nav-item dropdown"><a
                    class="nav-link active dropdown-toggle" data-toggle="dropdown"
                    href="#" role="button"><img
                    src="${pageContext.request.contextPath}/images/<auth:authentication property="principal.photo" />"
                    alt="Avatar" class="rounded-circle" width="50" height="50"></a>
                <div class="dropdown-menu dropdown-menu-right">
                
                <auth:authorize access="hasRole('ROLE_Admin')">
                    <a class="dropdown-item"
                       href="${pageContext.request.contextPath }/profile/<auth:authentication property="principal.id" />">
                        <i class="material-icons">person</i> Profile
                    </a> 
                </auth:authorize>
                
                <auth:authorize access="hasRole('ROLE_Student')">
                    <a class="dropdown-item" 
                    	href="${pageContext.request.contextPath }/profile/<auth:authentication property="principal.id" />"> <i
                        class="material-icons">person</i> Profile
                	</a> 
                </auth:authorize>

	                <a class="dropdown-item" href="${pageContext.request.contextPath }/logout"> <i
	                        class="material-icons">lock</i> Logout
	                </a>
                </div>
            </li>
            <!-- // END User dropdown -->
        </ul>
    </nav>
    <!-- // END Navbar -->

		<div class="mdk-drawer-layout js-mdk-drawer-layout flex" data-fullbleed data-push data-has-scrolling-region>
				<jsp:invoke fragment="content"></jsp:invoke>
			<div class="mdk-drawer js-mdk-drawer" id="default-drawer">
				<div class="mdk-drawer__content ">
					<div
						class="sidebar sidebar-left sidebar-light sidebar-transparent-sm-up o-hidden">
						<div class="sidebar-p-y" data-simplebar
							data-simplebar-force-enabled="true">
							<div class="sidebar-heading">APPLICATIONS</div>
							<ul class="sidebar-menu">
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button" href="${pageContext.request.contextPath }/dashboard">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i>
										Dashboard
								</a></li>
							</ul>
							<div class="sidebar-heading">Management</div>
							<ul class="sidebar-menu">	
							<auth:authorize access="hasRole('ROLE_Student')">	
							 <li class="sidebar-menu-item">
									<a class="sidebar-menu-button" 
										href="${pageContext.request.contextPath }/student/TakeAQuiz">
										<i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i> Take a Quiz
									</a>
								</li>
								 <li class="sidebar-menu-item">
									<a class="sidebar-menu-button" 
										href="${pageContext.request.contextPath }/student/HistoryExam">
										<i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i> History Quiz
									</a>
								</li>
							 </auth:authorize>			
							 <auth:authorize access="hasRole('ROLE_Admin')">	
							 <li class="sidebar-menu-item"><a
									class="sidebar-menu-button"
									href="${pageContext.request.contextPath}/admin/questions">
										<i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">help</i>
										Questions
								</a></li>
								<li class="sidebar-menu-item"><a
										class="sidebar-menu-button"
										href="${pageContext.request.contextPath}/admin/subjects">
									<i
											class="sidebar-menu-icon sidebar-menu-icon--left material-icons">help</i>
									Subjects
								</a></li>
								<li class="sidebar-menu-item"><a
										class="sidebar-menu-button"
										href="${pageContext.request.contextPath}/admin/levels">
									<i
											class="sidebar-menu-icon sidebar-menu-icon--left material-icons">help</i>
									Levels
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <mytag:answer button="Add"/>
	<mytag:answer button="Edit"/>
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

<!-- RichText Editor -->
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/js/richtext.js"></script>

<!-- Simple Pagination  -->
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/simplePagination.js"></script>
</body>

<!-- Font Awesome  -->
<script src="https://kit.fontawesome.com/b48db25390.js" crossorigin="anonymous"></script>

<!-- App JS -->
<script
        src="${pageContext.request.contextPath}/resources/admin/assets/js/main.js"></script>

<!-- Pagination Common -->
<script
        src="${pageContext.request.contextPath}/resources/common/js/pagination.js"></script>

<%--Manager Question--%>
<script
        src="${pageContext.request.contextPath}/resources/admin/account/manageQuestion.js"></script>

<%--Manager Answer--%>
<script
		src="${pageContext.request.contextPath}/resources/admin/account/manageAnswer.js"></script>

<script
		src="${pageContext.request.contextPath}/resources/admin/account/manageLevel.js"></script>

<script
		src="${pageContext.request.contextPath}/resources/common/js/general.js"></script>

<%--Upload Image--%>
<script
		src="${pageContext.request.contextPath}/resources/common/js/uploadImage.js"></script>
</html>