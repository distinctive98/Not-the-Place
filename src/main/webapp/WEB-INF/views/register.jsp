<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: 0.75rem;
}

.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.5);
	overflow: hidden;
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

.form-signin {
	width: 100%;
}

.form-signin .btn {
	font-size: 80%;
	border-radius: 2rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
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
	transition: all .1s ease-in-out;
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
			<img class="imgloc"
				src="/project/resources/images/title2.png" id="mainImg"
				style="width: 200px !important; margin-bottom: -30px">
		</div>
		<div class="row">
			<div class="col-lg-13 col-xl-10 mx-auto">
				<div class="card card-signin flex-row my-5">
					<div class="card-img-left d-none d-md-flex">
						<!-- Background image for card set in CSS! -->
					</div>
					<div class="card-body">
						<h5 class="card-title text-center"
							style="text-align: center; font-family: NanumBarunGothic; margin-bottom: -10px">환영합니다!</h5>

						<form class="form-signin" action="/project/parking/register"
							method="post" onsubmit='return regcheck();'>
							<div class="form-label-group">
								<input type="email" id="email" name="email" class="form-control"
									placeholder="이메일"
									style="font-family: NanumBarunGothic; margin-bottom: -10px">
							</div>

							<div class="form-label-group">
								<input type="password" id="password" name="password"
									class="form-control" placeholder="비밀번호"
									style="font-family: NanumBarunGothic; margin-bottom: -10px">
							</div>

							<div class="form-label-group">
								<input type="password" id="confirmpassword"
									name="confirmpassword" class="form-control"
									placeholder="비밀번호재확인"
									style="font-family: NanumBarunGothic; margin-bottom: -10px">
							</div>
							
							<div class="form-label-group">
								<p id="pwcheck" style="color: red"></p>
							</div>
							
							<div class="form-label-group">
								<input type="text" id="nickname" name="nickname"
									class="form-control" placeholder="사용할 이름"
									style="font-family: NanumBarunGothic; margin-bottom: 20px">
							</div>


							<button
								class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
								type="submit">회원가입</button>
							<div class="text-center">
								<a class="small" href="/project/parking/login">로그인으로 이동하기</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#mainImg").click(function(){
			location.href="/project/parking/main";
		});
	
		$(document).ready(function() {
			$('.login-info-box').fadeOut();
			$('.login-show').addClass('show-log-panel');
			
			$('#confirmpassword').blur(function() {
				if ($('#confirmpassword').val() != $('#password').val()) {
					$('#pwcheck').text("비밀번호가 다릅니다.");
				} else {
					$('#pwcheck').text("");
				}
			});
		});

		$('.login-reg-panel input[type="radio"]').on('change', function() {
			if ($('#log-login-show').is(':checked')) {
				$('.register-info-box').fadeOut();
				$('.login-info-box').fadeIn();

				$('.white-panel').addClass('right-log');
				$('.register-show').addClass('show-log-panel');
				$('.login-show').removeClass('show-log-panel');

			} else if ($('#log-reg-show').is(':checked')) {
				$('.register-info-box').fadeIn();
				$('.login-info-box').fadeOut();

				$('.white-panel').removeClass('right-log');

				$('.login-show').addClass('show-log-panel');
				$('.register-show').removeClass('show-log-panel');
			}
		});
		
		function regcheck() {
			if (document.getElementById('email').value == "") {
				alert("이메일을 입력해주세요!!!");
				return false;
			} else if (document.getElementById('password').value == "") {
				alert("비밀번호를 확인해주세요");
				return false;
			} else if (document.getElementById('confirmpassword').value == "") {
				alert("비밀번호를 재확인해주세요");
				return false;
			} else if (document.getElementById('pwcheck').innerHTML == '비밀번호가 다릅니다.') {
				alert("비밀번호를 제대로 입력해주세요");
				return false;
			} else if (document.getElementById('nickname').value == "") {
				alert("닉네임을 입력해주세요!!!");
				return false;
			} else {
				return true;
			}
		}
		
		<c:if test="${!empty msg}">
			alert("${msg}");
		</c:if>
	</script>
</body>
</html>