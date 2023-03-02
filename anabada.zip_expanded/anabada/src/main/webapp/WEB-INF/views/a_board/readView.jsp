<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${read.a_title }</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.container {
	width: 100%;
  	min-width: 1000px;
  	max-width: 1000px;
  	margin: 0 auto 0 auto;
}
.mcont {
 	margin: 0 auto;
  	padding: 15px 20px 50px 20px;
 	box-sizing: border-box;
}
.update_btn, .delete_btn, .list_btn,
.report_btn, .replysave, .replyreset,
.replyupdate, .replydelete, .write_btn {
   display:inline-block;
   padding:4px 4px;
   border:1px solid #AEB6BF;
   border-radius:6px;
   background-color:white;
   text-align:center;
   cursor:pointer;
   font-size:14px;
   width:45px;
   height:30px;
}
</style>
<script src="//cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js""></script>
<script type="text/javascript">

	/* 게시글 수정, 삭제 스크립트 */
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
	
	/* 게시글 신고 스크립트 */
		$(".report_btn").on("click", function() {
			
			var id = "${id}";
			var a_bno = $("#a_bno").val();
			
			if(id == "") {
				alert("로그인 후 신고하실 수 있습니다.");
			}
			else{
				$.ajax({
					url: '/a_board/complaintChk',
					type: 'GET',
					data: {id: id, a_bno: a_bno, board_type: 'a_board'},
					dataType: 'json',
					success: function(result) {
						if(result > 0) {
							alert("이미 신고하셨습니다.");
						}
						else {
							window.open("/a_board/report?a_bno=${read.a_bno}", "신고", "width=400, height=600, left=0, top=0");
						}
					}
				});
			}
		});	
	/* 신고 스크립트 끝 */
	});
	
	
	/* 좋아요 스크립트 */
	$(document).ready(function() {
		
		var likeVal = ${Chk};
		
		if(likeVal > 0) {
			$("#heart").one("click", function() {
				
				var id = "${id}"
				
				if(id == "") {
					alert("로그인 후 이용 가능합니다.");
					return false;
				}
				else if(id == "admin") {
					alert("관리자 모드입니다.");
					return false;
				}
				else {
					$.ajax ({
					url: '/a_board/deleteLike',
					type: 'POST',
					dataType: 'text',				
					data: ({'id': '${sessionScope.id}', 'a_bno': '${read.a_bno}' }),
					success: function(data) {
						$("#heart").attr("src", "<c:url value='/images/clear.png'/>");
						location.reload();
					}
				});
			}
		});
		} else {
			$("#clear").one("click", function() {
				
				var id = "${id}"
					
					if(id == "") {
						alert("로그인 후 이용 가능합니다.");
					}
					else if(id == "admin") {
						alert("관리자 모드입니다.");
					}
				
					else { 
						$.ajax ({
						url: '/a_board/insertLike',
						type: 'POST',
						dataType: 'text',				
						data: ({'id': '${sessionScope.id}', 'a_bno': '${read.a_bno}' }),
						success: function(data) {
							$("#clear").attr("src", "<c:url value='/images/heart.png'/>");
							location.reload();
						}
					});
				}						
			});
		}
	});
	/* 좋아요 스크립트 끝 */
	
	
	/* 댓글 작성, 수정, 삭제 스크립트 */
	$(function() {
		var replybtn = $("form[name='replyForm']");
	$(".write_btn").on("click", function() {
		
		var id = "${id}"

		if(id == "admin") {
			alert("관리자 모드입니다.");
			return false;
		}
		
		if($("#r_content").val() == "") {
			alert("댓글 내용을 입력해주세요.");
			$("#r_content").focus();
			return false;
		}
		
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
	
	/* 댓글 관련 스크립트 끝 */
</script>
</head>
<body>
<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/miniHeader.jsp"/>
</div>
	<!-- 게시글 -->
	<section class="container">
	
	<!-- 지역 카테고리 -->
   	  <div class="sidemenu2">
		<p class="side-t">아나바다</p>   	  	
   	  		<ul class="side-ul">
				<li class="side-li all"><a href="/a_board/list">전체글 보기</a></li>
				<li class="side-line"/>
			</ul>
			
		<p class="side-t">지역별</p>
			<ul class="side-ul">
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=1">강원</a></li> 	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=2">경기</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=3">경남</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=4">경북</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=5">부산</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=6">서울</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=7">인천</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=8">전남</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=9">전북</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=10">제주</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=11">충남</a></li>   	  		
				<li class="side-li loca"><a href="/a_board/loca_list?locaType=12">충북</a></li>  
   	  		</ul>
   	  </div>
      <!-- 지역 카테고리 끝 -->
      
     <form name="readForm" method="post" role="form">
		<input type="hidden" id="a_bno" name="a_bno" value="${read.a_bno }"/>
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
		<input type="hidden" id="cateType" name="cateType" value="${scri.cateType }"/>
	</form>
	
	<div class="aboardcon">
		<div style="font-size:18px; font-weight:bold; padding-bottom:20px;">
			<label for="a_type" class="form-label"></label>
			<c:if test="${read.a_type == 1 }">
				<c:out value="동네생활"/>
			</c:if>
			<c:if test="${read.a_type == 2 }">
				<c:out value="동네맛집"/>
			</c:if>
			<c:if test="${read.a_type == 3 }">
				<c:out value="같이해요"/>
			</c:if>
		</div>
		
		<div style="font-size:20px; padding-bottom:20px;">
			<label for="a_title" class="form-label"></label>
			<c:out value="${read.a_title }"/> 
		</div>
		
			
		<div style="font-size:15px; font-weight:bold;">
			<label for="nick" class="form-label"></label>
			<c:out value="${read.nick }"/>
		</div>
		
		
		<div style="font-size:13px; border-bottom:1px solid #E0E0E0; padding-bottom:15px; color:#505050;">
			<label></label>
			<fmt:formatDate value="${read.a_regdate }" pattern="yyyy-MM-dd HH:mm"/>
		</div>
		
		
		<div>
			<label for="a_content" class="form-label"></label>
			<div id="a_content" style="font-size:15px;">${str}</div>
		</div>
	<!-- 게시글 끝 -->
	
		<!-- 좋아요 -->
	<div class="like">
	 <div class="row g-3" style="border-bottom:1px solid #E0E0E0; margin-top:10%; padding-bottom:10px;">
	 	<div class="col-sm-6">
		<c:choose>
			<c:when test="${read.a_like_cnt == 0}"> 
				<img id="clear" src="<c:url value='/images/clear.png'/>" style="width:50px; height:50px;"/>
	 		</c:when>
			<c:otherwise>  
 				<img id="heart" src="<c:url value='/images/heart.png'/>" style="width:50px; height:50px;"/> 
	 		</c:otherwise>
		</c:choose> 
		
		<!-- 좋아요 개수 표시 -->
		<span><c:out value="${read.a_like_cnt}"/></span>
		</div>
		
		<!-- 게시글 수정, 삭제, 목록, 신고 -->
		<div class="col-sm-6" style="text-align:right; margin-top:25px;">
			<c:if test="${read.id eq id }">
				<button type="button" class="update_btn">수정</button> &nbsp;
				<button type="button" class="delete_btn">삭제</button> &nbsp;
			</c:if>
			<button type="button" class="list_btn">목록</button> &nbsp;
			<button type="button" class="report_btn" style="color:red;">신고</button>
		</div>
	</div>
</div>


	<!-- 댓글 -->
	<div id="reply">
			<c:forEach items="${replyList }" var="replyList">
			<ol class="replyList" style="list-style:none; padding:10px; border-bottom:1px solid #E0E0E0;">
				<li>
				 	<div>
				 		<div class="col-sm-2">
				 			<input type="text" class="id form-control-plaintext" value="${replyList.nick }" style="font-weight:bold; font-size:15px;" readonly/>
				 		</div>

				 		<div class="col-sm-20">
					 		<input type="text" class="r_content form-control-plaintext" value="${replyList.r_content }" style="font-size:15px;"readonly/>
				 		</div>
				 		
				 		<div class="col-sm-4">
					 		<input type="date" class="form-control-plaintext" value="<fmt:formatDate value='${replyList.r_regdate }' pattern='yyyy-MM-dd'/>" 
					 		style="font-size:13px; color:#505050" readonly/>
				 		</div>
				 		
				 		<div class="col-sm-16" style="text-align:right;">
				 			<input type="text" class="r_content2 form-control form-control-sm" name="r_content2" value="${replyList.r_content }" style="display:none; margin-bottom:10px;"/>
				 			<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replysave" style="display:none">저장</button>&nbsp;
				 			<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replyreset"style="display:none">취소</button>
				 		<c:if test="${replyList.id eq id }">
				 			<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replyupdate">수정</button>&nbsp;
				 			<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replydelete">삭제</button>
				 		</c:if>
				 		</div>
				 	</div>
				 </li>
			</ol>
		</c:forEach>
	</div>
	
	<form name="replyForm" method="post" role="form">
		<input type="hidden" id="a_bno" name="a_bno" value="${read.a_bno }"/>
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
		<input type="hidden" id="cateType" name="cateType" value="${scri.cateType }"/>
		
	<c:if test="${id != null }">
		<div class="row g-4" style="padding-top:15px;">
			<div class="col-sm-2">
					<input type="hidden" id="id" name="id" value="${id }"/>
					<input type="text" id="nick" name="nick" value="${member.nick }" class="form-control-plaintext form-control-sm" style="text-align:center;" readonly/>
			</div>
		
			<div class="col-sm-8">
				<input type="text" id="r_content" name="r_content" class="form-control form-control-sm"/>
			</div>
			
			<div class="col-sm-2">
				<button type="button" class="write_btn">작성</button>
			</div>
		</div>
	</c:if>	
	
	<br>
	
	<c:if test="${id == null }">
		<span style="margin-left:35%;">로그인 후 댓글을 작성하실 수 있습니다.</span>
	</c:if>
	
</form>
<!-- 댓글 끝 -->
	
</div>
</section>
<div>
	<jsp:include page="../includes/footer.jsp" />
</div>
</body>
</html>