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
						<h1 class="h1-title">장바구니</h1>
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
                    <img src="${path}/resources/img/cart.PNG" align="left"><h2 style="height:auto;">장바구니</h2>
					<table class="ui celled table">
						<thead>
							<tr>
								<td>번호</td>
								<td>호텔 번호</td>
								<td>아이디</td>
								<td>체크인</td>
								<td>체크아웃</td>
							</tr>
						</thead>
						<tbody id="list">
						<c:forEach var="row" items="${list}">
							<tr>
								<td>${row.s_no}</td>
								<td>${row.s_h_no}</td>
								<td>${row.s_m_id}</td>
								<td>${row.s_checkin}</td>
								<td>${row.c_checkout}</td>
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