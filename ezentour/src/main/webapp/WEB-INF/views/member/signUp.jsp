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
<style>
label.custom-radio-button input[type="radio"] {
    opacity:0;
}
 
label.custom-radio-button input[type="radio"] ~ .helping-el {
    background-color: #FFFFFF;
    border: 2px solid #009688;  
    border-radius: 50%;
    display: inline-block;
    margin-right: 7px;
    padding: 11px;
    position: relative;
    top: 3px;
}
 
label.custom-radio-button input[type="radio"]:checked ~ .helping-el {
    border: 2px solid #009688;
}
 
label.custom-radio-button input[type="radio"]:checked ~ .helping-el:after {
    background-color: #009688;
    border-radius: 50%;
    content: " ";
    font-size: 33px;
    height: 16px;
    left: 3px;
    position: absolute;
    top: 3px;
    width: 16px;
     
}
</style>
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
						<h2 class="page-title">Join</h2>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}/">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Join</li>
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
				<input type="text" name="m_id" id="nlEmail" class="form-control" placeholder="ID">
				<input type="password" name="m_password" id="nlEmail" class="form-control" placeholder="Password">
				<input type="text" name="m_name" id="nlEmail" class="form-control" placeholder="Name">
				<input type="text" name="m_tel" id="nlEmail" class="form-control" placeholder="Tel">
				<input type="text" name="m_email" id="nlEmail" class="form-control" placeholder="Email">				
				<label class="custom-radio-button">
				 <input type="radio" name="m_field" value="normal" checked/>  <span class="helping-el"></span> <span class="label-text">일반</span> </label>	
				 <label class="custom-radio-button">	
				 <input type="radio" name="m_field" value="hostel" />  <span class="helping-el"></span> <span class="label-text">숙박업</span> </label>	
				 <br><br>
				<button type="submit" class="btn roberto-btn w-100">Join Us</button>
			</form>
		</div>
	</div>
	</center>
	<br>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>