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

	<div>
		<img src="/project/resources/images/main_qna_write.png" class="img-fluid"
			alt="">
	</div>
	<br>
	
	<c:if test="${empty user}">
		<script>
			alert("잘못된 접근입니다");
			location.href = "/project/parking/qna";
		</script>
	</c:if>

	<div class="container">
		<form method="post" action="/project/parking/qna/write">
			<input type="hidden" name="email" value="${user.email}">
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

			<div class="container text-center" style="margin-top:50px;">
				<button type="submit" class="btn btn-lg btn-outline-primary">작성하기</button>
				<button type="button" class="btn btn-outline-secondary btn-lg"
					id="cancelBtn">취소하기</button>
			</div>

		</form>
	</div>

	<script>
		$("#cancelBtn").click(function(){
			location.href = "/project/parking/qna";
		});
	</script>
</body>
</html>