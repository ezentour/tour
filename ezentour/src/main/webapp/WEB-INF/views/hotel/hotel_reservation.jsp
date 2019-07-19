<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>

<head>
<title>EzenTour</title>

<style>
table {
	text-align: center;
}

a:hover {
	color: #1AC2B2;
}

input {
	font-weight: bold;
}
</style>

<script>
	function cancel(){
		if(confirm("예약취소하시겠습니까?"))
			location.href='${path}/hotel/main';
	}
	
	function reservation(){		
		if(!${reservation.check}){
			if(${reservation.result == '예약가능'}){		
				if(confirm("예약확정하시겠습니까?"))
					document.form1.submit();
			} else {
				alert("예약불가입니다.");
			}
		} else 
			alert("이미 예약되어있습니다.");		
	}
	
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
						<h1 class="h1-title">예약확인요청</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="${path}">Home</a></li>
								<li class="breadcrumb-item">예약확인요청</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->

	<br>
	<br>
	<div class="row d-flex justify-content-center">
		<div style="width: 400px;">
			<div class="newsletter-form">
				<form name="form1" method="post"
					action="${path}/mypage/user/reservation?r_h_no=${reservation.h_no}">
					[숙소명]<input type="text" name="h_name" class="form-control"
						autocomplete="off" value="${reservation.h_name }"
						readonly="readonly"> [체크인]<input type="text"
						name="r_checkin" class="form-control" autocomplete="off"
						value="${reservation.r_checkin }" readonly="readonly">
					[체크아웃]<input type="text" name="r_checkout" class="form-control"
						autocomplete="off" value="${reservation.r_checkout }"
						readonly="readonly"> [방개수]<input type="text" name="r_room"
						class="form-control" autocomplete="off"
						value="${reservation.r_room }" readonly="readonly"> [1박가격]<input
						type="text" name="h_price" class="form-control" autocomplete="off"
						value="${reservation.h_price}" readonly="readonly"> [총 가격]<input
						type="text" name="r_price" class="form-control" autocomplete="off"
						value="${reservation.h_price * reservation.r_room }"
						readonly="readonly"> [예약요청]
						<c:if test = "${reservation.result == '예약가능' }">
						<input type="text"
						name="r_check" class="form-control" autocomplete="off"
						value="${reservation.result}" readonly="readonly"
						style="color: blue; font-weight: bold">
						</c:if>
						<c:if test = "${reservation.result != '예약가능' }">
						<input type="text"
						name="r_check" class="form-control" autocomplete="off"
						value="${reservation.result}" readonly="readonly"
						style="color: red; font-weight: bold">
						</c:if>
						<br>
						
					<div align=center>
						<button type="button" class="btn roberto-btn w-40"
							onclick="reservation()">예약확정</button>
						<button type="button" class="btn roberto-btn w-40"
							onclick="cancel()">예약취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div>
		<p>
			<br>
		</p>
	</div>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>