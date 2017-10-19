<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
test
The time on the server is ${serverTime}.
<br>
로그인 사용자 : ${user.usr_id} <br>22
로그인 사용자 명 : ${user.usr_nm}
<c:forEach var="item" items="${user}">
        <li>${item.usr_name}</li>
    </c:forEach>
</body>
</html>