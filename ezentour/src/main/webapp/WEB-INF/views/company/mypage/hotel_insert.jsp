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
<script>
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("${path}/mypage/company/josogo.do", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.

	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form1.roadFullAddr.value = roadFullAddr;
	}

	$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');

				fileTarget.on('change', function() {
					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}

					$(this).siblings('.upload-name').val(filename);
				});
			});
</script>
<script>
	$(
			function() {
				$("#cancel")
						.click(
								function() {
									if (confirm("취소하시겠습니까?(저장 안돼요!)")) {
										document.form1.action = "${path}/mypage/company/hotel_list";
										document.back.submit();
									}
								});
				$("#next")
						.click(
								function() {
									if ($("#name").val() == "") {
										alert("업체명(개인)을 입력해주세요!!!!");
									} else if ($("#roadFullAddr").val() == "") {
										alert("주소를 입력해주세요!!!!");
									} else if ($("#tel").val() == "") {
										alert("전화번호를 입력해주세요!!!!");
									} else {
										if (confirm("NEXT")) {
											document.back.action = "${path}/mypage/company/hotel_insertTwo";
											document.back.submit();
										}
									}
								});
			})
</script>
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
						<h1 class="h1-title">숙소 등록</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}">Home</a></li>
								<li class="breadcrumb-item">My page</li>
								<li class="breadcrumb-item">숙소 등록</li>
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
				<form action="${path}/mypage/company/hotel_insert.do" method="post" name="form1" enctype="multipart/form-data">
					<input type="text" name="h_name" id="h_name" class="form-control"
						placeholder="숙소이름" autocomplete="off"> 
						 <button type="button" class="btn btn btn-secondary w-30 btn-sm" style="background-color: #1cc3b2; border : none "onclick="goPopup();">주소검색</button>
						<input
						type="text" name="h_address" id="roadFullAddr" class="form-control"
						placeholder="숙소주소" autocomplete="off" readonly="readonly" > <input
						type="text" name="h_tel" id="h_tel" class="form-control"
						placeholder="전화번호" autocomplete="off"> <input
						type="text" name="h_price" id="h_price" class="form-control"
						placeholder="가격(1박기준)" autocomplete="off">
						<input
						type="text" name="h_room" id="h_room" class="form-control"
						placeholder="방개수(숫자만 입력)" autocomplete="off">
						 <textarea name="h_content" cols="40" rows="8"  style="border:none"placeholder="숙소설명" class="form-control"></textarea>
 					<br>
 					<select class="mdb-select md-form" name="h_type">
						<option value="" disabled selected> 숙소유형 </option>
						<option value="호텔">호텔</option>
						<option value="펜션">펜션</option>
						<option value="게스트하우스">게스트하우스</option>
						<option value="리조트/콘도">리조트/콘도</option>
					</select>				
					<br><br>
					<div class="filebox" style="margin-top : 15px">
						<input class="upload-name" value="숙소 이미지 첨부" disabled="disabled">
						<label for="ex_filename">업로드</label> <input type="file"
							id="ex_filename" name="file" class="upload-hidden">
					</div>
					<br>
					<button type="submit" class="btn roberto-btn w-100">숙소등록</button>
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
