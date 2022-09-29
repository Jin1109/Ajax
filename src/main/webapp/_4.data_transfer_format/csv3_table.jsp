<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CSV(Comma Separated Value)</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript">
/*
 * jQuery.get() = $.get() 
 - 서버에 데이터를 HTTP GET방식으로 보냅니다.
 - $.get() 함수를 이용해서 data.csv 파일을 불러옵니다.
 - $.get() 함수의 첫번째 매개변수에는 서버의 URL 주소를 지정합니다.
 - $.get() 함수의 두번째 매개변수인 콜백함수를 이용해서 서버에서 보내온 csv 형식의
       데이터를 input으로 받습니다.
 */
$(function(){
   $("button").click(function(){//버튼을 클릭하면
      //input에는 data.csv의 내용이 들어 있습니다.
      $.get("data.csv", function(input){
         
         //한 줄씩 자릅니다.
         var inputs = input.split('\n');
         
         var output="<table class=table><tbody><tr><th>이름</th><th>지역</th><th>나이</th></tr>";
         for (var i = 0; i < inputs.length; i++){
            //쉼표를 기준으로 자릅니다.
            var result = inputs[i].split(',');
            output += "<tr>";
            for (var j = 0; j < result.length; j++){
               output += "<td>" + result[j].trim() + "</td>";
            }
            output += "</tr>";
         }
         output += "</tbody></table>"
         $("pre").html(output)
      });//get end
   });//click end
});//ready end
</script>
</head>
<body>
<div class="container">
   <button class="btn btn-primary">데이터 불러오기</button>
   <pre>변경전 </pre>
</div>
</body>
</html>