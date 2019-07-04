    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Header Area Start -->
    <header class="header-area">
        <!-- Search Form -->
        <div class="search-form d-flex align-items-center">
            <div class="container">
                <form action="index.html" method="get">
                    <input type="search" name="search-form-input" id="searchFormInput" placeholder="Type your keyword ...">
                    <button type="submit"><i class="icon_search"></i></button>
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
                        <a class="nav-brand" href="index.html"><img src="${path}/resources/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">
                            <!-- Menu Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>
                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul id="nav">
                                    <li class="active"><a href="${path}/festival/main">축제</a></li>
                                    <li><a href="${path}/tour/main">관광</a></li>
                                    <li><a href="${path}/hotel/main">숙박</a></li>
                                    <li><a href="${path}/question/main">문의사항</a></li>
                                    <li><a href="${path}/mypage/user/main">마이(사용자)</a>
                                        <ul class="dropdown">
                                            <li><a href="">- 예약 내역</a></li>
                                            <li><a href="">- 장바구니</a></li>                                       
                                        </ul>
                                    </li>
                                    
                                    <li><a href="${path}/mypage/admin/main">마이(관리자)</a>
                                        <ul class="dropdown">
                                            <li><a href="">- 사용자 목록</a></li>
                                            <li><a href="">- 숙박업체 목록</a>
                                            	 <ul class="">
                                                    <li><a href="">- 승인 대기</a></li>
                                                    <li><a href="">- 승인 목록</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>      
                                    <li><a href="${path}/mypage/company/main">마이(숙박업)</a>
                                        <ul class="dropdown">
                                            <li><a href="">- 숙박 등록</a></li>
                                            <li><a href="">- 예약 내역</a></li>
                                        </ul>
                                    </li>   
                                                        
                                </ul>

                                <!-- Search -->
                                <!-- 
                                <div class="search-btn ml-4">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </div>
 								-->
                                <!-- Book Now -->
                                <!-- 
                                <div class="book-now-btn ml-3 ml-lg-5">
                                    <a href="#">Book Now <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                </div>
                                -->
                                
                                <div class="">
                          	     	<a href="${path}/member/login.do">로그인</a>&nbsp;&nbsp;&nbsp;
                                	<a href="${path}/member/signUp.do">회원 가입</a>
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