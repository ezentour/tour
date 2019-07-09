<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
	<title>EzenTour</title>

	<script>
	$(function() {
		$("#cancel").click(function() {
			if(confirm("취소하시겠습니까?")) {
				document.writeForm.action="${path}/question/main";
				document.writeForm.submit();
			}
		});
		
	})
	</script>
	<script type="text/javascript">
	<script>
	 
	$('#BSbtndanger').filestyle({
	 
	buttonName : 'btn-danger',
	 
	buttonText : ' File selection'
	 
	});
	</script>
	<style>
	.file_input_textbox {float:left;width:300px;}
	
	.file_input_div{position:relative;width:100px;height:23px;overflow:hidden;}
	
	.file_input_button{width:300px;position:absolute; top:0px; background-color:#aaa; color:#fff; border-style:solid;}
	
	.file_input_hidden{font-size:45px; position:absolute; right:0px; top:0px; opacity:0; 
	filter:alpha(opacity=0); 
	-ms-filter:"alpha(opacity=0)"; 
	-khtml-opacity:0; 
	-moz-opacity:0;}
	
	.table table-striped {
		text-align:center;
		border:1px;
		solid: #dddddd;
	}
	
	th {
		background-color:#eeeeee;
		text-align: center;
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
	

	<!-- BoardForm Start -->
	<div class="row d-flex justify-content-center">
	<div class="roberto-rooms-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12">
				
	<!-- Background Start -->
	<br><br>
	<div class="row d-flex justify-content-center">
	<div style="width:1200px;">
	<div class="newsletter-form">	
				
			 	 <form action="" name="writeForm" method="post">
			        <div class="form-group">
			            <label for="exampleFormControlInput1">제목</label>
			            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 작성해주세요.">
			        </div>
			        <div class="form-group">
			            <label for="exampleFormControlTextarea1">내용</label>
			            <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="10"></textarea>
			        </div>
			    </form>
	</div>
	</div>
	</div><br><br>
	<!-- BackGround End -->
	
			 	<div class="col-12" >
					<div class="welcome-text text-center">
						<input type="submit" class="btn roberto-btn w-10" value="등록" />&nbsp;
						<input type="button" class="btn roberto-btn w-10" value="취소" id="cancel"/>
					</div>
				</div>
			
				
				</div>
			</div>
		</div>
	</div>
	</div><br><br>

	<!-- BoardForm End -->
	
	
	<%@ include file="../include/footer.jsp"%>
	
	<!-- **** All JS Files ***** -->

	<!-- Popper -->
	<script src="${path }/resources/js/popper.min.js"></script>
	<!-- Bootstrap -->
	<script src="${path }/resources/js/bootstrap.min.js"></script>
	<!-- All Plugins -->
	<script src="${path }/resources/js/roberto.bundle.js"></script>
	<!-- Active -->
	<script src="${path }/resources/js/default-assets/active.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	

<script src="js/bootstrap.min.js"></script> 
</body>
</html>