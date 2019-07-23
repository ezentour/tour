<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/header.jsp"%>
<head>
<title>EzenTour</title>

<style>
tr td {
	text-align: center
}

th {
	text-align: center
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
						<h1 class="h1-title">매출상세현황</h1>
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
				<h4 style="font-weight:bold">예약번호 [ ${p_r_no } ]</h4>
					<table class="ui celled table">
						<thead>
							<tr>
								<th></th>
								<th>결제금액</th>
								<th>관리자매출</th>
								<th>숙박업매출</th>
							</tr>
						</thead>
						<tbody id="list">
						<c:set var="i" value="y" />
							<c:forEach var="row" items="${list}">
							<tr >	
									<c:if test="${i == 'y'}">
									<td>예약</td>
									</c:if>
									<c:if test="${i == 'n'}">
									<td>취소</td>
									</c:if>
									<c:if test = "${row.p_admin < 0 && row.p_hostel < 0 && row.p_room < 0}">
									<td style="color:red">${row.p_room }</td>
									<td style="color:red">${row.p_admin}</td>
									<td style="color:red">${row.p_hostel }</td>
									</c:if>
									<c:if test = "${row.p_admin > 0 && row.p_hostel > 0 && row.p_room > 0}">
									<td style="color:blue">${row.p_room }</td>
									<td style="color:blue">${row.p_admin}</td>
									<td style="color:blue">${row.p_hostel }</td>
									</c:if>
							</tr>			
							<c:set var="i" value="n" />				
							</c:forEach>						
						</tbody>
						<tfoot>
							<tr>		
								<th>총 금액</th>						
								<th>= ${total.p_room  }</th>
								<th>= ${total.p_admin  }</th>
								<th>= ${total.p_hostel  }</th>
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