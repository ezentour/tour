<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
    <title>EzenTour</title>
</head>

<body>
    <%@ include file="../include/menu.jsp" %>
<script>
	
	$(function() {
		var checkInDate = document.getElementById("checkInDate");
		var checkOutDate = document.getElementById("checkOutDate");
		
	    $("#cart").click(function() {
	        if(checkInDate.value== "" || checkOutDate.value == "") {
 				alert("CheckIn 날짜와CheckOut 날짜를 설정해주세요.");
 			} else if(confirm("장바구니로 이동하시겠습니까?")) {
 				document.detail.action="${path}/hotel/detail/cart?num=1";
	            document.detail.submit();
 			} else{
 				document.detail.action="${path}/hotel/detail/cart?num=2";
	            document.detail.submit();
 			}
	    });
	    });
	</script>

      <!-- Breadcrumb Area Start -->
    <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-end">
                <div class="col-12">
                    <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                        <h2 class="room-title">${hotel.h_name }</h2>
                        <h2 class="room-price">&#8361;${hotel.h_price } <span>/ Per Night</span></h2>
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
                            <div id="room-thumbnail--slide" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="${path}/resources/img/hotel-img/${hotel.h_img}" class="d-block w-100" alt="">
                                    </div>                                   
                                </div>

                                <ol class="carousel-indicators">
                                    <li data-target="#room-thumbnail--slide" data-slide-to="0" class="active">
                                        <img src="${path}/resources/img/hotel-img/${hotel.h_img}" class="d-block w-100" alt="">
                                    </li>                                   
                                </ol>
                            </div>
                        </div>

                        <!-- Room Features -->
                        <div class="room-features-area d-flex flex-wrap mb-50">
                            <h6>숙박유형 <span>${hotel.h_type}</span></h6>
                            <h6>방 개수 <span>${hotel.h_room}</span></h6>             
                            <h6>전화번호 <span>${hotel.h_tel}</span></h6>
                            <h6>호스텔 <span>${hotel.h_m_id }</span></h6>                 
                        </div>

                        <p>${hotel.h_content }</p>

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
                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
                                    <div class="reviwer-title">
                                        <span>27 Aug 2019</span>
                                        <h6>Brandon Kelley</h6>
                                    </div>
                                    <div class="reviwer-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora.</p>
                            </div>
                        </div>

                        <!-- Single Review Area -->
                        <div class="single-room-review-area d-flex align-items-center">
                            <div class="reviwer-thumbnail">
                                <img src="${path}/resources/img/bg-img/54.jpg" alt="">
                            </div>
                            <div class="reviwer-content">
                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
                                    <div class="reviwer-title">
                                        <span>27 Aug 2019</span>
                                        <h6>Sounron Masha</h6>
                                    </div>
                                    <div class="reviwer-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora.</p>
                            </div>
                        </div>

                        <!-- Single Review Area -->
                        <div class="single-room-review-area d-flex align-items-center">
                            <div class="reviwer-thumbnail">
                                <img src="${path}/resources/img/bg-img/55.jpg" alt="">
                            </div>
                            <div class="reviwer-content">
                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
                                    <div class="reviwer-title">
                                        <span>27 Aug 2019</span>
                                        <h6>Amada Lyly</h6>
                                    </div>
                                    <div class="reviwer-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora.</p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <!-- Hotel Reservation Area -->
                    <div class="hotel-reservation--area mb-100">
                        <form name="detail" method="post">
                            <div class="form-group mb-30">
                                <label for="checkInDate">숙박날짜</label>
                                <div class="input-daterange" id="datepicker">
                                    <div class="row no-gutters">
                                        <div class="col-6">
                                            <input type="text" class="input-small form-control" id="checkInDate" name="checkInDate" placeholder="체크인">
                                        </div>
                                        <div class="col-6">
                                            <input type="text" class="input-small form-control" id="checkOutDate" name="checkOutDate" placeholder="체크아웃">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-30">
                                <label for="guests">인원수</label>
                                <div class="row">
                                    <div class="col-12">
                                        <select name="guests" id="guests" class="form-control">
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-50">
                                <div class="slider-range">
                                    <div class="range-price">가격 설정: ₩0 ~ ₩500000</div>
                                    <div data-min="0" data-max="500000" data-unit="₩" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="0" data-value-max="500000" data-label-result="가격 설정: ">
                                        <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                 <button type="button" class="btn roberto-btn w-100" id="searchAccomodation">숙소 검색</button>
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
   
    <div><p><br></p></div>

    <%@ include file="../include/footer.jsp" %>

</body>

</html>

