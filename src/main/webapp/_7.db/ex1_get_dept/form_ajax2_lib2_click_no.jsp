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

</head>
<body>
<div class="container">
</div>
<script>
	function getData(){
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

		}); //ajax end
	}
	getData();
</script>
</body>
</html>