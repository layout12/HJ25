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
<title>재고 조회</title>
<script type="text/javascript">
	$(function(){
		var amt = document.getElementsByClassName("amt");
		var del = document.getElementsByClassName("stockDelete");
		for(var i=0 ; i<amt.length ; i++){
			var a = Number($(amt).eq(i).text());
			if(a == 0){
				$(del).eq(i).show();
			}
		}
	});
	
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
	
	function stockDelete(s_no){
		var real = confirm("정말 삭제하시겠습니까?");
		if(real){
			$.ajax({
				url: "stockDelete.order?s_no="+s_no,
				success: function(msg){
					alert(msg);
					location.reload();
				},
				error: function(){
					alert("통신 에러");
				}
			})
		}
	}
	
	function autoCart(){
		var tf = confirm("현재 장바구니에 담겨있는 물건들이 비워지게 됩니다.\n그래도 괜찮으시겠습니까?");
		if(tf){
			$.ajax({
				url: "autoOrderSearshList.order?i_id=${loginPerson.i_id}",
				success: function(msg){
					alert(msg);
				},
				error: function(){
					alert("통신 에러");
				}
			})
		}
	}
</script>
<style type="text/css">
	h1{
		display: inline-block;
	}
	
	#autoCart{
		float: right;
		margin-top: 20px;
	}
	
	.stockDelete{
		display: none;
	}
</style>
</head>
<body>
	<%@include file="header.jsp" %>
	<div id="area">
		<h1>재고 조회</h1>
		<button class="btn btn-primary btn-lg" id="autoCart" onclick="autoCart()">자동 장바구니 담기</button>
		
		<hr>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>제품명</th><th>현재고</th><th>매입단가</th><th>담기</th><th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty stockList }">
						<tr>
							<td colspan="5">재고가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${stockList }" var="list">
						<tr>
							<td class="tableFont">${list.g_name }</td>
							<td class="tableFont amt">${list.s_amt }</td>
							<td class="tableFont">
							<fmt:parseNumber var="price" integerOnly="true" value="${list.g_price/2 }" />
							${price }
							</td>
							<td><input type="text" class="inputText" value="1"><input type="button" class="btn btn-primary" onclick="cartInsert(this, ${list.g_no})" value="담기"></td>
							<td><input type="button" class="btn btn-primary stockDelete" onclick="stockDelete(${list.s_no })" value="삭제"></td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
</body>
</html>