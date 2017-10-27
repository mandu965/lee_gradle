<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resurces/bootstrap/css/bootstrap.css" >
<link rel="stylesheet" href="/resurces/bootstrap/css/bootstrap-theme.css" >
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
$(document).ready(function(){
	$("#usrAddBtn").click(function(){
		$("#usrVO").attr('method', 'post');
		$("#usrVO").attr('action', '/join/usrAddPro').submit();
		return false;
	})
})
</script>


<title>Insert title here</title>
</head>
<body>
 
<jsp:include page="/WEB-INF/include/top.jsp" flush="true" />

    <!-- Main jumbotron for a primary marketing message or call to action -->
    
<div class="container">
  <h2>Info</h2>
  <p>Make the viewport larger than 768px wide to see that all of the form elements are inline, left aligned, and the labels are alongside.</p>
  <!-- class="form-inline"  -->
  
  <div class="col-md-6">
	  <form id="usrVO">
	  	<div class="form-group">
	      <label for="usr_nm">Name:</label>
	      <input type="text" class="form-control" id="usr_nm" placeholder="Enter name" name="usr_nm">
	    </div>
	    
	    <div class="form-group">
	      <label for="usr_id">ID:</label>
	      <input type="text" class="form-control" id="usr_id" placeholder="Enter Id" name="usr_id">
	    </div>
	    
	    <div class="form-group">
	      <label for="usr_pw">Password:</label>
	      <input type="password" class="form-control" id="usr_pw" placeholder="Enter password" name="usr_pw">
	    </div>
	    	    
 		<div class="form-group">
	      	<label for="usr_sex">성별 : </label><br>
	    	<label class="radio-inline"><input type="radio" name="usr_sex" value="M" checked>남</label>
			<label class="radio-inline"><input type="radio" name="usr_sex" value="W">여</label>
	    </div>	    
	    
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
	    </div>
	    
	    <div class="form-group">
	      <label for="usr_addr">Address:</label>
	      <input type="text" class="form-control" id="usr_addr" placeholder="Enter Addr" name="usr_addr">
	    </div>
	    
	    <!-- 비밀번호 확인  -->
	    
	    <!-- <div class="checkbox">
	      <label><input type="checkbox" name="emaiRcvAgree"> email 수신 여부</label>
	    </div> -->
	    
	    <button class="btn btn-default" id="usrAddBtn">가입</button>
	    <button class="btn btn-default" id="usrCnclBtn">취소</button>
	  </form>
	</div>
</div>

 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/resurces/bootstrap/js/bootstrap.min.js"></script>
     
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>