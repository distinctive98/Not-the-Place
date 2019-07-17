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
	<c:if test="${!empty vo}">
		<h1 class="text-center">Confirm</h1>
		<div class="container">
			<h3 class="text-center">${vo.title}</h3>
			<hr>

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
						alt="Responsive image">
				</div>
			</div>
			<hr>

		</div>
	</c:if>
	<div class="container text-center">
		<button type="button" class="btn btn-primary btn-lg" id="confirmBtn">확인</button>
	</div>
	
	<script>
		$("#confirmBtn").click(function(){
			location.href = "/project/parking/report"
		});
	</script>
</body>
</html>