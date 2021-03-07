<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ attribute name="title" type="java.lang.String" required="true"
	rtexprvalue="true"%>
<%@ attribute name="content" fragment="true"%>


<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<title>Flower Shop</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/user/css/style.css" />
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

</head>
<body>

	<div id="wrap">

		<div class="header">
			<div class="logo">
				<a href="index.html"> <img
					src="${pageContext.request.contextPath}/resources/user/images/logo.gif"
					alt="" title="" border="0" />
				</a>
			</div>
			<div id="menu">
				<ul>
					<li class="selected"><a
						href="${pageContext.request.contextPath}/user/home">home</a></li>
					<li><a href="${pageContext.request.contextPath}/user/aboutus">about
							us</a></li>
					<li><a href="${pageContext.request.contextPath}/user/flowers">flowers</a></li>
					<li><a
						href="${pageContext.request.contextPath}/user/specialgifts">specials
							gifts</a></li>
					<li><a
						href="${pageContext.request.contextPath}/user/myaccount">my
							accout</a></li>
					<li><a href="${pageContext.request.contextPath}/user/register">register</a></li>
					<li><a href="${pageContext.request.contextPath}/user/prices">prices</a></li>
					<li><a href="${pageContext.request.contextPath}/user/contact">contact</a></li>
				</ul>
			</div>


		</div>


		<div class="center_content">
			<div class="left_content">

				<jsp:invoke fragment="content"></jsp:invoke>

			</div>
			<!--end of left content-->

			<div class="right_content">
				<div class="languages_box">
					<span class="red">Languages:</span> <a href="#" class="selected">
						<img
						src="${pageContext.request.contextPath}/resources/user/images/gb.gif"
						alt="" title="" border="0" />
					</a> <a href="#"> <img
						src="${pageContext.request.contextPath}/resources/user/images/fr.gif"
						alt="" title="" border="0" />
					</a> <a href="#"> <img
						src="${pageContext.request.contextPath}/resources/user/images/de.gif"
						alt="" title="" border="0" />
					</a>
				</div>
				<div class="currency">
					<span class="red">Currency: </span> <a href="#">GBP</a> <a href="#">EUR</a>
					<a href="#" class="selected">USD</a>
				</div>


				<div class="cart">
					<div class="title">
						<span class="title_icon"> <img
							src="${pageContext.request.contextPath}/resources/user/images/cart.gif"
							alt="" title="" />
						</span>My cart
					</div>
					<div class="home_cart_content">
						3 x items | <span class="red">TOTAL: 100$</span>
					</div>
					<a href="cart.html" class="view_cart">view cart</a>

				</div>




				<div class="title">
					<span class="title_icon"> <img
						src="${pageContext.request.contextPath}/resources/user/images/bullet3.gif"
						alt="" title="" />
					</span>About Our Shop
				</div>
				<div class="about">
					<p>
						<img
							src="${pageContext.request.contextPath}/resources/user/images/about.gif"
							alt="" title="" class="right" /> Lorem ipsum dolor sit amet,
						consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
						labore et dolore magna aliqua. Ut enim ad minim veniam, quis
						nostrud.

					</p>

				</div>

				<div class="right_box">

					<div class="title">
						<span class="title_icon"> <img
							src="${pageContext.request.contextPath}/resources/user/images/bullet4.gif"
							alt="" title="" />
						</span>Promotions
					</div>
					<div class="new_prod_box">
						<a href="details.html">product name</a>
						<div class="new_prod_bg">
							<span class="new_icon"> <img
								src="${pageContext.request.contextPath}/resources/user/images/promo_icon.gif"
								alt="" title="" />
							</span> <a href="details.html"> <img
								src="${pageContext.request.contextPath}/resources/user/images/thumb1.gif"
								alt="" title="" class="thumb" border="0" />
							</a>
						</div>
					</div>

					<div class="new_prod_box">
						<a href="details.html">product name</a>
						<div class="new_prod_bg">
							<span class="new_icon"> <img
								src="${pageContext.request.contextPath}/resources/user/images/promo_icon.gif"
								alt="" title="" />
							</span> <a href="details.html"> <img
								src="${pageContext.request.contextPath}/resources/user/images/thumb2.gif"
								alt="" title="" class="thumb" border="0" />
							</a>
						</div>
					</div>

					<div class="new_prod_box">
						<a href="details.html">product name</a>
						<div class="new_prod_bg">
							<span class="new_icon"> <img
								src="${pageContext.request.contextPath}/resources/user/images/promo_icon.gif"
								alt="" title="" />
							</span> <a href="details.html"> <img
								src="${pageContext.request.contextPath}/resources/user/images/thumb3.gif"
								alt="" title="" class="thumb" border="0" />
							</a>
						</div>
					</div>

				</div>

				<div class="right_box">

					<div class="title">
						<span class="title_icon"> <img
							src="${pageContext.request.contextPath}/resources/user/images/bullet5.gif"
							alt="" title="" />
						</span>Categories
					</div>

					<ul class="list">
						<li><a href="#">accesories</a></li>
						<li><a href="#">flower gifts</a></li>
						<li><a href="#">specials</a></li>
						<li><a href="#">hollidays gifts</a></li>
						<li><a href="#">accesories</a></li>
						<li><a href="#">flower gifts</a></li>
						<li><a href="#">specials</a></li>
						<li><a href="#">hollidays gifts</a></li>
						<li><a href="#">accesories</a></li>
						<li><a href="#">flower gifts</a></li>
						<li><a href="#">specials</a></li>
					</ul>

					<div class="title">
						<span class="title_icon"> <img
							src="${pageContext.request.contextPath}/resources/user/images/bullet6.gif"
							alt="" title="" />
						</span>Partners
					</div>

					<ul class="list">
						<li><a href="#">accesories</a></li>
						<li><a href="#">flower gifts</a></li>
						<li><a href="#">specials</a></li>
						<li><a href="#">hollidays gifts</a></li>
						<li><a href="#">accesories</a></li>
						<li><a href="#">flower gifts</a></li>
						<li><a href="#">specials</a></li>
						<li><a href="#">hollidays gifts</a></li>
						<li><a href="#">accesories</a></li>
					</ul>

				</div>


			</div>
			<!--end of right content-->




			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<div class="footer">
			<div class="left_footer">
				<img
					src="${pageContext.request.contextPath}/resources/user/images/footer_logo.gif"
					alt="" title="" /><br /> <a
					href="http://csscreme.com/freecsstemplates/" title="free templates">
					<img
					src="${pageContext.request.contextPath}/resources/user/images/csscreme.gif"
					alt="free templates" title="free templates" border="0" />
				</a>
			</div>
			<div class="right_footer">
				<a href="#">home</a> <a href="#">about us</a> <a href="#">services</a>
				<a href="#">privacy policy</a> <a href="#">contact us</a>

			</div>


		</div>


	</div>

</body>
</html>
