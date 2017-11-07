<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<script>
$(document).ready(function(){

	
	
	$("#cmntSaveBtn").click(function(){

		var contens = $('#cmntModForm #cmnt_cntn').val();
		if(contens==''){
			alert("내용을 입력 하세요.");
			return false;
		}
		$("#cmnt_contents").val(contens);
		$.ajax({
			url: '/comm/cmnt/cmntModPro',
			data: $("#cmntModForm").serialize(),
			type: 'post',
			dataType: 'json',
			error: function(){
				alert('요청하신 페이지에 문제가 있어 표시할 수 없습니다.');
			},
			success: function(json){
				
				if(json.result=='true'){
					alert('수정을 완료하였습니다.');
					$('.btn-default').click();
					boardCmntList('List');
				}else{
					alert('수정을 실패하였습니다.');
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
	        <h4 class="modal-title" id="myModalLabel">Comment</h4>
	      </div>
	      
	      <div class="modal-body">
			<form class="form-horizontal" id="cmntModForm" method="post">
				<input type="hidden" id="cmnt_sno" name="cmnt_sno" value="${cmntVO.cmnt_sno}"/>
				<input type="hidden" id="cmnt_contents" name="cmnt_contents" value=""/>
				<textarea class="form-control" id="cmnt_cntn" name="cmnt_cntn" rows="3">${cmntVO.cmnt_contents}</textarea>
			</form>
	      </div>
	     
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <a href="#;" class="cmntSaveBtn" id="cmntSaveBtn"><button type="button" class="btn btn-primary">Save</button></a>
	      </div>
	    
		</div>
    </div>
</div>