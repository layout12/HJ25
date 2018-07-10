<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-Cache");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/order.css">
<title>발주 상품 조회</title>
<script type="text/javascript">
	function cartInsert(t, g_no){
		var amt = $(t).parent().children(0).val();
		
		if(isNaN(amt) || amt <= 0){
			alert("숫자만 입력해주세요");
		} else {
			$.ajax({
				url: "orderCartSelectOne.order?i_id=${loginPerson.i_id}&g_no="+g_no+"&c_amt="+amt,
				success: function(msg){
					alert(msg);
				},
				error: function(){
					alert("통신 에러");
				}
			})
		}
	}
	
	function saleAna(g_name){
		var today = new Date();
		var eDate = new Date(today.getFullYear(), today.getMonth(), 0);
		today.setMonth(today.getMonth()-3);
		var sDate = new Date(today.getFullYear(), today.getMonth(), 1);
		
		var startDate = String(sDate.getFullYear()).substring(2, 4)+"/"+
						(Number(sDate.getMonth()+1)<10?"0"+Numver(sDate.getMonth()+1):sDate.getMonth()+1);
		
		var endDate = String(eDate.getFullYear()).substring(2, 4)+"/"+
						(Number(eDate.getMonth()+1)<10?"0"+Number(eDate.getMonth()+1):eDate.getMonth()+1);
		
		location.href="saleAnalysis.order?g_name="+g_name+"&i_id=${loginPerson.i_id}&startDate="+startDate+"&endDate="+endDate;
	}
</script>
<style type="text/css">
	h1 {
		margin-left: 15px;
		width: 300px;
		display: inline-block;
	}
	
	.sty_srch{
	height:40px;
	list-style: none;
	display: inline;
	float: right;
	margin-top: 25px;
	margin-bottom: 0px;
	}
	
	.sty_srch li{
	float:left;
	padding-right:5px;
	}
	
	#category{
		height: 34px;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
	#category button{
		width: 110px;
		float: left;
		margin-left: 16px;
		margin-right: 16px;
	}
	
</style>
</head>
<body>
	<%@include file="header.jsp" %>
	<% String search = request.getParameter("o_inputName");%>
	<div id="area">
		<h1>발주 상품 조회</h1>
		
		<form action="orderName.do" style="display: inline;">
		<ul class="form-group sty_srch clearfix">
	  		<li><input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!" name="o_inputName" value="<%=search == null? "" : search %>"></li>
	 		<li><button type="submit" class="btn btn-info">검색</button></li>
		</ul>
		</form>
		
		<div id="category">
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=10'">신선식품</button>
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=20'">음료</button>
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=30'">유제품</button>
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=40'">아이스크림</button>
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=50'">과자류</button>
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=60'">라면</button>
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=70'">가공식품</button>
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=80'">생활용품</button>
			<button class="btn btn-primary" onclick="location.href='orderCategorieList.do?ct_no=90'">빵</button>
		</div>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>제품명</th><th>매입단가</th><th>판매단가</th><th>담기</th><th>분석</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${List }" var="list">
				<tr>
					<td class="tableFont">${list.g_name }</td>
					<td class="tableFont">
					<fmt:parseNumber var="price" value="${list.g_price/2 }" integerOnly="true"/>
					${price }
					</td>
					<td class="tableFont">${list.g_price }</td>
					<td><input type="text" class="inputText" value="1"><input type="button" class="btn btn-primary" onclick="cartInsert(this, ${list.g_no})" value="담기"></td>
					<td><input type="button" class="btn btn-primary" value="분석" onclick="saleAna('${list.g_name }')"></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>