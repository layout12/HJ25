<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-Cache");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/order.css">
<script type="text/javascript">
	$(function(){
		count();
		
		var msg = "${msg}";
		if(msg != null && msg != ""){
			alert(msg);
		}
		
		$("#orderForm").submit(function(){
			if($("#chk").prop("checked")){
				var amt = document.getElementsByName("o_amt");
				for(var i=0 ; i<amt.length ; i++){
					var a = Number($(amt).eq(i).val());
					var b = Number($("#limit").val());
		
					if(a>=b){
						var real = confirm("주문 제한 개수보다 많이 담긴 상품이 있습니다.\n정말로 발주하시겠습니까?");
						if(!real){
							return false;
						} else {
							return true;
						}
					}
				}
			}
		});
		
		var date = new Date();
		var h = date.getHours();
		
		if(h>=18 || ${empty cartInfo} || !${empty orderList}){
			document.getElementById("orderBtn").disabled = "disabled";
		}
		
	});
	
	function count(){
		var amt = document.getElementsByName("o_amt");
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
	
	function updateAmt(loc, c_no){
		var amt = $(loc).parent().children(0).val();
		if(isNaN(amt) || amt <= 0){
			alert("숫자만 입력해주세요.");
		} else {
			$.ajax({
				url: "orderCartUpdate.order?c_no="+c_no+"&c_amt="+amt,
				success: function(msg){
					alert(msg);
					count();
				},
				error: function(){
					alert("통신 실패");
				}
			})
		}
	}
	
	function deleteGoods(c_no){
		$.ajax({
			url: "orderCartDelete.order?c_no="+c_no,
			success: function(msg){
				alert(msg);
				location.reload();
			},
			error: function(){
				alert("통신 실패");
			}
		});
	}
</script>
<style type="text/css">
	h1{
		display: inline-block;
	}
	
	#orderConfirm{
		float: right;
		margin-top: 40px;
		font-weight: bold;
	}
</style>
<title>발주 장바구니</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<div id="area">
	<h1>발주 장바구니</h1>
	<span id="orderConfirm"><input type="checkbox" checked="checked" id="chk"> <input type="text" class="inputText" id="limit" value="30">개 이상 발주시 경고창 띄우기</span>
	<hr>
	<form id="orderForm" action="ordersInsert.order" method="post">
	<input type="hidden" name="i_id" value="${loginPerson.i_id}">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>제품명</th><th>매입단가</th><th>수량</th><th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty cartInfo }">
					<tr>
						<td colspan="4">담긴 상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${cartInfo }">
						<tr>
						<td class="tableFont"><input type="hidden" name="g_no" value="${dto.g_no }">${dto.g_name }</td>
						<td class="tableFont price">
						<fmt:parseNumber var="price" integerOnly="true" value="${dto.g_price/2 }"/>
						${price }
						</td>
						<td><input type="text" class="inputText" name="o_amt" value="${dto.c_amt }">
						<input type="button" class="btn btn-primary" onclick="updateAmt(this, ${dto.c_no})" value="수정"></td>
						<td><input type="button" class="btn btn-primary" value="삭제" onclick="deleteGoods(${dto.c_no })"></td>
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
		<button class="btn btn-primary btn-lg" id="orderBtn" style="width: 200px">발주</button>
	</div>
	</form>
	</div>
</body>
</html>