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

.btn-link {
	font-family: "NanumSquare";
	color: black;
}

.btn-link:hover{
	text-decoration : none;
}

.card-body {
	font-family: "NanumSquare";
}

.footer {
	margin-top: 100px;
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

	<div>
		<img src="/project/resources/images/main_qna.png" class="img-fluid"
			alt="">
	</div>
	<br>

	<div class="container">
		<h4>질문목록</h4>
		<hr>

		<div class="accordion" id="accordionExample">
			<c:if test="${!empty list}">
				<c:set var="i" value="0" />
				<c:forEach var="list" items="${list}">
					<c:set var="i" value="${i + 1}" />

					<div class="card">
						<c:choose>
							<c:when test="${i%2 eq 1}">
								<div class="card-header" id="heading${i}" style="background:#e6e6e6">
									<h2 class="mb-0">
										<button class="btn btn-link collapsed" type="button"
											data-toggle="collapse" data-target="#collapse${i}"
											aria-expanded="false" aria-controls="collapse${i}">${list.title}</button>
									</h2>
								</div>
							</c:when>
							<c:otherwise>
								<div class="card-header" id="heading${i}">
									<h2 class="mb-0">
										<button class="btn btn-link collapsed" type="button"
											data-toggle="collapse" data-target="#collapse${i}"
											aria-expanded="false" aria-controls="collapse${i}">${list.title}</button>
									</h2>
								</div>
							</c:otherwise>
						</c:choose>

						<div id="collapse${i}" class="collapse"
							aria-labelledby="heading${i}" data-parent="#accordionExample">
							<div class="card-body">
								${list.content}
								<hr>
								<c:if test="${!empty user}">
									<c:if test="${user.admin eq 'admin'}">
										<button type="button" class="btn btn-outline-secondary"
											id="updateBtn" onclick="updateQNA(${list.qna_no})">수정</button>
										<button type="button" class="btn btn-outline-danger"
											id="deleteBtn" onclick="deleteQNA(${list.qna_no})">삭제</button>
									</c:if>
								</c:if>

							</div>
						</div>
					</div>

				</c:forEach>
			</c:if>
		</div>



	</div>

	<div class="container" style="margin-top: 50px;">
		<c:if test="${!empty user}">
			<c:if test="${user.admin eq 'admin'}">
				<div class="row-fluid text-center" style="margin-bottom: 20px">
					<button id="writeBtn" class="btn btn-lg btn-outline-secondary">등록하기</button>
				</div>
			</c:if>
		</c:if>
	</div>

	<!-- FOOTER -->
	<div class="footer">
		<footer>
			<p class="footertxt">Copyright @ 그자리아냐</p>
		</footer>
	</div>

	<script>
		$("#writeBtn").click(function() {
			location.href = "/project/parking/qna/write";
		});
		
		var updateQNA = function(index){
			location.href = "/project/parking/qna/update?id="+index;
		};
		
		var deleteQNA = function(index){
			location.href = "/project/parking/qna/delete?id="+index;
		};
	</script>

</body>
</html>