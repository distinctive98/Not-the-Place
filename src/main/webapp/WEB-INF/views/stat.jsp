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
				<h1>통계</h1>
				<h4>여러분이 쌓아올린 데이타</h4>
			</div>
		</div>
	</div>

	<div class="container" style="border: 1px solid #cccccc;">
		<form method="POST" action="/project/parking/stat" id="searchForm">

			<div class="form-group row" style="padding-top: 15px">
				<label class="col-sm-1 col-form-label">위치별</label>
				<div class="col-sm-11">
					<select class="custom-select" name="addressLevel">
						<option selected>선택 안 함</option>
						<option value="address_level1">시 단위 (현재 서울특별시만 적용됩니다)</option>
						<option value="address_level2">구 단위 (현재 서울특별시만 적용됩니다)</option>
						<option value="address_level3">동 단위 (현재 서울특별시만 적용됩니다)</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">시간대별</label>
				<div class="col-sm-11">
					<select class="custom-select" name="timeLevel">
						<option selected>선택 안 함</option>
						<option value="time_level1">월 단위</option>
						<option value="time_level2">일 단위</option>
						<option value="time_level3">요일 단위</option>
					</select>
				</div>
			</div>

			<div class="container text-center" style="padding-bottom: 10px">
				<button type="submit" class="btn btn-primary btn-lg">검색하기</button>
			</div>

		</form>
	</div>

	<script>
		$(document).ready(function() {
			$("#searchBtn").click(function() {
				$.ajax("/project/parking/stat", {
					type : "POST", //POST면 반드시 명시
					data : $("#searchForm").serialize(),
					async : false,
					success : function(data) {
						$("#rankingContainer").css("display", "block");
					}
				});
			});
		});
	</script>

	<br>
	<br>
	<div class="container" id="rankingContainer">
		<c:if test="${!empty list}">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">위치</th>
						<th scope="col">시간</th>
						<th scope="col">개수</th>
					</tr>
				</thead>
				<c:set var="i" value="0" />
				<c:forEach var="list" items="${list}">
					<tbody>
						<tr>
							<c:set var="i" value="${i + 1}" />
							<th scope="row">${i}</th>
							<td>${list.addressLevel}</td>
							<td>${list.timeLevel}</td>
							<td>${list.count}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>

	</div>

</body>
</html>