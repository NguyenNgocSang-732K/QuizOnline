<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>
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
					<s-form:form action="${pageContext.request.contextPath }/signup"
						class="form-horizontal" method="POST" modelAttribute="account"
						enctype="multipart/form-data">
						<div class="form-group">
							<s-form:input path="fullname" cssClass="form-control"
								placeholder="Full Name" />
						</div>
						<div class="form-group">
							<s-form:input path="email" cssClass="form-control"
								placeholder="Email" type="email" />
						</div>
						<div class="form-group">
							<s-form:input path="username" cssClass="form-control"
								placeholder="Username" />
						</div>
						<div class="form-group">
							<s-form:input path="password" cssClass="form-control"
								placeholder="Password" type="password" />
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								placeholder="Confirm Password">
						</div>
						<p class="text-center">
							<button type="submit" class="btn btn-primary btn-block">
								<span class="btn-block-text">Sign Up</span>
							</button>
						</p>
						<div class="text-center">
							Already signed up? <a
								href="${pageContext.request.contextPath }/login">Log
								in</a>
						</div>
					</s-form:form>
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