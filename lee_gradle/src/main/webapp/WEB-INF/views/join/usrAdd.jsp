<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		$("#usrVO").attr('action', '/join/usrAddPro').submit();
		return false;
	})
})
</script>


<title>Insert title here</title>
</head>
<body>
 
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
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

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
	      	<label for="usr_sex">���� : </label><br>
	    	<label class="radio-inline"><input type="radio" name="usr_sex" value="M" checked>��</label>
			<label class="radio-inline"><input type="radio" name="usr_sex" value="W">��</label>
	    </div>	    
	    
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
	    </div>
	    
	    <div class="form-group">
	      <label for="usr_addr">ID:</label>
	      <input type="text" class="form-control" id="usr_addr" placeholder="Enter Addr" name="usr_addr">
	    </div>
	    
	    <!-- ��й�ȣ Ȯ��  -->
	    
	    <!-- <div class="checkbox">
	      <label><input type="checkbox" name="emaiRcvAgree"> email ���� ����</label>
	    </div> -->
	    
	    <button class="btn btn-default" id="usrAddBtn">����</button>
	    <button class="btn btn-default" id="usrCnclBtn">���</button>
	  </form>
	</div>
</div>

 <!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <script src="/resurces/bootstrap/js/bootstrap.min.js"></script>
     
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>