<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<head>
	<script type="text/javascript">
		$(document).ready(function() {
		var addResult='${addResult}'	
			if(addResult == 'true'){
				alert('Comment Add Success');
			}
		
		});
	</script>
</head>
	<div id="modal_div"></div>
	<div class="detail_table">
		<form class="form-horizontal"  id="cmntForm" name="cmntForm" method="post">
        	<input type="hidden" id="blt_rsrc_sno" name="blt_rsrc_sno" value="${cmntVO.blt_rsrc_sno}"/>
			<input type="hidden" id="cmnt_sno" name="cmnt_sno" value="${cmntVO.cmnt_sno}"/>
			<input type="hidden" id="cmnt_contents" name="cmnt_contents" value=""/>
   		<div class="form-group">
		<h4><label for="inputEmail3" class="col-sm-1 control-label">Comments</label></h4>
 			
 		</div>
		    				
		<div class="form-group">
		 	<label for="inputEmail3" class="col-sm-1 control-label"></label>
			<div class="col-sm-10">
		 		<c:choose> 
					<c:when test="${not empty cmntList}">
						<c:forEach items="${cmntList}" var="vo" varStatus="index">
							<dl>
								<dt class="writeinfo">
									<c:out value="${vo.usr_id}"/> | <c:out value="${vo.reg_date}"/> |
									<c:if test="${usrSession.usr_auth_cd=='103' || usrSession.usr_no == vo.reg_usr_no}" >
										<a href='#;' id= "${vo.cmnt_sno}" class="cmntMod" data-toggle="modal" href="#;" data-target="#modal-testNew" role="button" data-backdrop="static"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
										<a href='#;' id= "${vo.cmnt_sno}" class="cmntDel" data-toggle="modal" href="#;" data-target="#modal-testNew" role="button" data-backdrop="static"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
									</c:if>
								</dt>
								<dd class="contents"><pre class="cmntContent">${vo.cmnt_contents}</pre></dd>
							</dl>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-1 control-label">Content</label>
		     <div class="col-sm-11">
		    <c:choose>
	            <c:when test="${empty usrSession }">
		            <p class="lead">로그인이 필요합니다.</p>
		            <p class="lead">(If you want write comment, you have to log in.)</p>
	            </c:when>
	            <c:otherwise>
	            	<textarea class="form-control" id="cmnt_cntn" name="cmnt_cntn" rows="3"></textarea>
		    		<br>
					<div class="pull-right">
						<button type="button" id="cmntBtnAdd" class="btn btn-primary"><span class="glyphicon glyphicon-saved" aria-hidden="true"> Add</span></button>
					</div>
	            </c:otherwise>
            </c:choose>
		   </div>
		  </div>
		 </form>
	</div>
		