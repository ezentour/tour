<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
	$(function() {
		$("#slider-range").slider(
				{
					range : true,
					min : 0,
					max : 500000,
					values : [ 0, 500000 ],

					slide : function(event, ui) {
						$("#amount").val(
								"￦" + ui.values[0] + " - ￦"
										+ ui.values[1]);
					}
				});
		$("#amount").val(
				"￦" + $("#slider-range").slider("values", 0) + " - ￦"
						+ $("#slider-range").slider("values", 1));
		
		$("#search").click(function() {
							document.searchDetail.action = "${path}/hotel/searchDetail.do?minPrice="+$('#slider-range').slider('values', 0)+"&maxPrice="+$('#slider-range').slider('values', 1);
							document.searchDetail.submit();
						});
	});
		</script>
<head>
<title>EzenTour</title>
	<script>
    $(function() {
      var $startDate = $('#checkInDate');
      var $endDate = $('#checkOutDate');
      $startDate.datepicker({
        autoHide: true,
        startDate: new Date(),
        format: 'dd/mm/yy',
      });
      $endDate.datepicker({
        autoHide: true,
        startDate: $startDate.datepicker('getDate'),
        format: 'dd/mm/yy',
      });
      $startDate.on('change', function () {
        $endDate.datepicker('setStartDate', $startDate.datepicker('getDate'));
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
					<c:forEach var="row" items="${hsList}">
					<div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
						<!-- Room Thumbnail -->
						<div class="room-thumbnail">
							<img src="${path}/resources/img/hotel-img/${row.h_img}" alt="">
						</div>
						<!-- Room Content -->
						<div class="room-content">
							<h2>${row.h_name }</h2>
							<h4>
								&#8361;<fmt:formatNumber value="${row.h_price }" pattern="#,###" /> <span>/ Day</span>
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
						<form method="POST" name="searchDetail">
							<div class="form-group mb-30">
								<label for="checkInDate">체크인</label>
									<input type="text" class="input-small form-control" id="checkInDate"
										style="width:200px" name="checkin" placeholder="클릭하세요" value="${checkin }">
								<br>
								<label for="checkOutDate">체크아웃</label>
									<input type="text" class="input-small form-control" id="checkOutDate"
										style="width:200px" name="checkout" placeholder="클릭하세요" value="${checkout }">
							</div>
							<div class="form-group mb-30">
								<label for="guests">숙소유형</label>
								<div class="row">
									<div class="col-12">
										<select name="hotel-type" id="hotel-type" class="form-control">
											<option value="" selected>전체</option>
											<option value="호텔">호텔</option>
											<option value="팬션">팬션</option>
											<option value="게스트하우스">게스트하우스</option>
											<option value="모텔">모텔</option>
											<option value="리조트/콘도">리조트/콘도</option>
										</select>
									</div>
								</div>
							</div>
							         <div class="col-4 col-md-2" >
                                <label for="room" >Room</label>
                                <select name="room" id="room" class="form-control" >
                                    <option value="1"> 1 &nbsp;</option>
                                    <option value="2"> 2 &nbsp;</option>
                                    <option value="3"> 3 &nbsp;</option>
                                    <option value="4"> 4 &nbsp;</option>
                                    <option value="5"> 5 &nbsp;</option>
                                    <option value="6"> 6 &nbsp;</option>
                                </select>
                            </div>
                            <br><br>
							<p>
								<label for="amount"><b>Price range:</b></label> <input type="text"
									id="amount" readonly 
									style="border: 0; color: #f6931f; font-weight: bold;" >
							</p>
							<div id="slider-range" name="price"></div>
							<br><br>
							<div class="form-group">
								<button type="button" class="btn roberto-btn w-100" id="search">숙소 검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Rooms Area End -->
	<br><br><br>

	<%@ include file="../include/footer.jsp"%>

</body>

</html>