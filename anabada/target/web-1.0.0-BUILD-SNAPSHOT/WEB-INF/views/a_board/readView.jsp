<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js""></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		$(".update_btn").on("click", function() {
				formObj.attr("action", "/a_board/updateView");
				formObj.attr("method", "get");
				formObj.submit();
			})
			
			$(".delete_btn").on("click", function() {
				var deleteYN = confirm("삭제 하시겠습니까?");
				if(deleteYN == true) {
					formObj.attr("action", "/a_board/delete");
					formObj.attr("method", "get");
					formObj.submit();
				}
			})
			
		$(".list_btn").on("click", function() {
			location.href = "/a_board/list?page=${scri.page}" + "&perPageNum=${scri.perPageNum}" + 
					"&searchType=${scri.searchType}" + "&keyword=${scri.keyword}";
		});
	});
	
	$(document).ready(function() {
		
		var likeVal = ${Chk};
		
		if(likeVal > 0) {
			$("#clear").attr("src", "<c:url value='images/heart.png'/>");
		}
		else {
			$("#clear").attr("src", "<c:url value='images/clear.png'/>");
		}
		
		$("#clear").on("click", function() {
			$.ajax ({
				url: '/a_board/insertLike',
				type: 'POST',
				dataType: 'json',				
				data: JSON.stringify 
				({'id': '${sessionScope.id}', 'a_bno': ${read.a_bno} }),
				success: function(likeVal) {
					if(likeVal == 0) {
						$("#clear").attr("src", "<c:url value='/images/heart.png'/>");
					}
					else {
						$("#clear").attr("src", "<c:url value='/images/clear.png'/>");			
					}
				}
			});
		});
	});
</script>

</head>
<body>

<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/header.jsp"/>
</div>
	<!-- 게시글 -->
<section>
	<form name="readForm" method="post" role="form">
		<input type="hidden" id="a_bno" name="a_bno" value="${read.a_bno }"/>
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
		<input type="hidden" id="cateType" name="cateType" value="${scri.cateType }"/>
	</form>

	<div>
		작성자 <input type="text" id="id" name="id" value="${read.id}" readonly/>
	</div>

	<div>
		제목 <input type="text" id="a_title" name="a_title" value="${read.a_title }" readonly/>
	</div>

	<div>
		내용 <textarea id="a_content" name="a_content" readonly><c:out value="${read.a_content }"/></textarea>
	</div>


	<div>
		<c:if test="${read.id eq member.id }">
			<button type="button" class="update_btn">수정</button>
			<button type="button" class="delete_btn">삭제</button>
		</c:if>
	</div>
		
	<div>	
		<button type="button" class="list_btn">목록</button>
	</div>
	
	<div>
	<c:choose>
		<c:when test="${Chk eq '0'}"> 
			<img id="clear" src="<c:url value='/images/clear.png'/>" style="width:40px; height:40px;"/> 
	 	</c:when>
		<c:otherwise>  
 			<img id="heart" src="<c:url value='/images/heart.png'/>" style="width:40px; height:40px;"/> 
	 	</c:otherwise>
	</c:choose> 
	</div> 
	
<div>
	<%@include file="replyReadView.jsp" %>
</div>

<div>
	<jsp:include page="../includes/footer.jsp" />
</div>
</section>
</body>
</html>