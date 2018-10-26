<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	
	$('.boardModBtn').click(function(){
		
		var markupStr = $('#summernote').summernote('code');
		$("#bbs_contents").val(markupStr);
		
		$.ajax({
			url: '/board/notice/boardModPro',
			data: $("#boardForm").serialize(),
			type: 'post',
			dataType: 'json',
			error: function(){
				alert('요청하신 페이지에 문제가 있어 표시할 수 없습니다.');
			},
			success: function(json){
				
				if(json.result!='0'){
					alert('수정을 완료하였습니다.');
					$("#boardSearchVO").attr('action', '/board/notice/boardView').submit();	
				}else{
					alert('수정을 실패하였습니다.');
				}		
			}
		});
		return false;
	});
	
	$('.file_del').click(function(){
		$(this).parent().remove();
		var file_no = $("#del_file_no").val() + $(this).attr('href')+":";
		$("#del_file_no").val(file_no);
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
			<input type="hidden" id="blt_rsrc_sno" name="blt_rsrc_sno" value="${boardSearchVO.blt_rsrc_sno}"/>
        </form>

        <form class="form-horizontal"  id="boardForm" name="boardForm" method="post" enctype="multipart/form-data">
        	<input type="hidden" id="bbs_contents" name="bbs_contents" value=""/>
        	<input type="hidden" id="ntc_yn" name="ntc_yn" value="N"/>
        	<input type="hidden" id="atch_file_sno" name="atch_file_sno" value="${boardVO.atch_file_sno}"/>
        	<input type="hidden" id="bbs_sno" name="bbs_sno" value="${boardSearchVO.bbs_sno}"/>
        	<input type="hidden" id="blt_rsrc_sno" name="blt_rsrc_sno" value="${boardVO.blt_rsrc_sno}"/>
        	<input type="hidden" id="del_file_no" name="del_file_no" value=""/>
        	
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">Title</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="bbs_title" name="bbs_title" placeholder="Title" value="${boardVO.bbs_title}">
		    </div>
		  </div>

		  <div class="form-group">
		   	<label for="inputPassword3" class="col-sm-2 control-label">contents</label>
		   	<div class="col-sm-10">
		   		<div id="summernote">${boardVO.bbs_contents}</div>
		   	</div>
		  </div>
		   <%-- 
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
		    <div class="col-sm-10">
		      <div id="fine-uploader"></div>
    			<!-- Fine Uploader -->
    			<jsp:include page="/resources/fileUpload/all.fine-uploader/lee/division_script.jsp" flush="true" />
		    </div>
		  </div>
		 
		  <div class="form-group">
		   	<label for="inputPassword3" class="col-sm-2 control-label">files</label>
		   	<div class="col-sm-10">
		   		 <c:choose> 
					<c:when test="${not empty atchFileList}">
						<c:forEach items="${atchFileList}" var="vo" varStatus="index">
							<font id="fileInfo">${vo.file_dsp_nm}<a href="${vo.file_no}" class="file_del">[삭제]</a><Br></font>
						</c:forEach>
					</c:when>
				</c:choose>
		   	</div>
		  </div>
		</form> 
		 --%>
		<div class="form-group">
		   	<div class="col-md-2"></div>
		   	<div class="col-md-10">
				<div class="pull-right"><a href="#" class="btn btn-primary btn-success boardModBtn"><span class="glyphicon glyphicon-pencil"></span> Save</a></div>		   		
		   	</div>
		  </div>		 
        
        
    </div>
</body>
</html>
