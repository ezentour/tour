<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="today" />
<!DOCTYPE html>
<html>
<%@ include file="../../include/header.jsp"%>
<head>
<title>EzenTour</title>
<style>
th {
	font-weight: bold;
	text-align: center;
}

td {
	text-align: center;
}

.roberto-btn4 {
	position: relative;
	z-index: 1;
	width: 80px;
	height: 30px;
	/*font-weight: 500;*/
	display: inline-block;
	text-align: center;
	text-transform: capitalize;
	background-color: #C8041F;
	color: #ffffff;
	border: none;
	border-radius: 2px;
	-webkit-transition-duration: 500ms;
	-o-transition-duration: 500ms;
	transition-duration: 500ms;
}

.roberto-btn5 {
	position: relative;
	z-index: 1;
	width: 80px;
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

.roberto-btn4:focus, .roberto-btn4:hover {
	font-weight: 500;
	-webkit-box-shadow: 0 2px 40px 8px rgba(15, 15, 15, 0.15);
	box-shadow: 0 2px 40px 8px rgba(15, 15, 15, 0.15);
	background-color: #ffffff;
	color: #C8041F;
}

.roberto-btn5:focus, .roberto-btn5:hover {
	font-weight: 500;
	-webkit-box-shadow: 0 2px 40px 8px rgba(15, 15, 15, 0.15);
	box-shadow: 0 2px 40px 8px rgba(15, 15, 15, 0.15);
	background-color: #ffffff;
	color: #1cc3b2;
}
</style>
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
						<h1 class="h1-title">예약 내역</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}/">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">My
									page(user)</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->

	<!-- Newsletter -->

	<!-- ui middle aligned center aligned grid -->
	<div class="roberto-rooms-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<table class="ui celled table">
						<!-- <thead style="background-color: #1CC3B2; color:white;"> -->
						<thead>
							<tr>
								<th>예약번호</th>
								<th>예약숙박</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th>방 개수</th>
								<th>결제금액</th>
								<th>취소여부</th>
								<th>예약취소</th>
							</tr>
						</thead>
						<tbody id="list">

							<c:forEach var="row" items="${list}">
								<tr>
									<td>${row.r_no}</td>
									<td><a
										href="${path}/mypage/user/hotel_detail.do?h_no=${row.r_h_no }">${row.h_name }</a></td>
									<td>${row.r_checkin.substring(0,10) }</td>
									<td>${row.r_checkout.substring(0,10) }</td>
									<td>${row.r_room }</td>
									<td>${row.r_price }</td>
									<c:if test="${row.r_cancel == 'N' }">
										<td style="color: red">${row.r_cancel }</td>
										<c:if test="${today > row.r_checkin.substring(0,10)  }">
											<td><button type="button" class="roberto-btn5" style="background:#0E2737">사용완료</button></td>
										</c:if>
										<c:if test="${today <= row.r_checkin.substring(0,10)  }">
											<td><button type="button" class="roberto-btn4"
													onclick="location.href ='${path}/mypage/user/reservation_cancel?r_no=${row.r_no }'">예약취소</button></td>
										</c:if>
									</c:if>
									<c:if test="${row.r_cancel == 'Y' }">
										<td style="color: blue">${row.r_cancel }</td>										
											<td><button type="button" class="roberto-btn5"
													onclick="alert('취소신청하셨습니다.')">취소완료</button></td>
										</c:if>								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div>
		<p>
			<br>
		</p>
	</div>

	<%@ include file="../../include/footer.jsp"%>
</body>
</html>