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
</head>
<body>
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
		<div class="row">
			<h1 class="my-4">
				<button id="writeBtn" class="btn btn-primary">신고하기</button>
			</h1>
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
									<div class="col-14 col-md-9">
										<h4 class="card-title">
											<a href="/project/parking/report/select?id=${list.report_no}">${list.title}</a>
										</h4>
									</div>
									<div class="col-4 col-md-3">
										<h6 class="card-title">${list.nickname}</h6>
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

	<script>
		$("#writeBtn").click(function() {
			location.href = "/project/parking/report/write";
		});
	</script>
</body>
</html>