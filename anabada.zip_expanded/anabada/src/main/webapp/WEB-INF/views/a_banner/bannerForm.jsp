<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	//파일 추가를 위한 메소드 
	function addFile() {
		var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
		$("#file-list").append(str);
		$("a[name='file-delete']").on("click", function(e) {
			e.preventDefault();
			deleteFile($(this));
		});
	}
	
	//파일 삭제 
	function deleteFile(obj) {
		obj.parent().remove();
	}
	
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		
		$(".write_btn").on("click", function() {
			formObj.attr("action", "/a_banner/insert");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
</script>
</head>

<body>
	<form name="writeForm" enctype="multipart/form-data" method="POST">
		<div>
			<div class="form-group" id="file-list">
				<a href="#this" onclick="addFile()">파일추가</a>
				<div class="file-group">
					<input type="file" name="file"><a href='#this' name='file-delete'>삭제</a>
				</div>
			</div>
		</div>
			
		<div>
			<button type="submit" class="write_btn">저 장</button>
		</div>
	</form>
</body>
</html>