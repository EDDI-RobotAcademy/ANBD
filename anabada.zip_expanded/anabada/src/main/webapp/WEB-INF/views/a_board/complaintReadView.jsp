<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 신고 내역 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.container {
	width: 1000px;
  	padding: 30px;
}
</style>
<script src="//cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js""></script>
<script>
	$(function() {
		$("button[name=delete_btn]").on("click", function() {
			if(confirm("삭제하시겠습니까?")) {
				$.ajax({
					type: 'get',
					url: '/a_board/admin_delete',
					data: { id: '{id}', a_bno: ${read.a_bno}},
					dataType: 'json',
					traditional: true,
					success: function(data) {
						alert("게시글 삭제 완료");
						if(${href eq 'all'}) {
							window.opener.top.location.href = "http://localhost:8081/complaint-all-view/";
						}
						else if(${href eq 'a_board'}) {
							window.opener.top.location.href = "http://localhost:8081/complaint-view/a_board";
						}
						
						window.close();
					},
					error: function(request, status, error) {
						alert("삭제 실패 : " + error);
					}
				});
			}
			else {
				return;
			}
		});
	});
</script>
</head>
<body style="overflow-x: hidden">
	
<section class="container">
	<form name="complaintReadForm" method="post" role="form">
		<input type="hidden" id="a_bno" name="a_bno" value="${read.a_bno }"/>
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
		<input type="hidden" id="cateType" name="cateType" value="${scri.cateType }"/>
	</form>
	
		<div>
			<label for="nick" class="form-label">작성자</label>
			<input type="text" id="nick" name="nick" class="form-control" value="${read.nick}" readonly/>
		</div>
		
		<br>
		
		<div>
			<label for="a_title" class="form-label">제목</label>
			<input type="text" id="a_title" name="a_title" class="form-control" value="${read.a_title }" readonly/> 
		</div>
		
		<br>
		
		<div>
			<label for="a_content" class="form-label">내용</label>
			<textarea id="a_content" name="a_content" readonly><c:out value="${read.a_content }"/></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('a_content', {filebrowserUploadUrl: '/a_board/fileUpload', width:930, height:300});
			</script>
		</div>
		
		<div>
			<button type="button" class="delete_btn">삭제</button> &nbsp;
		</div>
</section>
	
</body>
</html>