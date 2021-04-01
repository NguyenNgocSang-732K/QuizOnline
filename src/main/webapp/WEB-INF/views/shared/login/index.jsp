<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
<meta name="robots" content="noindex">

<!-- Simplebar -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/vendor/simplebar.css"
	rel="stylesheet">

<!-- Material Design Icons  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Roboto Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en"
	rel="stylesheet">

<!-- MDK -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/vendor/material-design-kit.css"
	rel="stylesheet">

<!-- Sidebar Collapse -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/vendor/sidebar-collapse.min.css"
	rel="stylesheet">

<!-- App CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/user/assets/css/style.css" rel="stylesheet">


</head>
<body class="login">
	<div class="row">
		<div class="col-sm-8 col-md-4 col-lg-4 mx-auto">
			<div class="text-center m-2">
				<div class="icon-block rounded-circle">
					<i class="material-icons align-middle md-36 text-muted">lock</i>
				</div>
			</div>
			<div class="card bg-transparent">
				<div class="card-header bg-white text-center">
					<h4 class="card-title">Login</h4>
					<p class="card-subtitle">Access your account</p>
				</div>
				<div class="card-body">
					<form
						action="${pageContext.request.contextPath }/securitylogin"
						method="post">
						<div class="form-group">
							<input type="text" name="username" class="form-control"
								placeholder="Username">
						</div>
						<div class="form-group">
							<input type="password" name="password" class="form-control"
								placeholder="Password">
						</div>
						<div class="form-group ">
							<button type="submit" class="btn  btn-primary btn-block">
								<span class="btn-block-text">Login</span>
							</button>
						</div>
						<div class="text-center">
							<a href="#"><small>Forgot Password?</small></a>
						</div>
					</form>
				</div>
				<div class="card-footer text-center bg-white">
					Not yet a student? <a href="${pageContext.request.contextPath }/account/register">Sign up</a>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/jquery.min.js"></script>

	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/bootstrap.min.js"></script>

	<!-- Simplebar -->
	<!-- Used for adding a custom scrollbar to the drawer -->
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/simplebar.js"></script>

	<!-- MDK -->
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/dom-factory.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/material-design-kit.js"></script>

	<!-- Sidebar Collapse -->
	<script src="${pageContext.request.contextPath}/resources/user/assets/vendor/sidebar-collapse.js"></script>

	<!-- App JS -->
	<script src="${pageContext.request.contextPath}/resources/user/assets/js/main.js"></script>

</body>
</html>