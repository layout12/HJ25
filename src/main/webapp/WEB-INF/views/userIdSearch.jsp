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
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css?ver=1" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
body {
	background: #eee !important;
}

.form-signin {
	max-width: 580px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

.form-control {
	font-size: 16px;
	height: auto;
	padding: 10px;
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

#searchIdRes{
	display: none;
}

</style>
<script type="text/javascript">
	function searchId(){
		var name = $("#u_name").val();
		var email = $("#u_email").val();
		if(name == "" || name == null || email == "" || email == null){
			alert("이름과 이메일을 입력해주세요!");
		} else {
			$.ajax({
				url: "userIdSearchRes.do?u_name="+name+"&u_email="+email,
				success: function(msg){
					$("#searchId").hide();
					$("#searchIdRes").show();
					$("#searchIdRes h3").text(msg);
				},
				error: function(){
					alert("검색에 실패했습니다. 다시 시도해주세요.");
				}
			})
		}
	}
</script>
</head>
<body>

	<div>
		<h1 style="text-indent: 15px; font-weight: bold;">아이디 찾기</h1>
		<hr style="margin-top: 5px; margin-bottom: 5px;">
			<div class="form-signin" id="searchId">
			<input type="text" id="u_name" style="width: 400px; margin: auto;" class = "form-control" placeholder="이름">
			<br>
			<input type="text" id="u_email" style="width: 400px; margin: auto;" class = "form-control" placeholder="이메일">
			<br>
			<button style="width:200px; margin: auto;" class="btn btn-lg btn-primary btn-block" type="button" onclick="searchId()">아이디 찾기</button>
			</div>
			<div class="form-signin" id="searchIdRes" style="text-align: center;">
				<h3 style="font-weight: bold;"></h3>
				<br>
				<button onclick="self.close()" class="btn btn-lg btn-primary">확인</button>
				<button onclick="location.href='userPwSearch.do'" class="btn btn-lg btn-primary">비밀번호 찾기</button>
			</div>
	</div>



</body>
</html>