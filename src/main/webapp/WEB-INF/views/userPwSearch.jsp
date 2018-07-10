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
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


	function email(val) {
		var a = $("#u_emailForm");
		a.val("");
		if (val == "text") {
			a.prop("readonly", false);
		} else {
			a.val(val);
			a.prop("readonly", true);
		}
	}



	function userPwSearch() {
		var u_id = $("input[name=u_id]").val();
		var u_name = $("input[name=u_name]").val();
		var u_email = $("input[name=u_email]").val();
		var u_emailFrom = $("#u_emailForm").val();

		var date = new Date();
		date.setHours(date.getHours()+9);
	    var sysdate = date.toISOString();
	    
	    
		if (u_id == "" || u_id == null) {
			alert("ID를 입력해주시기바랍니다.");
			return false;
		}
		if (u_name == "" || u_name == null) {
			alert("이름을 입력해주시기바랍니다.");
			return false;
		}

		if (u_email == "" || u_email == null) {
			alert("이메일을 입력해주시기바랍니다.");
			return false;
		}
		if (u_emailForm == "" || u_emailForm == null) {
			alert("이메일을 입력해주시기바랍니다.");
			return false;
		}
		
		$("#search").prop("disabled",true);

		$.ajax({
			url:"PwSearch.do",
			data:"u_id="+u_id+"&u_name="+u_name+"&u_email="+u_email+"@"+u_emailFrom+"&sysdate="+sysdate,
			success : function(data){
				if(data =="회원정보를 찾을 수 없습니다"){
				alert(data);
				$("#search").prop("disabled",false);
			}else{
				if(data=='true'){
					alert("비밀 번호변경에 대한 메일을 발송하엿습니다 확인해주시기바랍니다");
					$("#search").prop("disabled",false);
					self.close();
					
				}else{
					alert("메일전송 에러");
					$("#search").prop("disabled",false);
				}
				
			}
			},
			erorr:function(){
				alert("에러");
				$("#search").prop("disabled",false);
			}
			
		})
		


	}
</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css?ver=1" />
<title>비밀번호 찾기</title>
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
	<div id="area">
		<hr>
		<h3 class="form-signin-heading">비밀번호 찾기</h3>

		<div class="form-signin">
			아이디 <input type="text" class="form-control" name="u_id"
				placeholder="아이디를 입력해주세요"><br> 이름 <input type="text"
				class="form-control" name="u_name" placeholder="이름을 입력해주세요"><br>
			이메일
			<div style="width: 430px">
				<input class="form-control" name="u_email" type="text"
					style="width: 150px; float: left"> @ <input type="text"
					class="form-control" id="u_emailForm" name="u_emailForm"
					style="width: 150px; display: inline-block"> <select
					onchange="email(this.value)" style="height: 30px;">
					<option selected="selected" value="text">직접 입력</option>
					<option value="naver.com">네이버</option>
					<option value="hanmail.net">다음</option>
					<option value="gmail.com">구글</option>
				</select>
			</div>

			<br>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				style="clear: both" onclick="userPwSearch()" id="search">비밀번호 찾기</button>
		</div>


	</div>

</body>
</html>