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
						<h2 class="page-title">숙박 승인내역</h2>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}/">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">My page (admin)</li>
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
								<th>작성 번호</th>
								<th>제목</th>
								<th>등록자</th>
								<th>등록일</th>
							</tr>
							<tr>
								<td>1</td>
								<td>게시판은 이렇게</td>
								<td>유상원</td>
								<td>2019.07.04</td>
							</tr>
						</thead>
						<tbody id="list">
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