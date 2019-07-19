<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/signup.css">
<head>
	<title>EzenTour</title>
	
	
	<script>
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	var idck = 0;
	$(function() {
	    //idck 버튼을 클릭했을 때 
	    $("#check-id").click(function() {
	        
	        //userid 를 param.
	        var userid =  $("#m_id").val(); 
	        
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : userid,
	            url : "signUp.do/idcheck.do",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data.cnt > 0) {
						$(".result-id .msg").text("사용 불가");
						$(".result-id .msg").attr("style", "color:#FF0000");
						$("#submitBtn").attr("disabled", "disabled");
	                } else {
						$(".result-id .msg").text("사용 가능");
						$(".result-id .msg").attr("style", "color:#008000");
						$("#submitBtn").removeAttr("disabled");
	                }
	            },
	            error : function(error) {  
	                alert("error : " + error);
	            }
	        });
	    }); // end $("#check-id").click function
	    
	    var mId = document.getElementById("m_id");
		var mPwd = document.getElementById("m_password");
		var mPwd2 = document.getElementById("m_password2");
		var mName = document.getElementById("m_name");
		var mTel = document.getElementById("m_tel");
		var mEmail = document.getElementById("m_email");
		var contentElement = document.getElementById("span-check-id");

		 $("#check-pwd").click(function() {
			var contentElementPwd = document.getElementById("span-check-pwd");
			if(mPwd.value != mPwd2.value) {
				contentElementPwd.innerHTML = "<span style='color:#FF0000'>비밀번호가 다릅니다.</span>";
				$("#submitBtn").attr("disabled", "disabled");
			} else {
				contentElementPwd.innerHTML = "<span style='color:#008000'>비밀번호가 일치합니다.</span>";
				$("#submitBtn").removeAttr("disabled");
			}
		});
		 
		$("#sign-up").submit(function() {
			//var mid = $("#m_id");
				
			if(mId.value == "") {
				alert("아이디를 입력해주세요.");
				return false;
			} else if (mPwd == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if (mName.value == "") {
				alert("이름을 입력해주세요.");
				return false;
			} else if (mTel.value == "") {
				alert("전화번호를 입력해주세요.");
				return false;
			} else if (mEmail.value == "") {
				alert("이메일을 입력해주세요.");
				return false;
			} else {
				alert("회원가입이 완료되었습니다.");	
				//document.back.submit();
		    	//document.back.action="${path}/mypage/company/hotel_insertTwo";
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
			

				<form action="${path}/member/register" method="post" id="sign-up" enctype="multipart/form-data">
					<input type="text" name="m_id" id="m_id" class="form-control" placeholder="ID" autocomplete="off">
					<button type="button" class="btn btn btn-secondary w-30 btn-sm" id="check-id">중복 확인</button>
					&nbsp;&nbsp;<span id="span-check-id"></span>
					<span class="result-id"><span class="msg">아이디를 확인해주세요.</span></span>
					<br><br>
					<input type="password" name="m_password" id="m_password" class="form-control" placeholder="Password" autocomplete="off" />
					<input type="password" name="m_password2" id="m_password2" class="form-control" placeholder="Password Check" autocomplete="off" />
					<button type="button" class="btn btn btn-secondary w-40 btn-sm" id="check-pwd">비밀번호 확인</button>
					&nbsp;&nbsp;<span id="span-check-pwd">비밀번호를 확인해주세요.</span>
					<br><br>
					<input type="text" name="m_name" id="m_name" class="form-control" placeholder="Name" autocomplete="off" />
					<input type="text" name="m_tel" id="m_tel" class="form-control" placeholder="Tel" autocomplete="off" />
					<input type="text" name="m_email" id="m_email" class="form-control" placeholder="Email" autocomplete="off" />
					<br>
					<label class="custom-radio-button">
						<input type="radio" name="m_field" value="U" checked/>  <span class="helping-el"></span> <span class="label-text">일반</span> 
					</label>	
					<label class="custom-radio-button">	
						<input type="radio" name="m_field" value="H" />  <span class="helping-el"></span> <span class="label-text">숙박업</span>
					</label>	
					 <br><br>
					<button type="submit" class="btn roberto-btn w-100" id="submitBtn" disabled="disabled">Join Us</button>
				</form>

			</div>
		</div>
		

		
	</div>
	<br>

	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>