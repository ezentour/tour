<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/header.jsp"%>

<head>
<title>EzenTour</title>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="//cdn.poesis.kr/post/search.min.js"
	charset="UTF-8"></script>
<!--[if IE 6]><script type="text/javascript" src="http://cdn.poesis.kr/post/search.min.js"></script><![endif]-->
<link rel="stylesheet" type="text/css"
	href="//cdn.poesis.kr/post/search.css" media="all" />
	
<link rel="stylesheet" href="${path}/resources/css/signup.css">
</head>


<style>
div.postcodify_search_form {
	clear: both;
	padding: 0;
	position: relative;
	width: 500px;
}

label {
	display: block;
	width: 100px;
}

tr {
	height: 50px;
}

.roberto-btn3 {
	position: relative;
	min-width: 60px;
	height: 30px;
	/*font-weight: 500;*/
	display: inline-block;
	text-align: center;
	text-transform: capitalize;
	background-color: #1cc3b2;
	color: #ffffff;
	border: none;
	border-radius: 2px;
	-webkit-transition-duration: 500ms;
	-o-transition-duration: 500ms;
	transition-duration: 500ms;
}

.roberto-btn:focus, .roberto-btn:hover {
	font-weight: 500;
	-webkit-box-shadow: 0 2px 40px 8px rgba(15, 15, 15, 0.15);
	box-shadow: 0 2px 40px 8px rgba(15, 15, 15, 0.15);
	background-color: #ffffff;
	color: #1cc3b2;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	position: relative;
	min-width: 60px;
	height: 40px;
	/*font-weight: 500;*/
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	text-transform: capitalize;
	background-color: #1cc3b2;
	color: #ffffff;
	border: none;
	border-radius: 2px;
	-webkit-transition-duration: 500ms;
	-o-transition-duration: 500ms;
	transition-duration: 500ms;
	margin-top:-10px;
	margin-left : 10px;
		padding: .5em .75em;
	
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	width : 215px;
	padding: .5em .75em;
	font-size: inherit;	
	line-height: normal;
	vertical-align: middle;
	background-color: white;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>

<body>

	<!--
 *  Postcodify - 도로명주소 우편번호 검색 프로그램 (코딩 예제)
 * 
 *  Copyright (c) 2014-2015, Poesis <root@poesis.kr>
 * 
 *  이 프로그램은 자유 소프트웨어입니다. 이 소프트웨어의 피양도자는 자유
 *  소프트웨어 재단이 공표한 GNU 약소 일반 공중 사용 허가서 (GNU LGPL) 제3판
 *  또는 그 이후의 판을 임의로 선택하여, 그 규정에 따라 이 프로그램을
 *  개작하거나 재배포할 수 있습니다.
 * 
 *  이 프로그램은 유용하게 사용될 수 있으리라는 희망에서 배포되고 있지만,
 *  특정한 목적에 맞는 적합성 여부나 판매용으로 사용할 수 있으리라는 묵시적인
 *  보증을 포함한 어떠한 형태의 보증도 제공하지 않습니다. 보다 자세한 사항에
 *  대해서는 GNU 약소 일반 공중 사용 허가서를 참고하시기 바랍니다.
 * 
 *  GNU 약소 일반 공중 사용 허가서는 이 프로그램과 함께 제공됩니다.
 *  만약 허가서가 누락되어 있다면 자유 소프트웨어 재단으로 문의하시기 바랍니다.
 *
 *-->

	<%@ include file="../../include/menu.jsp"%>

	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcrumb-content text-center">
						<h1 class="h1-title">숙소 상세정보</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">My page(user)</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->

	<br><br>
	<div class="row d-flex justify-content-center">
		<div style="width: 400px;">
			<div class="newsletter-form">
				<form name ="form1" enctype="multipart/form-data" method="post">
					<input type="text" name="h_name" id="h_name" class="form-control"
						placeholder="숙소이름" autocomplete="off" value="${hotel.h_name }" readonly="readonly"> 						
						<input
						type="text" name="h_address" id="roadFullAddr" class="form-control"
						placeholder="숙소주소" autocomplete="off" value="${hotel.h_address }" readonly="readonly"> <input
						type="text" name="h_tel" id="h_tel" class="form-control"
						placeholder="전화번호" autocomplete="off"  value="${hotel.h_tel }" readonly="readonly"> <input
						type="text" name="h_price" id="h_price" class="form-control"
						placeholder="가격(1박기준)" autocomplete="off"  value="1박 가격 : ${hotel.h_price }" readonly="readonly">
						<input
						type="text" name="h_room" id="h_room" class="form-control"
						placeholder="방개수(숫자만 입력)" autocomplete="off" value="방개수 : ${hotel.h_room }" readonly="readonly">
						 <textarea name="h_content" cols="40" rows="8"  style="border:none"placeholder="숙소설명" class="form-control" readonly="readonly">${hotel.h_content }</textarea>
 					<br>
 					<input
						type="text" name="h_type"  class="form-control"
						autocomplete="off" value="숙박유형 : ${hotel.h_type }" readonly="readonly">
					
					<br>
					<img src="${path}/resources/img/hotel-img/${hotel.h_img}" alt="">
				</form>
			</div>
		</div>
	</div>

	<div>
		<p>
			<br>
		</p>
	</div>

	<!-- Footer Area Start -->
	<footer class="footer-area section-padding-80-0">
		<!-- Main Footer Area -->
		<div class="main-footer-area">
			<div class="container">
				<div class="row align-items-baseline justify-content-between">
					<!-- Single Footer Widget Area -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget mb-80">
							<!-- Footer Logo -->
							<a href="${path}" class="footer-logo"><img
								src="${path}/resources/img/core-img/ezenlogo2.png" alt=""></a>

						</div>
					</div>

					<div class="col-12 col-sm-6 col-lg-9">
						<div class="single-footer-widget mb-80">

							<h4>+82 042-1234-1234</h4>
							<span>ezentour@ezen.com</span> <span>대전광역시 서구 대덕대로 325
								스타게이트 7층</span>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- Copywrite Area -->
		<div class="container">
			<div class="copywrite-content">
				<div class="row align-items-center">
					<div class="col-12 col-md-12" align="center">
						<!-- Copywrite Text -->
						<div class="copywrite-text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart-o" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Area End -->

	<!-- **** All JS Files ***** -->

	<!-- Popper -->
	<script src="${path }/resources/js/popper.min.js"></script>
	<!-- Bootstrap -->
	<script src="${path }/resources/js/bootstrap.min.js"></script>
	<!-- All Plugins -->
	<script src="${path }/resources/js/roberto.bundle.js"></script>
	<!-- Active -->
	<script src="${path }/resources/js/default-assets/active.js"></script>

</body>
</html>
