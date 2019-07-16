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
	
	<script>
	$(
			function() {
				$("#delete")
						.click(
								function() {
									if (confirm("취소하시겠습니까?")) {
										document.form1.action = "${path}/mypage/company/hotel_delete.do?h_no=${hotel.h_no}";
										document.form1.submit();
									}
								});
				$("#update")
						.click(
								function() {
									if (confirm("예약확정하시겠습니까?")) {
											document.form1.action = "${path}/mypage/company/hotel_update.do?h_no=${hotel.h_no}";
											document.form1.submit();
										}
									}
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
	
<br><br>
	<div class="row d-flex justify-content-center">
		<div style="width: 400px;">
			<div class="newsletter-form">
				<form name ="form1" method="post">
					<input type="text" name="h_name"  class="form-control" autocomplete="off" value="${reservation.h_name }" readonly="readonly"> 						
					<input type="text" name="r_checkin"  class="form-control" autocomplete="off" value="${reservation.r_checkin }" readonly="readonly"> 
					<input type="text" name="r_checkin"  class="form-control" autocomplete="off"  value="${reservation.r_checkout }" readonly="readonly"> 
					<input type="text" name="r_room"  class="form-control" autocomplete="off"  value="${reservation.r_room }" readonly="readonly">
					<input type="text" name="h_price"  class="form-control" autocomplete="off"  value="${reservation.h_price}" readonly="readonly">
						<button type="button" class="btn roberto-btn w-40" id="update">예약확정</button>
						<button type="button" class="btn roberto-btn w-40" id="delete">예약취소</button>
				</form>
			</div>
		</div>
	</div>
    
    <div><p><br></p></div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>