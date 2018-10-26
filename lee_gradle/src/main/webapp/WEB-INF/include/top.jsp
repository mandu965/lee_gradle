
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
      <a class="navbar-brand" href="/">LEe</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/board/notice/boardList?bbs_sno=1">공지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/schedule/scheduleList">일정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="/board/board/boardList">Disabled 테스트</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" id="signForm">
          <c:choose>
	            <c:when test="${empty usrSession }">
		            <div class="form-group has-success has-feedback" >
		              <input class="form-control mr-sm-2" type="text" placeholder="Id" aria-label="Search"  id="id" name="id" value="admin">
		            </div>
		            <div class="form-group ">
		              <input class="form-control mr-sm-2" type="password" placeholder="Password" aria-label="Search"  id="pw" name="pw" value="1">
		            </div>
	            	<button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="singInBtn">로그인</button>
	            	<button class="btn btn-outline-primary my-2 my-sm-0" type="submit" id="singUpBtn">회원가입</button>

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
      </div>
    </nav>
    <br>
