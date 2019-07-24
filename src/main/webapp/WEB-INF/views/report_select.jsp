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

<style>
.nav-item {
	font-family: "NanumSquare";
	font-weight: bold;
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
						<a href="/project/parking/mypage"><button
								class="dropdown-item" type="button">My Page</button></a> <a
							href="/project/parking/logout"><button class="dropdown-item"
								type="button">Logout</button></a>
					</div>
				</div>
			</c:if>
		</div>
	</nav>

	<div>
		<img src="/project/resources/images/main_report_select.png"
			class="img-fluid" alt="">
	</div>
	<br>
	<br>

	<c:if test="${!empty vo}">
		<div class="container">
			<h3 class="text-center">"${vo.title}"</h3>
			<hr>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">작성자</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" value="${vo.nickname}" readonly />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">내용</label>
				<div class="col-sm-11">
					<textarea class="form-control" rows="3" readonly>${vo.content}</textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">차량번호</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" value="${vo.car_id}"
						readonly />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">발견시간</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" value="${vo.report_time}"
						readonly />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">발견위치</label>
				<div class="col-sm-11">
					<input type="text" class="form-control"
						value="${vo.report_address}" readonly />
				</div>
			</div>

			<hr>
			<div class="form-group row">
				<label class="col-sm-1 col-form-label">이미지</label>
				<div class="col-sm-11">
					<img src="/project/resources/images/${vo.image}" class="img-fluid"
						width="100%" alt="Responsive image">
				</div>
			</div>
			<hr>

		</div>
	</c:if>
	<div class="container text-center">
		<button type="button" class="btn btn-lg btn-outline-primary"
			id="confirmBtn">확인</button>
		<c:set var="email1" value="${user.email}" />
		<c:set var="email2" value="${email}" />
		<c:if test="${email1 eq email2 || (!empty user && user.admin eq 'admin')}">
			<button type="button" class="btn btn-lg btn-outline-primary"
				id="updateBtn">수정</button>
			<button type="button" class="btn btn-lg btn-outline-danger"
				id="deleteBtn">삭제</button>
		</c:if>
	</div>

	<!-- FOOTER -->
	<div class="footer">
		<footer>
			<p class="footertxt">Copyright @ 그자리아냐</p>
		</footer>
	</div>

	<script>
		$("#confirmBtn").click(function() {
			if(${empty sign}){
				if(${empty search}){
					location.href = "/project/parking/report?curPage=${curPage}";	
				} else {
					location.href = "/project/parking/report/search?curPage=${curPage}&searchType=${search.searchType}&searchWord=${search.searchWord}";	
				}
			} else {
				location.href = "/project/parking/mypage/manage";
			}
		});

		$("#updateBtn")
				.click(
						function() {
							if(${empty sign}){
								//location.href = "${ header.referer }";
								location.href = "/project/parking/report/update?id=${vo.report_no}";
							} else {
								location.href = "/project/parking/report/update?id=${vo.report_no}&sign=mypage";
							}
							
						});

		$("#deleteBtn")
				.click(
						function() {
							if(${empty sign}){
								location.href = "/project/parking/report/delete?id=${vo.report_no}";
							} else {
								location.href = "/project/parking/report/delete?id=${vo.report_no}&sign=mypage";
							}
						});
	</script>
</body>
</html>