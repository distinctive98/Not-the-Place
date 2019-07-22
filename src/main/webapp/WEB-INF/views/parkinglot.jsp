<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
	integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
	crossorigin=""></script>
<style>
.nav-item {
	font-family: "NanumSquare";
	font-weight: bold;
}

.footer {
	margin-top : 20px;
	background-color: #595959;
	text-align: center;
	height: 50px;
}

.footertxt {
	padding-top: 10px;
	color: white;
}
</style>
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="/project/parking/main"
				style="padding-top: 0 !important; padding-bottom: 0 !important; margin-right: 0 !important;">
				<img src="/project/resources/images/title1.png"
				style="width: 200px !important;">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="/project/parking/report">신고하기</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/project/parking/stat">통계</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/project/parking/parkinglot">주차장</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/project/parking/qna">고객지원</a></li>
				</ul>
			</div>
			<c:if test="${empty user}">
				<a href="/project/parking/login"><button type="button"
						class="btn btn-secondary" style="margin-left: 10px;">로그인</button></a><
			</c:if>
			<c:if test="${!empty user}">
				<!-- <li class="nav-item"><a class="nav-link"
							 href="/project/parking/logout">로그아웃</a></li> -->
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
					<div class="dropdown-menu dropdown-menu-right">
						<a href="/project/parking/mypage"><button class="dropdown-item" type="button">마이페이지</button></a>
						<a href="/project/parking/logout"><button
								class="dropdown-item" type="button">로그아웃</button></a>
					</div>
				</div>
			</c:if>
		</div>
	</nav>

	<div>
		<img src="/project/resources/images/main_parkinglot.png" class="img-fluid" alt="">
	</div>
	<br>

	<div class="container">
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="address"
				placeholder="지역을 입력하세요" aria-label="지역을 입력하세요"
				aria-describedby="search">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="search">검색하기</button>
			</div>
		</div>

		<div id="mapid" style="width:100%; height: 600px;"></div>
	</div>
	
	<div class="footer">
		<footer>
			<p class="footertxt">Copyright @ 그자리아냐</p>
		</footer>
	</div>
	
	<script>
		var first = true;
		var group;
		var mymap;
		$(document)
				.ready(
						function() {
							var initMap = function(lat, lng) {
								//alert(lat + " " + lng);
								if (mymap) //mymap이 true이면(null이 아니면)
									mymap.remove();
								mymap = L.map('mapid')
										.setView([ lat, lng ], 14);

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

								if (first == true)
									setMarker();
								first = false;
								group.addTo(mymap);
							}

							function setMarker() {

								
								var myIcon = L.icon({
								    iconUrl: '/project/resources/images/parkinglotIcon.png',
								    iconSize: [30, 40]
								});				
								

								var marker = new Array();
								var parking_no = new Array();
								var name = new Array();
								var address = new Array();
								var tel = new Array();

								<c:forEach items="${list}" var="list">
								marker.push(L.marker([ "${list.lat}",
										"${list.log}" ], {icon: myIcon}));
								name.push("${list.name}");
								address.push("${list.address}");
								tel.push("${list.tel}");
								parking_no.push()
								</c:forEach>

								group = L.layerGroup(marker);
								var offset = Object.keys(group._layers)[0];
								group.eachLayer(function(layer, i) {

									var id = group.getLayerId(layer);
									layer.bindPopup("상호 : " + name[id - offset]
											+ "<br>" + "주소 : "
											+ address[id - offset] + "<br>"
											+ "전화번호 : " + tel[id - offset]);

								});
								//group.addTo(mymap);
							}

							function addToCoord() {
								var address = $('#address').val();
								//alert(address);
								var lat;
								var lng;
								if (address) {
									$
											.getJSON(
													"https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY&address="
															+ encodeURIComponent(address),
													function(data) {
														lat = data.results[0].geometry.location.lat;
														lng = data.results[0].geometry.location.lng;
														//alert(lat + " " + lng);
														initMap(lat, lng);
													});
								}
							}

							$("#search").click(function() {
								addToCoord();
							});

							initMap(37.5017, 127.0409);

						});
	</script>
</body>
</html>