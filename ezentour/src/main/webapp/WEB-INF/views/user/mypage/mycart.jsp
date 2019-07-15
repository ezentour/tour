<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/header.jsp"%>
<head>
	<title>EzenTour</title>
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
						<img src="${path}/resources/img/cart.PNG" align="left"><h1 class="h1-title" style="height:auto;">장바구니</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">My page(user)</li>
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
				  <!-- Single Footer Widget Area -->
                     <div class="col-12 col-sm-8 col-lg-4 float-right">
                        <div class="single-footer-widget mb-80">
							<!-- Newsletter Form -->
                   	 		<form action="#" class="nl-form">
                    			<input type="text" class="form-control" placeholder="Search">
                    			<button type="submit">
                    				<i class="fa fa-search" aria-hidden="true"></i>
                    			</button>
                  			</form>
                  		</div>
                  	</div>
					<table class="ui celled table">
						<thead>
							<tr>
								<td>번호</td>
								<td>호텔</td>
								<td>체크인</td>
								<td>체크아웃</td>
								<td> </td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<td>${row.s_no}</td>
									<td>${row.h_name}</td>
									<td>${row.s_checkin.substring(0,10)}</td>
									<td>${row.c_checkout.substring(0,10)}</td>
									<td><img src="${path}/resources/img/hotel-img/${row.h_img}" width="70px" height="70px"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-12" >
					<div class="welcome-text text-center">
						<a href="#" class="btn roberto-btn mt-30" data-animation="fadeInUp" data-delay="700ms">글쓰기</a>
					</div>
				</div>
            </div>
        </div>
    </div>
    
    <div><p><br></p></div>
    
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>