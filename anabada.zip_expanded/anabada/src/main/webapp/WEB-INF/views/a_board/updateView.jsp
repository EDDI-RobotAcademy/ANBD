<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.chk input[type='radio'] {
	display:none;
}
.chk input[type='radio']+span {
	display:inline-block;
	padding:5px 5px;
	border:1px solid #AEB6BF;
	border-radius:10px;
	background-color:white;
	text-align:center;
	cursor:pointer;
}
.chk input[type='radio']:checked+span {
	background-color:#8E9091;
	color:white;
	border-radius:10px;
}
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
.subtn, .rebtn {
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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

	//글 수정 유효성 검사
	function formChk() {
				
		if($("input:radio[name='a_type']:checked").length < 1) {
			alert("말머리를 선택해주세요.");
			return false;
		}
		if($("#title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if(CKEDITOR.instances['content'].getData() == "") {
			alert("내용을 입력해주세요.");
			CKEDITOR.instances['content'].focus();
			return false;
		}
	}
	
</script>
</head>
<body>

<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/miniHeader.jsp"/>
</div>

<!-- 게시글 수정 -->
<section class="container">
<form name="updateForm" method="post" action="/a_board/update" class="mcont" onsubmit="return formChk()">
	<input type="hidden" name="a_bno" value="${update.a_bno }" readonly="readonly"/>
	<input type="hidden" name="page" value="${scri.page }"/>
	<input type="hidden" name="perPageNume" value="${scri.perPageNum }"/>
	<input type="hidden" name="searchType" value="${scri.searchType }"/>
	<input type="hidden" name="keyword" value="${scri.keyword }"/>
	<input type="hidden" name="cateType" value="${scri.cateType }"/>
	
	<table>
		<tr>
			<td>
				<label class="chk"><input type="radio" id="life" name="a_type" value="1"/><span>동네 생활</span></label>
				<label class="chk"><input type="radio" id="food" name="a_type" value="2"/><span>동네 맛집</span></label>
				<label class="chk"><input type="radio" id="with" name="a_type" value="3"/><span>같이 해요</span></label>
			</td>
		</tr>
		
		<tr>
			<td>
				<br>
				<select id="loca" name="loca" class="form-select form-select-sm">
					<option value="1">강원</option>
					<option value="2">경기</option>
					<option value="3">경남</option>
					<option value="4">경북</option>
					<option value="5">부산</option>
					<option value="6">서울</option>
					<option value="7">인천</option>
					<option value="8">전남</option>
					<option value="9">전북</option>
					<option value="10">제주</option>
					<option value="11">충남</option>
					<option value="12">충북</option>
				</select>
				<br>
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="a_title" class="form-label">제목</label>
				<input type="text" id="title" name="a_title" class="chk form-control" value="${update.a_title }" placeholder="제목을 입력해주세요."/>
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="a_content" class="form-label">내용</label>
				<textarea id="content" name="a_content" placeholder="내용을 입력해주세요."><c:out value="${update.a_content }"/></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('a_content', {filebrowserUploadUrl: '/a_board/fileUpload', width:930, height:300});
			</script>
			</td>
			
		</tr>
		
		<tr>
			<td>
				<label for="nick" class="form-label">작성자</label>
				<input type="text" id="nick" name="nick" class="form-control" value="${update.nick }" readonly/>
			</td>
		</tr>
	</table>
	<!-- 게시글 수정 끝 -->
	
	
	<!-- 저장 및 취소 버튼 -->
	<div style="text-align:right;">
		<br>
		<button type="submit" class="subtn">저장</button>&nbsp;
		<!-- .cancel_btn이 안먹어서 history.go(-2)로 변경, 게시글 목록으로 넘어가게 함 -->
		<button type="reset" onclick="javascript:history.go(-2)" class="rebtn">취소</button>
	</div>
</form>
</section>

<div>
	<jsp:include page="../includes/footer.jsp" />
</div>
</body>
</html>