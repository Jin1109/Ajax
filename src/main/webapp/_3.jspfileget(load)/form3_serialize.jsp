<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>
<link href="../css/form.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.6.0.js"></script>
<script>
$(function(){
	$("form").submit(function(e){ //전송 버튼 클릭시
		e.preventDefault();//기본 이벤트 제거
		// 서버로 보낼 데이터를 품에서 얻어옵니다.
		// 객체 형태로 파리미터 이름과 값을 전달합니다.
		var data =$('form').serialize();
			console.log(data);
			// $("div").load("process.jsp","name=love&age=21&address=서울시");
			$("div").load("process.jsp",data);
	});
});
</script>
</head>
<body>
<%--
	 form태그의 action 속성 업습니다. 이 상태에서 전송을 클릭하면 현재 URL를 다시 불러옵니다.
--%>
	<form>
		<span>이름</span><input type="text" placeholder="이름" id="name" name="name" required><br>
		<span>나이</span><input type="text" placeholder="나이" id="age" name="age" required><br>
		<span>주소</span><input type="text" placeholder="주소" id="address" name="address" required><br>
		<input type="submit" value="전송">
	</form>
	<div></div>
</body>
</html>