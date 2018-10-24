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
 <div class="container">
<jsp:include page="/WEB-INF/include/top.jsp" flush="true" />



	<div class="board_div">

          <h2 class="page-header">Notice</h2>
          
          <div class="search_div">
	          <form class="form" id="boardSearchVO" name="boardSearchVO">
	          <input type="hidden" id="pageIndex" name="pageIndex" value="${boardSearchVO.pageIndex}"/>
	          <input type="hidden" id="pageSize" name="pageSize" value="${boardSearchVO.pageSize}"/>
	          <input type="hidden" id="bbs_sno" name="bbs_sno" value="${boardSearchVO.bbs_sno}"/>
	          <input type="hidden" id="blt_rsrc_sno" name="blt_rsrc_sno" value="0"/>
	          
	         
	          <div class="row"> 
		          <div class="col-xs-2"> 
		          		<!-- <label for="usr_id">글쓴이(ID)</label> -->
					    <input type="text" class="form-control" id="usr_id" name="usr_id" value="${boardSearchVO.usr_id}" placeholder="input writer..."/>
		          </div> 
		          <div class="col-xs-4"> 
		          		<!-- <label for="title">제목</label> -->
					    <input type="text" class="form-control" id="title" name="title" value="${boardSearchVO.title}" placeholder="input title..."/>  
		          </div> 
				  <button type="submit" class="btn btn-default" id="searchBtn">Search</button> 
	          </div>
	          </form>
			</div>
        
          
          <h4>total : ${count}</h4>
          
          <div class="table-reponsive">
            <table class="table table-striped"> <!-- table-hover -->
              <thead>
                <tr>
                  <th class="col-xs-1 mobile_off">번호</th>
                  <th class="">제목</th>
                  <th class="col-xs-2 mobile_off">글쓴이(ID)</th>
                  <th class="col-xs-1 mobile_off">조회수</th>
                  <th class="col-xs-2 mobile_off">등록일</th>
                </tr>
              </thead>
              <tbody>
               <c:choose>
					<c:when test="${not empty articleList}">
						<c:forEach items="${articleList}" var="vo" varStatus="idx">
	
							<tr class="${idx.count % 2 == 1 ? 'trOdd' : 'trEven'}">
								<td class="mobile_off"><c:choose>
										<c:when test="${count > pageSize}"> <!-- ex) count= 11, pageSize=10 -->
											<c:out
												value="${count - pageSize*(pageIndex-1) - idx.count +1}" /> <!-- 11,10,9,8.......... -->
										</c:when>
										<c:otherwise>
											<c:out value="${count  - idx.count +1}" />
										</c:otherwise>
	
									</c:choose>
								</td>

								<td>
								
								<a id="${vo.blt_rsrc_sno}" class="boardView" data-toggle="modal" href="#;" data-target="#modal-testNew" role="button" data-backdrop="static">
								<span data-tooltip-text="<c:out value='${vo.bbs_title}'/>">${vo.bbs_title}</span>
								</a>
								<div class="mobile_on"><br><c:out value="${vo.usr_id}"/> | <c:out value="${vo.bbs_cnt}"/> |  <c:out value="${vo.reg_date}"/></div>
								</td>
								<td class="mobile_off"><c:out value="${vo.usr_id}"/></td>
								<td class="mobile_off"><c:out value="${vo.bbs_cnt}"/></td>
								<td class="mobile_off" ><c:out value="${vo.reg_date}"/></td>
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
            </div>
            
           	<div class="pull-right"><a href="#" class="btn btn-primary btn-success boardAddBtn"><span class="glyphicon glyphicon-pencil"></span> Write</a></div>
            <!-- Paging : S -->
			<c:if test="${count > 0}">
				<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
				<c:set var="startPage" value="${pageGroupSize*(nowPageGroup-1)+1}" />
				<c:set var="endPage" value="${startPage + pageGroupSize-1}" />
				
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				<div class="div-center" >
			
		            <ul class="pagination">
		            
		            	<c:if test="${nowPageGroup > 1}">
							<li><a href="#;" onclick='paging_script(${(nowPageGroup-2)*pageGroupSize+1 },${pageSize},"boardSearchVO","/board/notice/boardList");' ><span class="glyphicon glyphicon-chevron-left"></span></a></li>
						</c:if>
						
						<c:if test="${nowPageGroup == 1}">
							<!-- <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li> -->
						</c:if>
		
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li <c:if test="${pageIndex == i}"> class="active" </c:if>><a href="#;" onclick='paging_script(${i},${pageSize},"boardSearchVO","/board/notice/boardList");'>${i}</a></li>
						</c:forEach>
		              
		             	 <c:if test="${nowPageGroup < pageGroupCount}">
		             	 
							<li><a href="#;" onclick='paging_script(${nowPageGroup*pageGroupSize+1},${pageSize},"boardSearchVO","/board/notice/boardList");'><span class="glyphicon glyphicon-chevron-right"></span></a></li>
						</c:if>
		            </ul>
         	 </div>
          
			</c:if>
			<!-- Pageing : E -->
          </div>
        <!-- </div> --> 

</div>
</body>
</html>
