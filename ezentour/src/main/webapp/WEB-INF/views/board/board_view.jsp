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
		var m_id = document.getElementById("m_id");
		
		$("#list").click(function() {
			document.boardView.action="${path}/board/main?page=1";
			document.boardView.submit();
		});
		$("#update").click(function() {
			document.boardView.action="${path}/board/${dto.b_no}";
			document.boardView.submit();
		});
		$("#delete").click(function() {
			document.boardView.action="${path}/board/delete.do?b_no=${dto.b_no}";
			document.boardView.submit();
		});
		$("#comment").click(function() {
			if(m_id==null){
				alert("로그인 하세요");
			}else if("${m_id}"!="${dto.b_m_id}"&&"${m_field}"=="U"){// m_id 로그인 아이디, dto.b_m_id 게시글 작성 아이디 
				alert("권한이 없습니다.");
			}else if($("#exampleFormControlTextarea1").val()==""){
				alert("내용을 입력하세요");
			} else{
				document.c_content.action="${path}/board/comment.do?c_b_no=${dto.b_no}" ;
				document.c_content.submit();
			}
		});
	});
	
	</script>
	<style>
					.balloon {
		    display: inline-block;
		    position: relative;
		    background: #e8f1f8;
		    height: auto;
		    width: auto;
		    margin: 0 auto 50px;		   
		    border-radius: 11px;
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
						<div class="col-12" >
						
					</div>
					</form>
					<br><br>
					<hr>
					<br><br>
					<div class="welcome-text text-center">
							<c:if test="${sessionScope.m_id == dto.b_m_id}">
							<input type="button" class="btn roberto-btn w-10" value="수정" id="update"/>
							<input type="button" class="btn roberto-btn w-10" value="삭제" id="delete"/>
							</c:if>
							<input type="button" class="btn roberto-btn w-10" value="목록" id="list"/>
						</div>
					<br><br><br><br>
					<!-- 댓글 테이블 -->
					<form name="commentDeleteForm" method="post" >
						<table>
							<c:forEach var="row" items="${list}">
								<tr>
									<td class="balloon" style="word-break:break-all; padding-left:12px; padding-right:12px;  " valign="top"> <span>[${row.c_regdate.substring(0,10)} &nbsp;&nbsp;${row.c_m_id}]</span> <br> ${row.c_content} &nbsp;&nbsp;&nbsp;
										<c:if test="${m_id==row.c_m_id }">
											<a href="${path}/board/commentDelete?c_b_no=${row.c_b_no}&c_no=${row.c_no}&c_m_id=${row.c_m_id}">
													<img src="${path}/resources/img/x.png" width="10px" height="10px">
											</a>
										</c:if>
										&nbsp;&nbsp;
											<br>
									</td>
								</tr>
							</c:forEach>	
						</table>
					</form>
						<br><br>
							
					<form name="c_content" method="post" enctype="multipart/form-data">
			                <div class="form-group">
			                    <label for="exampleFormControlInput1"><b>댓글...</b></label>
			                </div>
			                <div class="form-group">
			                    <textarea class="form-control" id="exampleFormControlTextarea1" name="c_content" cols="30" rows="3"></textarea>
			                </div>
			                  <div>
			                    <button type="button" class="btn btn-info" id="comment" style="float: right">등록</button>&nbsp;
			                   </div> 
			            </form>
					</div>
					</div>
					</div><br><br><br>
					<!-- Background End -->
				</div>
            </div>
        </div>
    </div>
    
    <div><p><br></p></div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>