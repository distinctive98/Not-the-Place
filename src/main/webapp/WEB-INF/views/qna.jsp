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
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.nav-item {
	font-family: "NanumMyeongjo";
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
						href="/project/parking/qna">Q&amp;A</a></li>
				</ul>
			</div>
			<c:if test="${empty user}">
				<a href="/project/parking/login"><button type="button"
						class="btn btn-secondary" style="margin-left: 10px;">Login</button></a><
			</c:if>
			<c:if test="${!empty user}">
				<!-- <li class="nav-item"><a class="nav-link"
							 href="/project/parking/logout">로그아웃</a></li> -->
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
					<div class="dropdown-menu dropdown-menu-right">
						<button class="dropdown-item" type="button">마이페이지</button>
						<a href="/project/parking/logout"><button
								class="dropdown-item" type="button">로그아웃</button></a>
					</div>
				</div>
			</c:if>
		</div>
	</nav>

	<div class="container-fluid center">
		<div class="text-center" style="height: 300px">
			<div style="padding-top: 100px">
				<h1>Q&amp;A</h1>
				<h4>궁금해 하는 모든 것</h4>
			</div>
		</div>
	</div>
	<hr>

	<div class="container">
		<c:set var="admin" value="${user.admin}" />
		<c:if test="${admin eq 'admin'}">
			<div class="row-fluid text-center" style="margin-bottom: 20px">
				<button id="writeBtn" class="btn btn-lg btn-outline-primary">등록하기</button>
			</div>
		</c:if>

		<div class="accordion" id="accordionExample">
			<c:if test="${!empty list}">
				<c:set var="i" value="0" />
				<c:forEach var="list" items="${list}">
					<c:set var="i" value="${i + 1}" />

					<div class="card">
						<div class="card-header" id="heading${i}">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapse${i}"
									aria-expanded="false" aria-controls="collapse${i}">${list.title}</button>
							</h2>
						</div>
						<div id="collapse${i}" class="collapse"
							aria-labelledby="heading${i}" data-parent="#accordionExample">
							<div class="card-body">${list.content}</div>
						</div>
					</div>

				</c:forEach>
			</c:if>
		</div>

	</div>

	<script>
		$("#writeBtn").click(function() {
			location.href = "/project/parking/qna/write";
		});
	</script>

</body>
</html>