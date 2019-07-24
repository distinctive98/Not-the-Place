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
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<style>
svg {
	width: 90%;
	height: 400px;
	border: 1px solid #cccccc;
}

.barNum {
	font-family: NanumSquare;
	font-size: 15pt;
	color : blue;
	text-anchor: middle;
}

.axis text {
	font-family: NanumSquare;
	font-size: 12pt;
}

.axis path, .axis line, .axis rect {
	fill: none;
	stroke: black;
}

.barName {
	font-family: NanumSquare;
	font-size: 12pt;
	text-anchor: middle;
}

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
		<img src="/project/resources/images/main_stat.png" class="img-fluid"
			alt="">
	</div>

	<hr>
	<div class="container" style="border: 1px solid #cccccc;">
		<form method="POST" action="/project/parking/stat">

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
						<option value="time_level1" id="time_level1">월 단위</option>
						<option value="time_level2" id="time_level2">일 단위</option>
						<option value="time_level3" id="time_level3">요일 단위</option>
					</select>
				</div>
			</div>

			<div class="container text-center" style="padding-bottom: 10px">
				<button type="submit" class="btn btn-lg btn-secondary">검색하기</button>
			</div>

		</form>
	</div>
	<hr>
	<br>
	<br>
	<c:if test="${!empty list}">
		<c:if test="${!empty title}">
			<div class="contatiner text-center">
				<c:choose>
					<c:when
						test="${!empty title.addressTitle}&& ${!empty title.timeTitle}">

					</c:when>
				</c:choose>
				<h2 style="font-family: NanumSquare;">
					<span style="color:gray">${title.addressTitle}</span><span style="color:gray"> ${title.timeTitle}</span>
					검색 결과입니다
				</h2>
			</div>
			<br>
		</c:if>
		<div class="contatiner text-center">
			<svg id="graph"></svg>
		</div>

		<br>
		<br>
		<div class="container">

			<table class="table table-striped">
				<thead class="thead-light">
					<tr>
						<th scope="col">#</th>
						<th scope="col">위치</th>
						<th scope="col">시간</th>
						<th scope="col">개수</th>
					</tr>
				</thead>
				<c:set var="i" value="0" />
				<c:forEach var="list" items="${list}" begin="1" end="30" step="1">
					<tbody>
						<tr>
							<c:set var="i" value="${i + 1}" />
							<th scope="row">${i}</th>
							<td><a href="/project/parking/report/search?searchType=report_address&searchWord=${list.addressLevel}">${list.addressLevel}</a></td>
							<td>${list.timeLevel}</td>
							<td>${list.count}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>


		</div>
	</c:if>
	<script>
		<c:if test="${!empty list}">
			var address = new Array();
			var time = new Array();
			var count = new Array();
			
			<c:forEach items="${list}" var="list" begin="0" end="8" step="1">	
				address.push("${list.addressLevel}");
				time.push("${list.timeLevel}");
				count.push("${list.count}");
				//alert("${list.addressLevel}")
			</c:forEach>
			
			var min = d3.min(count, function(e){return e;});
			var max = d3.max(count, function(e){return e;});
			
			var countMax = Math.max.apply(null, count);
			var dataMax = countMax+10-(countMax%10);
			
			var colorSet = d3.scale.linear().domain([min, dataMax]).range(["gray", "green"]);
				
			var graph = d3.select("#graph");
			var scaleY = d3.scale.linear().domain([0, dataMax]).range([300, 0]);
			var dataY = d3.scale.linear().domain([0, dataMax]).range([0, 300]);
			
			graph
			.append("g")	// 그룹화함
			.attr("class", "axis")
			.attr("transform", "translate(40, 20)")	// 표시 위치 조정
			.call(d3.svg.axis()	// call()로 눈금을 표시할 함수를 호출
				.scale(scaleY)  // 스케일을 적용	
				.ticks(5)
			    .orient("left")
		    );
			
			var barElements = graph.selectAll("rect").data(count);
			barElements.enter()
			.append("rect")	
			.attr("class", "bar")
			.attr("height", 0)
			.attr("width", 80)
			.style("fill", function(d){return colorSet(d);})
			.attr("x", function(d, i){
				return i * 120 + 60;
			})
			.attr("y", 300+20)
			// 이벤트 추가
			/*
			.on("mouseover", function(){
				d3.select(this)
					.style("fill", "orange");
					console.log(this);
				})
			.on("mouseout", function(){
				d3.select(this)
					.style("fill",  function(d){return colorSet(d);})	
				})
			*/
			.transition()
			.duration(1000)	// 1초동안 애니메이션 처리
			.delay(function(d, i){
				return i * 100;	// 0.1초 대기
			})
			.attr("y", function(d, i){
				return 300+20 - dataY(d);
			})
			.attr("height",function(d,i){
				return dataY(d);
			});
			
			
			// 막대의 레이블을 표시
			barElements.enter()
			.append("text")
			.attr("class", "barName")
			.attr("x", function(d, i){	// X 좌표를 지정
				return i * 120 + 60 + 40;	// 막대그래프의 표시 간격을 맞춤
			})
			.attr("y", 300 + 20 + 20)
			.text(function(d, i){
				return address[i];	// 레이블 이름을 반환
			})
			.append("tspan")
			.attr("class", "barName")
			.attr("x", function(d, i){
				return i * 120 + 60 + 40;
			})
			.attr("y", 300 + 20 + 40)
			.text(function(d, i){
				return time[i];	// 레이블 이름을 반환
			});
			
			//x축
			barElements.enter()
			.append("rect")
			.attr("class", "axis")
			.attr("x", 40)
			.attr("y", 300+20)
			.attr("width", "95%")
			.attr("height", 1);
			
			barElements.enter()	// text 요소 지정
			.append("text")	// text 요소 추가
			.style("opacity", "0")
			.attr("class", "barNum")	// CSS 클래스 설정
			.attr("x", function(d, i){	// X 좌표를 지정
				return i * 120 + 60 + 40;	// 막대그래프의 표시 간격을 맞춤
			})
			.attr("y", function(d, i){
				return 300;
			})
			.text(function(d, i){	// 데이터 표시
				return d;
			})
			.transition()
			.duration(1000)
			.delay(function(d, i){
				return 500;
			})
			.attr("y", function(d, i){
				return 300 - dataY(d) + 10;
			})
			.style("opacity", "1")
		</c:if>
	</script>
</body>
</html>