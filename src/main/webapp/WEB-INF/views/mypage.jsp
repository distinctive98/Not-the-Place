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

.cardimg {
	padding-top : 10px;
}

.cardimg {
	display: block;
	margin: 0px auto;
	width: 100px;
	height: auto;
}

.footer {
	margin-top: 200px;
	background-color: #595959;
	text-align: center;
	height: 50px;
	background-color: #595959;
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
						<a href="/project/parking/mypage"><button
								class="dropdown-item" type="button">마이페이지</button></a> <a
							href="/project/parking/logout"><button class="dropdown-item"
								type="button">로그아웃</button></a>
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

	<div>
		<img src="/project/resources/images/main_mypage.png" class="img-fluid"
			alt="">
	</div>
	<br>

	<div class="container text-center" style="margin-top: 50px;">
		<c:choose>
			<c:when test="${empty msg}">
				<h2>보안을 위해 비밀번호를 입력해주세요</h2>

				<div class="row">
					<div class="col"></div>
					<div class="col-6">
						<form method="post" action="/project/parking/mypage"
							style="margin-top: 50px;">
							<input type="hidden" name="email" value="${user.email}">

							<div class="form-group row">
								<label class="col-sm-2 col-form-label"
									style="text-align: center">비밀번호</label>
								<div class="col-sm-10">
									<div class="input-group mb-3">
										<input type="password" class="form-control" name="password"
											placeholder="비밀번호 입력" aria-label="Recipient's username"
											aria-describedby="button-addon2">
										<div class="input-group-append">
											<button class="btn btn-outline-secondary" type="submit"
												id="button-addon2">확인</button>
										</div>
									</div>
								</div>
							</div>
						</form>

					</div>
					<div class="col"></div>
				</div>

			</c:when>
			<c:otherwise>
				<c:if test="${msg eq 'success'}">
					<div class="card-deck">
						<div class="card" id="card1">
							<img class="cardimg"
								src="/project/resources/images/cardimage4.png"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">
									<a href="/project/parking/mypage/update">내 정보 수정</a>
								</h5>
								<p class="card-text"></p>
							</div>
						</div>
						<div class="card" id="card2">
							<img class="cardimg"
								src="/project/resources/images/cardimage5.png"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">
									<a href="/project/parking/mypage/manage">게시글 관리</a>
								</h5>
								<p class="card-text"></p>
							</div>
						</div>
						<div class="card" id="card3">
							<img class="cardimg"
								src="/project/resources/images/cardimage6.png"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">
									<a href="#" onclick="goAway()">회원 탈퇴</a>
								</h5>
								<p class="card-text"></p>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${msg eq 'fail'}">
					<script>
						alert("비밀번호가 일치하지 않습니다");
						location.href = "/project/parking/mypage";
					</script>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- FOOTER -->
	<div class="footer">
		<footer>
			<p class="footertxt">Copyright @ 그자리아냐</p>
		</footer>
	</div>

	<script>
		var goAway = function() {
			alert("준비 중인 서비스입니다");
		}
	</script>


</body>
</html>