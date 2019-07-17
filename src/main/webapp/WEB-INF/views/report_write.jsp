<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
	integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
	crossorigin=""></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">Write</h1>
		<form method="post" action="/project/parking/report/write" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-1 col-form-label">제목</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" id="titleForm" name="title"
						placeholder="제목을 입력하세요" required>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">내용</label>
				<div class="col-sm-11">
					<textarea class="form-control" id="contentForm" name="content"
						placeholder="내용을 입력하세요" rows="5" required></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">차량번호</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" id="car_idForm"
						name="car_id" placeholder="차량번호를 입력하세요">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">발견일시</label>
				<div class="col-sm-11">
					<input type="datetime-local" class="form-control"
						id="report_timeForm" name="report_time" required>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">발견위치</label>
				<div class="col-sm-11">
					<input id="report_addressForm" type="text" class="form-control"
						name="report_address" readonly required><br>
					<!-- <button class="col-sm-1">검색</button> -->
					<div id="map" style="height: 300px"></div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">이미지</label>
				<div class="col-sm-11 custom-file">
					<input type="file" class="custom-file-input" accept=".gif, .jpg, .png" name="imageInfo"  id="imageBtn">
					<label class="custom-file-label" for="customFile" id="imageLabel">이미지 파일</label>
				</div>
			</div>
			
			<div class="container text-center">
					<button type="submit" class="btn btn-primary btn-lg">작성하기</button>
					<button type="button" class="btn btn-secondary btn-lg" id="cancelBtn">취소하기</button>
			</div>

		</form>
	</div>

	<script>
		/*
			var mymap = L.map('map').setView([ 37.566, 126.978 ], 18);

			L
					.tileLayer(
							'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
							{
								maxZoom : 18,
								attribution : 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, '
										+ '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, '
										+ 'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
								id : 'mapbox.streets'
							}).addTo(mymap);
		 */

		$(document).ready(function() {
			getLocation();
		});
		 
		 $("#cancelBtn").click(function(){
			 location.href = "/project/parking/report";
		 });
		 
		 $("#imageBtn").change(function(){
			 var fileName = $(this).val();
			 $("#imageLabel").html(fileName);
		 });
		 
		var icon = L.icon({
		    iconUrl: '/project/resources/images/logo1.svg',
		    iconSize: [10, 30]
		});

		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition,
						showError);
			} else {
				alert(" 이 브라우저는 geolocation을 지원하지 않습니다.");
			}
		}
		function showPosition(position) {
			var lat = position.coords.latitude;
			var lng = position.coords.longitude;
			var map = L.map('map').setView([ lat, lng ], 15);
			L
					.tileLayer(
							'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
							{
								maxZoom : 18,
								attribution : 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, '
										+ '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, '
										+ 'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
								id : 'mapbox.streets'
							}).addTo(map);

			L.marker([ lat, lng ]).addTo(map).bindPopup("<b>현재 위치").openPopup();

			var latlng = encodeURIComponent(lat + "," + lng);
			//alert(latlng);
			coordToAddr(latlng);
			
			map.on('click', onMapClick);
		}
		
		function showError(error) {
			switch (error.code) {
			case error.PERMISSION_DENIED:
				alert("사용자가 위치 기능 사용을 거부했습니다.");
				break;

			case error.POSITION_UNAVAILABLE:
				alert("위치를 구할 수 없습니다.");
				break;

			case error.TIMEOUT:
				alert("사용자가 위치 기능 사용을 거부했습니다.");
				break;
			case error.UNKNOWN_ERROR:
				alert("기타 에러");
			}
			
			var map = L.map('map').setView([ 37.5017, 127.0409], 15);
			L
					.tileLayer(
							'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
							{
								maxZoom : 18,
								attribution : 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, '
										+ '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, '
										+ 'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
								id : 'mapbox.streets'
							}).addTo(map);
			
			map.on('click', onMapClick);
		}

		function coordToAddr(latlng) {
			$
					.getJSON(
							"https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY&latlng="
									+ latlng, function(data) {
								$("#report_addressForm").val(
										data.results[0].formatted_address);
								
							});
			
			//L.marker(latlng, {icon: icon}).addTo(map);
		}
		
		function onMapClick(e) {
			//var latlng = encodeURIComponent(lat + "," + lng);
			coordToAddr(encodeURIComponent(e.latlng.lat + "," + e.latlng.lng));
			
			// alert(encodeURIComponent(e.latlng.lat + "," + e.latlng.lng));
		}
	</script>
</body>
</html>