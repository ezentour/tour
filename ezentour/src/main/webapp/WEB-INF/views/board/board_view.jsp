<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board.css">
<head>
	<title>EzenTour</title>
	<script>
	$(function() {
		$("#list").click(function() {
			document.boardView.action="${path}/board/main";
			document.boardView.submit();
		});
		
	})
	</script>
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
                     
                    <!-- Background Start -->
					<div class="row d-flex justify-content-center">
					<div style="width:1200px;">
					<div class=""> 
					
                    <form action="" name="boardView" method="post">
						<div id="title">
							<p id="p_title">${dto.b_title}</p>
						</div>
						<div id="id">
							<p>${dto.b_m_id}</p>
						</div>
						<div id="date">
							<p><fmt:formatDate value="${dto.b_regdate}" pattern="yyyy-MM-dd  HH:mm"/></p>
						</div>
						<table class="ui celled table">
							<tr>
								<td id="content">${dto.b_content}</td>
							</tr>
						</table>
					</form>
					
					</div>
					</div>
					</div><br><br><br>
					<!-- Background End -->
				

					<div class="col-12" >
						<div class="welcome-text text-center">
							<input type="button" class="btn roberto-btn w-10" value="수정" id="cancel"/>
							<input type="button" class="btn roberto-btn w-10" value="삭제" id="cancel"/>
							<input type="button" class="btn roberto-btn w-10" value="목록" id="list"/>
						</div>
					</div>
				</div>
            </div>
        </div>
    </div>
    
    <div><p><br></p></div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>