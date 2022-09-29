<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
td{border: 1px soild gray;}

td:nth-child(3n){text-align: right}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
/*
 - $.get() 메서드를 이용해서 item.xml 파일을 불러옵니다.
 - $.get() 메서드의 첫번째 매개변수에는 서버의 URL 주소를 지정합니다.
 - $.get() 메서드의 두번째 매개변수인 콜백함수를 이용해서 서버에서 보내온
 	 XML 형식의 데이터를 data 로 받습니다.
 */
$(function(){
	$("button").click(function(){ //버튼을 클릭하면
		$.get('item.xml', function(data){ //data에는 item.xml의 내용이 들어 있습니다.
			$("table").remove(); //테이블이 존재하면 제거해 계속 추가 되지 않도록 합니다.
			
			var output = "<table class='table'><thead>"
				+ "<tr><td>id</td><td>name</td><td>price</td>"
				+ "<td>description</td></tr></thead><tbody>"
				
			// 서버에서 얻어온 데이터에서 셀렉터로 item 태그를 찾습니다.
			$(data).find('item')
			.each(function(){
				//each() : 반복 하는 메서드로 item을 찾을 때마다 반복해서 아래 문장들을 수행합니다.
				// 6개의 item태그 중 현재 처리중인 item태그를 this로 접근합니다.
				// $(this)를 사용하여 jQuery객체를 생성합니다.
					output += "<tr>"
						   + "<td>" + $(this).attr("id") + "</td>"
						   + "<td>" + $(this).attr("name") + "</td>"
						   + "<td>" + $(this).find("price").text() + "</td>"
						   + "<td>" + $(this).find("description").text() + "</td>"
						   + "</tr>";
						   
			/*
			$(this).attr("id") : 속성 id의 값을 구해옵니다.
			$(this).find("price") : price 태그를 찾습니다.
			$(this).find("price").text() : price 태그 사이의 값을 구해옵니다.
			$(this).find("description") : description 태그를 찾습니다.
			$(this).find("description").text() : description 태그 사이의 값을 구해옵니다.
			*/
			});//each end
			output += "</tbody></table>"
			$("body").append(output);
		});//get() end
		
	});//click end
	
});//$() end
</script>
</head>
<body>
<button>XML형식으로 데이터 가져옵니다.</button>
</body>
</html>