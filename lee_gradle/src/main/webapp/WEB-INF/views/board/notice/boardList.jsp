<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script> 

$(document).ready(function(){
	$("#searchBtn").click(function(){
		$("#boardSearchVO").find("#pageIndex").val(1);		
		$("#boardSearchVO").attr('action', '/board/notice/boardList').submit();
		return false;
	});
	
	$('.boardAddBtn').click(function(){
		$("#boardSearchVO").attr('action', '/board/notice/boardAdd').submit();
		return false;
	});
	
	$(".boardView").click(function(){
		var blt_rsrc_sno = $(this).attr('id');
		$("#boardSearchVO").find("#blt_rsrc_sno").val(blt_rsrc_sno);
		$("#boardSearchVO").attr('action', '/board/notice/boardView').submit();
		return false;
	});
	
})
</script>


<title>Lee's library</title>
</head>
<body>
<div class=container-fluid">
	<div class="board_div">
		<jsp:include page="/WEB-INF/include/top.jsp" flush="true" />
          <h2 class="page-header">Notice</h2>
          
          <div class="search_div">
	          <form class="form" id="boardSearchVO" name="boardSearchVO">
	          <input type="hidden" id="pageIndex" name="pageIndex" value="${boardSearchVO.pageIndex}"/>
	          <input type="hidden" id="pageSize" name="pageSize" value="${boardSearchVO.pageSize}"/>
	          <input type="hidden" id="bbs_sno" name="bbs_sno" value="${boardSearchVO.bbs_sno}"/>
	          <input type="hidden" id="blt_rsrc_sno" name="blt_rsrc_sno" value="0"/>
	          <div class="row"> 
		          <div class="col-md-3"> 
		          		<!-- <label for="usr_id">글쓴이(ID)</label> -->
					    <input type="text" class="form-control" id="usr_id" name="usr_id" value="${boardSearchVO.usr_id}" placeholder="writer..."/>
		          </div> 
		          <div class="col-md-6 "> 
		          		<!-- <label for="title">제목</label> -->
					    <input type="text" class="form-control" id="title" name="title" value="${boardSearchVO.title}" placeholder="title..."/>  
		          </div> 
		         <div class="col-md-3">
				  	<button type="submit" class="btn btn-primary" id="searchBtn">Search</button>
				  </div> 
	          </div>
	          </form>
			</div>
        
          
          <h4>total : ${count}</h4>
            <table class="table table-hover"> <!-- table-hover -->
              <thead>
               <tr class="d-flex">
                  <th class="w-10 d-none d-md-inline">번호</th>
                  <!-- <th class=" col-md-6 col-sm-12">제목</th> -->
                  <th class=" w-50 ">제목</th>
                  <th class="w-10 d-none d-md-inline">글쓴이(ID)</th>
                  <th class="w-10  d-none d-md-inline">조회수</th>
                  <th class="w-20 d-none d-md-inline">등록일</th>
                </tr>
              </thead>
              <tbody>
               <c:choose>
					<c:when test="${not empty articleList}">
						<c:forEach items="${articleList}" var="vo" varStatus="idx">
	
							<tr class="d-flex">
								<td class="w-10 d-none d-md-inline"><c:choose>
										<c:when test="${count > pageSize}"> <!-- ex) count= 11, pageSize=10 -->
											<c:out
												value="${count - pageSize*(pageIndex-1) - idx.count +1}" /> <!-- 11,10,9,8.......... -->
										</c:when>
										<c:otherwise>
											<c:out value="${count  - idx.count +1}" />
										</c:otherwise>
	
									</c:choose>
								</td>

								<td class="w-50  col-sm-12">
									<a id="${vo.blt_rsrc_sno}" class="boardView" data-toggle="modal" href="#;" data-target="#modal-testNew" role="button" data-backdrop="static">
										<span data-tooltip-text="<c:out value='${vo.bbs_title}'/>">${vo.bbs_title}</span>
									</a>
									<%-- <div class="padding_0  d-none d-sm-inline d-md-none d-inline d-sm-none"  ><br><c:out value="${vo.usr_id}"/> | <c:out value="${vo.bbs_cnt}"/> |  <c:out value="${vo.reg_date}"/></div> --%>
									<div class="padding_0  d-non d-md-none"  ><c:out value="${vo.usr_id}"/> | <c:out value="${vo.bbs_cnt}"/> |  <c:out value="${vo.reg_date}"/></div>
									<!--md 이하에서는 모이지 말게 하라  -->
								</td>
								<td class=" w-10 d-none d-md-inline"><c:out value="${vo.usr_id}"/></td>
								<td class="w-10 d-none d-md-inline"><c:out value="${vo.bbs_cnt}"/></td>
								<td class=" w-20 d-none d-md-inline"><c:out value="${vo.reg_date}"/></td>
								<!--md 이하에서는 모이지 말게 하라, md 이상에서 보여라  -->
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
     
   
           	<div class="pull-right"><a href="#" class="btn btn-primary btn-success boardAddBtn"><span class="glyphicon glyphicon-pencil"></span> Write</a></div>
           

            <!-- Paging : S -->
			<c:if test="${count > 0}">
				<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
				<c:set var="startPage" value="${pageGroupSize*(nowPageGroup-1)+1}" />
				<c:set var="endPage" value="${startPage + pageGroupSize-1}" />
				
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				
					<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					<!--이전  -->
						<c:if test="${nowPageGroup > 1}">
			            	<li class="page-item">
		      					<a class="page-link"   href="#;"   aria-label="Previous" onclick='paging_script(${(nowPageGroup-2)*pageGroupSize+1 },${pageSize},"boardSearchVO","/board/notice/boardList");'   aria-label="Previous">
			        				<span aria-hidden="true">&laquo;</span>
			        				<span class="sr-only">Previous</span>
		      					</a>
	    					</li>
	    				</c:if>
	    				
	    				<c:if test="${nowPageGroup == 1}">
								<!-- <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li> -->
							</c:if>
							
	    				<!--페이지 출력  -->
	    				<c:forEach var="i" begin="${startPage}" end="${endPage}">
	    					<li <c:if test="${pageIndex == i}"> class="page-item active" </c:if>><a href="#;"   class="page-link" onclick='paging_script(${i},${pageSize},"boardSearchVO","/board/notice/boardList");'>${i}</a></li>
	    				</c:forEach>
	    				
	    				<!--다음페이지  -->
	    				<c:if test="${nowPageGroup < pageGroupCount}">
							<li class="page-item">
								 <a class="page-link" href="#" aria-label="Next" onclick='paging_script(${nowPageGroup*pageGroupSize+1},${pageSize},"boardSearchVO","/board/notice/boardList");'>
									<span aria-hidden="true">&raquo;</span>
		        					<span class="sr-only">Next</span>
								</a>
							</li>
						</c:if>
							
			            </ul>
					</nav>
         	 
          
			</c:if>
			<!-- Pageing : E -->
			
          </div>
 </div>
</body>
</html>
