<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>

<head>
	<title>EzenTour</title>
	
	<style>
		table {
			text-align:center;
		}
		a:hover {
			color:#1AC2B2;
		}
	</style>
</head>
<body>

	<%@ include file="../include/menu.jsp"%>
	
	<!-- Breadcrumb Area Start -->
	<div class="breadcrumb-area bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/16.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcrumb-content text-center">
						<h1 class="h1-title">자유게시판</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}">Home</a></li>
								<li class="breadcrumb-item">자유게시판</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->
	
	<!-- ui middle aligned center aligned grid -->
	<div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
          <div class="row">
				<div class="col-12">
				  <!-- Single Footer Widget Area -->
                     <div class="col-12 col-sm-8 col-lg-4 float-right">
                        <div class="single-footer-widget mb-80">
							<!-- Newsletter Form -->
                   	 		<form action="${path}/board/search" class="nl-form">
                    			<input type="text" class="form-control" name="search"  placeholder="Search">
                    			<button type="submit">
                    				<i class="fa fa-search" aria-hidden="true"></i>
                    			</button>
                  			</form>
                  		</div>
                  	</div>
                    
					<table class="ui celled table">
						<thead>
							<tr>
								<th>글번호</th>
								<th>글제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<td>${row.b_no}</td>
									<td>
										<a href="${path}/board/view.do?b_no=${row.b_no}">${row.b_title}</a>
									</td>
									<td>${row.b_m_id}</td>
									<td><fmt:formatDate value="${row.b_regdate}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-12" >
					<div class="welcome-text text-center">
						<a href="${path}/board/write.do" class="btn roberto-btn mt-30" data-animation="fadeInUp" data-delay="700ms" id="write">글쓰기</a>
					</div>
				</div>
				<nav class="roberto-pagination wow fadeInUp mb-100"
							data-wow-delay="2ms">
							<ul class="pagination">
				<c:forEach var="i" begin="1" end="${totalPage}">
								<li class="page-item"><a class="page-link" href="${path}/board/main?page=${i}">${i}</a></li>
				</c:forEach>
								<li class="page-item"><a class="page-link" href="${path}/board/main?page=${curPage+1}">Next
										<i class="fa fa-angle-right"></i>
								</a></li>
							</ul>
						</nav>
				
            </div>
        </div>
    </div>
    
    <div><p><br></p></div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>