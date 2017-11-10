<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--fileUpload, drag_drop :S -->
<link rel="stylesheet" href="/resources/fileUpload/drag_drop/css/drag_drop.css" >
<script src="/resources/fileUpload/drag_drop/js/drag_drop.js"></script>
<!--fileUpload, drag_drop :E -->


<!--fileUpload, drag_drop, select :S -->
<link rel="stylesheet" href="/resources/fileUpload/all.fine-uploader/fine-uploader-new.css" >
<script src="/resources/fileUpload/all.fine-uploader/all.fine-uploader.js"></script>
<!--fileUpload, drag_drop, select :E -->

<script>

$(document).ready(function(){
	
	 $('#summernote').summernote({
	        placeholder: 'Write contents',
	        height: 400,
	        minHeight: null,             // set minimum height of editor
	        maxHeight: null,             // set maximum height of editor
	      });
	 ////////////////////////////////////////////////////////////
	dropFileInit($("#fileUpload"));
	
	////////////////////////////////////////////////////////////

	$("#searchBtn").click(function(){
		$("#boardSearchVO").find("#pageIndex").val(1);		
		$("#boardSearchVO").attr('action', '/board/notice/boardList').submit();
		return false;
	});
	
	$('.boardAddBtn').click(function(){
		
		var markupStr = $('#summernote').summernote('code');
		$("#bbs_contents").val(markupStr);
		//$("#boardForm").attr('action', '/board/notice/boardAddPro').submit();
		$.ajax({
			url: '/board/notice/boardAddPro',
			data: $("#boardForm").serialize(),
			type: 'post',
			dataType: 'json',
			error: function(){
				alert('요청하신 페이지에 문제가 있어 표시할 수 없습니다.');
			},
			success: function(json){
				
				if(json.result!='0'){
					alert('등록을 완료하였습니다.');
					$("#boardSearchVO").attr('action', '/board/notice/boardList').submit();	
				}else{
					alert('등록을 실패하였습니다.');
				}		
			}
		});
		
		
		
		return false;
	});
	
	
})


</script>


<title>Lee's library</title>
</head>
<body>
 
	<jsp:include page="/WEB-INF/include/top.jsp" flush="true" />


	<div class="board_div">
		<h2 class="page-header">Write</h2>


 		<form class="form" id="boardSearchVO" name="boardSearchVO">
			<input type="hidden" id="pageIndex" name="pageIndex" value="${boardSearchVO.pageIndex}"/>
			<input type="hidden" id="pageSize" name="pageSize" value="${boardSearchVO.pageSize}"/>
			<input type="hidden" id="bbs_sno" name="bbs_sno" value="${boardSearchVO.bbs_sno}"/>
			<input type="hidden" id="usr_id" name="usr_id" value="${boardSearchVO.usr_id}"/>
			<input type="hidden" id="title" name="title" value="${boardSearchVO.title}"/>
        </form>

        <form class="form-horizontal"  id="boardForm" name="boardForm" method="post" enctype="multipart/form-data">
        	<input type="hidden" id="bbs_contents" name="bbs_contents" value=""/>
        	<input type="hidden" id="ntc_yn" name="ntc_yn" value="N"/>
        	<input type="hidden" id="atch_file_sno" name="atch_file_sno" value="0"/>
        	<input type="hidden" id="bbs_sno" name="bbs_sno" value="${boardSearchVO.bbs_sno}"/>
        	
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">Title</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="bbs_title" name="bbs_title" placeholder="Title">
		    </div>
		  </div>

		  <div class="form-group">
		   	<label for="inputPassword3" class="col-sm-2 control-label">contents</label>
		   	<div class="col-sm-10">
		   		<div id="summernote"></div>
		   	</div>
		  </div>
		  
		  <!-- <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
		    <div class="col-sm-10">
		      <div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here</div>
		    </div>
		  </div> -->
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
		    <div class="col-sm-10">
		      <div id="fine-uploader"></div>
    			<!-- Fine Uploader -->
    			<jsp:include page="/resources/fileUpload/all.fine-uploader/lee/division_script.jsp" flush="true" />
		    </div>
		  </div>


		</form>
		


		
        <div class="pull-right"><a href="#" class="btn btn-primary btn-success boardAddBtn"><span class="glyphicon glyphicon-pencil"></span> Write</a></div>
        
    </div>
</body>
</html>
