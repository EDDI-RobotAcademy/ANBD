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
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");
		
		$("a[name='file-delete']").on("click", function(e) {
			e.preventDefault();
			deleteFile($(this));
		});
		
		$(".write_btn").on("click", function() {
			alert("배너가 등록되었습니다.");
			formObj.attr("action", "/a_banner/update");
			formObj.attr("method", "post");
			formObj.submit();
		});
	
		var dlist=[];
		
		$(".imgbtn").on("click" , function() {
			var inum = $(this).val(); //버튼에 담은 이미지의 a_no 
		    
			if(confirm("사진을 삭제하시겠습니까?")){
			
				var va = $("#dlist").val();
				$("#dlist").attr('value', va + inum + ','); 
				$(this).parent().remove();
				
			} else {
				return false;
			}
		});
	});
	
	//파일 추가를 위한 메소드 
	function addFile() {
		var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete' style='font-size: 14px; font-weight: 500;'>삭제</a></div>";
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
	
</script>
</head>

<body>
	<!-- 네비바 -->
	<div>
		<%@ include file="../includes/nav.jsp" %>
	</div>

	<!-- 헤더 -->
	<div>
		<%@ include file="../includes/miniHeader.jsp" %>
	</div>
	
	<c:if test="${member.id eq null }">
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="/member/login"
		</script>
	</c:if>
	
	<div>
		<section class="container">
			<!-- 메뉴 -->
			<jsp:include page="/WEB-INF/views/includes/myPageHeader.jsp" />
		
			<div class="minicon">
				<div class="mtitle">
					배너 관리
				</div>
	
				<form name="updateForm" enctype="multipart/form-data" method="POST">
				<input name="a_no" type="hidden" value="${update.a_no}">
				<input id="dlist" name="dlist" type="hidden" value="">
					<div style="margin-top: 20px; text-align: center;">
						<div class="form-group" id="file-list">
							<p style="margin-bottom: 15px; font-size: 18px; font-weight: 450;">📌 등록된 배너</p>
							<c:forEach items="${filelist}" var="filelist" >
								<div style="display: inline-block;" id="${filelist.a_no}"> 
									<img width="700px;" height="182px;" src="${filelist.a_file}">
									<br>
									
									<button type="button" class="imgbtn deleteChk" value="${filelist.a_no}" style="margin-bottom: 15px;">삭제</button>
									<br>
								</div>
							</c:forEach>
			                
			                <p style="margin-top: 40px; margin-bottom: 15px; font-size: 18px; font-weight: 450;">💾 새로운 배너 등록</p>
							<div style="margin-bottom: 5px;">
			            		<a href="#this" onclick="addFile()" style="font-size: 14px; font-weight: 500;">+ 파일 추가</a>
			         		</div>
			         		
							<div class="file-group">
								<input type="file" name="file"><a href='#this' name='file-delete' style="font-size: 14px; font-weight: 500;">삭제</a>
							</div>
						</div>
					</div>
			         
					<div>
						<button type="submit" class="write_btn modi_btn">저장</button>
					</div>
				</form>
			</div>
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>