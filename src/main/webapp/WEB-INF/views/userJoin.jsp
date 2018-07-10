<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css?ver=1" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/userinsert.js?ver=1"></script>
<script type="text/javascript" src="resources/js/info.js?ver=1"></script>
<style type="text/css">

@import "bourbon";

body {
	background: #eee !important;	
}

.wrapper {	
	margin-top: 100px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  width: 680;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
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
.form-signin-heading{
text-align: center;


}

</style>

</head>
<body>

<div id="userjoinForm" >

<div class = "wrapper">
<form action="AfterInsert.do" class = "form-signin" method="post" >
<h1 class = "form-signin-heading">회원가입</h1>
<input type="text" class="form-control"  name="u_name"  placeholder="이름을 입력해주세요"><br>


<input type="text" class="form-control id" name="u_id"  id="u_id"  placeholder="ID를 입력해주세요" ><br>


<input type="password" class="form-control"  name="u_pw" id="u_pw" oninput="wordChk(this.value)" placeholder="비밀번호 입력 영문자와 숫자로 6~12자리까지 "><br>

<input type="password" class="form-control"  name="u_pwch"  id="u_pwch" oninput="checkPwd()" placeholder="비밀번호를 확인해주세요" >
<br>


<input type="text" class="form-control"  name="u_phone" id="u_phone" oninput="phoneChk(this.value)" placeholder="'-'를 제외한 전화번호를 입력해주세요 ">
<br>
<input type="text" class="form-control" name="u_email" id="u_email" oninput="emailChk(this.value)" placeholder="EMAIL을 입력해주세요">
<br>

<input type="text" class="form-control" onclick="goPopup(this)" readonly="readonly" name="u_addr" id="u_addr" placeholder="주소 입력을 위해 클랙해주세요">
<br>
<input type="text" class="form-control"  name="i_id" id="i_id" placeholder="가게ID를 입력해주세요">
<br>
<input type="button"  class= "btn btn-lg btn-primary cancelbtn" onclick="infoForm()" value="가게아이디 가입하기">
<br><br>

<input type="submit" value="등록" class = "btn btn-lg btn-primary signupbtn" disabled="disabled">
<input type="reset" value="취소" class= "btn btn-lg btn-primary cancelbtn">
<input type="button" value = "뒤로가기" class = "btn btn-lg btn-primary" onclick="location.href='login.do'">


</form>
</div>
</div>

<div id="infojoinForm" >
<div class = "wrapper">
<form action="" class = "form-signin" method="post" >
<h1 class = "form-signin-heading">가게정보</h1>
<input type="text" class="form-control"  name="i_id" id="info_i_id" placeholder="ID을 입력해주세요"><br>


<input type="text" class="form-control id" name="i_name"  id="i_name"  placeholder="가게이름를 입력해주세요" ><br>


<input type="text" class="form-control"  name="i_addr" id="i_addr"  onclick="goPopup(this)" readonly="readonly" placeholder="주소 입력을 위해 클랙해주세요"><br>

<input type="text" class="form-control"  name="i_detailaddr"  id="i_detailaddr" readonly="readonly">
<br>


<input type="text" class="form-control"  name="i_postno" id="i_postno"readonly="readonly">
<br>

<input type="button" value="등록" class = "btn btn-lg btn-primary" onclick="infojoin(this)" id="signupbtn" disabled="disabled">
<input type="reset" value="취소" class= "btn btn-lg btn-primary cancelbtn" onclick="usertFrom()"> 
<input type="button" value = "뒤로가기" class = "btn btn-lg btn-primary" onclick="location.href='login.do'">


</form>
</div>



</div>


</body>

</html>