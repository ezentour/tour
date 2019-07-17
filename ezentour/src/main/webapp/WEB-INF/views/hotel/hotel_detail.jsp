<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
<title>EzenTour</title>
</head>

<body>
	<%@ include file="../include/menu.jsp"%>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3214d52dc541ad022a4463064eeff3c&libraries=services"></script>

	<script>
		$(function() {
			var checkInDate = document.getElementById("checkInDate");
			var checkOutDate = document.getElementById("checkOutDate");
			var m_id = document.getElementById("m_id"); //menu get
			var r_room = document.getElementById("r_room");

			$("#cart")
					.click(
							function() {
								if (m_id != null) {
									if ("${field}" == "U") {
										if (checkInDate.value == ""
												|| checkOutDate.value == "") {
											alert("CheckIn 날짜와CheckOut 날짜를 설정해주세요.");
										} else if (confirm("장바구니로 이동하시겠습니까?")) {
											document.detail.action = "${path}/hotel/detail/cart?num=1&h_no="
													+ $
											{
												hotel.h_no
											}
											;
											document.detail.submit();
										} else {
											document.detail.action = "${path}/hotel/detail/cart?num=2&h_no="
													+ $
											{
												hotel.h_no
											}
											;
											document.detail.submit();
										}
									} else {
										alert("사용자만 이용할 수 있습니다.");
									}
								} else {
									alert("로그인하세요");
								}
							});			
				
		});
	</script>


	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-end">
				<div class="col-12">
					<div
						class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
						<h2 class="room-title">${hotel.h_name }</h2>
						<h2 class="room-price">
							&#8361;
							<fmt:formatNumber value="${hotel.h_price }" pattern="#,###" />
							<span>/ Per Night</span>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->

	<!-- Rooms Area Start -->
	<div class="roberto-rooms-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8">
					<!-- Single Room Details Area -->
					<div class="single-room-details-area mb-50">
						<!-- Room Thumbnail Slides -->
						<div class="room-thumbnail-slides mb-50">
							<div id="room-thumbnail--slide" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="${path}/resources/img/hotel-img/${hotel.h_img}"
											class="d-block w-100" alt="">
									</div>
								</div>

								<ol class="carousel-indicators">
									<li data-target="#room-thumbnail--slide" data-slide-to="0"
										class="active"><img
										src="${path}/resources/img/hotel-img/${hotel.h_img}"
										class="d-block w-100" alt=""></li>
								</ol>
							</div>
						</div>

						<!-- Room Features -->
						<div class="room-features-area d-flex flex-wrap mb-50">
							<h6>
								숙박유형 <span>${hotel.h_type}</span>
							</h6>
							<h6>
								방 개수 <span>${hotel.h_room}</span>
							</h6>
							<h6>
								전화번호 <span>${hotel.h_tel}</span>
							</h6>
							<h6>
								호스텔 <span>${hotel.h_m_id }</span>
							</h6>
						</div>

						<p>${hotel.h_content }</p>
						<br>
						<p>
							<b>주소 : </b>${hotel.h_address }
						</p>

						<div class="carousel-inner">
							<div class="carousel-item active">
								<div id="map" style="width: 100%; height: 350px;"></div>
							</div>
						</div>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(33.450701,
										126.570667), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();

							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											'${hotel.h_address}',
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});

													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:6px 0;">${hotel.h_name}</div>'
															});
													infowindow
															.open(map, marker);

													// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
													map.setCenter(coords);
												}
											});
						</script>

					</div>

					<!-- Room Review -->
					<div class="room-review-area mb-100">
						<h4>Room Review</h4>

						<!-- Single Review Area -->
						<div class="single-room-review-area d-flex align-items-center">
							<div class="reviwer-thumbnail">
								<img src="${path}/resources/img/bg-img/53.jpg" alt="">
							</div>
							<div class="reviwer-content">
								<div
									class="reviwer-title-rating d-flex align-items-center justify-content-between">
									<div class="reviwer-title">
										<span>27 Aug 2019</span>
										<h6>Brandon Kelley</h6>
									</div>
									<div class="reviwer-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
									sit amet, consectetur, adipisci velit, sed quia non numquam
									eius modi tempora.</p>
							</div>
						</div>

						<!-- Single Review Area -->
						<div class="single-room-review-area d-flex align-items-center">
							<div class="reviwer-thumbnail">
								<img src="${path}/resources/img/bg-img/54.jpg" alt="">
							</div>
							<div class="reviwer-content">
								<div
									class="reviwer-title-rating d-flex align-items-center justify-content-between">
									<div class="reviwer-title">
										<span>27 Aug 2019</span>
										<h6>Sounron Masha</h6>
									</div>
									<div class="reviwer-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
									sit amet, consectetur, adipisci velit, sed quia non numquam
									eius modi tempora.</p>
							</div>
						</div>

						<!-- Single Review Area -->
						<div class="single-room-review-area d-flex align-items-center">
							<div class="reviwer-thumbnail">
								<img src="${path}/resources/img/bg-img/55.jpg" alt="">
							</div>
							<div class="reviwer-content">
								<div
									class="reviwer-title-rating d-flex align-items-center justify-content-between">
									<div class="reviwer-title">
										<span>27 Aug 2019</span>
										<h6>Amada Lyly</h6>
									</div>
									<div class="reviwer-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
									sit amet, consectetur, adipisci velit, sed quia non numquam
									eius modi tempora.</p>
							</div>
						</div>

					</div>
				</div>
				<div class="col-12 col-lg-4">
					<!-- Hotel Reservation Area -->
					<div class="hotel-reservation--area mb-100">
						<form name="detail" method="post" action="${path}/mypage/user/reservation_check?h_no=${hotel.h_no}">
							<div class="form-group mb-30">
								<label for="checkInDate">숙박날짜</label>
								<div class="input-daterange" id="datepicker">
									<div class="row no-gutters">
										<div class="col-6">
											<input type="text" class="input-small form-control"	id="checkInDate" name="checkin" placeholder="체크인">
										</div>
										<div class="col-6">
											<input type="text" class="input-small form-control" id="checkOutDate" name="checkout" placeholder="체크아웃">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group mb-30">
								<label for="guests">방개수</label>
								<div class="row">
									<div class="col-12">
										<select name="r_room" id="r_room" class="form-control">																						
											<c:forEach var="i" begin="1" end="${hotel.h_room }" step="1">
											<option value="${i }">${i}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div></div>
							<div class="form-group">
								<button type="submit" class="btn roberto-btn w-100">숙소 예약</button>
							</div>
							<div class="form-group">
								<button type="button" class="btn roberto-btn w-100" id="cart">장바구니</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Rooms Area End -->

	<div>
		<p>
			<br>
		</p>
	</div>

	<%@ include file="../include/footer.jsp"%>

</body>

</html>

