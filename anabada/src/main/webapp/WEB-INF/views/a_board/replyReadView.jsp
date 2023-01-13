<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function() {
			var replybtn = $("form[name='replyForm']");
		$(".write_btn").on("click", function() {
			replybtn.attr("action", "/a_board/replyWrite");
			replybtn.submit();
		});
		
		$(".replyupdate").on("click", function(el) {
			var target = $(el.target).parents("div");
			$($(target).children(".replysave")).css("display", "inline");
			$($(target).children(".replyreset")).css("display", "inline");
			$($(target).children(".r_content2")).css("display", "inline");
			$($(target).children(".replyupdate")).css("display", "none");
			$($(target).children(".r_content")).css("display", "none");
			$($(target).children(".replydelete")).css("display", "none");
			
			console.log( $(target).children(".r_content").val());
			$($(target).children(".r_content2")).val($(target).children(".r_content").val());
			
		});
		
		$(".replyreset").on("click", function(el) {
			var target = $(el.target).parents("div");
			$($(target).children(".replysave")).css("display", "none");
			$($(target).children(".replyreset")).css("display", "none");
			$($(target).children(".r_content2")).css("display", "none");
			$($(target).children(".replyupdate")).css("display", "inline");
			$($(target).children(".r_content")).css("display", "inline");
			$($(target).children(".replydelete")).css("display", "inline");
		});
		
		$(".replysave").on("click", function(el) {
			var target = $(el.target).parents("div");
			$($(target).children(".replysave")).css("display", "none");
			$($(target).children(".replyreset")).css("display", "none");
			$($(target).children(".r_content2")).css("display", "none");
			$($(target).children(".replyupdate")).css("display", "inline");
			$($(target).children(".r_content")).css("display", "inline");
			$($(target).children(".replydelete")).css("display", "inline");
			
			var rno = $(el.target).attr("data-rno");
			console.log(rno);
			 $.ajax ({
				url:"/a_board/replyUpdate", 
				type:"POST",
				data:{"r_content":$(target).children(".r_content2").val(), "r_rno": $(el.target).attr("data-rno")},
				success:function(data) {
					alert("댓글 수정 완료");
					location.reload();
				}
			}); 
			
		});
		//function()에 적힌 값은, 클릭했을 때 a의 정보(이벤트)를 가져오기 위해 적어줌
		//a.target은 a의 엘리먼트(태그값)들을 전부 가져온다는 뜻이다.
		// /를 붙이면 절대경로, 상대경로로 쓰려면 그냥 주소값만 적어주면 된다.
		// 위에서 가져온 a의 엘리먼트 값들 중 "data-rno"를 변수 rno에 담아서 가져옴
		$(".replydelete").on("click", function(el) {
			 var rno = $(el.target).attr("data-rno");
			 var bno = $(el.target).attr("data-bno");
			 alert("댓글이 삭제되었습니다.");
			$(location).attr("href", "replyDelete?rno="+rno+"&bno="+bno);
		});
		
	});
</script>
</head>
<body>
<!-- 댓글 -->
	<div id="reply">
		<ol class="replyList">
			<c:forEach items="${replyList }" var="replyList">
				<li>
					<%-- <p>
					작성자 : ${replyList.id }<br>
				 	작성 날짜 : <fmt:formatDate value="${replyList.r_regdate }" pattern="yyyy-MM-dd"/>
				 	</p>
					<p>${replyList.r_content }</p> --%>
				 	<div>
				 		<input type="text" class="id" value="${replyList.id }" readonly/>
				 		<input type="date" value="<fmt:formatDate value='${replyList.r_regdate }' pattern='yyyy-MM-dd'/>" readonly/>
				 		<input type="text" class="r_content" value="${replyList.r_content }" readonly/>
				 		
				 		<input type="text" class="r_content2" name="r_content2" value="${replyList.r_content }" style="display:none"/>
				 		<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replysave" style="display:none">저장</button>
				 		<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replyreset"style="display:none">취소</button>
				 		
				 		<c:if test="${replyList.id eq member.id }">
				 			<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replyupdate">수정</button>
				 			<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replydelete">삭제</button>
				 		</c:if>
				 	</div>
				 </li>
			</c:forEach>
		</ol>
	</div>
	
	<form name="replyForm" method="post" role="form">
		<input type="hidden" id="a_bno" name="a_bno" value="${read.a_bno }"/>
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
		<input type="hidden" id="cateType" name="cateType" value="${scri.cateType }"/>
		
		<div>
			<label for="id">작성자</label>
			<input type="text" id="id" name="id" value="${member.id }" readonly/>
			<label for="r_content">내용</label>
			<input type="text" id="r_content" name="r_content"/>
		</div>
		
		<div>
			<c:if test="${member.id != null }">
				<button type="button" class="write_btn">작성</button>
			</c:if>
			<c:if test="${member.id == null }">
				<span>로그인 후 댓글을 작성하실 수 있습니다.</span>
			</c:if>
		</div>
	</form>
	
</body>
</html>