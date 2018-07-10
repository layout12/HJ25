<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<div id="header" style="background-color: #337AB7; height: 30px; text-align: center; padding-top: 5px;"> 	
	<span style="float:right;">
	<span style="color:white;">${loginPerson.u_id} 점주님 환영합니다!</span>
	<b style="color:white;">ㅣ</b>
	<a href="logout.do" style="color: white;">로그아웃</a>
	<b style="color:white;">ㅣ</b>
	<a href="loginRes.do" style="color: white;">메인화면</a>
	<b style="color:white;">ㅣ</b>
	<a href="BoardList.do?pageNo=1" style="color: white;">게시판</a>
	<b style="color:white;">ㅣ</b>
	<span style="margin-right: 15px;"><a href="userInfo.do?u_id=${loginPerson.u_id}" style="color:white;">내 정보 수정</a></span>
	</span>
</div>
<script>
	onload = function(){
		if(${empty loginPerson}){
			location.href = "login.do";
		}
	}
</script>