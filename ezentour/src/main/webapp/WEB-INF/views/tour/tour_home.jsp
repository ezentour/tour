<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
<!-- Title -->
<title>EzenTour</title>
<style>
table {
	text-align: center
}

td {
	valign: middle
}

.roberto-btn1 {
  position: relative;
  min-width: 50px;
  height: 40px;
  line-height: 46px;
  font-size: 16px;
  text-align: center;
  text-transform: capitalize;
  background-color: #1cc3b2;
  color: #ffffff;
  border: none;
  border-radius: 2px;
  -webkit-transition-duration: 500ms;
  -o-transition-duration: 500ms;
  transition-duration: 500ms;
  margin-left : 10px;
   }
</style>
</head>
<body>

	<%@ include file="../include/menu.jsp"%>

	<!-- Breadcrumb Area Start -->
	<div
		class="breadcrumb-area contact-breadcrumb bg-img bg-overlay jarallax"
		style="background-image: url(${path}/resources/img/bg-img/18.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb-content text-center mt-100">
						<h1 class="h1-title">관광 정보</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Tour</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End -->

	<!-- Google Maps & Contact Info Area Start -->
	<section class="google-maps-contact-info">
		<div class="container-fluid">
			<div class="google-maps-contact-content">	
				<div align=center>	
				  <div class="row center-content-between align-items-end">		 
				  <select name="option" id="selectbox" >
                                    <option value="" selected>전체</option>
                                    <option value="A01">자연</option>
                                    <option value="A02">인문</option>
                                    <option value="A03">레포츠</option>
                 </select>
                  <button type="submit" class="roberto-btn1" id="btnd">검색</button>
                  </div>
				</div>
				<br>
				<!-- Google Maps -->
				<div class="google-maps">
					<div id="map" style="width: 100%; height: 500px; boarder: 1px solid black;"></div>
				</div>
				<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3214d52dc541ad022a4463064eeff3c&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(36.36181333069756,
					127.37896281500157), // 지도의 중심좌표
			level : 7
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	
		
		
		$.ajax({
			url : '${path}/Tour/PublicData.do',
			data: { option : document.getElementById("selectbox").value },
			type : 'get',
			dataType : 'json',
			success : function(data) {
				console.log(data);
				console.log(data.response.body.items.item);
				var positions = data.response.body.items.item;		
				
				for (var i = 0; i < positions.length; i++) {
					 var output = new Object();
					 output.title = positions[i].title;
					 output.addr = positions[i].addr1;					
					 output.img = positions[i].firstimage;
		              
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : new kakao.maps.LatLng(positions[i].mapy,
								positions[i].mapx)
					// 마커의 위치
					});
					

					// 마커에 표시할 인포윈도우를 생성합니다 
					var infowindow = new kakao.maps.InfoWindow({
						content : "<b>" + positions[i].title + "</b><br>" + positions[i].addr1,
						removable : true
					// 인포윈도우에 표시할 내용
					});

					// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					// 이벤트 리스너로는 클로저를 만들어 등록합니다 
					// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					kakao.maps.event.addListener(marker, 'click',
							makeOverListener(map, marker, infowindow, output));
				}

			}
		});
		
		$("#btnd").click(function(){  
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다		
			$.ajax({
				url : '${path}/Tour/PublicData.do',
				data: { option : document.getElementById("selectbox").value },
				type : 'get',
				dataType : 'json',
				success : function(data) {
					console.log(data);
					console.log(data.response.body.items.item);
					var positions = data.response.body.items.item;		
					
					for (var i = 0; i < positions.length; i++) {
						 var output = new Object();
						 output.title = positions[i].title;
						 output.addr = positions[i].addr1;					
						 output.img = positions[i].firstimage;
			              
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map : map, // 마커를 표시할 지도
							position : new kakao.maps.LatLng(positions[i].mapy,
									positions[i].mapx)
						// 마커의 위치
						});
						

						// 마커에 표시할 인포윈도우를 생성합니다 
						var infowindow = new kakao.maps.InfoWindow({
							content : "<b>" + positions[i].title + "</b><br>" + positions[i].addr1,
							removable : true
						// 인포윈도우에 표시할 내용
						});

						// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						// 이벤트 리스너로는 클로저를 만들어 등록합니다 
						// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						kakao.maps.event.addListener(marker, 'click',
								makeOverListener(map, marker, infowindow, output));
					}

				}
			});
		});
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow, output) {
			return function() {
				infowindow.open(map, marker);
				document.getElementById("title").innerHTML = output.title;
				document.getElementById("addr").innerHTML = output.addr;
				document.getElementById("img").innerHTML = "<img src='" + output.img + "'>";
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
		/* 아래와 같이도 할 수 있습니다 */
		/*
		 for (var i = 0; i < positions.length; i ++) {
		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({
		 map: map, // 마커를 표시할 지도
		 position: positions[i].latlng // 마커의 위치
		 });

		 // 마커에 표시할 인포윈도우를 생성합니다 
		 var infowindow = new kakao.maps.InfoWindow({
		 content: positions[i].content // 인포윈도우에 표시할 내용
		 });

		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		 // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 (function(marker, infowindow) {
		 // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		 kakao.maps.event.addListener(marker, 'mouseover', function() {
		 infowindow.open(map, marker);
		 });

		 // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		 kakao.maps.event.addListener(marker, 'mouseout', function() {
		 infowindow.close();
		 });
		 })(marker, infowindow);
		 }
		 */
	</script>
			</div>
		</div>
	</section>
	<!-- Google Maps & Contact Info Area End -->
<!-- ui middle aligned center aligned grid -->
	<div class="roberto-rooms-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<table class="ui celled table">
					<thead>
						<tr>
							<td>관광지</td>
							<td><p id="title"></p></td>
						</tr>
					</thead>
					<tbody id="list">						
						<tr>
							<td>위치</td>
							<td><p id="addr"></td>
						</tr>						
						<tr>
							<td>이미지</td>
							<td><p id="img"></td>
						</tr>
					</tbody>
				</table>
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





