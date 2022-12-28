<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 게시판 글쓰기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">
.rach input[type='radio'] {
	display: none;
}

.rach input[type='radio']+span {
	display: inline-block;
	padding: 5px 5px;
	border: 1px solid #AEB6BF;
	border-radius: 10px;
	background-color: white;
	text-align: center;
	cursor: pointer;
}

.rach input[type='radio']:checked+span {
	background-color: #AEB6BF;
	color: white;
	border-radius: 10px;
}

input[type='file']{
display: inline;
}




</style>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[name='writeForm']");
		// 글 저장 눌렀을때 실행   
		$(".write_btn").on("click", function() {
			if (fn_valiChk() || radio_ch() || ch_ch()) {
				return false;
			}

			//가격정보에 숫자가 아닌값 있는지 확인하기 
			if (!(isNaN($("#p_cost").value))) {
				alert("가격란에는 숫자만 입력해주세요.");
				return false;
			}

			formObj.attr("action", "/product/write");
			formObj.attr("method", "post");
			formObj.submit();
		});

		//직거래 선택시 주소입력 하도록 하기     style="display: none;
		$("#sell_a").change(function() {

			if ($("#sell_a").is(":checked")) {
				$("#p_local").css("display", "inline");
			} else {
				$("#p_local").css("display", "none");
			}

		});

		$('#summernote').summernote({
			  disableDragAndDrop:true,
			placeholder : '내용을 입력하세요',
			tabsize : 2,
			height : 500,
			width : 900,
			 toolbar: [
				    // [groupName, [list of button]]
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']]
				  ],
				  
		

		});
		
		
		

	})

	//제품의 상태를 체크했는지 확인하는 메소드 
	function radio_ch() {

		if ($("input[type='radio']:checked").val() != null) {
			return false;

		} else {
			alert("상품의 상태를 선택하세요");
			return true;
		}

	}

	// 내용을 입력안했을때 입력하라고 alert를 띄움 
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	// 거래 방법 선택 안했을때  alert
	function ch_ch() {
		const checkPart = document.querySelector('.checkbox-part');
		const checkboxes = checkPart.querySelectorAll('input');

		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked == true) {

				return false;

			}
		}

		alert("판매 유형을 선택하세요");
		return true;

	}

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
</script>


</head>
<body>

	<div  >

		<h2  >카페 글쓰기</h2>
		<br>

		<form name="writeForm" enctype="multipart/form-data" method="post">
			<input type="hidden" name="id" value="${id }">
			<table  style="margin-left: auto; margin-right: auto;" >
				<tr>
					<td>
						<h4>[ 상품 카테고리 ]</h4>
					</td>
					<td><select name="p_type">
							<option value="전자기기">전자기기</option>
							<option value="상품권/쿠폰">상품권/쿠폰</option>
							<option value="남성의류">남성 의류</option>
							<option value="여성의류">여성 의류</option>
							<option value="아동용품">아동 용품</option>
							<option value="가구">가구</option>
							<option value="신발">신발</option>
							<option value="가방">가방</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr>
					<td><h4>판매 가격</h4></td>
					<td><input name="p_cost" type="text" placeholder="가격을 입력해 주세요" style="width: 150px; height: 30px; font-size: 15px;" class="chk" title="가격을 입력하세요"> 원</td>
				</tr>

				<tr>
					<td>
						<h4>상품 상태</h4>
					</td>

					<td>

						<div>

							<div style="display: inline;">

								<label class="rach"><input type="radio" id="con" name="p_con" value="미개봉" /><span>미개봉</span></label>

							</div>

							<div style="display: inline;">
								<label class="rach"><input type="radio" id="con" name="p_con" value="거의 새것" /><span>거의 새것</span></label>
							</div>

							<div style="display: inline;">
								<label class="rach"><input type="radio" id="con" name="p_con" value="사용감 있음" /><span>사용감 있음</span></label>
							</div>



						</div>

					</td>

				</tr>

				<tr>
					<td><h4>거래 방법</h4></td>
					<td><div class="checkbox-part">

							<input type="checkbox" id="sell_a" name="sell_a" value="직거래"> <label for="sell_a">직거래</label> <input type="checkbox" id="sell_b" name="sell_b" value="택배"> <label for="sell_b">택배</label>

						</div></td>

				</tr>

				<tr>
					<td></td>

					<td><input type="text" id="p_local" size="20" name="p_local" style="display: none;" placeholder="거래가능지역을 입력하세요"></td>
				</tr>

				<tr>
					<td><h4>제목</h4></td>
					<td><input name="p_title" id="p_title" class="chk" title="제목을 입력하세요" type="text"></td>

				</tr>
				<tr>
					<td colspan="2"><textarea id="summernote" class="chk" title="내용을 입력하세요" name="p_content" rows="50" cols="80" placeholder="제품의 상세 정보를 기입해주세요. 직거래시 가능한 장소도 알려주세요."></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="form-group" id="file-list">
							<a href="#this" onclick="addFile()"> 파일추가</a>
							<div class="file-group"  >
								<input type="file" name="file"  > <a href='#this' name='file-delete'>삭제</a>
							</div>
						</div>

					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="write_btn">저 장</button>
						<button type="reset" >다시작성</button>

					</td>
				</tr>


			</table>





		</form>
	</div>






</body>
</html>