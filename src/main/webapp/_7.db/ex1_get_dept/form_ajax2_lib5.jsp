<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>조회와 검색</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
   <div class="container">
     <h3 class="mt-5">검색할 부서 번호를 입력하세요</h3>
     <form class="mb-3">
       <div class="row">
        <input type='search' name='deptno' required pattern="[0-9]{2}" class="form-control col-8 ml-3"> 
        <button class="btn btn-info" >검색</button>
        </div>
     </form>
  </div>
  <script>
           function getData(go, senddata){ //수정
              console.log(senddata);
               $.ajax({
                     type: "post",
                     url :    '${pageContext.request.contextPath}/' + go, //수정
                     data : {"deptno":senddata}, //추가
                     dataType : 'json',
                     success : function(rdata){
                        if(rdata.length>0){
                           var output = '<div id="result"><table  class="table">'
                                    + '<thead><tr><th>부서번호</th><th>부서명</th><th>지역</th></tr></thead>'
                                    + '<tbody>';
                            $(rdata).each(function (index, item) { 
                               output += '<tr>';
                               output += '    <td>' + item.deptno + '</td>';
                               output += '    <td>' + item.dname + '</td>';
                               output += '    <td>' + item.loc + '</td>';
                               output += '</tr>';
                             });//each end
                           output += '</tbody></table></div>';
                             $('.container').append(output);
                        }else{
                           $('.container').append('<div id="result">데이터가 존재하지 않습니다.</div>');
                        }
                  }//success end
                  , error : function(request, status, error){
                     $(".container").append("<div id='result'>code :" 
                        + request.status  + "<br>"
                        + "받은 데이터 :" + request.responseText  + "<br>"
                        + "error status : " + status + "<br>"
                          + "error 메시지 : " + error +"</div>");
                  }//error end
               });//ajax end
        }//function getData() end
        
        getData('dept_lib');  
        
        $("form").submit(function(event){
           event.preventDefault();
            $("#result").remove()
            var senddata = $("input[name='deptno']").val();
            getData('dept_lib_search', senddata);
        })
    </script> 
</body>
</html>