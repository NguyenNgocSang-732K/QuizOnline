<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ attribute name="title" type="java.lang.String" required="true"
	rtexprvalue="true"%>
<%@ attribute name="content" fragment="true"%>

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
<link type="text/css" href="assets/vendor/simplebar.css"
	rel="stylesheet">

<!-- Material Design Icons  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Roboto Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en"
	rel="stylesheet">

<!-- MDK -->
<link type="text/css" href="assets/vendor/material-design-kit.css"
	rel="stylesheet">

<!-- Sidebar Collapse -->
<link type="text/css" href="assets/vendor/sidebar-collapse.min.css"
	rel="stylesheet">

<!-- App CSS -->
<link type="text/css" href="assets/css/style.css" rel="stylesheet">





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
			<a href="instructor-dashboard.html" class="navbar-brand"><i
				class="material-icons">school</i> LearnPlus</a>

			<div class="navbar-spacer"></div>

			<!-- Menu -->
			<ul class="nav navbar-nav">
				<!-- User dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link active dropdown-toggle" data-toggle="dropdown"
					href="#" role="button"><img
						src="assets/images/people/50/guy-6.jpg" alt="Avatar"
						class="rounded-circle" width="40"></a>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" href="instructor-account-edit.html">
							<i class="material-icons">edit</i> Profile
						</a> <a class="dropdown-item" href="instructor-profile.html"> <i
							class="material-icons">person</i> Profile Details
						</a> <a class="dropdown-item" href="guest-login.html"> <i
							class="material-icons">lock</i> Logout
						</a>
					</div></li>
				<!-- // END User dropdown -->
			</ul>
		</nav>
		<!-- // END Navbar -->

		<div class="mdk-drawer-layout js-mdk-drawer-layout flex"
			data-fullbleed data-push data-has-scrolling-region>

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
									class="sidebar-menu-button" href="instructor-dashboard.html">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i>
										Instructor
								</a></li>
							</ul>
							<div class="sidebar-heading">Instructor</div>
							<ul class="sidebar-menu">
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button" href="instructor-statement.html">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">receipt</i>
										student management
								</a></li>
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button" href="instructor-courses.html">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i>
										Course Manager
								</a></li>
								<li class="sidebar-menu-item"><a
									class="sidebar-menu-button" href="instructor-quizzes.html">
										<i
										class="sidebar-menu-icon sidebar-menu-icon--left material-icons">help</i>
										Quiz Manager
								</a></li>
							</ul>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- jQuery -->
	<script src="assets/vendor/jquery.min.js"></script>

	<!-- Bootstrap -->
	<script src="assets/vendor/popper.min.js"></script>
	<script src="assets/vendor/bootstrap.min.js"></script>

	<!-- Simplebar -->
	<!-- Used for adding a custom scrollbar to the drawer -->
	<script src="assets/vendor/simplebar.js"></script>

	<!-- MDK -->
	<script src="assets/vendor/dom-factory.js"></script>
	<script src="assets/vendor/material-design-kit.js"></script>

	<!-- Sidebar Collapse -->
	<script src="assets/vendor/sidebar-collapse.js"></script>

	<!-- App JS -->
	<script src="assets/js/main.js"></script>

</body>


<!-- Mirrored from learnplus.frontendmatter.com/instructor-account-edit.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Jun 2018 08:40:59 GMT -->

</html>
