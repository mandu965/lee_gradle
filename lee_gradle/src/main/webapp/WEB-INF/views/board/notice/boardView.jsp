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
				$("#cmntBtnAdd").click(function(){
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
				$(".cmntDel").click(function(){
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

 <div class=container-fluid">
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
			  <table class="table table-bordered">
  				 <tr class="d-flex">
  					<td colspan="5" class="w-100">
  						<div  class="view_title">${boardVO.bbs_title}</div>
  						<div class="padding_0 col-sm-12 d-non d-md-none"><c:out value="${boardVO.usr_id}"/> | <c:out value="${boardVO.bbs_cnt}"/> |  <c:out value="${boardVO.reg_date}"/></div>
  					</td>
  				</tr>
  		 		
  			<tr class="d-flex">
	  				<td class="w-20 d-none d-md-inline">이정훈222 </td>
	  				<td class="w-10 d-none d-md-inline">댓글 2</td>
	  				<td class="w-40 d-none d-md-inline">&nbsp;</td>
	  				<td class="w-20 d-none d-md-inline">2018-10-10 :15:30</td>
	  				<td class="w-10 d-none d-md-inline">조회수 3</td>
  				</tr> 
  				
  				<tr class="d-flex">
  					<td  colspan="5" class="w-100"> ${boardVO.bbs_contents}</td>
  				</tr>
			</table>
        </div>	

		  <div class="row">
    <div class="col">
      1 of 377
    </div>
    <div class="col-6">
      2 of 3 (wider)
    </div>
    <div class="col-5">
      3 of 3
    </div>
  </div>
		  <%-- 
		  <div class="form-group">
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
		  </div>
		   --%>
		 	
		</form>

        <div class="pull-right"><a href="#" class="btn btn-primary btn-success boardMdoBtn"><span class="glyphicon glyphicon-edit"></span>Mod</a></div>
        
        <div id="boarCmntList"></div>

		
    </div>
    

</div>
</body>
</html>
