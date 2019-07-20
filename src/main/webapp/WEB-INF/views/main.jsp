<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<title>그자리아냐</title>

<!-- Bootstrap core CSS -->
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>
#but {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-radius: 5px;
	margin-left: -3px;
	font-size: 15px;
	width: 100px;
}

.card {
	text-align: center;
}

.card-img-top {
	display: block;
	margin: 0px auto;
	width: 100px;
	height: auto;
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

.nav-item {
	font-family: "NanumSquare";
	font-weight: bold;
}

.card-title, .card-text {
	font-family: "NanumSquare";
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
						class="btn btn-secondary" style="margin-left:10px;">로그인</button></a><
			</c:if>
			<c:if test="${!empty user}">
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

	<div class="text-center">
		<img src="/project/resources/images/main.png" class="img-fluid" alt="">
	</div>
	<br>
	<br>
	<br>

	<!-- Page Content -->
	<div class="container">
		<div class="card-deck">
			<div class="card">
				<a href="#"><img  id="card1" src="/project/resources/images/cardimage1.png"
					class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h4 class="card-title">시민 자발적 신고 플랫폼</h4>
					<p class="card-text">시민들은 불법 주차 차량 발견시, <br>자발적 신고를 통하여 <br>불법주차 근절에 <br>기여할
						수 있습니다.</p>
				</div>
			</div>
			<div class="card">
				<a href="#"><img id="card2" src="/project/resources/images/cardimage2.png"
					class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h4 class="card-title">데이터 기반의 통계 정보</h4>
					<p class="card-text">시민들이 신고한 데이터를 기반으로 <br>지역별, 시간대별로 <br>정확한 통계를
						제공합니다.</p>
				</div>
			</div>
			<div class="card">
				<a href="#"><img id="card3" src="/project/resources/images/cardimage3.png"
					class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h4 class="card-title">주차장 위치 안내 서비스</h4>
					<p class="card-text">주차장 위치 안내 서비스를 통해 <br>불법 주차를 줄여, <br> 긴급 출동 시간을
						단축시키는데 <br>기여할 수 있습니다.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<div class="footer">
		<footer>
			<p class="footertxt">Copyright @ 그자리아냐</p>
		</footer>
	</div>
	
	<script>
		$("#card1").click(function(){
			location.href = "/project/parking/report";
		});
		$("#card2").click(function(){
			location.href = "/project/parking/stat";
		});
		$("#card3").click(function(){
			location.href = "/project/parking/parkinglot";
		});
	</script>

</body>
</html>
