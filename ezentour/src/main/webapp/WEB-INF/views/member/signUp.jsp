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
		var mId = document.getElementById("m_id");
		var mPwd = document.getElementById("m_password");
		var mPwd2 = document.getElementById("m_password2");
		var mName = document.getElementById("m_name");
		var mTel = document.getElementById("m_tel");
		var mEmail = document.getElementById("m_email");
		
		$("#check-id").click(function() {
			var contentElement = document.getElementById("span-check-id");
			if (mId.value == "admin")
				contentElement.innerHTML = "<span style='color:#FF0000'>사용 불가능한 아이디입니다.</span>";
			else if (mId.value == "asdf")
				contentElement.innerHTML = "<span style='color:#008000'>사용 가능한 아이디입니다.</span>";
			else
				contentElement.innerHTML = "<span style='color:#FF0000'>중복된 아이디입니다.</span>";
		});
		
		$("#check-pwd").click(function() {
			var contentElementPwd = document.getElementById("span-check-pwd");
			if(mPwd.value != mPwd2.value) {
				contentElementPwd.innerHTML = "<span style='color:#FF0000'>비밀번호가 다릅니다.</span>";
			} else
				contentElementPwd.innerHTML = "<span style='color:#008000'>비밀번호가 일치합니다.</span>";
		});
		
		$("#sign-up").submit(function() {
			//var mid = $("#m_id");
			
			if(mId.value == "") {
				alert("아이디를 입력해주세요.");
			} else if (mName.value == "") {
				alert("이름을 입력해주세요.");
			} else if (mTel.value == "") {
				alert("전화번호를 입력해주세요.");
			} else if (mEmail.value = "") {
				alert("이메일을 입력해주세요.");
			} else {
				alert("회원가입이 완료되었습니다.");
				document.back.submit();
		    	document.back.action="${path}/mypage/company/hotel_insertTwo";
		    	//document.back.submit();
			}
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
		<div style="width:500px;">
			<div class="newsletter-form">
				<form action="" method="post" id="sign-up" enctype="multipart/form-data">
					<input type="text" name="m_id" id="m_id" class="form-control" placeholder="ID" autocomplete="off">
					<button type="button" class="btn btn btn-secondary w-30 btn-sm" id="check-id">중복 확인</button>
					&nbsp;&nbsp;<span id="span-check-id"></span>
					<br><br>
					<input type="password" name="m_password" id="m_password" class="form-control" placeholder="Password" autocomplete="off">
					<input type="password" name="m_password2" id="m_password2" class="form-control" placeholder="Password check" autocomplete="off">
					<button type="button" class="btn btn btn-secondary w-40 btn-sm" id="check-pwd">비밀번호 확인</button>
					&nbsp;&nbsp;<span id="span-check-pwd"></span>
					<br><br>
					<input type="text" name="m_name" id="m_name" class="form-control" placeholder="Name" autocomplete="off">
					<input type="text" name="m_tel" id="m_tel" class="form-control" placeholder="Tel" autocomplete="off">
					<input type="text" name="m_email" id="m_email" class="form-control" placeholder="Email" autocomplete="off">				
					<label class="custom-radio-button">
					 <input type="radio" name="m_field" value="normal" checked/>  <span class="helping-el"></span> <span class="label-text">일반</span> </label>	
					 <label class="custom-radio-button">	
					 <input type="radio" name="m_field" value="hostel" />  <span class="helping-el"></span> <span class="label-text">숙박업</span> </label>	
					 <br><br>
					<button type="submit" class="btn roberto-btn w-100" >Join Us</button>
				</form>
				
			</div>
		</div>
		

		
	</div>
	<br>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>