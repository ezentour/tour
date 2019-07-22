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
						<h1 class="h1-title" style="height: auto;">장바구니</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}">Home</a></li>
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

					
					<img src="${path}/resources/img/cart.PNG" align="left" height="100px" />
					<br>
					
				
						<form action="${path}/mypage/user/delete" method="post">
						
							<table class="ui celled table">
								<thead>
									<tr>
										<th></th>
										<th>번호</th>
										<th>숙소이름</th>
										<th>체크인</th>
										<th>체크아웃</th>
										<th>숙소사진</th>										
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${list}">
										<tr>
											<td><input type="checkbox" name="check" value="${row.s_no}"></td>
											<td>${row.s_no}</td>
											<td><a href="${path}/mypage/user/hotel_detail.do?h_no=${row.h_no }">${row.h_name}</a></td>
										<fmt:parseDate value="${row.s_checkin.substring(0,10)}" pattern="yyyy-MM-dd" var="dayin" />
										<fmt:formatDate value="${dayin}" pattern="dd/MM/yy" var="checkin" />
										<fmt:parseDate value="${row.c_checkout.substring(0,10)}" pattern="yyyy-MM-dd" var="dayout" />
										<fmt:formatDate value="${dayout}" pattern="dd/MM/yy" var="checkout" /> 
											<td>${checkin}</td>
											<td>${checkout}</td>
											<td><img
												src="${path}/resources/img/hotel-img/${row.h_img}"
												width="70px" height="70px" />
											</td>											
											<td>											
											<button type="button" class="roberto-btn5"	onclick="location.href ='${path}/mypage/user/reserve.do?h_no=${row.h_no }&checkin=${checkin }&checkout=${checkout }'">예약하기</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
									<tfoot>
										<tr>
											<td colspan="7" align="center">
												<div class="col-12">
													<div class="welcome-text text-center">
														<button type="submit" class="btn roberto-btn mt-30"
															data-animation="fadeInUp" data-delay="700ms">장바구니 삭제</button>
													</div>
												</div>
											</td>
										</tr>
									</tfoot>
						</table>
				</form>
					<nav class="roberto-pagination wow fadeInUp mb-100"
							data-wow-delay="2ms">
							<ul class="pagination">
				<c:forEach var="i" begin="1" end="${totalPage}">
								<li class="page-item"><a class="page-link" href="${path}/mypage/user/mycart?page=${i}">${i}</a></li>
				</c:forEach>
								<li class="page-item"><a class="page-link" href="${path}/mypage/user/mycart?page=${curPage+1}">Next
										<i class="fa fa-angle-right"></i>
								</a></li>
							</ul>
						</nav>
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