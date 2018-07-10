<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css?ver=1" />

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
  max-width: 780px;
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
.form-signin-heading{
text-align: center;


}
</style>

</head>
<body>
<div class = "wrapper" align="center">
<form class="form-signin">


	<h2 class="form-signin-heading">가입이 완료되었습니다.</h2>
	
	<div align="left">
	<ul>
		<li class="form-control">이름 : <%= request.getParameter("u_name") %></li>
		<li class="form-control">아이디 : <%= request.getParameter("u_id") %></li>
		<li class="form-control">전화번호 : <%= request.getParameter("u_phone") %></li>
		<li class="form-control">이메일 : <%= request.getParameter("u_email") %></li>
		<li class="form-control">주소 : <%= request.getParameter("u_addr") %></li>
	</ul>
	</div>
	
	<input type="button" value = "로그인" class = "btn btn-lg btn-primary" onclick="location.href='login.do'">


</form>
</div>
</body>
</html>