<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>

<head>

<title>EzenTour</title>
<style>
table {
	text-align: center
}

td {
	valign: middle
}

.roberto-btn1 {
	position: relative;
	min-width: 60px;
	height: 38px;
	line-height: 46px;
	font-size: 16px;
	text-align: center;
	text-transform: capitalize;
	background-color: #1cc3b2;
	color: #ffffff;
	border: none;
	border-radius: 2px;
	-webkit-transition-duration: 500ms;
	-o-transition-duration: 500ms;
	transition-duration: 500ms;
	margin-left: 10px;
}
</style>
</head>
<body>

	<%@ include file="../include/menu.jsp"%>

	<!-- Breadcrumb Area Start -->
	<div
		class="breadcrumb-area contact-breadcrumb bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/18.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb-content text-center mt-100">
						<h1 class="h1-title">축제 정보</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Festival</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->

	<!-- Google Maps & Contact Info Area Start -->
	<section class="google-maps-contact-info">
		<div class="container-fluid">
			<div class="google-maps-contact-content">
				<div class="row center-content-between align-items-end">
					<div class="col-4 col-md-2 col-lg-2">
						<label for="f_start">축제 기간</label> <input type="date"
							class="form-control" id="f_start" name="f_start" value="2019-07-01">
					</div>
					<div class="col-4 col-md-2 col-lg-2">
						<label for="f_end"></label> <input type="date"
							class="form-control" id="f_end" name="f_end" value="2019-12-31">
					</div>
					 <button type="submit" class="roberto-btn1" id="btnd">검색</button>
				</div>
				<br>
				<!-- Google Maps -->
				<div class="google-maps">
					<div id="map" style="width: 100%; height: 500px; boarder: 1px solid black;"></div>
				</div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3214d52dc541ad022a4463064eeff3c&libraries=services,clusterer,drawing"></script>
				<script>
								
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					mapOption = {
						center : new kakao.maps.LatLng(36.36181333069756,
								127.37896281500157), // 지도의 중심좌표
						level : 7
					// 지도의 확대 레벨
					};
					var map = new kakao.maps.Map(mapContainer, mapOption);
					
					$.ajax({
						 // 지도를 생성합니다
						url : '${path}/festival/PublicData.do',
						type : 'get',
						data: { start : document.getElementById("f_start").value,
								end : document.getElementById("f_end").value},
						dataType : 'json',
						success : function(data) {
							console.log(data);
							console.log(data.response.body.items.item);
							var positions = data.response.body.items.item;							
							

							for (var i = 0; i < positions.length; i++) {
								var output = new Object();
								output.title = positions[i].title;
								output.addr = positions[i].addr1;
								output.tel = positions[i].tel;														
								output.date = positions[i].eventstartdate + " ~ " + positions[i].eventenddate;
								output.img = positions[i].firstimage2;

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									map : map, // 마커를 표시할 지도
									position : new kakao.maps.LatLng(
											positions[i].mapy,
											positions[i].mapx)
								// 마커의 위치
								});

								// 마커에 표시할 인포윈도우를 생성합니다 
								var infowindow = new kakao.maps.InfoWindow({
									content : "<b>" + positions[i].title
											+ "</b><br>" + positions[i].addr1,
									removable : true
								// 인포윈도우에 표시할 내용
								});

								// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
								// 이벤트 리스너로는 클로저를 만들어 등록합니다 
								// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
								kakao.maps.event.addListener(marker, 'click',
										makeOverListener(map, marker,
												infowindow, output));
							}

						}
					});

					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow, output) {
						return function() {
							infowindow.open(map, marker);
							document.getElementById("title").innerHTML = output.title;
							document.getElementById("date").innerHTML = output.date;
							document.getElementById("addr").innerHTML = output.addr;
							document.getElementById("tel").innerHTML = output.tel;
							document.getElementById("img").innerHTML = "<img src='" + output.img + "'>";
						};
					}

					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
						return function() {
							infowindow.close();
						};
					}
										
										
					$("#btnd").click(function(){  
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						$.ajax({
							url : '${path}/festival/PublicData.do',
							type : 'get',
							data: { start : document.getElementById("f_start").value,
									end : document.getElementById("f_end").value},
							dataType : 'json',
							success : function(data) {
								console.log(data);
								console.log(data.response.body.items.item);
								var positions = data.response.body.items.item;

								for (var i = 0; i < positions.length; i++) {
									var output = new Object();
									output.title = positions[i].title;
									output.addr = positions[i].addr1;
									output.tel = positions[i].tel;
									output.date = positions[i].eventstartdate
											+ " ~ " + positions[i].eventenddate;
									output.img = positions[i].firstimage2;

									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
										map : map, // 마커를 표시할 지도
										position : new kakao.maps.LatLng(
												positions[i].mapy,
												positions[i].mapx)
									// 마커의 위치
									});

									// 마커에 표시할 인포윈도우를 생성합니다 
									var infowindow = new kakao.maps.InfoWindow({
										content : "<b>" + positions[i].title
												+ "</b><br>" + positions[i].addr1,
										removable : true
									// 인포윈도우에 표시할 내용
									});

									// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
									// 이벤트 리스너로는 클로저를 만들어 등록합니다 
									// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
									kakao.maps.event.addListener(marker, 'click',
											makeOverListener(map, marker,
													infowindow, output));
								}

							}
						});
					});
				
				
				</script>
			</div>
		</div>
	</section>
	<!-- Google Maps & Contact Info Area End -->

	<!-- ui middle aligned center aligned grid -->
	<div class="roberto-rooms-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<table class="ui celled table">
					<thead>
						<tr>
							<td>축제명</td>
							<td><p id="title"></p></td>
						</tr>
					</thead>
					<tbody id="list">
						<tr>
							<td>기간</td>
							<td><p id="date"></td>
						</tr>
						<tr>
							<td>위치</td>
							<td><p id="addr"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><p id="tel"></td>
						</tr>
						<tr>
							<td></td>
							<td><p id="img"></td>
						</tr>
					</tbody>
				</table>
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

	<!-- jQuery 2.2.4 -->
	<script src="${path }/resources/js/jquery-1.11.0.min.js"></script>
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