<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>
<script src="../js/jquery-3.6.0.js"></script>
<link href="../css/form.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="process.jsp">
		<span>이름</span><input type="text" placeholder="이름" id="name" name="name" required><br>
		<span>나이</span><input type="text" placeholder="나이" id="name" name="age" required><br>
		<span>주소</span><input type="text" placeholder="주소" id="name" name="address" required><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>