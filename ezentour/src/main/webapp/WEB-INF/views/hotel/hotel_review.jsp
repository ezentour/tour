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
				<div class="col-12">
					<!-- Single Room Details Area -->
					<div class="single-room-details-area mb-50">
						<!-- Room Thumbnail Slides -->
						<div class="room-thumbnail-slides mb-50">
							<div id="room-thumbnail--slide" class="carousel slide" data-ride="carousel">
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
							<h6>숙박유형 <span>${hotel.h_type}</span></h6>
							<h6>방 개수 <span>${hotel.h_room}</span></h6>
							<h6>전화번호 <span>${hotel.h_tel}</span></h6>
							<h6>호스텔 <span>${hotel.h_m_id}</span></h6>
						</div>

						<p>${hotel.h_content}</p>
						<br>
						<p><b>주소 : </b>${hotel.h_address}</p>
					</div>
					
					<div class="single-room-details-area mb-50">
						<h4>리뷰 작성하기</h4>
						<br>
						<div class="newsletter-form">
						<form action="${path}/hotel/hotel_review_writeBtn?h_no=${hotel.h_no}" method="post" enctype="multipart/form-data">
						<input hidden="hidden" name="m_id" value="${m_id}"/>
						<div>
                        	<div class="form-check form-check-inline">
							  <label class="form-check-label">평점</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="hre_score" value="1">
							  <label class="form-check-label" for="inlineRadio1">1</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="hre_score" value="2">
							  <label class="form-check-label" for="inlineRadio2">2</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="hre_score" value="3">
							  <label class="form-check-label" for="inlineRadio3">3</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="hre_score" value="4">
							  <label class="form-check-label" for="inlineRadio4">4</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="hre_score" value="5">
							  <label class="form-check-label" for="inlineRadio5">5</label>
							</div>
						</div>
							
						<textarea id="hre_comment" name="hre_comment" cols="40" rows="8" placeholder="리뷰를 작성해주세요." class="form-control"></textarea>
						<br>
						<a href="#" onClick="javascript:history.go(-1); return false;" class="btn roberto-btn mt-10">취소</a>&nbsp;&nbsp;&nbsp;
						<button type="submit" onclick="return confirm('작성하시겠습니까?');" class="btn roberto-btn mt-10">작성</button>&nbsp;&nbsp;&nbsp;
						</form>
						</div>
					</div>
					
					<!-- Room Review -->
					<div class="room-review-area mb-100">

							<div class="single-room-review-area d-flex align-items-center">
							<div class="welcome-text text-center">
							 	
							</div>
						</div>
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

