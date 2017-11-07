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
    
<div class="container">
	<p class="bg-warning">접근권한이 없습니다.</p>
	<p class="bg-danger">접근권한이 없습니다.</p>
	
	<button type="button" class="btn btn-success" id="mainBtn">메인으로 이동</button>
</div>

</body>
</html>