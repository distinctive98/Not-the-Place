<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: 0.75rem;
}

.login, .image {
	min-height: 100vh;
}

.card-signin .card-title {
	margin-bottom: 2rem;
	font-weight: 300;
	font-size: 1.5rem;
}

.card-signin .card-img-left {
	width: 45%;
	/* Link to your background image using in the property below! */
	background: scroll center url("/project/resources/images/parking.png");
	background-size: cover;
}

.card-signin .card-body {
	padding-top: 50px;
}

.form-signin .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}

.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.5);
	overflow: hidden;
}

.btn-login {
	font-size: 0.9rem;
	letter-spacing: 0.05rem;
	padding: 0.75rem 1rem;
	border-radius: 2rem;
}

.form-label-group {
	position: relative;
	margin-top: 30px;
	margin-left: 20px;
}

.form-label-group input {
	height: auto;
	border-radius: 2rem;
}

.form-label-group>input, .form-label-group>label {
	padding: var(- -input-padding-y) var(- -input-padding-x);
}

.form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 100%;
	margin-bottom: 0;
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
}

.imgloc {
	margin-top: 2%;
	margin-left: 45%;
}
</style>
</head>
<body>
	<div class="container text-center">
		<div style="margin-top: 150px"></div>
		<div class="container">
			<a href="/project/parking/main"><img class="imgloc"
				src="/project/resources/images/title2.png" id="mainBtn"
				style="width: 200px !important;"></a>
		</div>
		<div class="row">
			<div class="col-lg-13 col-xl-10 mx-auto">
				<div class="card card-signin flex-row my-5">
					<div class="card-img-left d-none d-md-flex"></div>
					<div class="card-body">
						<h5 class="card-title text-center"
							style="text-align: center; font-family: NanumBarunGothic">안녕하세요!</h5>
						<form method="post" action="/project/parking/login">
							<div class="form-label-group">
								<input type="email" id="inputEmail" class="form-control"
									placeholder="이메일" name="email"
									style="font-family: NanumBarunGothic" required autofocus>
							</div>
							<div class="form-label-group">
								<input type="password" id="inputPassword" class="form-control"
									placeholder="비밀번호" name="password" required
									style="font-family: NanumBarunGothic">
							</div>
							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1">
							</div>
							<button
								class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
								type="submit" style="margin-bottom: 20px !important">로그인</button>
							<button
								class="btn btn-lg btn-secondary btn-block btn-login text-uppercase font-weight-bold mb-2"
								type="button" id="registerBtn">회원가입</button>
							<div class="text-center">
								<a class="small" href="/project/parking/main">메인으로 이동하기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$("#registerBtn").click(function() {
			location.href = "/project/parking/register";
		});
	</script>
</body>
</html>