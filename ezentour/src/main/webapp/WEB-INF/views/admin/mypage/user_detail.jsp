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
						<h1 class="h1-title">사용자 상세정보</h1>
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
	<div class="roberto-rooms-area section-padding-100-0 ">
 
		<div class="row d-flex justify-content-center">
				<div class="col-8">
						<table class="ui celled table">						
							<tr>
								<th>ID</th>
								<td>${member.m_id}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${member.m_name}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${member.m_tel}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${member.m_email}</td>
							</tr>
							<tr>
								<th>유형</th>
								<td>
									<c:if test="${member.m_field eq 'H' }">숙박업체</c:if>
									<c:if test="${member.m_field eq 'U' }">일반 사용자</c:if>
								</td>
							</tr>
							<c:if test="${member.m_field eq 'U' }">
								<tr>
									<th>예약 호텔</th>
									<td></td>
								</tr>
							</c:if>
						</table>	
				</div>
				<div class="col-8" >
				<div class="welcome-text text-center">
					<button type="button" onclick="location.href='${path}/mypage/admin/user_list'" class="btn roberto-btn w-8">목록으로</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='${path}/mypage/admin/user_update?showMID=${member.m_id}'" class="btn roberto-btn w-8">수정</button>&nbsp;&nbsp;
					<button type="button" onclick="if(confirm('탈퇴 처리하시겠습니까?')){location.href='${path}/mypage/admin/user_delete?showM_id=${member.m_id}'}" class="btn roberto-btn w-8" name="deleteBtn">삭제</button>
					<!-- <input type="button" class="btn roberto-btn w-8" value="탈퇴" id="delete"/> -->
				</div>
			</div>
        </div>
    </div>
    
    <div><p><br></p></div>
    
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>