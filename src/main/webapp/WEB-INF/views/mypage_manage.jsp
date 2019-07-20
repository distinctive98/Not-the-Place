<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.nav-item {
	font-family: "NanumSquare";
	font-weight: bold;
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
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
					<div class="dropdown-menu dropdown-menu-right">
						<a href="/project/parking/mypage"><button
								class="dropdown-item" type="button">마이페이지</button></a> <a
							href="/project/parking/logout"><button class="dropdown-item"
								type="button">로그아웃</button></a>
					</div>
				</div>
			</c:if>
		</div>
	</nav>

	<div class="container-fluid center">
		<div class="text-center" style="height: 300px">
			<div style="padding-top: 100px">
				<h1>내 게시글 관리</h1>
			</div>
		</div>
	</div>
	<hr>
	
	<div class="container">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col">First</th>
					<th scope="col">Last</th>
					<th scope="col">Handle</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>
	</div>
	
</body>
</html>