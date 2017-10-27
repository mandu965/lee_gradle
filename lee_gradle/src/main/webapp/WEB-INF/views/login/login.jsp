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
			}
		});
		return false;
	});
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
  <form class="navbar-form navbar-right" id="signForm">
	    <div class="form-group">
	      <label for="usr_id">ID:</label>
	      <input type="text" class="form-control" id="usr_id" placeholder="Enter Id" name="usr_id">
	    </div>
	    
	    <div class="form-group">
	      <label for="usr_pw">Password:</label>
	      <input type="password" class="form-control" id="usr_pw" placeholder="Enter password" name="usr_pw">
	    </div>
	
	     <button type="submit" class="btn btn-success" id="singInBtn">Sign in</button>
            <button class="btn btn-success" id="singUpBtn">Cancle</button>
	  </form>
	</div>
</div>
</body>
</html>