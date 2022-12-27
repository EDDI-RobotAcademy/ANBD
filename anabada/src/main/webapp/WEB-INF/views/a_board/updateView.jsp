<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function() {
		var formObj = $("form[name='updateForm']")d;
		
		$(".update_btn").on("click", function() {
			if(fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/a_board/update");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		function fn_valiChk() {
			var updateForm = ${"form[name='updateForm'] .chk"}.length;
			for(var i=0; i<updateForm; i++) {
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
					alert($(".chk").eq(i).attr("placeholder"));
				}
			}
		}
		
		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href="/a_board/readView?a_bno=${update.a_bno}" + "&page=${scri.page}" + "&perPageNum=${scri.perPageNum}" + 
			"&searchType=${scri.searchType}" + "&keyword=${scri.keyword}" + "&cateType=${scri.cateType}";
		});
	});
</script>
</head>
<body>
<header>
	<h1>게시판</h1>
</header>

<div>
	<%@include file="nav.jsp" %>
</div>

<form name="updateForm" method="post" action="/a_board/update">
	<input type="hidden" name="a_bno" value="${update.a_bno }" readonly="readonly"/>
	<input type="hidden" name="page" value="${scri.page }"/>
	<input type="hidden" name="perPageNume" value="${scri.perPageNum }"/>
	<input type="hidden" name="searchType" value="${scri.searchType }"/>
	<input type="hidden" name="keyword" value="${scri.keyword }"/>
	<input type="hidden" name="cateType" value="${scri.cateType }"/>
	
	<table>
		<tr>
			<td>
				제목 <input type="text" id="a_title" name="a_title" class="chk" value="${update.a_title }" placeholder="제목을 입력해주세요."/>
			</td>
		</tr>
		
		<tr>
			<td>
				내용 <textarea id="a_content" name="a_content" class="chk" placeholder="내용을 입력해주세요."><c:out value="${update.a_content }"/></textarea>
			</td>
		</tr>
		
		<tr>
			<td>
				작성자 <input type="text" id="id" name="id" value="${update.id }" readonly="readonly"/>
			</td>
		</tr>
	</table>
	
	<div>
		<button type="submit" class="update_btn">저장</button>
		<button type="reset" class="cancel_btn">취소</button>
	</div>
</form>
</body>
</html>