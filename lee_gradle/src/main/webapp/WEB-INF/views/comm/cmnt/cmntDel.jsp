<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<script>
$(document).ready(function(){

	
	
	$("#cmntSaveBtn").click(function(){


		$.ajax({
			url: '/comm/cmnt/cmntDelPro',
			data: $("#cmntDelForm").serialize(),
			type: 'post',
			dataType: 'json',
			error: function(){
				alert('요청하신 페이지에 문제가 있어 표시할 수 없습니다.');
			},
			success: function(json){
				
				if(json.result=='true'){
					alert('삭제를 완료하였습니다.');
					$('.btn-default').click();
					boardCmntList('List');
				}else{
					alert('삭제를 실패하였습니다.');
				}		
			}
		});
		return false;
	});

})
</script>

<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="Lee Label" aria-describedby="테스트 모달">
    <div class="modal-dialog">
	  <div class="modal-content">
	        
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Comment Delete</h4>
	      </div>
	      
	      <div class="modal-body">
			<form class="form-horizontal" id="cmntDelForm" method="post">
				<input type="hidden" id="cmnt_sno" name="cmnt_sno" value="${cmnt_sno}"/>
				삭제하시겠습니까?
			</form>
	      </div>
	     
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <a href="#;" class="cmntSaveBtn" id="cmntSaveBtn"><button type="button" class="btn btn-primary">Delete</button></a>
	      </div>
	    
		</div>
    </div>
</div>