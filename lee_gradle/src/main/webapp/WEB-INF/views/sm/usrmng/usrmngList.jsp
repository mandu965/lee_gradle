<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:set var="urlPath" value="test" />

<script>

// refrence blog?
//http://zzznara2.tistory.com/category
$(document).ready(function(){
	
	$(".usrView").click(function(){
		var target = $(this).data('target');
		var usr_no = $(this).attr('id');
		
		 $('#modal_div').load('/sm/usrmng/modal/usrForm', {'usr_no' : usr_no}, function (response, status, xhr) {
             if (status === "success") {
                 $(target).modal({ show: true });
                
             }
         });

		return false;
	});
	
	$("#usrmngSearchBtn").click(function(){
		$("#usrmngSearchVO").find("#pageIndex").val(1);
		$("#usrmngSearchVO").attr('action', '/sm/usrmng/usrmngList').submit();
		return false;
	});
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
          
          <div class="search_div">
	          <form class="form-inline" id="usrmngSearchVO" name="usrmngSearchVO">
	          <input type="hidden" id="pageIndex" name="pageIndex" value="${usrmngSearchVO.pageIndex}"/>
	          <input type="hidden" id="pageSize" name="pageSize" value="${usrmngSearchVO.pageSize}"/>
				  <div class="form-group">
				    <label for="usr_nm">이름</label>
				    <input type="text" class="form-control" id="usr_nm" name="usr_nm" value="${usrmngSearchVO.usr_nm}"/>
				  </div>
				  <div class="form-group">
				    <label for="usr_id">ID</label>
				    <input type="text" class="form-control" id="usr_id" name="usr_id" value="${usrmngSearchVO.usr_id}"/>
				  </div>		
				  <div class="form-group">
				    <label for="usr_addr">주소</label>
				    <input type="text" class="form-control" id="usr_addr" name="usr_addr" value="${usrmngSearchVO.usr_addr}"/>
				  </div>		
				  <div class="form-group">
				    <label for="exampleInputEmail2">권한</label>
				    <input type="checkbox" class="form-check-input" name="ck_usr_auth" id="usr_auth_cd_ad" value="103">
				    <label for="usr_auth_cd_ad">관리자</label>
				    <input type="checkbox" class="form-check-input" name="ck_usr_auth" id="usr_auth_cd_nm" value="101">
				    <label for="usr_auth_cd_nm">일반</label>
				  </div>				  		  
				  	<span class="searchBtn_div">
				  		<button type="submit" class="btn btn-default" id="usrmngSearchBtn">Search</button>
				  	</span>
				</form>
			</div>
          
          <h4>total : ${count}</h4>
          <div class="table-responsive">
            <table class="table table-striped"> <!-- table-hover -->
              <thead>
                <tr>
                  <th>번호</th>
                  <th>이름</th>
                  <th>ID</th>
                  <th>연락처</th>
                  <th>주소</th>
                  <th>권한</th>
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

								<td>
								<a id="${vo.usr_no}" class="usrView" data-toggle="modal" href="#;" data-target="#modal-testNew" role="button" data-backdrop="static">	
								<c:out value="${vo.usr_nm}"/>
								</a>
								
								</td>
								<td><c:out value="${vo.usr_id}"/></td>
								<td><c:out value="${vo.usr_hp}"/></td>
								<td><c:out value="${vo.usr_addr}"/></td>
								<td>
									<c:choose>
										<c:when test="${vo.usr_auth_cd == '103'}">
											<c:out value="관리자"/>
										</c:when>
										<c:otherwise>
											<c:out value="일반"/>
										</c:otherwise>
									</c:choose>
								</td>
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
				<div class="jb-center" >
			
		            <ul class="pagination">
		            	<c:if test="${nowPageGroup > 1}">
							<li><a href="<c:url value = "/sm/usrmng/usrmngList?pageIndex=${(nowPageGroup-2)*pageGroupSize+1 }&pageSize=${pageSize}"/>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
						</c:if>
						<c:if test="${nowPageGroup == 1}">
							<!-- <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li> -->
						</c:if>
		
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li <c:if test="${pageIndex == i}"> class="active" </c:if>><a href="#;" onclick='paging_script(${i},${pageSize},"usrmngSearchVO","/sm/usrmng/usrmngList");'>${i}</a></li>
						</c:forEach>
		              
		             	 <c:if test="${nowPageGroup < pageGroupCount}">
							<li><a href="<c:url value = "/sm/usrmng/usrmngList?pageIndex=${nowPageGroup*pageGroupSize+1}&pageSize=${pageSize}"/>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
						</c:if>
		            </ul>
         	 </div>
          
			</c:if>
			<!-- Pageing : E -->
          </div>
        </div> 
<div id="modal_div"></div>

</body>
</html>
