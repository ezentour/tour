<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 70px;
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
						<h1 class="h1-title">관리자매출액</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}/">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">My
									page (admin)</li>
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
								<th>예약번호</th>
								<th>관리자이익</th>
								<th>매출상세</th>
							</tr>
						</thead>
						<c:set var="sum" value="0" />
						<tbody id="list">

							<c:forEach var="row" items="${list}">
								<tr>
									<td>${row.p_r_no}</td>

									<c:if test="${row.p_admin == 0}">
										<td>${row.p_admin}<span style="color: red">(환불
												100%)</span></td>
									</c:if>
									<c:if test="${row.p_admin != 0}">
										<td>${row.p_admin}</td>
									</c:if>
									<c:set var="sum" value="${sum + row.p_admin}" />
									<td><button type="button" class="roberto-btn4"
											onclick="location.href ='${path}/mypage/admin/grossprofit_detail?p_r_no=${row.p_r_no }'">상세보기</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="3">관리자 총 매출액 <br><span style="color:blue; font-size:1.5em"><c:out value="${sum}" /></span>
								</th>
							</tr>
						</tfoot>
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