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
<title>회원 정보</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css?ver=1" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	$(function(){
		var msg = "${msg}";
		if(msg != null && msg != ""){
			alert(msg);
		}
		
		$("#u_pw").focusout(function(){
			$("#u_pwch").val("");
			var e = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
			if(e.test($(this).val())){
				$(this).css("background-color", "#B0F6AC");
			} else {
				$(this).css("background-color", "#FFCECE");
			}
		})
		
		$("#u_pwch").focusout(function(){
			var e = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
			if(e.test($(this).val()) && $("#u_pw").val() == $(this).val()){
				$(this).css("background-color", "#B0F6AC");
			} else if (!e.test($(this).val()) || $("#u_pw").val() != $(this).val()) {
				$(this).css("background-color", "#FFCECE");
			}
		})
		
		$("#u_email").focusout(function(){
			var e = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/i;
			if(e.test($(this).val())){
				$.ajax({
					url: "UdundantInspection.do?column=u_email&val="+$(this).val(),
					success: function(msg){
						if(msg == "null" || msg == "${loginPerson.u_no}"){
							$("#u_email").css("background-color", "#B0F6AC");
						} else {
							alert("해당 이메일이 이미 존재합니다");
							$("#u_email").css("background-color", "#FFCECE");
						}
					},
					error: function(){
						alert("이메일 중복 검사 실패");
					}
				})
			} else {
				$(this).css("background-color", "#FFCECE");
			}
		})
		
		$("#u_phone").focusout(function(){
			var e = /^[0-9]{10,11}$/g;
			if(e.test($(this).val())){
				$.ajax({
					url: "UdundantInspection.do?column=u_phone&val="+$(this).val(),
					success: function(msg){
						if(msg == "null" || msg == "${loginPerson.u_no}"){
							$("#u_phone").css("background-color", "#B0F6AC");
						} else {
							alert("해당 번호가 이미 존재합니다");
							$("#u_phone").css("background-color", "#FFCECE");
						}
					},
					error: function(){
						alert("전화번호 중복 검사 실패");
					}
				})
			} else {
				$(this).css("background-color", "#FFCECE");
			}
		})
		
		$("#updateForm").submit(function(){
			var value = document.getElementsByClassName("form-control");
			for(var i=0 ; i<value.length ; i++){
				if(value[i].value == "" || value[i].value == null){
					alert("값을 모두 입력해주세요");
					return false;
				} else if (value[i].style.backgroundColor == "rgb(255, 206, 206)"){
					alert("올바른 값을 입력해주세요");
					return false;
				}
			}
		})
	})
	
	function userDelete(){
		var tf = confirm("정말로 탈퇴하시겠습니까?");
		if(tf){
			$.ajax({
				url: "userDelete.do?u_no=${myInfo.u_no}",
				success: function(msg){
					alert(msg);
					if(msg != "탈퇴 실패"){
						location.href = "index.jsp";
					}
				},
				error: function(){
					alert("통신 실패");
				}
			})
		}
	}
</script>
<style type="text/css">

body {
	background: #eee !important;
}

.updateForm{
	border-radius: 25px;
	margin: auto;
	margin-top: 150px;
	margin-bottom: 80px;
	max-width: 630px;
	padding: 15px 35px 45px;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	text-align: center;
}

td, th{
	text-align: left;
	position: relative;
	font-size: 16px;
	height: auto;
	width: 70%;
	padding: 10px;
}

td{
	width: 30%;
}

</style>


</head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="updateForm">
	<form action="userInfoUpdate.do" id="updateForm">
		<input type="hidden" name="u_no" value="${myInfo.u_no }">
		<input type="hidden" name="u_id" value="${myInfo.u_id }">
		<table style="width: 100%;">
	
			<tr>
				<td>이름</td>
				<th>${myInfo.u_name }</th>
			</tr>
			<tr>
				<td>아이디</td>
				<th>${myInfo.u_id }</th>
			</tr>
			<tr>
				<td>비밀번호</td>
				<th><input type="password" class="form-control"  name="u_pw" id="u_pw" placeholder="비밀번호 입력 영문자와 숫자로 6~12자리까지 "></th>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<th><input type="password" class="form-control" id="u_pwch" placeholder="비밀번호를 확인해주세요"></th>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td>주소</td>
				<th><input type="text" class="form-control" onclick="goPopup(this)" readonly="readonly" name="u_addr" id="u_addr" value="${myInfo.u_addr }" required="required"></th>
			</tr>
			<tr>
				<td>전화번호</td>
				<th><input type="text" class="form-control" name="u_phone" id="u_phone" placeholder="'-'를 제외한 전화번호를 입력해주세요 " value="${myInfo.u_phone }" required="required"></th>
			</tr>
			<tr>
				<td>Email</td>
				<th><input type="text" class="form-control" name="u_email" id="u_email" placeholder="EMAIL을 입력해주세요" value="${myInfo.u_email }" required="required"></th>
			</tr>
			<tr>
				<td>가게아이디</td>
				<th>${myInfo.i_id }</th>
			</tr>
			
		</table>
		<div style="margin-top: 15px;">
			<button class="btn btn-primary btn-lg" id="updateBtn">수정하기</button>
			<button type="button" onclick="userDelete()" class="btn btn-primary btn-lg">탈퇴하기</button>
		</div>
	</form>
	</div>
</body>
</html>