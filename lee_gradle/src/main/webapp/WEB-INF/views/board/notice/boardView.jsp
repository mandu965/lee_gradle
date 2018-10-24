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
	boardCmntList('List');
	
	$("#searchBtn").click(function(){
		$("#boardSearchVO").find("#pageIndex").val(1);		
		$("#boardSearchVO").attr('action', '/board/notice/boardList').submit();
		return false;
	});
	
	$('.boardMdoBtn').click(function(){
		$("#boardSearchVO").attr('action', '/board/notice/boardMod').submit();
		return false;
	});
})

	function boardCmntList(gubun){
		var blt_rsrc_sno = $("#boardForm #blt_rsrc_sno").val();
		var cmnt_cntn = $("#cmnt_cntn").val();
		
		$.ajax({
			url: '/comm/cmnt/cmntList',
			data: "blt_rsrc_sno="+blt_rsrc_sno+'&cmnt_cntn='+cmnt_cntn+'&gubun='+gubun,
			type: 'POST',
			dataType: 'html',
			error: function(){
				$().ck_alert('요청하신 페이지에 문제가 있어 표시할 수 없습니다.');
			},
			success: function(html){
				$('#boarCmntList').html(html);
				
				//등록
				$("#cmntBtnAdd")
				.button({icons:{primary:'ui-icon-document'}})
				.click(function(){
					boardCmntList('Add');
					return false;
				});
				
				//수정
				$(".cmntMod")
				.click(function(){
					var cmnt_sno = $(this).attr('id');
					var target = $(this).data('target');

					 $('#modal_div').load('/comm/cmnt/cmntMod', {'cmnt_sno' : cmnt_sno}, function (response, status, xhr) {
			             if (status === "success") {
			                 $(target).modal({ show: true });
			             }
			         });

					return false;
					
				});
				
				//삭제
				$(".cmntDel")
				.click(function(){
					var cmnt_sno = $(this).attr('id');
					var target = $(this).data('target');
					
					$('#modal_div').load('/comm/cmnt/cmntDel', {'cmnt_sno' : cmnt_sno}, function (response, status, xhr) {
			             if (status === "success") {
			                 $(target).modal({ show: true });
			             }
			         }); 
					return false;
				});	
			}
			
		});
	}
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

        <form class="form-horizontal"  id="boardForm" name="boardForm" method="post">
        	<input type="hidden" id="bbs_contents" name="bbs_contents" value=""/>
        	<input type="hidden" id="ntc_yn" name="ntc_yn" value="${boardVO.ntc_yn}"/>
        	<input type="hidden" id="atch_file_sno" name="atch_file_sno" value="${boardVO.bbs_sno}"/>
        	<input type="hidden" id="bbs_sno" name="bbs_sno" value="${boardVO.bbs_sno}"/>
        	<input type="hidden" id="blt_rsrc_sno" name="blt_rsrc_sno" value="${boardVO.blt_rsrc_sno}"/>
        	
        <div class="view">
        <%-- 
	        <div class="form-group">
			    <label for="inputEmail3" class="col-sm-1 control-label">Title</label>
			    <div class="col-sm-11">
			      ${boardVO.bbs_title}
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-1 control-label">contents</label>
			    <div class="col-sm-11">
			      ${boardVO.bbs_contents}
			    </div>
			  </div>
			   --%>
			  <table class="table table-bordered">
  				<tr>
  					<td colspan="5"  class="view_title">${boardVO.bbs_title}</td>
  				</tr>
  				<tr class="active">
	  				<td class="col-sm-2">이정훈 </td>
	  				<td class="col-sm-1">댓글 2</td>
	  				<td class="col-sm-4">&nbsp;</td>
	  				<td class="col-sm-3">2018-10-10 :15:30</td>
	  				<td class="col-sm-2">조회수 3</td>
  				</tr>
  				<tr>
  					<td colspan="5" > ${boardVO.bbs_contents}</td>
  				</tr>
			</table>
        </div>	
		  
		  
		  
		  <%-- <div class="form-group">
		   	<label for="inputPassword3" class="col-sm-2 control-label">files</label>
		   	<div class="col-sm-10">
		   		 <c:choose> 
					<c:when test="${not empty atchFileList}">
						<c:forEach items="${atchFileList}" var="vo" varStatus="index">
							<a href="/comm/attach/attachDown.do?file_sno=${vo.file_sno}&file_no=${vo.file_no}" id="${vo.file_sno};${vo.file_no}">${vo.file_dsp_nm}</a><br>
						</c:forEach>
					</c:when>
				</c:choose>
		   	</div>
		  </div> --%>
		  
		 	
		</form>

        <div class="pull-right"><a href="#" class="btn btn-primary btn-success boardMdoBtn"><span class="glyphicon glyphicon-edit"></span>Mod</a></div>
        
        <div id="boarCmntList"></div>

		
    </div>
    


</body>
</html>
