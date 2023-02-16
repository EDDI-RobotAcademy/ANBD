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
<title>신고 게시글</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	
	  $("button[name=delete]").on("click", function () {
	         if(confirm("삭제하시겠습니까?")){
	            
	            
	            $.ajax({
	                    type: "get",
	                    url : "/pcomplaint/delete_pro",
	                    data: {
	                       id: '${read.id}',
	                       pno : '${read.pno}',
	                       p_title:'${read.p_title}'
	                    },
	                    dataType :  'json',   // 데이터 타입을 Json으로 변경
	                    traditional : true,
	                    success: function(data){
	                        alert("삭제했습니다.");
	                        
	                        if(${href eq 'all'}){
						    	window.opener.top.location.href = "http://localhost:8081/complaint-all-view/";
						    	
						    }else if(${href eq 'pboard'}){
						    	window.opener.top.location.href = "http://localhost:8081/complaint-view/pboard";
						    }
				            		
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
<input type="hidden" name="pno" value="${read.pno}" >

	<div style="width: 700px">

		<table>
			<tr>
				<td colspan="3"> <font style="font-weight: bold;" >상품 게시판 신고글 </font>   &nbsp;&nbsp;&nbsp;&nbsp;
					<div style="text-align: left; display: inline">
						<button type="button" name="delete" class="d_btn">삭제</button>
					</div>
				</td>
			</tr>
			<tr>
			<td colspan="2" ><div class="box">제목</div>  ${read.p_title }</td>
				<td ><div class="box"> 작성자</div> ${read.id}  </td>
			</tr>

			<tr>
				<td>
					<div class="box">카테고리</div> ${read.p_type }
				</td>
				<td>
					<div class="box">제품상태</div> ${read.p_con }
				</td>
				<td>
					<div class="box">거래유형</div><c:if test="${read.sell_a != '0' }">${read.sell_a} [ ${read.p_local} ] </c:if> <c:if test="${read.sell_b != '0' }">${read.sell_b}</c:if>
				</td>
			</tr>

			<tr> <td colspan="3" > 
			<div class="box">내용</div>
			
			 ${read.p_content} </td> </tr>
			 <c:if test="${not empty filelist }">
			<tr> <td colspan="3" > 
			
			
			
			<c:forEach items="${filelist }" var="list" >
			<img  src="${list.filepath}" name="p_file" width="150px;" height="150px;" >
			</c:forEach>
			
			
			
			
			</td> </tr>
			</c:if>
		</table>








	</div>

	<div style="padding: 10px">${fn:replace(n_read.n_content, replaceChar, "<br/>")}</div>





</body>
</html>