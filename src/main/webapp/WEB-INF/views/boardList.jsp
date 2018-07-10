<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HJ25-게시판 리스트</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css?ver=1" />
<link rel="stylesheet" type="text/css" href="resources/css/boardStyle.css?ver=1" />
<style type="text/css">
	/* #userList{display:none;} */
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/boardJs.js?ver=2"></script>
<script type="text/javascript">
var total =Math.ceil(parseInt(${total})/10);
var Page = ${param.pageNo};

</script>
</head>
<body>
	<!-- c태그 안에 주석 쓰지 말 것. 실행이 안됨 -->
	<!-- contents 영역 -->
<%@include file="header.jsp" %>
	<!-- contents 영역 --> 
	<div id="sty_wrap"> <!-- footer고정을 위해 div 생성 -->
		<div id="container">
			<!-- searchArea -->
			<form action="BoardSearch.do" name="search">
			<input type="hidden" name="pageNo" value="1">
				<ul class="form-group sty_srch clearfix">
					<li>				
						<select name="option" size="1" class="form-control">
							<option value="U_ID" ${option == 'U_ID'? 'selected': ''} >작성자</option>	
							<option value="B_TITLE" ${option == 'B_TITLE'? 'selected': ''} >제목</option>
						</select>
					</li>
			  		<li><input type="text" name="input" value="${input }" class="form-control" placeholder="검색 키워드를 입력하세요!"></li>
			 		<li><button type="button" class="btn btn-info" onclick="bdCheck();">검색</button></li>
				</ul>
			</form>
			<!--// searchArea -->
			<c:choose>
				<c:when test="${loginPerson.u_grade != 'ADMIN' }">
					<!-- User boardList -->
					<div id="userList">
						<table class="table table-hover">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="*%">
								<col width="15%">
								<col width="20%">
							</colgroup>
	
							<thead class="thead-light">
								<tr>
									<th scope="col">번호</th>
									<th scope="col">작성자</th>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="5">---작성된 글이 존재하지 않습니다---</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="dto">
											<tr>
												<th scope="row">${dto.b_no }</th>
												<td class="sty_u_id">${dto.u_id }</td>
												<td class="sty_txLeft">
												<c:choose>
													<c:when test="${dto.u_grade == 'ADMIN' }">
														<a href="BoardDetail.do?b_no=${dto.b_no }" style="color:#0a1d76; font-weight:bold"><img src="resources/images/ico_notice.PNG"> ${dto.b_title }											
														<c:if test="${dto.total!=0 }">
															<span class="sty_commTotal">(${dto.total })</span>
														</c:if>
														</a>
													</c:when>
													<c:otherwise>
														<a href="BoardDetail.do?b_no=${dto.b_no }">${dto.b_title }											
														<c:if test="${dto.total!=0 }">
															<span class="sty_commTotal">(${dto.total })</span>
														</c:if>
														</a>
													</c:otherwise>
												</c:choose>
												</td>
												<td><fmt:formatDate value="${dto.b_date }" pattern="yyyy.MM.dd" /></td>
												<td>${dto.b_hits }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
						<!-- buttons -->						
						<button type="button" class="btn btn-primary sty_btnR" onclick="location.href='BoardInsertForm.do'">글쓰기</button>					
						<!--//buttons  -->
					</div>
					<!-- User boardList -->
				</c:when>
				<c:otherwise>
					<!-- Admin boardList -->
					<div id="adminList">
						<form action="BoardMulDel.do" id="mudelForm">
							<table class="table table-hover">
								<colgroup>
									<col width="5%">
									<col width="8%">
									<col width="15%">
									<col width="*%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th scope="col"><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
										<th scope="col">번호</th>
										<th scope="col">작성자</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan="6">--- 글이 존재하지 않습니다---</td>
											</tr>
										</c:when>
										<c:otherwise>
											<!-- 리스트들이 나타남 -->
											<c:forEach items="${list }" var="dto" varStatus="status">
												<tr>
													<td><input type="checkbox" name="chk" value="${dto.b_no }"></td>
													<th scope="row">${dto.b_no }</th>
													<td class="sty_u_id">${dto.u_id }</td>
													<td class="sty_txLeft">
													<c:choose>
													<c:when test="${dto.u_grade == 'ADMIN' }">
														<a href="BoardDetail.do?b_no=${dto.b_no }" style="color:#0a1d76; font-weight:bold"><img src="resources/images/ico_notice.PNG"> ${dto.b_title }											
														<c:if test="${dto.total!=0 }">
															<span class="sty_commTotal">(${dto.total })</span>
														</c:if>
														</a>
													</c:when>
													<c:otherwise>
														<a href="BoardDetail.do?b_no=${dto.b_no }">${dto.b_title }											
														<c:if test="${dto.total!=0 }">
															<span class="sty_commTotal">(${dto.total })</span>
														</c:if>
														</a>
													</c:otherwise>
													</c:choose>
													</td>
													<td><fmt:formatDate value="${dto.b_date }"	pattern="yyyy.MM.dd" /></td>
													<td>${dto.b_hits }</td>
												</tr>
											</c:forEach>
											<!--// 리스트들이 나타남 -->
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!-- buttons -->
							<button class="sty_btnL btn btn-default" type="submit">삭제</button>						
							<button type="button" class="sty_btnR btn btn-primary" onclick="location.href='BoardInsertForm.do'">글쓰기</button>
					
							<!--//buttons  -->
						</form>
					</div>
				</c:otherwise>
			</c:choose>
			<!--// Admin boardList -->
			<div class="sty_page">								
				<!-- paging -->
				<c:choose>
					<c:when test="${empty param.option}">
						<div class="sty_wdt">
							<nav aria-label="...">
								<ul class="pagination justify-content-center">
									<li><a class="page-link" id="firstPage" onclick="boardListPage(${start-5 })">&laquo;</a></li>
									<c:forEach begin="${start }" end="${end }" var="page" step="1">
										<c:choose>
											<c:when test="${page eq param.pageNo }">
												<li class="page-item active"><a class="page-link" onclick="boardListPage(${page})">${page }</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" onclick="boardListPage(${page})">${page }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li class="page-item"><a class="page-link" id="lastPage" onclick="boardListPage(${start+5 })">&raquo;</a></li>
								</ul>
							</nav>
						</div>
					</c:when>
					<c:otherwise>
						<div class="sty_wdt">
							<nav aria-label="...">
								<ul class="pagination justify-content-center">
									<li><a class="page-link"  id="firstPage" onclick="boardSearchPage(${start-5 },'${param.option}','${param.input}')">&laquo;</a></li>
									<c:forEach begin="${start }" end="${end }" var="page">
										<c:choose>
											<c:when test="${page eq param.pageNo }">
												<li class="page-item active"><a class="page-link" onclick="boardSearchPage(${page },'${param.option}','${param.input}')">${page }</a></li>	
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" onclick="boardSearchPage(${page },'${param.option}','${param.input}')">${page }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li class="page-item"><a class="page-link" id="lastPage"  onclick="boardSearchPage(${start+5 },'${param.option}','${param.input}')">&raquo;</a></li></ul>
							</nav>
						</div>						
					</c:otherwise>
				</c:choose>
				<!--// paging -->	
			</div>	
		</div>		
			
		<!-- footer -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!--// footer -->
	</div><!-- footer고정을 위해 div 생성 -->
	<!--// contents 영역 -->
	
	

</body>
</html>