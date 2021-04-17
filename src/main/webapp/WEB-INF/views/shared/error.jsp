<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/error/404-notfound.css">
</head>
<body>
	<section class="page_404">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 ">
					<div class="col-sm-10 col-sm-offset-1  text-center">
						<div class="four_zero_four_bg">
							<h1 class="text-center ">${content}</h1>
						</div>

						<div class="contant_box_404">
							<h3 class="h2">Look like you're lost</h3>

							<p>the page you are looking for not avaible!</p>

							<a href="${pageContext.request.contextPath}/dashboard" class="link_404">Go to Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>