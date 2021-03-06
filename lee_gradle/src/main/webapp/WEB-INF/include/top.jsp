<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<head>

<script>
$(document).ready(function(){
	$("#singUpBtn").click(function(){
		location.href='/join/usrAdd';
		return false;
	});
	$("#singInBtn").click(function(){
		$.ajax({
			url: '/login/loginPro',
			data: $("#signForm").serialize(),
			type: 'post',
			dataType: 'json',
			error: function(){
				alert('요청하신 페이지에 문제가 있어 표시할 수 없습니다.');
			},
			success: function(json){
				alert(json.msg);
				if(json.result=='true'){
					location.reload();	
				}
			}
		});
		return false;
	});
	$("#logOutBtn").click(function(){
		$.ajax({
			url: '/login/logOutPro',
			data: $("#signForm").serialize(),
			type: 'post',
			dataType: 'json',
			error: function(){
				alert('요청하신 페이지에 문제가 있어 표시할 수 없습니다.');
			},
			success: function(json){
				alert(json.msg);
				location.reload();	
			}
		});
		return false;
	});
})
</script>

</head>

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">Lee Project</a>
          <a class="navbar-brand" href="/board/notice/boardList?bbs_sno=1">notice</a>
          <a class="navbar-brand" href="/board/board/boardList">board</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" id="signForm">
          	<c:choose>
	            <c:when test="${empty usrSession }">
		            <div class="form-group has-success has-feedback" >
		              <input type="text" placeholder="Id" class="form-control" id="id" name="id" value="admin">
		            </div>
		            <div class="form-group ">
		              <input type="password" placeholder="Password" class="form-control" id="pw" name="pw" value="1">
		            </div>
	            	<button type="submit" class="btn btn-success" id="singInBtn">Sign in</button>
	            	<button class="btn btn-info" id="singUpBtn">Sign up</button>

	            </c:when>
	            <c:otherwise>
	            	<font color="white"><c:out value="${usrSession.usr_id}"/>님 반갑습니다.</font>
	            	<button class="btn btn-danger" id="logOutBtn">Log Out</button>	
	            	<c:if test="${usrSession.usr_auth_cd ==  103}">
	            	<a href="/sm/usrmng/usrmngList" class="btn btn-link">시스템 관리</a>
	            	</c:if>
	            	
	            </c:otherwise>
            </c:choose>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
