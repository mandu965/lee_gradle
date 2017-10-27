<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resurces/bootstrap/css/bootstrap.css" >
<link rel="stylesheet" href="/resurces/bootstrap/css/bootstrap-theme.css" >
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

// refrence blog?
//http://zzznara2.tistory.com/category
$(document).ready(function(){


})
</script>


<title>Insert title here</title>
</head>
<body>
 
<jsp:include page="/WEB-INF/include/top.jsp" flush="true" />

<!-- left : S -->
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">User Manage <span class="sr-only">(current)</span></a></li>
            <li><a href="#">XX Manage</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>
<!-- left : E -->
 	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h2 class="page-header">User Manage</h2>
          <h4>total : ${count}</h4>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>이름</th>
                  <th>ID</th>
                  <th>연락처</th>
                  <th>주소</th>
                  <th>가입일</th>
                </tr>
              </thead>
              <tbody>
               <c:choose>
					<c:when test="${not empty articleList}">
						<c:forEach items="${articleList}" var="vo" varStatus="idx">
	
							<tr class="${idx.count % 2 == 1 ? 'trOdd' : 'trEven'}">
								<td><c:choose>
										<c:when test="${count > pageSize}"> <!-- ex) count= 11, pageSize=10 -->
											<c:out
												value="${count - pageSize*(pageIndex-1) - idx.count +1}" /> <!-- 11,10,9,8.......... -->
										</c:when>
										<c:otherwise>
											<c:out value="${count  - idx.count +1}" />
										</c:otherwise>
	
									</c:choose></td>
	
								<%-- <td><a href="lee/board/boardView.do?blt_rsrc_sno=${vo.blt_rsrc_sno}" class="boardBtnView">${vo.blt_rsrc_tlt}</a></td> --%>
								<%-- <td><a href="lee/board/boardView.do?blt_rsrc_sno=${vo.blt_rsrc_sno}" class="boardBtnView">${vo.blt_rsrc_tlt}</a></td> --%>
								
								<td><c:out value="${vo.usr_nm}"/></td>
								<td><c:out value="${vo.usr_id}"/></td>
								<td><c:out value="${vo.usr_hp}"/></td>
								<td><c:out value="${vo.usr_addr}"/></td>
								<td><c:out value="${vo.reg_date}"/></td>
								
								
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">조회된 자료가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
              </tbody>
            </table>
            
            <!-- Paging : S -->
			<c:if test="${count > 0}">
				<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
				<c:set var="startPage" value="${pageGroupSize*(nowPageGroup-1)+1}" />
				<c:set var="endPage" value="${startPage + pageGroupSize-1}" />
				
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				<%-- <c:if test="${nowPageGroup > 1}">
					<a href="<c:url value = "/sm/usrmng/usrmngList?pageIndex=${(nowPageGroup-2)*pageGroupSize+1 }&pageSize=${pageSize}&bbs_sno=${bbs_sno}"/>">[이전]</a>
				</c:if>
 
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="<c:url value="/sm/usrmng/usrmngList?pageIndex=${i}&pageSize=${pageSize}&bbs_sno=${bbs_sno}"/>">
					  [<font color="#000000" /> 
					  <c:if test="${pageIndex == i}"><font color="#bbbbbb" /></c:if> ${i} </font>]
					</a>
				</c:forEach>
 
				<c:if test="${nowPageGroup < pageGroupCount}">
					<a href="<c:url value = "/sm/usrmng/usrmngList?pageIndex=${nowPageGroup*pageGroupSize+1}&pageSize=${pageSize}&bbs_sno=${bbs_sno}"/>">[다음]</a>
				</c:if> --%>
				
				<div class="jb-center" style="text-align: center;">
			
            <ul class="pagination">
            	<c:if test="${nowPageGroup > 1}">
					<li><a href="<c:url value = "/sm/usrmng/usrmngList?pageIndex=${(nowPageGroup-2)*pageGroupSize+1 }&pageSize=${pageSize}&bbs_sno=${bbs_sno}"/>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
				</c:if>
				<c:if test="${nowPageGroup == 1}">
					<!-- <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li> -->
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li <c:if test="${pageIndex == i}"> class="active" </c:if>><a href="<c:url value="/sm/usrmng/usrmngList?pageIndex=${i}&pageSize=${pageSize}&bbs_sno=${bbs_sno}"/>">
					   ${i}
					</a></li>
				</c:forEach>
              
             	 <c:if test="${nowPageGroup < pageGroupCount}">
					<li><a href="<c:url value = "/sm/usrmng/usrmngList?pageIndex=${nowPageGroup*pageGroupSize+1}&pageSize=${pageSize}&bbs_sno=${bbs_sno}"/>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
				</c:if>
            </ul>
          </div>
          
			</c:if>
			<!-- Pageing : E -->
          </div>
        </div>
   
 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/resurces/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>