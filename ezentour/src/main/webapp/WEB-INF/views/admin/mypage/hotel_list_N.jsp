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
	width: 50px;
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
<script>
	function approve(str) {
		if (confirm("승인하시겠습니까?")) {
			location.replace(str);
		}
	}
	
	function approve_no(str) {
		if (confirm("승인거부하시겠습니까?(숙박목록에서 삭제됩니다.)")) {
			location.replace(str);
		}
	}
</script>
<body>

	<%@ include file="../../include/menu.jsp"%>
	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcrumb-content text-center">
						<h1 class="h1-title">숙박 승인대기</h1>
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
								<td>번호</td>
								<td>숙박이름</td>
								<td>숙박유형</td>
								<td>승인여부</td>
								<td></td>
							</tr>
						</thead>
						<tbody id="list">
							<c:forEach var="row" items="${list}">
								<tr>
									<td>${row.h_no}</td>
									<td><a
										href="${path}/mypage/admin/hotel_detail.do?h_no=${row.h_no }"
										style="font-weight: bold">${row.h_name }</a></td>
									<td>${row.h_type }</td>
									<td>${row.h_approve }</td>
									<td><button type="button" class="roberto-btn4"
											onclick="approve('${path}/mypage/admin/hotel_approve_update?h_no=${row.h_no }')">승인</button>
										<button type="button" class="roberto-btn4" style="background-color : #C8041F"
											onclick="approve_no('${path}/mypage/admin/hotel_approve_delete?h_no=${row.h_no }')">거부</button></td>
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