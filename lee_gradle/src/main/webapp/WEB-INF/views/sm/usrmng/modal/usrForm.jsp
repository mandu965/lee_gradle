<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>

<script>
$(document).ready(function(){

	$(".usrModBtn").click(function(){
		$('.usrView_div').css('display', 'none');
		$('.usrMod_div').css('display', '');
		$(this).css('display', 'none');
		$('.usrViewBtn').css('display', '');
		return false;
	});
	
	$(".usrViewBtn").click(function(){
		$('.usrView_div').css('display', '');
		$('.usrMod_div').css('display', 'none');
		$(this).css('display', 'none');
		$('.usrModBtn').css('display', '');
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
				  <div class="col-xs-3 text-right g-header" >ID : </div><div class="col-xs-9">${usrVO.usr_id}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right g-header">성명 : </div><div class="col-xs-9">${usrVO.usr_nm}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right g-header">성별 : </div><div class="col-xs-9">${usrVO.usr_sex}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right g-header">연락처 : </div><div class="col-xs-9">${usrVO.usr_hp}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right g-header">주소 : </div><div class="col-xs-9">${usrVO.usr_addr}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right g-header">권한 : </div><div class="col-xs-9">${usrVO.usr_auth_cd}</div>
				</div>
				<div class="row">
				  <div class="col-xs-3 text-right g-header">가입일자 : </div><div class="col-xs-9">${usrVO.reg_date}</div>
				</div>
			</div>
			<div class="usrMod_div" style="display:none;">
				<form class="form-horizontal">
				 	<div class="form-group">
				  		<label for="inputEmail3" class="col-sm-2 control-label">ID : </label>
				  		<div class="col-xs-9">
				  			<input class="form-control" type="text" placeholder="${usrVO.usr_id}" readonly>
				  		</div>
					</div>
					<div class="form-group">
				  		<label for="inputEmail3" class="col-sm-2 control-label">성명 : </label>
				  		<div class="col-xs-9">
				  			<input class="form-control" type="text" placeholder="${usrVO.usr_nm}" readonly>
				  		</div>
					</div>
					<div class="form-group">
				  		<label for="inputEmail3" class="col-sm-2 control-label">성별 : </label>
				  		<div class="col-xs-9">
				  			<input class="form-control" type="text" placeholder="${usrVO.usr_sex}">
				  		</div>
					</div>					
				  	<div class="form-group">
				    	<label for="inputEmail3" class="col-sm-2 control-label">연락처 : </label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputEmail3" value="${usrVO.usr_hp}">
					    </div>
				  	</div>
				 	<div class="form-group">
				    	<label for="inputEmail3" class="col-sm-2 control-label">주소 : </label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputEmail3" value="${usrVO.usr_addr}">
					    </div>
				  	</div>
				  	<div class="form-group">
				    	<label for="inputEmail3" class="col-sm-2 control-label">권한 : </label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputEmail3" value="${usrVO.usr_auth_cd}">
					    </div>
				  	</div>
				</form>
			</div>	
	      </div>
	     
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <a href="#;" class="usrModBtn"><button type="button" class="btn btn-primary">Mod</button></a>
	        <a href="#;" class="usrViewBtn" style="display:none;"><button type="button" class="btn btn-primary">View</button></a>
	      </div>
	    
		</div>
    </div>
</div>