<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<h1 class="h1-title">사용자목록</h1>
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
								<th>No</th>
								<th>ID</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>유형</th>
							</tr>
						</thead>
						<tbody id="list">
							<c:set var="cnt" value="0" />
							<c:forEach var="row" items="${mList}">
								<c:set var="cnt" value="${cnt + 1}"/>
								<tr>
									<td>${cnt}</td>
									<td><a href="${path}/mypage/admin/user_detail?showM_id=${row.m_id}" style="color:#1CC3B2">${row.m_id}</a></td>
									<td>${row.m_name}</td>
									<td>${row.m_tel}</td>
									<td>
										<c:if test="${row.m_field eq 'H' }">숙박업체</c:if>
										<c:if test="${row.m_field eq 'U' }">일반 사용자</c:if>
									</td>
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