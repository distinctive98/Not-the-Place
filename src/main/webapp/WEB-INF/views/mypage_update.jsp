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

.col-form-label {
	text-align: center;
}

.footer {
	margin-top: 20px;
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

	<c:if test="${empty user}">
		<script>
			alert("로그인 후 이용하실 수 있습니다")
			location.href = "/project/parking/login";
		</script>
	</c:if>

	<div class="container-fluid center">
		<div class="text-center" style="height: 300px">
			<div style="padding-top: 100px">
				<h1>내 정보 수정</h1>
			</div>
		</div>
	</div>
	<hr>

	<div class="container">
		<form method="post" action="/project/parking/mypage/update">

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이메일</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="email"
						value="${user.email}" readonly>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">닉네임</label>
				<div class="col-sm-10">
					<input class="form-control" value="${user.nickname}" readonly></input>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="passwordForm"
						name="password" placeholder="비밀번호를 입력하세요" required></input>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">비밀번호 확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="repasswordForm" name="repassword"
						placeholder="비밀번호를 한번 더 입력하세요" required></input>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label"> </label>
				<div class="col-sm-10">
					<p id="passwordCheckForm" style="color: red"></p>
				</div>
			</div>

			<div class="container text-center" style="margin-top: 100px;">
				<button type="submit" class="btn btn-lg btn-outline-primary">수정하기</button>
				<button type="button" class="btn btn-outline-secondary btn-lg"
					id="cancelBtn">취소하기</button>
			</div>
		</form>
	</div>

	<c:if test="${!empty msg}">
		<c:choose>
			<c:when test="${msg eq 'success'}">
				<script>
					alert("수정이 완료되었습니다");
					location.href = "/project/parking/logout";
				</script>
			</c:when>
			<c:when test="${msg eq 'password'}">
				<script>
					alert("비밀번호가 다릅니다");
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("수정에 실패하였습니다");
				</script>
			</c:otherwise>
		</c:choose>
	</c:if>


	<!-- FOOTER -->
	<div class="footer" style="margin-top: 50px;">
		<footer>
			<p class="footertxt">Copyright @ 그자리아냐</p>
		</footer>
	</div>

	<script>
		$('#repasswordForm').blur(function() {
			if ($('#repasswordForm').val() != $('#passwordForm').val()) {
				$('#passwordCheckForm').text("비밀번호가 다릅니다");
			} else {
				$('#passwordCheckForm').text(" ");
			}
		});

		$('#cancelBtn').click(function() {
			location.href = "/project/parking/mypage";
		});
	</script>

</body>
</html>