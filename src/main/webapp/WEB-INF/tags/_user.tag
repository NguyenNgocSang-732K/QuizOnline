<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ attribute name="title" type="java.lang.String" required="true"
	rtexprvalue="true"%>
<%@ attribute name="content" fragment="true"%>


<!DOCTYPE html>
<html lang="en">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Mirrored from learnplus.frontendmatter.com/student-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Jun 2018 08:41:25 GMT -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Student - Dashboard</title>

<!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
<meta name="robots" content="noindex">

<!-- Simplebar -->
<link type="text/css"
	href="${pageContext.request.contextPath}/resources/user/assets/vendor/simplebar.css"
	rel="stylesheet">

<!-- Material Design Icons  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Roboto Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en"
	rel="stylesheet">

<!-- MDK -->
<link type="text/css"
	href="${pageContext.request.contextPath}/resources/user/assets/vendor/material-design-kit.css"
	rel="stylesheet">

<!-- Sidebar Collapse -->
<link type="text/css"
	href="${pageContext.request.contextPath}/resources/user/assets/vendor/sidebar-collapse.min.css"
	rel="stylesheet">

<!-- App CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/resources/user/assets/css/style.css"
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
			<a href="${pageContext.request.contextPath }/dashboard/index"
				class="navbar-brand"><i class="material-icons">school</i>
				LearnPlus</a>
			<div class="navbar-spacer"></div>
			<ul class="nav navbar-nav">

				<!-- User dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link active dropdown-toggle" data-toggle="dropdown"
					href="#" role="button"><img
						src="assets/images/people/50/guy-6.jpg" alt="Avatar"
						class="rounded-circle" width="40"></a>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath }/account/index"> <i
							class="material-icons">edit</i> Profile
						</a> <a class="dropdown-item"
							href="${pageContext.request.contextPath }/profile/index"> <i
							class="material-icons">person</i> Profile Details
						</a> <a class="dropdown-item"
							href="${pageContext.request.contextPath}/resources/user/account/login">
							<i class="material-icons">lock</i> Logout
						</a>
					</div></li>
				<!-- // END User dropdown -->
			</ul>
			<!-- // END Menu -->
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
								<li class="sidebar-menu-item active"><a
									class="sidebar-menu-button"
									href="${pageContext.request.contextPath }/dashboard/index">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">account_box</i>
										Student
								</a></li>
							</ul>
							<div class="sidebar-heading">Student</div>
							<ul class="sidebar-menu">
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button"
									href="${pageContext.request.contextPath }/browseCourses/index">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">search</i>
										Browse Courses
								</a></li>
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button"
									href="${pageContext.request.contextPath }/takeCourse/index">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">class</i>
										Take Course

								</a></li>
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button"
									href="${pageContext.request.contextPath }/takeQuiz/index">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dvr</i>
										Take a Quiz
								</a></li>
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button"
									href="${pageContext.request.contextPath }/quizResults/index">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">poll</i>
										Quiz Results
								</a></li>
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button"
									href="${pageContext.request.contextPath }/myCourses/index">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i>
										My Courses
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
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/jquery.min.js"></script>

	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/bootstrap.min.js"></script>

	<!-- Simplebar -->
	<!-- Used for adding a custom scrollbar to the drawer -->
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/simplebar.js"></script>

	<!-- MDK -->
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/dom-factory.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/material-design-kit.js"></script>

	<!-- Sidebar Collapse -->
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/sidebar-collapse.js"></script>

	<!-- App JS -->
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/js/main.js"></script>

	<!-- Required by countdown -->
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/moment.min.js"></script>
	<!-- Easy Countdown -->
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/vendor/jquery.countdown.min.js"></script>

	<!-- Init -->
	<script
		src="${pageContext.request.contextPath}/resources/user/assets/js/countdown.js"></script>

</body>
</html>
