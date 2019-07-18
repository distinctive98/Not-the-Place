<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>

<style>
.nav-item {
	font-family: "NanumMyeongjo";
	font-weight: bold;
}

.card-title {
	/* font-family: "NanumBarunGothic";
	font-size : 20px; */
}

.footer {
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
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
					<c:if test="${empty user}">
						<li class="nav-item"><a class="nav-link"
							href="/project/parking/login">로그인</a></li>
					</c:if>
					<c:if test="${!empty user}">
						<li class="nav-item"><a class="nav-link"
							href="/project/parking/logout">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid center">
		<div class="text-center" style="height: 300px">
			<div style="padding-top: 100px">
				<h1>신고 게시판</h1>
				<h4>시민 자발적 신고 플랫폼</h4>
			</div>
		</div>
	</div>
	<hr>

	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading -->
		<div class="row-fluid text-center" style="margin-bottom:20px">
			<button id="writeBtn" class="btn btn-lg btn-outline-primary">신고하기</button>
		</div>

		<div class="row">
			<c:if test="${!empty list}">
				<c:forEach var="list" items="${list}">

					<div class="col-sm-4 mb-4">
						<div class="card h-100">
							<a href="/project/parking/report/select?id=${list.report_no}"><img
								class="card-img-top"
								src="/project/resources/images/${list.image}"
								alt="/project/resources/images/dog.jpg" width="400" height="200"></a>
							<div class="card-body">
								<div class="row">
									<div class="col-14 col-md-8">
										<h5 class="card-title">
											<a href="/project/parking/report/select?id=${list.report_no}">${list.title}</a>
										</h5>
									</div>
									<div class="col-4 col-md-4">
										<h5 class="card-title">${list.nickname}</h5>
									</div>
								</div>

							</div>
						</div>
					</div>

				</c:forEach>
			</c:if>
		</div>
		<!-- /.row -->

		<!-- Pagination -->
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Previous</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>
	</div>
	<!-- /.container -->
	
	<!-- FOOTER -->
	<div class="footer">
		<footer>
			<p class="footertxt">Copyright @ 그자리아냐</p>
		</footer>
	</div>

	<script>
		$("#writeBtn").click(function() {
			<c:if test="${!empty user}">
				location.href = "/project/parking/report/write";
			</c:if>
			<c:if test="${empty user}">
				alert("로그인 후 신고가 가능합니다");
				location.href = "/project/parking/login";
			</c:if>
		});
	</script>
</body>
</html>