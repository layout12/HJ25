<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-Cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
<script type="text/javascript">
	$(function(){
		var msg = "${msg}";
		if(msg != null && msg != ""){
			alert(msg);
		}
	})
	
	function saleList(){
		location.href = "saleList.order?i_id=${loginPerson.i_id}&sal_date="+today();
	}
	
	function orderList(){
		location.href = "orderList.order?i_id=${loginPerson.i_id}&o_inputDate="+today();
	}
	
	function orderCart(){
		location.href = "orderCart.order?i_id=${loginPerson.i_id}&o_inputDate="+today();
	}
	
	function today(){
		var date = new Date();
		var yy = String(date.getFullYear()).substring(2, 4);
		var m = date.getMonth()+1;
		var mm = m < 10 ? 0+String(m) : m;
		var dd = date.getDate() < 10 ? 0+String(date.getDate()) : date.getDate();
		var yymmdd = yy+"/"+mm+"/"+dd;
		
		return yymmdd;
	}
</script>
<style type="text/css">
	.main{
		width: 900px;
		margin: auto;
		margin-top: 300px;
	}
	
	.main p{
		text-align: center;
	}
	
	p:nth-child(1) button, p:nth-child(2) button{
		width: 152px;
	}
	
	p:nth-child(3) button, p:nth-child(4) button{
		width: 308px;
	}
</style>
<title>발주 메인 화면</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="main">
		<p><button class="btn btn-primary btn-lg" onclick="location.href='orderGoodsList.order?i_id=${loginPerson.i_id}'">발주 상품 조회</button>
		<button class="btn btn-primary btn-lg" onclick="saleList()">판매 조회</button></p>
		<p><button class="btn btn-primary btn-lg" onclick="orderList()">발주서 조회</button>
		<button class="btn btn-primary btn-lg" onclick="location.href='stockList.order?i_id=${loginPerson.i_id}'">재고 조회</button></p>
		<p><button class="btn btn-primary btn-lg" onclick="orderCart()">발주 장바구니</button></p>
		<p><button class="btn btn-primary btn-lg" onclick="location.href='BoardList.do?pageNo=1'">공지사항 &amp; QnA 게시판</button></p>
		<p><button class="btn btn-primary btn-lg" onclick="location.href='userList.do?pageNo=1'">관리자페이지</button></p>
	</div>
</body>
</html>