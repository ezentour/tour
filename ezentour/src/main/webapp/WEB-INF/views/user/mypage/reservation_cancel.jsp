<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board.css">
<head>
<title>EzenTour</title>

<script>
function reset(){
	location.href='${path}/mypage/user/user_reservation';
}

function reservation_cancel(){	
	if(${result == '취소불가'}){		
			alert("취소가 불가능합니다.")
	} else if(${result == '취소가능 : 환불불가'}){
		if(confirm("환불이 불가합니다. 취소확정하시겠습니까?"))
			document.form1.submit();			
	} else{
		if(confirm("취소확정하시겠습니까?"))
			document.form1.submit();			
	}
		
}
</script>
</head>
<body>

	<%@ include file="../../include/menu.jsp"%>

	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcrumb-content text-center">
						<h1 class="h1-title">예약취소</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}">Home</a></li>
								<li class="breadcrumb-item">Mypage(user)</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->


	<!-- BoardForm Start -->
	<div class="row d-flex justify-content-center">
		<div class="roberto-rooms-area section-padding-100-0">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Background Start -->
						<div class="row d-flex justify-content-center">
							<div style="width: 600px;">
								<div class="newsletter-form">
									<div align=center>
										<h5 align=center style="font-weight:bold">[예약 규정]</h5>
										<ul>
											<li>체크인 7일전 : 100% 환불</li>
											<li>체크인 2 ~ 6일전 : 50% 환불</li>
											<li>체크인 당일, 하루전 :<span style="color: red"> 환불불가</span></li>
										</ul>
									</div>
									<form name="form1" method="post" action="${path}/mypage/user/reservation_cancel.do?r_no=${reservation.r_no}&r_h_no=${reservation.r_h_no}">
										[숙소명]<input type="text" name="h_name" class="form-control"autocomplete="off" value="${reservation.h_name }" readonly="readonly">
										<fmt:parseDate value="${reservation.r_checkin.substring(0,10)}" pattern="yyyy-MM-dd" var="dayin" />
										<fmt:formatDate value="${dayin}" pattern="dd/MM/yy" var="checkin" />
										<fmt:parseDate value="${reservation.r_checkout.substring(0,10)}" pattern="yyyy-MM-dd" var="dayout" />
										<fmt:formatDate value="${dayout}" pattern="dd/MM/yy" var="checkout" /> 
										[체크인]<input type="text" name="r_checkin" class="form-control" autocomplete="off"value="${checkin }" readonly="readonly">
										[체크아웃]<input type="text" name="r_checkout"class="form-control" autocomplete="off"value="${checkout }" readonly="readonly">
										[방개수]<input type="text" name="r_room" class="form-control"autocomplete="off" value="${reservation.r_room }"readonly="readonly">
										[총 가격]<input type="text" name="r_price" class="form-control"autocomplete="off"value="${reservation.r_price }"readonly="readonly"> 
										[취소요청]
										<c:if test="${result == '취소불가' }">
											<input type="text" name="r_check" class="form-control"
												autocomplete="off" value="${result}"
												readonly="readonly" style="color: red; font-weight: bold">
										</c:if>
										<c:if test="${result != '취소불가' }">
											<input type="text" name="r_check" class="form-control"
												autocomplete="off" value="${result}"
												readonly="readonly" style="color: blue; font-weight: bold">
										</c:if>
										<br>
									</form>

									<div align=center>
										<button type="button" class="btn roberto-btn w-40"	onclick="reservation_cancel()">취소확정</button>
										<button type="button" class="btn roberto-btn w-40"	onclick="reset()">돌아가기</button>
									</div>


								</div>
							</div>
						</div>
						<br> <br>
						<!-- BackGround End -->


					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	<!-- BoardForm End -->

	<%@ include file="../../include/footer.jsp"%>

</body>
</html>