<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/signup.css">
<head>
	<title>EzenTour</title>
	<script>
	$(function() {
		$("#check-id").click(function() {
			var contentElement = document.getElementById("div-check-id");
			var mid = document.getElementById("m_id");
			//alert(mid.value + " ");
			//alert(mid.textContent + " ");
			//alert(mid.innerHTML + " ");
			
			if (mid.value == "admin")
				contentElement.innerHTML = "<span style='color:#FF0000'>사용 불가능한 아이디입니다.</span>";
			else if (mid.value == "asdf")
				contentElement.innerHTML = "<span style='color:#008000'>사용 가능한 아이디입니다.</span>";
			else
				contentElement.innerHTML = "<span style='color:#FF0000'>중복된 아이디입니다.</span>";
		});
		
		$("#signup").submit(function() {
			var mid = $("#m_id");
			if(mid.value == "")
				alert("id가 공백임");
		});
	});
	</script>
	
	
</head>
<body>

	<%@ include file="../include/menu.jsp"%>
	
	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcrumb-content text-center">
						<h1 class="h1-title">Join</h1>
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
	<div class="row d-flex justify-content-center">

	<div style="width:400px;">
		<div class="newsletter-form">
			<form action="#" method="post">
				<input type="text" name="m_id" id="nlEmail" class="form-control" placeholder="ID">
				<button class="btn btn btn-secondary w-30">중복 확인</button><br><br>
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

		<div style="width:400px;">
			<div class="newsletter-form">
				<form action="#" method="post" name="signup">
					<input type="text" name="m_id" id="m_id" class="form-control" placeholder="ID" autocomplete="off">
					<button type="button" class="btn btn btn-secondary w-30 btn-sm" id="check-id">중복 확인</button>
					&nbsp;&nbsp;<div id="div-check-id"></div>
					<br>
					<input type="password" name="m_password" id="m_password" class="form-control" placeholder="Password" autocomplete="off">
					<input type="password" name="m_password2" id="m_password2" class="form-control" placeholder="Password check" autocomplete="off">
					<button type="button" class="btn btn btn-secondary w-40 btn-sm" id="check-pwd">비밀번호 확인</button>
					&nbsp;&nbsp;<div id="div-check-pwd"></div>
					<br>
					<input type="text" name="m_name" id="m_name" class="form-control" placeholder="Name" autocomplete="off">
					<input type="text" name="m_tel" id="m_tel" class="form-control" placeholder="Tel" autocomplete="off">
					<input type="text" name="m_email" id="m_email" class="form-control" placeholder="Email" autocomplete="off">				
					<label class="custom-radio-button">
					 <input type="radio" name="m_field" value="normal" checked/>  <span class="helping-el"></span> <span class="label-text">일반</span> </label>	
					 <label class="custom-radio-button">	
					 <input type="radio" name="m_field" value="hostel" />  <span class="helping-el"></span> <span class="label-text">숙박업</span> </label>	
					 <br><br>
					<button type="submit" class="btn roberto-btn w-100">Join Us</button>
				</form>
				
			</div>

		</div>
		

		
	</div>

	</div>

	<br>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>