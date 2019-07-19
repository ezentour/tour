<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Preloader -->
<div id="preloader">
	<div class="loader"></div>
</div>
<!-- /Preloader -->

<!-- Header Area Start -->
<header class="header-area">
	<!-- Search Form -->
	<div class="search-form d-flex align-items-center">
		<div class="container">
			<form action="index.html" method="get">
				<input type="search" name="search-form-input" id="searchFormInput"
					placeholder="Type your keyword ...">
				<button type="submit">
					<i class="icon_search"></i>
				</button>
			</form>
		</div>
	</div>

	<!-- Main Header Start -->
	<div class="main-header-area">
		<div class="classy-nav-container breakpoint-off">
			<div class="container">
				<!-- Classy Menu -->
				<nav class="classy-navbar justify-content-between" id="robertoNav">

					<!-- Logo -->
					<a class="nav-brand" href="${path}"><img src="${path}/resources/img/core-img/ezenlogo.png" alt=""></a>

					<!-- Navbar Toggler -->
					<div class="classy-navbar-toggler">
						<span class="navbarToggler"><span></span></span>
					</div>

					<c:set var="username" value="${m_name}" />				


					<!-- Menu -->
					<div class="classy-menu">
						<!-- Menu Close Button -->
						<div class="classycloseIcon">
							<div class="cross-wrap">
								<span class="top"></span><span class="bottom"></span>
							</div>
						</div>
						<!-- Nav Start -->
						<div class="classynav">
							<ul id="nav">
								<li class="active"><a href="${path}/festival/main">축제</a></li>
								<li><a href="${path}/tour/main">관광</a></li>
								<li><a href="${path}/hotel/main">숙소</a></li>
								<li><a href="${path}/board/main?page=1&search= ">자유게시판</a></li>

								<!-- 접속 계정에 따라 메뉴바 다르게 보이기 -->

								<c:if test="${m_field == 'U'}">
									<!-- 일반 사용자 메뉴바 -->
									<li><a href="#">마이페이지</a>
										<ul class="dropdown">
											<li><a href="${path}/mypage/user/user_reservation">- 예약 내역</a></li>
											<li><a href="${path}/mypage/user/mycart?page=1">- 장바구니</a></li>
										</ul></li>
								</c:if>
								<!-- 관리자 메뉴바 -->
								<c:if test="${m_field == 'A'}">
									<li><a href="#">마이페이지</a>
										<ul class="dropdown">
											<li><a href="${path}/mypage/admin/user_list">- 사용자 목록</a></li>
											<li><a href="#">- 숙박업체 목록</a>
												<ul class="dropdown">
													<li><a href="${path}/mypage/admin/hotel_list_N">- 승인 대기</a></li>
													<li><a href="${path}/mypage/admin/hotel_list_Y">- 승인 목록</a></li>
												</ul></li>
												<li><a href="${path}/mypage/admin/grossprofit">- 매출액 관리</a></li>
										</ul></li>
								</c:if>

								<c:if test="${m_field == 'H'}">
									<!-- 숙박업체 메뉴바 -->
									<li><a href="#">마이페이지</a>
										<ul class="dropdown">
											<li><a href="${path}/mypage/company/hotel_list.do">- 숙소 목록 및 등록</a></li>
											<li><a href="${path}/mypage/company/reservation">- 예약 내역</a></li>
										</ul></li>
								</c:if>
							</ul>

							<div class="" >
	
								<c:choose>
									<c:when test="${empty username}">
										<a href="${path}/member/login.do">로그인</a>&nbsp;&nbsp;&nbsp;
	                          	     		<a href="${path}/member/signUp.do">회원
											가입</a>
									</c:when>
									<c:otherwise>
										<span style="font-size: 0.9em;" id="m_id">${username}님
											환영합니다.</span>&nbsp;&nbsp;
	                                		<a href="${path}/member/logout.do">로그아웃</a>
									</c:otherwise>
								</c:choose>
							</div>

						</div>

						<!-- Nav End -->
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- Header Area End -->