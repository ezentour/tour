<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="include/header.jsp"%>
<head>
    <title>EzenTour</title>
    <script>
	    $(function() {
	      var $startDate = $('#checkIn');
	      var $endDate = $('#checkOut');
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
	<style>
	#date {
		display: inline;
	}
	</style>
</head>
<!-- bootstrap 위치 지정 : https://getbootstrap.com/docs/4.0/utilities/flex/ -->
<body>
	
	<%@ include file="include/menu.jsp" %>

    <!-- Welcome Area Start -->
    <section class="welcome-area">
        <div class="welcome-slides owl-carousel">
            <!-- Single Welcome Slide -->
            <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(${path}/resources/img/bg-img/16.jpg);" data-img-url="${path}/resources/bg-img/16.jpg">
                <!-- Welcome Content -->
                <div class="welcome-content h-100">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <!-- Welcome Text -->
                            <div class="col-12">
                                <div class="welcome-text text-center">
                                    <h6 data-animation="fadeInLeft" data-delay="200ms">Hotel &amp; Trip</h6>
                                    <h1 data-animation="fadeInLeft" data-delay="500ms" class="h1-title-main">Welcome To EzenTour</h1>
                                    <a href="${path}/hotel/main" class="btn roberto-btn btn-2" data-animation="fadeInLeft" data-delay="800ms">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Welcome Slide -->
            <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(${path}/resources/img/bg-img/17.jpg);" data-img-url="img/bg-img/17.jpg">
                <!-- Welcome Content -->
                <div class="welcome-content h-100">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <!-- Welcome Text -->
                            <div class="col-12">
                                <div class="welcome-text text-center">
                                    <h6 data-animation="fadeInUp" data-delay="200ms">Hotel &amp; Trip</h6>
                                    <h1 data-animation="fadeInUp" data-delay="500ms" class="h1-title-main">Welcome To EzenTour</h1>
                                    <a href="${path}/hotel/main" class="btn roberto-btn btn-2" data-animation="fadeInUp" data-delay="800ms">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Welcome Slide -->
            <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(${path}/resources/img/bg-img/18.jpg);" data-img-url="img/bg-img/18.jpg">
                <!-- Welcome Content -->
                <div class="welcome-content h-100">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <!-- Welcome Text -->
                            <div class="col-12">
                                <div class="welcome-text text-center">
                                    <h6 data-animation="fadeInDown" data-delay="200ms">Hotel &amp; Trip</h6>
                                    <h1 data-animation="fadeInDown" data-delay="500ms" class="h1-title-main">Welcome To EzenTour</h1>
                                    <a href="${path}/hotel/main" class="btn roberto-btn btn-2" data-animation="fadeInDown" data-delay="800ms">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Welcome Area End -->

    <!-- About Us Area Start -->
    <section class="roberto-about-area section-padding-100-0">
        <!-- Hotel Search Form Area -->
        <div class="hotel-search-form-area">
            <div class="container-fluid">
                <div class="hotel-search-form">
                    <form action="${path}/search.do" name="searchForm" method="post">
                        <div class="row justify-content-between align-items-end">
                        	<div class="col-6 col-md-2">
                                <label for="">지역</label>
                                <select name="h_address" id="" class="form-control">
                                    <option value="서울">서울</option>
                                    <option value="경기">경기도</option>
                                    <option value="인천">인천</option>
                                    <option value="강원">강원도</option>
                                    <option value="충청">충청도</option>
                                    <option value="대전">대전</option>
                                    <option value="전라">전라도</option>
                                    <option value="광주">광주</option>
                                    <option value="경상">경상도</option>
                                    <option value="부산">부산</option>
                                    <option value="대구">대구</option>
                                    <option value="울산">울산</option>
                                </select>
                              </div>
                              <div>
								<label for="">체크인</label>
										<input type="text" class="input-small form-control" id="checkIn" name="checkin-date" autocomplete="off" 
											style="width:150px" placeholder="클릭하세요">
								
								</div>
								<div>
								<label for="">체크아웃</label>
									    <input type="text" class="input-small form-control" id="checkOut" name="checkout-date" autocomplete="off" 
											style="width:150px" placeholder="클릭하세요">
								</div>
                            <!-- 네모박스 크기 늘리기 : col-md-1의 숫자 늘리기 -->
                            <div class="col-4 col-md-2">
                                <label for="room">Room</label>
                                <select name="room" id="room" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                </select>
                            </div>
                            <div class="col-4 col-md-2">
                                <label for="hotel-type">숙소</label>
                                <select name="hotel-type" id="hotel-type" class="form-control">
                                    <option value="호텔">호텔</option>
                                    <option value="펜션">펜션</option>
                                    <option value="게스트하우스">게스트하우스</option>
                                    <option value="리조트/콘도">리조트/콘도</option>
                                </select>
                            </div>
                            </div>
                            <div class="row d-flex justify-content-center">
                            <div class="col-12 col-md-3">
                                <button type="submit" class="form-control btn roberto-btn w-100" id="search">검색하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


    <%@ include file="include/footer.jsp" %>

</body>

</html>