        <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="Lee Label" aria-describedby="테스트 모달">
    <div class="modal-dialog">
	  <div class="modal-content">
	        
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">사용자 정보</h4>
	      </div>
	      
	      <div class="modal-body">
	        ${usrVO.usr_nm }
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    
		</div>
    </div>
</div>