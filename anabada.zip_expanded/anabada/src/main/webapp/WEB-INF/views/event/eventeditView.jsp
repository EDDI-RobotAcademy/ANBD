<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>




<meta charset="utf-8">

<title>게시글 수정하기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- 데이피커 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!--   <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- 여기까지 -->

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<style type="text/css">
td {
	padding: 10px;
}

.tline {
	border: 2px solid #E1E1E1;
}

.tline td {
	text-align: center;
	border: 2px solid #E1E1E1;
}

font {
	font-weight: bold;
}

input[type='file'] {
	display: inline;
}
.banner{

 padding-top: 30px; padding-bottom: 10px;
text-align: center;
margin-bottom: 50px;

}

</style>

</head>





<script>
	$(document).ready(
			function() {

				//summernote
				$('#summernote').summernote(
						{
							disableDragAndDrop : true,
							placeholder : '내용을 입력하세요',
							tabsize : 2,
							height : 500,
							width : 900,
							toolbar : [
									// [groupName, [list of button]]
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'clear' ] ],
									[
											'font',
											[ 'strikethrough', 'superscript',
													'subscript' ] ],
									[ 'fontsize', [ 'fontsize' ] ],
									[ 'color', [ 'color' ] ],
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									[ 'height', [ 'height' ] ] ],

						});

				var formObj = $("form[name='editForm']");

				//저장을 눌렀을때 
				$(".write_btn").on("click", function() {

					if (valChk() || day()) {
						return false;
					}

					formObj.attr("action", "/event/update");
					formObj.attr("method", "post");
					formObj.submit();

				})

				// 날짜체크 
				$("#e_start").datepicker({

					dateFormat : 'yy-mm-dd',
					minDate : 0,
					onClose : function() {
						$("#e_end").datepicker({
							dateFormat : 'yy-mm-dd',
							minDate : 0

						});
					}

				});
				$("#e_win").datepicker({
					dateFormat : 'yy-mm-dd',
					minDate : 0
				});
				
				//이미지 삭제 
				$(".imgbtn").on("click" , function() {
					var inum = $(this).val(); //버튼에 담은 이미지의 fno 
				    
					if(confirm("사진을 삭제하시겠습니까?")){
					
						var va =   $("#dlist").val();
						$("#dlist").attr('value', va+ inum+ ',');
						$(this).parent().remove();
						
						
						
					
					}else{
						return false;
					}
					
					
				} );
				
				
				

			}) //ready 끝 

	//내용을 입력하지 않았을때 alert 띄우기 
	function valChk() {
		var regForm = $("form[name='editForm'] .chk").length;

		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
		if ($("#summernote").summernote('isEmpty')) {
			alert("내용을 입력하세요");
			return true;
		}
	}

	//파일추가 
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

	// 날짜 테스트 
	function day() {
		var e_start = $("#e_start").val().replace(/-/gi, '');
		var e_end = $("#e_end").val().replace(/-/gi, '');
		var e_win = $("#e_win").val().replace(/-/gi, '');
		var ch1 = e_end - e_start;
		var ch2 = e_win - e_end;
		if (ch1 < 0) {
			alert("이벤트 시작일 보다 마감일이 빠릅니다. 다시 선택해 주세요.");
			$("#e_end").val('');
			return true;
		}

		if (ch2 < 0) {
			alert("이벤트 마감일보다 당첨자 발표일이 빠릅니다. 다시 선택해 주세요.");
			$("#e_win").val('');
			return true;
		}

	}
</script>

<body>

	<div>
		<jsp:include page="../includes/nav.jsp" />
	</div>

	
	

		<div >
		<jsp:include page="../includes/eventHeader.jsp" />
		<jsp:include page="../includes/eventNav.jsp" />
	</div> 
	


<div style="width: 1000px;   margin: auto; margin-top: 30px; " >
	<form name="editForm" enctype="multipart/form-data" method="post"   >
		<input name="eno" type="hidden" value="${update.eno }"> <input id="dlist" name="dlist" type="hidden" value="">
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<th colspan="5" style="font-size: 20px;" >이벤트 게시판</th>
			</tr>
			<tr>
				<td colspan="5" style="text-align: right;">

					<button type="submit" class="write_btn">저 장</button>
					<button type="reset">다시작성</button>
				</td>
			</tr>
			<tr class="tline">
				<td style="background-color: #E1E1E1;"><font> 제목 </font></td>
				<td colspan="4"><input name="e_title" id="" class="chk" type="text" style="width: 100%; border: 0; outline: none;" value="${update.e_title}" title="제목을 입력해주세요"></td>
			</tr>

			<tr class="tline">
				<td colspan="1" style="background-color: #E1E1E1;"><font>이벤트 기간</font></td>
				<td colspan="2"><input name="e_start" id="e_start" class="chk" value="${update.e_start }" title="이벤트 기간을 입력하세요" placeholder="이벤트 시작일📅" size="11" type="text"> &nbsp;<font> ~ </font>&nbsp; <input class="chk" value="${update.e_end }" title="이벤트 기간을 입력하세요" placeholder="이벤트 마감일📅" size="11" id="e_end" name="e_end" type="text"></td>
				<td style="background-color: #E1E1E1;"><font> 당첨자 발표 </font></td>
				<td><input name="e_win" id="e_win" value="${update.e_win }" placeholder="당첨자 발표일📅" size="11" type="text" class="chk" title="당첨자 발표일을 입력하세요"></td>
			</tr>
			<tr>
			<tr>
				<td colspan="6" style="border-spacing: 0px; padding: 0px;"><textarea id="summernote" name="e_content" class="chtext" style="width: 100%; height: 100%; border: 0px;">${update.e_content}</textarea></td>

			</tr>




		</table>

		<table  style="margin-left: 40px;" >
			<tr>
				<td><c:forEach items="${filelist }" var="filelist">

						<div style="display: inline-block;" id="${filelist.efno }">
							<img src="${filelist.filepath }"  width="150px;" height="150px;" >
							<button type="button" class="imgbtn" value="${filelist.efno }">삭제</button>
						</div>
					</c:forEach></td>


			</tr>


			<tr>
				<td colspan="2">
					<div class="form-group" id="file-list">
						<a href="#this" onclick="addFile()"> 파일추가</a>
						<div class="file-group">
							<input type="file" name="file"> <a href='#this' name='file-delete'>삭제</a>
						</div>
					</div>

				</td>
				<td></td>
			</tr>



		</table>





	</form>
	</div>











</body>
</body>
</html>