<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#error{color:green}
	#com{color:blue}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$("button").click(function(){	
		$.ajax({
			type : "post",
			url : '${pageContext.request.contextPath}/dept_lib',
			dataType : 'json',
			success : function(rdata){
				console.log("성공" + rdata)
					$("button+div").remove()
				if(rdata.length>0){
					var output = '<div id="result"><table class="table">'
						  	 + '<thead><tr><th>부서번호</th><th>부서명</th><th>지역</th></tr></thead>'
						  	 + '<tbody>';
					$(rdata).each(function (index, item){
						output += '<tr>';
						output += '    <td>' + item.deptno + '</td>';
						output += '    <td>' + item.dname + '</td>';
						output += '    <td>' + item.loc + '</td>';
						output += '</tr>';
					});//each end
					output += '</tbody></table></div>';
						$('.container').append(output);
				}else{
					$('.container').append('<div>데이터가 존재하지 않습니다.</div>');
				}			   
			},//success end
			error : function(request, status, error){
				$("body").append("<div id='result'>code :"
						+ request.status + "<br>"
						+ "받은 데이터 :" + request.responseText + "<br>"
						+ "error status : " + status + "<br>"
						+ "error 메시지 : " + error +"</div>");
			},
			complete : function(){//요청의 실패, 성공과 상관 없이 완료될 경우 호출
				$("body").append("<div id='com'>Ajax가 완료되었습니다.</div>");
			}
		}); //ajax end
	});//click end
});
</script>
</head>
<body>
<div class="container">
	<button class="btn btn-info">라이브러리를 이용한 json 형식으로 dept 내용 가져오기.</button>
</div>
</body>
</html>