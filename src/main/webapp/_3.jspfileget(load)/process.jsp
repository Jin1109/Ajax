<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>process.jsp</title>
<script src="../js/jquery-3.6.0.js"></script>
<link href="css/form.css" rel="stylesheet" type="text/css">
</head>
<body>
넘어온 이름은 ${param.name} 입니다.<br>
넘어온 나이는 ${param.age}세 입니다.<br>
넘어온 주소는 ${param.address} 입니다.
</body>
</html>