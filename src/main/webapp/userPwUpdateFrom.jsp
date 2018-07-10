<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.apache.commons.codec.binary.Base64"  %>
        <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

var urldecode = null;
$(function(){
	var url = "${param.url}";
  
	$.ajax({
		url : "decode.do",
		data : "url="+url,
		success: function(date){
			urldecode = date;
		},
		erorr : function(){
			alert("decode실패")
		},
		
	})
	.done(function(){
		$("#url").val(urldecode);
		var url = urldecode.split("!");
	
		var sysdate =url[2].split("=")[1];
		var date = new Date();
		date.setHours(date.getHours()+9);
		 date = date.toISOString();
		
		 
		if(sysdate.substr(0, 10)!=date.substr(0, 10)){
			alert("유효시간이 지났습니다 다시 비밀번호찾기를 해주시기바랍니다");
		   location.href="login.do";
		}
		if(date.substr(11, 2)-sysdate.substr(11, 2)>1){
			alert("유효시간이 지났습니다 다시 비밀번호찾기를 해주시기바랍니다");
			 location.href="login.do";
		}
		
		if(date.substr(11, 2)-sysdate.substr(11, 2)==1 && (60+Number(date.substr(14, 2)))-sysdate.substr(14, 2)>31 ){
			alert("유효시간이 지났습니다 다시 비밀번호찾기를 해주시기바랍니다");
			 location.href="login.do";
		}
		if(date.substr(11, 2)-sysdate.substr(11, 2)==0 && (sysdate.substr(14, 2))-date.substr(14, 2)>31 ){
			alert("유효시간이 지났습니다 다시 비밀번호찾기를 해주시기바랍니다");
			 location.href="login.do";
		}
		$("#u_id").val(url[0].split("=")[1]);
	})

	$("#u_pw").focusin(function(){
		$("#u_pwch").val("");
		$("#u_pwch").css("background-color", "white");
	})
	
});

function checkPwd() {
	var inputed = $('#u_pw').val();
	var reinputed = $('#u_pwch').val();
	if (reinputed == "") {
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#u_pwch").css("background-color", "#FFCECE");
	} else if (inputed == reinputed) {
		$("#u_pwch").css("background-color", "#B0F6AC");
			$(".signupbtn").prop("disabled", false);
			$(".signupbtn").css("background-color", "#4CAF50");
		
		
	} else if (inputed != reinputed) {
		pwdCheck = 0;
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#u_pwch").css("background-color", "#FFCECE");
	}
}

function wordChk(str) {
	
	var idReg = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z]).*$/g;

	if (idReg.test( $("#u_pw").val() ) ) {
		$(".signupbtn").prop("disabled", true);
		$("#u_pw").css("background-color", "#B0F6AC");
		
		
	} else {
		$(".signupbtn").prop("disabled", true);
		$("#u_pw").css("background-color", "#FFCECE");
	}

}

function pwUdate(){
	var u_id = $('#u_id').val();
	var u_pw = $('#u_pw').val();
	var u_pwch = $('#u_pwch').val();
	
	if (u_pw == "" || u_pw == null) {
		alert("비밀번호를 입력해주시기바랍니다.");
		return false;
	}
	if (u_pwch == "" || u_pwch == null) {
		alert("비밀번호 확인을 입력해주시기바랍니다.");
		return false;
	}
	$.ajax({
		url:"pwUpdate.do",
		data : "u_id="+u_id+"&u_pw="+u_pw,
		success: function(date){
			if(date !=0){
				alert("비밀번호변경에 성공하셧습니다");
				location.href="login.do"
			}else{
				alert("비밀번호 변경에 실패하셨습니다");
				return false;
			}
			
			
		},
		erorr:function(){
			alert("비밀번호 변경에러");
		}
	})
}

</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css?ver=1" />

<style type="text/css">
@import "bourbon";

body {
	background: #eee !important;
}

.wrapper {
	margin-top: 300px;
	margin-bottom: 80px;
}

.form-signin {
	max-width: 580px;
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
</style>
</head>
<body>

<div class= "wrapper">
<form class= "form-signin">

<h1 class = "form-signin-heading" style="text-align: center">비밀번호 변경 Page</h1>
<input type="hidden" class="form-control" name="u_id" id="u_id">
<input type="password" class="form-control"  name="u_pw" id="u_pw" oninput="wordChk(this.value)" placeholder="비밀번호 입력 영문자와 숫자로 6~12자리까지 "><br>
<input type="password" class="form-control"  name="u_pwch"  id="u_pwch" oninput="checkPwd()" placeholder="비밀번호를 확인해주세요" >
<br>
<input type="button" value="수정" class="btn btn-lg btn-primary btn-block signupbtn" disabled="true" onclick="pwUdate()">

</form>
</div>
</body>
</html>