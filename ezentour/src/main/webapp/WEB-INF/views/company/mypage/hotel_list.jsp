<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/header.jsp"%>
<head>
<title>EzenTour</title>
<style>
tr td{
text-align :center
}

th{
text-align :center
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
						<h1 class="h1-title">나의 숙소 목록 및 등록</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}/">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">My
									page (hostel)</li>
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
						<thead>
							<tr>
								<td>No.</td>
								<td>숙소이름</td>
								<td>숙소유형</td>
								<td>승인여부</td>
							</tr>
						</thead>
						<tbody id="list">
							<c:forEach var="row" items="${list}">
								<tr>
									<th>${row.h_no}</th>
									<td><a href="${path}/mypage/company/hotel_detail.do?h_no=${row.h_no }">${row.h_name }</a></td>
									<td>${row.h_type }</td>		
									<td>${row.h_approve }</td>						
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-12">
					<div class="welcome-text text-center">
						<a href="${path}/mypage/company/hotel_insert"
							class="btn roberto-btn mt-30" data-animation="fadeInUp"
							data-delay="700ms">숙소 등록</a>
					</div>
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