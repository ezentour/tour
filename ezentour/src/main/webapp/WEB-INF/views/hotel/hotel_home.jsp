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

	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcrumb-content text-center">
						<h1 class="h1-title">숙소</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Room</li>
							</ol>
						</nav>
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
					<!-- Single Room Area -->
					<c:forEach var="row" items="${list}">
					<div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
						<!-- Room Thumbnail -->
						<div class="room-thumbnail">
							<img src="${path}/resources/img/hotel-img/${row.h_img}" alt="">
						</div>
						<!-- Room Content -->
						<div class="room-content">
							<h2>${row.h_name }</h2>
							<h4>
								&#8361;${row.h_price } <span>/ Day</span>
							</h4>
							<div class="room-feature">
								<h6>
									숙소종류 <span>${row.h_type }</span>
								</h6>													
														
							</div>
							<a href="${path}/hotel/detail.do?h_no=${row.h_no}" class="btn view-detail-btn">View	Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
						</div>
					</div>
					</c:forEach>

					

					<!-- Pagination -->
					<nav class="roberto-pagination wow fadeInUp mb-100"
						data-wow-delay="1000ms">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next
									<i class="fa fa-angle-right"></i>
							</a></li>
						</ul>
					</nav>
				</div>

				<div class="col-12 col-lg-4">
					<!-- Hotel Reservation Area -->
					<div class="hotel-reservation--area mb-100">
						<form action="#" method="post">
							<div class="form-group mb-30">
								<label for="checkInDate">숙박날짜</label>
								<div class="input-daterange" id="datepicker">
									<div class="row no-gutters">
										<div class="col-6">
											<input type="text" class="input-small form-control"
												id="checkInDate" name="checkInDate" placeholder="체크인">
										</div>
										<div class="col-6">
											<input type="text" class="input-small form-control"
												name="checkOutDate" placeholder="체크아웃">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group mb-30">
								<label for="guests">숙소유형</label>
								<div class="row">
									<div class="col-12">
										<select name="hotel-type" id="hotel-type" class="form-control">
											<option value="" selected>전체</option>
											<option value="type-h">호텔</option>
											<option value="type-f">팬션</option>
											<option value="type-g">게스트하우스</option>
											<option value="type-m">모텔</option>
											<option value="type-r">리조트/콘도</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group mb-50">
								<div class="slider-range">
									<div class="range-price">가격 설정: ₩0 ~ ₩500000</div>
									<div data-min="0" data-max="500000" data-unit="₩"
										class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
										data-value-min="0" data-value-max="500000"
										data-label-result="가격 설정: ">
										<div class="ui-slider-range ui-widget-header ui-corner-all"></div>
										<span class="ui-slider-handle ui-state-default ui-corner-all"
											tabindex="0"></span> <span
											class="ui-slider-handle ui-state-default ui-corner-all"
											tabindex="0"></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn roberto-btn w-100">숙소
									검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Rooms Area End -->

	<!-- Call To Action Area Start -->
	<section class="roberto-cta-area">
		<div class="container">
			<div class="cta-content bg-img bg-overlay jarallax"
				style="background-image: url(${path}/resources/img/bg-img/1.jpg);">
				<div class="row align-items-center">
					<div class="col-12 col-md-7">
						<div class="cta-text mb-50">
							<h2>예약하러 가기</h2>
							<h6>숙소 예약 화면으로 이동합니다.</h6>
						</div>
					</div>
					<div class="col-12 col-md-5 text-right">
						<a href="#" class="btn roberto-btn mb-50">예약</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Call To Action Area End -->

	<div>
		<p>
			<br>
		</p>
	</div>

	<%@ include file="../include/footer.jsp"%>

</body>

</html>

