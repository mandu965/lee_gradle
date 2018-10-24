<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<script>
$(document).ready(function(){
	$('input:radio[name=usr_sex]:input[value=${usrVO.usr_sex}]').attr("checked", true);
	$('input:radio[name=usr_auth_cd]:input[value=${usrVO.usr_auth_cd}]').attr("checked", true);
	
	$(".usrModBtn").click(function(){
		$('.usrView_div').css('display', 'none');
		$('.usrMod_div').css('display', '');
		$(this).css('display', 'none');
		$('.usrViewBtn').css('display', '');
		return false;
	});
	
	$("#viewBtn").click(function(){
		$('.usrView_div').css('display', '');
		$('.usrMod_div').css('display', 'none');
		$('#saveBtn').css('display', 'none');
		$(this).css('display', 'none');
		$('.usrModBtn').css('display', '');
		
		return false;
	});
	
	$("#saveBtn").click(function(){
		$.ajax({
			url: '/sm/usrmng/usrModPro',
			data: $("#usrForm").serialize(),
			type: 'post',
			dataType: 'json',
			error: function(){
				alert('요청하신 페이지에 문제가 있어 표시할 수 없습니다.');
			},
			success: function(json){
				
				if(json.result=='true'){
					alert('수정을 완료하였습니다.');
					$("#usrmngSearchVO").attr('action', '/sm/usrmng/usrmngList').submit();	
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
	        <h4 class="modal-title" id="myModalLabel">사용자 정보</h4>
	      </div>
	      
	      <div class="modal-body">
	      <div class="usrView_div">
				<div class="row">
				  <div class="col-xs-3 text-right modal-column">성명 :</div><div class="col-xs-9">${usrVO.usr_nm}</div>
				</div>	      
		        <div class="row">
				  <div class="col-xs-3 text-right modal-column" >ID :</div><div class="col-xs-9">${usrVO.usr_id}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right modal-column">성별 :</div><div class="col-xs-9">${usrVO.usr_sex}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right modal-column">연락처 :</div><div class="col-xs-9">${usrVO.usr_hp}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right modal-column">주소 :</div><div class="col-xs-9">${usrVO.usr_addr}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right modal-column">권한 :</div><div class="col-xs-9">${usrVO.usr_auth_cd}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right modal-column">가입일자 :</div><div class="col-xs-9">${usrVO.reg_date}</div>
				</div>
			</div>
			<div class="usrMod_div" style="display:none;">
				<form class="form-horizontal" id="usrForm" method="post">
				<input type="hidden" id="usr_no" name="usr_no" value="${usrVO.usr_no}"/>
					<div class="form-group">
				  		<label for="usr_nm" class="col-xs-3 control-label">성명 :</label>
				  		<div class="col-xs-9">
				  			<input class="form-control" type="text" id="usr_nm" name="usr_nm" placeholder="${usrVO.usr_nm}" readonly>
				  		</div>
					</div>				
				 	<div class="form-group">
				  		<label for="usr_id" class="col-xs-3 control-label">ID :</label>
				  		<div class="col-xs-9">
				  			<input class="form-control" type="text" id="usr_id" name="usr_id"  placeholder="${usrVO.usr_id}" readonly>
				  		</div>
					</div>

					<div class="form-group">
				  		<label for="usr_sex" class="col-xs-3 control-label">성별 :</label>
				  		<div class="col-xs-9">
					  		<label class="radio-inline">
	  							<input type="radio" name="usr_sex" id="usr_sex_m" value="M"> 남자
							</label>
					  		<label class="radio-inline">
	  							<input type="radio" name="usr_sex" id="usr_sex_w" value="W"> 여자
							</label>
				  		</div>
					</div>					
				  	<div class="form-group">
				    	<label for="usr_hp" class="col-xs-3 control-label">연락처 :</label>
					    <div class="col-xs-9">
					      <input type="text" class="form-control" id="usr_hp" name="usr_hp" value="${usrVO.usr_hp}">
					    </div>
				  	</div>
				 	<div class="form-group">
				    	<label for="usr_addr" class="col-xs-3 control-label">주소 :</label>
					    <div class="col-xs-9">
					      <input type="text" class="form-control" id="usr_addr" name="usr_addr" value="${usrVO.usr_addr}">
					    </div>
				  	</div>
				  	<div class="form-group">
				    	<label for="usr_auth_cd" class="col-xs-3 control-label">권한 :</label>
					    <div class="col-xs-9">
					  		<label class="radio-inline">
	  							<input type="radio" name="usr_auth_cd" id="usr_auth_cd_ad" value="103"> 관리자
							</label>
					  		<label class="radio-inline">
	  							<input type="radio" name="usr_auth_cd" id="usr_auth_cd_nm" value="101"> 일반
							</label>
					    </div>
				  	</div>
				</form>
			</div>	
	      </div>
	     
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <a href="#;" class="usrModBtn"><button type="button" class="btn btn-primary">Mod</button></a>
	        <a href="#;" class="usrViewBtn" id="viewBtn" style="display:none;"><button type="button" class="btn btn-primary">View</button></a>
	        <a href="#;" class="usrViewBtn" id="saveBtn" style="display:none;"><button type="button" class="btn btn-primary">Save</button></a>
	      </div>
	    
		</div>
    </div>
</div>