<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
	<title>EzenTour</title>
	<script>
	function doSign() {
		var m_id = $("#m_id").val();
		
		if(m_id.length == 0) {
			alert("아이디를 입력해주세요.");
			$("#m_id").focus();
			return false;
		}
	}
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
						<h1 class="h1-title">Login</h1>
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
	<div class="row d-flex justify-content-center">
	<div style="width:400px;">
		<div class="newsletter-form">			
			<form action="${path}/member/login_check.do" method="post">
				<input type="text" name="m_id" id="m_id" class="form-control" placeholder="Enter your ID" autocomplete="off">
				<input type="password" name="m_password" id="m_password" class="form-control" placeholder="Enter your Password" autocomplete="off">
				<button type="submit" class="btn roberto-btn w-100" onclick="doSign();">Login</button>
			</form>
		</div>
	</div>
	</div>
	<br>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>