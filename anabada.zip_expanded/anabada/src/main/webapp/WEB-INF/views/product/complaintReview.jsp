<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="../resources/css/n_styles.css">
<meta charset="UTF-8">
<title>신고된 리뷰</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	
	  $("button[name=delete]").on("click", function () {
	         if(confirm("삭제하시겠습니까?")){
	            
	            
	            $.ajax({
	                    type: "get",
	                    url : "/pcomplaint/deleteReview",
	                    data: {
	                       id: '${review.r_consumer}',
	                       r_no : '${review.r_no}',
	                    },
	                    dataType :  'json',   // 데이터 타입을 Json으로 변경
	                    traditional : true,
	                    success: function(data){
	                        alert("삭제했습니다.");
	                        window.parent.postMessage('Done', 'http://localhost:8081/complaint-all-view/');
	                        window.close();
	                    },
	                    error : function(request, status, error) {
	                     alert("삭제 실패:" + error);
	                  }
	              });
	         }else{
	            return;
	         }
	         
	      });
	
})
</script>

<style>
table {
	margin: auto;
	width: 100%;
}

tr, td {
	border-bottom: 1px solid #e5e5e5;
	padding: 10px;
}

.box {
	display: inline;
	border-radius: 7px;
	padding: 5px;
	background-color: #AFAFAF;
	text-align: center;
	font-weight: bold;
	color: white;
	margin-right: 0px;
	letter-spacing: 2px;
}
</style>
</head>

<body style="overflow-x: hidden" >
<input type="hidden" name="r_no" value="${review.r_no}" >

	<div style="width: 500px">

	<table>
	<tr> <td colspan="3" >신고된 리뷰   &nbsp; &nbsp;  <div style="text-align: left; display: inline">
						<button type="button" name="delete" class="d_btn">삭제</button>
					</div>   </td>    </tr>
	
	<tr> <td> <div class="box">작성자</div> ${review.r_consumer } </td> 
	
	<td>  
	<c:if test="${review.r_score == 0.3 }"> ⭐⭐⭐⭐ </c:if> <c:if test="${review.r_score == 0.2 }"> ⭐⭐⭐ </c:if> <c:if test="${review.r_score == 0.1 }"> ⭐⭐ </c:if> <c:if test="${review.r_score == -0.1 }"> ⭐ </c:if>
	
	 </td>  
	 
	 <td> ${review.r_date} </td>
	 
	  </tr>
	  
	  <tr>
	  <td colspan="3" > <div class="box">내용</div> ${review.r_content }  </td>
	  </tr>
	  
	</table>







	</div>

	<div style="padding: 10px">${fn:replace(n_read.n_content, replaceChar, "<br/>")}</div>





</body>
</html>