<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css?ver=1" />

<style type="text/css">
body {
	background-image:
		url("${pageContext.request.contextPath}/resources/img/loginBackground.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
	overflow: hidden;
}

.wrapper {
	margin-top: 300px;
	margin-bottom: 80px;
}

.form-signin {
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-signin-heading
	,
	.checkbox
	{
	margin-bottom
	:
	30px;
}

.checkbox {
	font-weight: normal;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	width: 280px;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
}

}
input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
}
</style>
</head>


<body>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#commLogin").hide();
		});
		function login() {
			$("#commLogin").show();
	
			var idVal = $("#u_id").val();
			var pwVal = $("#u_pw").val();
			if (idVal == null || idVal == "") {
				alert("ID를 입력해 주세요.");
			} else if (pwVal == null || pwVal == "") {
				alert("PW를 입력해 주세요");
	
			} else {
				$.ajax({
					type : "post",
					url : "loginAjax.do",
					data : "u_id=" + idVal + "&u_pw=" + pwVal,
					success : function(msg) {
						if (msg.lc) {
					
							if (msg.u_enabled ==true) {
								

								location.href = "loginRes.do";
							} else {
								$("#fail").html("<p style = 'color:red'>탈퇴된 회원입니다</p>");
							}
							
						} else {
	
							$("#fail").html("<p style = 'color:red'>아이디 혹은 비밀번호를 확인해 주세요</p>");
						}
	
					},
					error : function(statusCode) {
						alert("error : " + statusCode.status);
					}
				});
			}
		}
		function IdSearch() {
			window.open("userIdSearch.do", "아이디 찾기", "width=580, height=400, scrollbars=no, resizable=no, toolbars=no, menubar=no");
	
		}
	
		function PwSearch() {
			window.open("userPwSearch.do", "비밀번호 찾기", "width=500,height=500,left=200,top=100");
	
		}
	
		function userInsert() {
			location.href("userInsert.do");
	
		}
	</script>
<body>


	<div class="wrapper">
		<form class="form-signin">
			<h2 class="form-signin-heading">로그인</h2>
			<div>
				<input type="text" class="form-control" name="username"
					placeholder="ID를 입력해주세요" id="u_id" />
			</div>
			<br>
			<div>
				<input type="password" class="form-control" name="password"
					placeholder="PASSWORD를 입력해주세요" id="u_pw" />
			</div>
			<br>
			<div id="fail"></div>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				onclick="login()">로그인</button>
			<div style="text-align: justify;">
				<b> <a href="#" onclick="IdSearch();">아이디</a><a>/</a><a href="#"
					onclick="PwSearch();">비밀번호 찾기</a></b> <a href="userInsert.do">회원가입</a>
			</div>

		</form>
	</div>

</body>
</html>