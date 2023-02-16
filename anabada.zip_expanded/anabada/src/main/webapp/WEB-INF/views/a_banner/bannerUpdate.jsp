<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="manifest" href="resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
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
		var formObj = $("form[name='updateForm']");
		
		$(".write_btn").on("click", function() {
			formObj.attr("action", "/a_banner/update");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
</script>
</head>

<body>
	<form name="updateForm" enctype="multipart/form-data" method="POST">
		<input type="text" id="fileList" name="fileList" value="${fileList.a_no}">
		<input type="text" id="fileList" name="fileList" value="${fileList.a_file}">
		
		<div>
			<div class="form-group" id="file-list">
				<c:forEach items="${blist}" var="filelist" >
                   <div style="display: inline-block;"  id="${blist.a_no}" > <img  width="150px;" height="150px;"  src="${blist.a_file}"  >  <button  type="button"  class="imgbtn"  value="${blist.a_no}"  >삭제</button> </div> 
                </c:forEach>
                
                <c:forEach items="${blist}" var="blist">		
				<div class="imgbox">
					<div><c:out value="${blist.a_no}" /></div>
					<div><img width="500px;" height="300px;" class="single-item" id="slick" src="${blist.a_file}" /></div>
				</div>
				</c:forEach>
			
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