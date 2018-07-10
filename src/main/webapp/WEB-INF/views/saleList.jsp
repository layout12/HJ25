<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-Cache");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/order.css">
<title>판매 조회</title>
<style type="text/css">
	h1 {
		display: inline-block;
	}
	
	.table{
		width: 1000px;
		margin: auto;
	}
</style>
<script type="text/javascript">
	$(function(){
		var price = document.getElementsByClassName("price");
		var amt = document.getElementsByClassName("amt");
		var sum = 0;
		
		for(var i=0 ; i<price.length ; i++){
			var p = Number($(price[i]).text());
			var a = Number($(amt[i]).text())
			sum += p*a;
		}
		
		$("#sum").val(sum);
		
		var sal_date = "${saleDate}";
		var sliceDate = sal_date.split("/");
		$("#saleDate").val("20"+sliceDate[0]+"-"+sliceDate[1]+"-"+sliceDate[2]);
		
		document.getElementById("saleDate").onchange = function(){
			var sal_date = String($("#saleDate").val()).substring(2, 10).replace(/-/g, "/");
			
			location.href = "saleList.order?i_id=${loginPerson.i_id}&sal_date="+sal_date;
		}
		
	})
</script>
</head>
<body>
	<%@include file="header.jsp" %>
	<div id="area">
		
	<h1>판매 조회</h1>
	
	<input type="date" style="margin-left: 10px" id="saleDate">
	
	<hr>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>제품명</th><th>판매단가</th><th>개수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty saleList }">
					<tr>
						<td colspan="3">판매 내역이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="list" items="${saleList }">
						<tr>
							<td class="tableFont">${list.g_name }</td>
							<td class="tableFont price">${list.g_price }</td>
							<td class="amt">${list.sal_amt }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" style="font-weight: bold;">
				총 판매금액 <input type="text" style="width: 100px" readonly="readonly" id="sum">
				</td>
			</tr>
		</tfoot>
	</table>
		
	</div>
	
</body>
</html>