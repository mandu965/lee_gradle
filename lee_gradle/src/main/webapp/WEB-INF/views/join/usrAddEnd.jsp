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
	$("#mainBtn").click(function(){
		$(location).attr('href', '/')
		return false;
	})
})
</script>


<title>Lee's library</title>
</head>
<body>
 	<jsp:include page="/WEB-INF/include/top.jsp" flush="true" />
 <!-- 
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">Project name</a>
          <a class="navbar-brand" href="#">notice</a>
          <a class="navbar-brand" href="#">board</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
            <button class="btn btn-success" id="singUpBtn">Sign up</button>
          </form>
        </div>/.navbar-collapse
      </div>
    </nav>
 -->
    <!-- Main jumbotron for a primary marketing message or call to action -->
    
<div class="container">
  	<p class="bg-primary">회원가입이 완료 되었습니다.1</p>
	<p class="bg-success">회원가입이 완료 되었습니다.2</p>
	<p class="bg-info">회원가입이 완료 되었습니다.3</p>
	<p class="bg-warning">회원가입이 완료 되었습니다.4</p>
	<p class="bg-danger">회원가입이 완료 되었습니다.5</p>
	
	<button type="button" class="btn btn-success" id="mainBtn">메인으로 이동</button>
</div>

</body>
</html>