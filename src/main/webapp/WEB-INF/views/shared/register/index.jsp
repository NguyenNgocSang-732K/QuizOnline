<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>

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
<body class="login">

	<div class="row">
		<div class="col-sm-8 col-md-4 col-lg-4 mx-auto">
			<div class="text-center m-2">
				<div class="icon-block rounded-circle">
					<i class="material-icons align-middle md-36 text-muted">edit</i>
				</div>
			</div>
			<div class="card">
				<div class="card-header bg-white text-center">
					<h4 class="card-title">Sign Up</h4>
					<p class="card-subtitle">Create a new account</p>
				</div>
				<div class="card-body">
					<form
						action="${pageContext.request.contextPath }/dashboard/index"
						method="get">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Full Name">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="Email">
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								placeholder="Password">
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								placeholder="Confirm Password">
						</div>
						<div class="form-group text-center">
							<label class="custom-control custom-checkbox m-0"> <input
								type="checkbox" class="custom-control-input" checked> <span
								class="custom-control-indicator"></span> I agree to the&nbsp;<a
								href="#">Terms of Use</a>
							</label>
						</div>
						<p class="text-center">
							<button type="submit" class="btn btn-primary btn-block">
								<span class="btn-block-text">Sign Up</span>
							</button>
						</p>
						<div class="text-center">
							Already signed up? <a href="${pageContext.request.contextPath }/account/login">Log in</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="assets/vendor/jquery.min.js"></script>

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

</body>
</html>