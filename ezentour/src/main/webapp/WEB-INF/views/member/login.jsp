<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>EzenTour</title>
<!-- Favicon -->
<link rel="icon" href="${path}/resources/img/core-img/favicon.png">
<!-- Stylesheet -->
<link rel="stylesheet" href="${path}/resources/style.css">
</head>
<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<!-- /Preloader -->

	<%@ include file="../include/menu.jsp"%>
	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcrumb-content text-center">
						<h2 class="page-title">Login</h2>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}/">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Login</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->

	<!-- Newsletter -->
	<br>
	<center>
	<div style="width:400px;">
		<div class="newsletter-form">			
			<form action="#" method="post">
				<input type="text" name="m_id" id="nlEmail" class="form-control" placeholder="Enter your ID...">
				<input type="password" name="m_password" id="nlEmail" class="form-control" placeholder="Enter your Password...">
				<button type="submit" class="btn roberto-btn w-100">Login</button>
			</form>
		</div>
	</div>
	</center>
	<br>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>