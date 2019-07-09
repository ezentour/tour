<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/header.jsp"%>

<head>
    <title>EzenTour</title>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="//cdn.poesis.kr/post/search.min.js" charset="UTF-8"></script>
    <!--[if IE 6]><script type="text/javascript" src="http://cdn.poesis.kr/post/search.min.js"></script><![endif]-->
    <link rel="stylesheet" type="text/css" href="//cdn.poesis.kr/post/search.css" media="all" />
</head>
<style>
	div.postcodify_search_form {
	    clear: both; margin: 12px; padding: 0; position: relative;
	    font: 13px/160% "Malgun Gothic", "Gulim", sans-serif;
	    width:500px;
	}
	label { display: block; width: 100px; }
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
	
	
	<!-- ui middle aligned center aligned grid -->
	<div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
          <div class="row">
				<div class="col-12" >
				
				<!-- -------------------------------------------------------------------------- -->
					
					<h2>주소 입력</h2>
										
					<div class="postcodify_search_form">
						<div class="alert alert-info" role="alert">
						<!-- <div class="graybox" style="line-height:220%"> -->
						    <label for="ex1_pc5">우편번호</label>
						    <input type="text" id="ex1_pc5" class="example_pcfull postcodify_postcode5" value="" style="width:100px;" readonly/>
						    <button id="ex1_button" class="example_button">검색</button>
						    <br />
						    <label for="ex1_input1">도로명주소</label>
						    <input type="text" id="ex1_input1" class="example_input postcodify_address" value="" style="width:250px;" readonly/>
						    <br />
						    <label for="ex1_input2">상세주소</label>
						    <input type="text" id="ex1_input2" class="example_input postcodify_details" value="" style="width:250px;" />
						    <br />
						    <label for="ex1_input3">참고항목</label>
						    <input type="text" id="ex1_input3" class="example_input postcodify_extra_info" value="" style="width:250px;" readonly/>
						    <br />
						</div>
						
						<script type="text/javascript">
						    $(function() { $("#ex1_button").postcodifyPopUp({ forceDisplayPostcode5 : true }); });
						</script>
					
					</div>
					
					
					<!-- 검색 도움말 -->
					
					<div class="alert alert-secondary" role="alert" style="width:70%">
					    <p>검색 요령</p>
					    <ul>
					        <li>도로명주소 검색 : 도로명과 건물번호를 입력하세요. &nbsp; 예: <span>세종대로 110</span></li>
					        <li>지번주소 검색 : "동" 또는 "리" 이름과 번지수를 입력하세요. &nbsp; 예: <span>연산동 1000</span></li>
					        <li>건물명 검색 : 빌딩 또는 아파트 이름을 입력하세요. &nbsp; 예: <span>방배동 래미안</span>, <span>수곡동 주공3차</span></li>
					        <li>사서함 검색 : 사서함 이름과 번호를 입력하세요. &nbsp; 예: <span>광화문우체국사서함 123-4</span></li>
					    </ul>
					    <br><br>
					    <p>주의사항</p>
					    <ul>
					        <li>시·군·구·읍·면 등은 쓰지 않아도 되지만, 만약 쓰실 경우 반드시 띄어쓰기를 해 주세요.</li>
					        <li>도로명에 "××번길" 등이 포함되어 있는 경우에도 잊지 말고 써 주세요.</li>
					        <li>건물명보다는 도로명주소 또는 지번 주소로 검색하시는 것이 빠르고 정확합니다.</li>
					    </ul>
					</div>    
					
										
					<!-- -------------------------------------------------------------------------- -->
					
				</div>
            </div>
        </div>
    </div>
    
    <div><p><br></p></div>
	
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
                            <a href="${path}" class="footer-logo"><img src="${path}/resources/img/core-img/ezenlogo2.png" alt=""></a>

                        </div>
                    </div>
                    
                     <div class="col-12 col-sm-6 col-lg-9">
                        <div class="single-footer-widget mb-80">
                          
                            <h4>+82 042-1234-1234</h4>
                            <span>ezentour@ezen.com</span>
                            <span>대전광역시 서구 대덕대로 325 스타게이트 7층</span>
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
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>document.write(new Date().getFullYear());</script>
							All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i>
							by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
