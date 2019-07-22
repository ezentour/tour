<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/header.jsp"%>
<head>
	<title>EzenTour</title>
	<style>
	th{
		font-weight:bold;
		text-align:center;
	}
	td{
		text-align:center;
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
						<h1 class="h1-title">숙소 예약내역</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}/">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">My page (hostel)</li>
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
									</c:if>
									<c:if test="${row.r_cancel == 'Y' }">
										<td style="color: blue">${row.r_cancel }</td>	
										</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>				
            </div>
        </div>
    </div>
    
    <div><p><br></p></div>
    
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>