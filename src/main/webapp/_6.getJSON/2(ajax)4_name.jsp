<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버튼을 클릭하면 ajax실행하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#error{color:green}
	#com{color:blue}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/*
 $.ajax(object)
  url : 요청 전송 url,
  type : 전송 방식(get(기본) 또는 post),
  data : 전송할 자료들,
  dataType : return data의 Type(에이잭스 성공 후 돌려받은 자료의 형을 정의="json", "xml", "html"),
  success : HTTP 요청이 성공한 경우 실행할 함수 정의,
  error : HTTP 요청이 실패한 경우 실행할 함수 정의,
  complete : 요청의 실패, 성공과 상관 없이 완료 될 경우 실행할 함수 정의
 */
$(function(){
	$("button").click(function(){ //버튼을 클릭하면
		//기존 데이터가 있는 요소들을 제거합니다.
		$(".container div").remove()//div 요소 제거합니다.
		
		$.ajax({
			url : "${pageContext.request.contextPath}/get_name", //요청 전송 url
			dataType : "json", //return data의 Type(에이잭스 성공 후 돌려받은 자료 형을 정의)
			cache : false,
			success : function(rdata){//HTTP 요청이 성공한 경우 실행할 함수 정의(이벤트 핸들러)
									  //rdata는 서버에서 보낸 데이터입니다.
				
				$("body .container")
				.append("<div>서버에서 가져온 데이터는 <span style='color:red'>" + rdata.name + "</span>입니다.</div>");

			},
			error : function(request, status, error){
				$("body .container").append("<div id='error'>code :"
						+ request.status + "<br>"
						+ "받은 데이터 :" + request.responseText + "<br>"
						+ "error status : " + status + "<br>"
						+ "error 메시지 : " + error +"</div>");
			},
			complete : function(){//요청의 실패, 성공과 상관 없이 완료될 경우 호출
				$("body .container").append("<div id='com'>Ajax가 완료되었습니다.</div>");
			}
		}); //ajax end
	});//click end
});
</script>
</head>
<body>
<div class="container">
	<button class="btn btn-info">JSON 데이터를 불러옵니다.</button>
</div>
</body>
</html>