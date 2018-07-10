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
<title>회원 리스트</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css?ver=1" />
<link rel="stylesheet" type="text/css" href="resources/css/boardStyle.css?ver=1" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var total =Math.ceil(parseInt(${total})/10);
var Page = ${param.pageNo};

$(function() {
	//페이지1일때 << 막기
		if (Page == 1) {
			$("#firstPage").removeAttr("onclick");
		}
		//마지막페이지일떄 >> 막기
		if (total == Page) {
			$("#lastPage").removeAttr("onclick");
		}

	})
	//페이지 넘기기
	function userListPage(page) {
		if (page < 1) {
			page = 1;
		}
		if (page > total) {
			page = total;
		}
		location.href = "userList.do?pageNo=" + page;
	}
	// 검색 페이지 넘기기
	function userSearchPage(page, option, input) {
		if (page < 1) {
			page = 1;
		}
		if (page > total) {
			page = total;
		}
		location.href = "userListSearch.do?pageNo=" + page + "&option=" + option + "&input=" + input;

	}

	function userDrop(){
		alert("회원등급이 수정되었습니다.");
		return true;
		
		}

</script>
</head>
<body>
<%@include file="header.jsp" %>
<div id="container">
	<form action="userListSearch.do">
	<input type="hidden" name="pageNo" value="1">
		<ul class="form-group sty_srch clearfix">
		<li>
		<select name="option" size="1" class="form-control">
			<option value="U_NAME">이름</option>
			<option value="U_ID">아이디</option>
		</select>
		</li>
		<li><input type="text" name="input" class="form-control" placeholder="검색 키워드를 입력하세요!"></li>
		<li><button type="submit" class="btn btn-info">검색</button></li>
		</ul>
	</form>
	<div class="userList">
			<table class="table table-hover">
			<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="30%">
					<col width="10%">
					<col width="20%">
					<col width="5%">
					<col width="5%">
					<col width="15%">
			</colgroup>
			<thead class="thead-light">
				<tr>
					<th>번호</th>

					<th>이름</th>

					<th>주소</th>

					<th>전화번호</th>

					<th>Email</th>

					<th>아이디</th>

					<th>가게</th>

					<th>구분</th>
				</tr>
				</thead>
				<c:forEach items="${UserList }" var="List">
					<tr>
						<th scope="row">${List.u_no }</th>
						<td>${List.u_name }</td>
						<td>${List.u_addr }</td>
						<td>${List.u_phone }</td>
						<td>${List.u_email }</td>
						<td>${List.u_id }</td>
						<td>${List.i_id }</td>
						<td>
						<form action="userDrop.do" onsubmit="userDrop();">
						<input type="hidden" name="u_id" value="${List.u_id }">
						<select name="u_enabled" style="width: 40px">
								<option value="Y" ${List.u_enabled == 'Y'? 'selected': ''}>Y</option>
								<option value="N" ${List.u_enabled == 'N'? 'selected': ''}>N</option>
						</select>
							<button type="submit" class="btn btn-primary">수정</button>
						</form>
						</td>		
					</tr>
				</c:forEach>
			</table>
			</div>
		<c:choose>
			<c:when test="${empty param.option}">
			<div class="sty_wdt">
				<nav aria-label="..." style="text-align: center;">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" id="firstPage" onclick="userListPage(${start-5 })">&laquo;</a></li>
						<c:forEach begin="${start }" end="${end }" var="page" step="1">						
							 <c:choose>						
								 <c:when test="${page eq param.pageNo }">
									<li class="page-item active"><a class="page-link" onclick="userListPage(${page })">${page }</a></li>
								 </c:when> 
								 <c:otherwise>
									<li class="page-item"><a class="page-link" onclick="userListPage(${page })">${page }</a></li>		
								</c:otherwise>
							</c:choose>					
						</c:forEach>				
						<li class="page-item"><a class="page-link" id="lastPage" onclick="userListPage(${start+5 })">&raquo;</a></li>
					</ul>
				</nav>
			</div>
			</c:when>
			<c:otherwise>
			<div class="sty_wdt">
				<nav aria-label="...">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" id="firstPage" onclick="userSearchPage(${start-5 }, ${param.option}, ${param.input})">&laquo;</a></li>
						<c:forEach begin="${start }" end="${end }" var="page">						
							 <c:choose>						
								 <c:when test="${page eq param.pageNo }">
									<li class="page-item active"><a class="page-link" onclick="userSearchPage(${page }, ${param.option}, ${param.input})">${page }</a></li>
								 </c:when> 
								 <c:otherwise>
									<li class="page-item"><a class="page-link" onclick="userSearchPage(${page }, ${param.option}, ${param.input})">${page }</a></li>		
								</c:otherwise>
							</c:choose>					
						</c:forEach>				
						<li class="page-item"><a class="page-link" id="lastPage" onclick="userSearchPage(${start+5 }, ${param.option}, ${param.input})">&raquo;</a></li>
					</ul>
				</nav>
			</div>
			</c:otherwise>
		</c:choose>
		
		</div>
</body>
</html>