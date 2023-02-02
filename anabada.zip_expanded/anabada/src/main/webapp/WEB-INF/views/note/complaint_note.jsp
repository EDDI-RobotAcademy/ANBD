<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="../resources/css/n_styles.css">
<meta charset="UTF-8">
<title>신고 쪽지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		
		$("button[name=delete]").on("click", function () {
			if(confirm("쪽지를 삭제하시겠습니까?")){
				
				
				$.ajax({
				        type: "get",
				        url : "/note/delete_admin.ajax",
				        data: {
				        	id: '${n_read.n_sender}',
				        	n_bno : ${n_read.n_bno},
				        },
				        dataType :  'json',   // 데이터 타입을 Json으로 변경
				        traditional : true,
				        success: function(data){
				            alert("삭제했습니다.");
				            
				            if(${href eq 'all'}){
								alert("전체 새로고침");
						    	window.opener.top.location.href = "http://localhost:8081/complaint-all-view/";
						    	
						    }else if(${href eq 'note'}){
						    	alert("쪽지만 새로고침");
						    	window.opener.top.location.href = "http://localhost:8081/complaint-view/note";
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
	table{
  		margin: auto;
  		width: 100%;
	}
	tr, td{
  		border-bottom: 1px solid #e5e5e5;
  		padding: 10px;
	}
</style>
</head>
<body style="overflow-x: hidden">
		<div style="width: 450px">
			<table>
				<tr>
					<td colspan="2">
						신고쪽지
						<div style="text-align: left; display: inline">
						<button type="button" name="delete" class="d_btn">삭제</button>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					보낸 아이디&nbsp;&nbsp;&nbsp;
					<c:if test="${empty n_read.n_sender }">
					(알수없음)
					</c:if>
					<c:if test="${not empty n_read.n_sender }">
					${n_read.n_sender}
					</c:if>
					</td>
				<tr>
					<td colspan="2">
					받은 아이디&nbsp;&nbsp;&nbsp;
					<c:if test="${empty n_read.n_receiver }">
					(알수없음)
					</c:if>
					<c:if test="${not empty n_read.n_receiver }">
					${n_read.n_receiver}
					</c:if>
					</td>
				</tr>
				
				<!--1) 중고게시글과 관련된 쪽지일때. 후기요청 x -->
				<!--2) 후기 요청 쪽지일때 -->
				<!--3) 삭제된 중고 게시물과 연관된 쪽지일때 -->
				<!--4) 이벤트 게시물일때 -->
				<!--5) 삭제된 이벤트 게시물일때 -->
				<c:choose>
				<c:when test="${not empty p_read && n_read.n_rno ne 0 && n_read.n_type eq 'no'}">
				<tr>
					<td width="130px;">
						<a href="/product/readView?pno=${n_read.n_rno}">
							<img class="p_img" src="${p_read.p_filepath }">
						</a>
					</td>
					<td>
						${p_read.p_title}<br>
						${p_read.p_cost}<br>
					</td>
				</tr>
				</c:when>
				
				<c:when test="${not empty p_read && n_read.n_rno ne 0 && n_read.n_type eq 'review'}">
				<tr>
					<td width="130px;">
						<a href="/product/readView?pno=${n_read.n_rno}">
							<img class="p_img" src="${p_read.p_filepath }">
						</a>
					</td>
					<td>
						${p_read.p_title}<br>
						${p_read.p_cost}<br>
						<!-- 받은 사람만 후기 작성하기 버튼 누를수있도록 -->
						<c:if test="${n_read.n_receiver eq id }">
						   <button type="button" class="review" name="review">후기 작성하기</button>
						</c:if>
					</td>
				</tr>
				</c:when>
				
				<c:when test="${empty p_read && n_read.n_rno ne 0 && (n_read.n_type eq 'no' || n_read.n_type eq 'review')}">
				<tr>
					<td colspan="2">
						<font>*삭제된 게시물과 관련된 쪽지입니다.</font>
					</td>
				</tr>
				</c:when>
			
				<c:when test="${not empty eno && empty p_read && n_read.n_rno ne 0 && n_read.n_type eq 'event'}">
				<tr>
					<td colspan="2">
					<a href="/event/readView?eno=${eno }">이벤트 상세보기</a>
					</td>
				</tr>
				</c:when>
				
				<c:when test="${empty eno && empty p_read && n_read.n_rno ne 0 && n_read.n_type eq 'event'}">
				<tr>
					<td colspan="2">
						<font>*삭제된 이벤트와 관련된 쪽지입니다.</font>
					</td>
				</tr>
				</c:when>
				</c:choose>
			
			</table>
		</div>
			
		<div style="padding:10px">
		${fn:replace(n_read.n_content, replaceChar, "<br/>")}
		</div>
			
</body>
</html>