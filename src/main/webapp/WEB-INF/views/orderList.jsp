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
<title>발주서 조회</title>
<script type="text/javascript">
	$(function(){
		count();
		
		var order_date = "${o_inputDate}";
		var sliceDate = order_date.split("/");
		$("#orderDate").val("20"+sliceDate[0]+"-"+sliceDate[1]+"-"+sliceDate[2]);
		
		document.getElementById("orderDate").onchange = function(){
			var order_date = String($("#orderDate").val()).substring(2, 10).replace(/-/g, "/");
			
			location.href = "orderList.order?i_id=${loginPerson.i_id}&o_inputDate="+order_date;
		}
		
		var date = new Date();
		var month = Number(date.getMonth()+1)<10?"0"+Number(date.getMonth()+1):Number(date.getMonth()+1);
		var day = date.getDate()<10 ? "0"+date.getDate() : date.getDate();
		var today = date.getFullYear()+"-"+month+"-"+day;
		
		if(today == $("#orderDate").val()){
			$(".orderUpdate").show();
		}
		
		if(date.getHours()>=18 || ${empty orderList}){
			$(".orderUpdate").hide();
		}
		
	})
	
	function count(){
		var amt = document.getElementsByClassName("o_amt");
		var price = document.getElementsByClassName("price");
		$("#totalGood").val(amt.length);
		
		var total = 0;
		var totalM = 0;
		for(var i=0 ; i<amt.length ; i++){
			var eachAmt = $(amt).eq(i).val();
			total += Number(eachAmt);
			totalM += Number($(price).eq(i).text()) * Number(eachAmt);
		}
		
		$("#totalAmt").val(total);
		$("#sum").val(totalM);
	}
	
	function orderOneDelete(g_no){
		$.ajax({
			url: "ordersOneDelete.order?i_id=${loginPerson.i_id}&g_no="+g_no,
			success: function(msg){
				alert(msg);
				location.reload();
			},
			error: function(){
				alert("통신 실패");
			}
		})
	}
	
	function orderDelete(){
		var tf = confirm("정말로 발주를 취소하시겠습니까?");
			if(tf){
				$.ajax({
					url: "ordersDelete.order?i_id=${loginPerson.i_id}",
					success: function(msg){
						if(msg == "success"){
							alert("발주 취소 성공");
							location.href="loginRes.do";
						} else {
							alert("발주 취소 실패");
						}
					},
					error: function(){
						alert("통신 실패")
					}
				})
			}
	}
	
	function orderUpdate(t, g_no){
		var o_amt = $(t).parent().parent().children(1).val();
		if(isNaN(o_amt) || o_amt <= 0){
			alert("숫자를 입력해주세요.");
		} else {
			$.ajax({
				url: "ordersUpdate.order?o_amt="+o_amt+"&g_no="+g_no+"&i_id=${loginPerson.i_id}",
				success: function(msg){
					alert(msg);
					count();
				},
				error: function(){
					alert("통신 에러");
				}
			})	
		}
	}
</script>
<style type="text/css">
	h1 {
		display: inline-block;
	}
	
	.orderUpdate{
		display: none;
	}
</style>

</head>
<body>
	<%@include file="header.jsp" %>
	
	<div id="area">
		
	<h1>발주서 조회</h1>
	
	<input type="date" style="margin-left: 10px" id="orderDate">
	
	<hr>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>제품명</th><th>매입단가</th><th>수량</th><th class="orderUpdate">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty orderList }">
					<tr><td colspan="4">발주 내역이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${orderList }" var="list">
						<tr>
							<td class="tableFont">${list.g_name }</td>
							<td class="tableFont price">
								<fmt:parseNumber var="price" value="${list.g_price/2 }"/>
								${price }
							</td>
							<td>
							<input type="text" class="inputText o_amt" value="${list.o_amt }">
							<span class="orderUpdate"><input type="button" class="btn btn-primary" onclick="orderUpdate(this, ${list.g_no})" value="수정"></span>
							</td>
							<td><span class="orderUpdate"><input type="button" class="btn btn-primary" onclick="orderOneDelete(${list.g_no})" value="삭제"></span></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="4" style="font-weight: bold;">
				총 품목수 <input type="text" class="inputText" readonly="readonly" id="totalGood">
				발주수량 <input type="text" class="inputText" readonly="readonly" id="totalAmt">
				총 발주금액 <input type="text" style="width: 100px" readonly="readonly" id="sum">
				</td>
			</tr>
		</tfoot>
	</table>
	
	<br><br>
		<div style="text-align: center;">
			<button class="btn btn-primary btn-lg orderUpdate" id="orderDelete" style="width: 200px" onclick="orderDelete()">발주 취소</button>
		</div>
		
	</div>
	
</body>
</html>