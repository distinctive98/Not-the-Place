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

.btn, .card-title {
	font-family: "NanumSquare";
}

.card {
	border: 0;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.2);
	overflow: hidden;
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
		<img src="/project/resources/images/main_report.png" class="img-fluid"
			alt="">
	</div>
	<br>

	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading -->
		<div class="row-fluid text-center"
			style="margin-bottom: 20px; float: right;">
			<button id="writeBtn" class="btn btn-lg btn-secondary">게시글
				작성</button>
		</div>

		<div class="row" style="clear: both">
			<c:if test="${!empty list}">
				<c:forEach var="list" items="${list}">

					<div class="col-sm-4 mb-4">
						<div class="card h-100">
							<a href="/project/parking/report/select?id=${list.report_no}&curPage=${pagination.curPage}"><img
								class="card-img-top"
								src="/project/resources/images/${list.image}"
								alt="/project/resources/images/dog.jpg" width="400" height="200"></a>
							<div class="card-body">
								<div class="row">
									<h4 class="card-title">
										<a href="/project/parking/report/select?id=${list.report_no}&curPage=${pagination.curPage}">${list.title}</a>
									</h4>
								</div>
								<div class="row">
									<h5 class="card-title">작성자 : ${list.nickname}</h5>
								</div>

								<div class="row">
									<div class="col-8" style="padding: 0">
										<h6 class="card-title">작성일 : ${list.writedate}</h6>
									</div>
									<div class="col-4 text-right"
										style="padding: 0; padding-right: 10px;">
										<h6 class="card-title">조회수 : ${list.cnt}</h6>
									</div>
								</div>


								<%-- <div class="row">
									<h6 class="card-title">작성일 : ${list.writedate}</h6>
								</div>
								<div class="row">
									<h6 class="card-title">조회수 : ${list.cnt}</h6>
								</div> --%>

							</div>
						</div>
					</div>

				</c:forEach>
			</c:if>
		</div>
		<!-- /.row -->

		<!-- Pagination -->
		<ul class="pagination justify-content-center">
			<c:if test="${pagination.curPage ne 1}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous" onClick="paging('${pagination.prevPage}')">
						<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
				</a></li>
			</c:if>
			<c:forEach var="pageNum" begin="${pagination.startPage}"
				end="${pagination.endPage}">
				<c:choose>
					<c:when test="${pageNum eq pagination.curPage}">
						<li class="page-item" style="font-weight: bold;"><a
							class="page-link" href="#" onclick="paging('${pageNum}')">${pageNum}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="#"
							onclick="paging('${pageNum}')">${pageNum}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagination.curPage ne pagination.endPage}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next" onClick="paging('${pagination.nextPage }')">
						<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
				</a></li>
			</c:if>
		</ul>
		<br>

		<!-- Search Bar -->

		<div class="row">
			<div class="col"></div>
			<div class="col-6">
				<form method="GET" action="/project/parking/report/search">
					<div class="form-group row">

						<div class="col-sm-3" style="padding: 0;">
							<div class="input-group mb-3 text-right">
								<select class="custom-select" name="searchType">
									<option value="nickname" selected>작성자</option>
									<option value="report_address">지역명</option>
								</select>
							</div>
						</div>

						<div class="col-sm-9">
							<div class="input-group mb-3">
								<input type="text" class="form-control" name="searchWord"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="submit"
										id="button-addon2">검색하기</button>
								</div>
							</div>
						</div>

					</div>
				</form>

			</div>
			<div class="col"></div>
		</div>



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
		
		var paging = function(curPage){
			if(${!empty search}){
				location.href = "/project/parking/report/search?searchType=${search.searchType}&searchWord=${search.searchWord}&curPage="+curPage;
			} else {
				location.href = "/project/parking/report?curPage="+curPage;	
			}
			
		};
	</script>
</body>
</html>