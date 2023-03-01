<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${update.p_title}</title>
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
.img_div {
	display: inline-block;
	padding: 10px 10px 10px 10px;
	border-color: yellow;
}
/* img{
width: 150px; height: 150px;
} */
#wapper {
	width: 800px;
	margin: auto;
	height: auto;
	
}
</style>

<script type="text/javascript">
$(document).ready(function(){
      
      
     $('#summernote').summernote({
     
		  disableDragAndDrop:true,
		placeholder : '내용을 입력하세요',
		tabsize : 2,
		height : 500,
		width : 800,
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
      
      
      
	var dlist=[];
	
	var formObj = $("form[name='updateForm']");
	$(".write_btn").on("click", function() {
		if (fn_valiChk() || radio_ch() || ch_ch()) {
			return false;
		}
		
	
		if(!(isNaN( $("#p_cost").value ))){
			alert("가격란에는 숫자만 입력해주세요.");
			return false;
		}
		
		
        
		formObj.attr("action", "/product/update");
		formObj.attr("method", "post");
		formObj.submit();
	});
	
	
	$("#sell_a").change( function() {
		
		if($("#sell_a").is(":checked")){
			$("#p_local").css("display","inline");
		}else{
			$("#p_local").css("display","none");
		}
		
		
	
	});
	
	
	
	
	
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
	
	
	
})
function radio_ch() {
	if ($("input[type='radio']:checked").val() != null) {
		return false;
	} else {
		alert("상품의 상태를 선택하세요");
		return true;
	}
}
function fn_valiChk() {
	var regForm = $("form[name='writeForm'] .chk").length;
	for (var i = 0; i < regForm; i++) {
		if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
function ch_ch() {
	const checkPart = document.querySelector('.checkbox-part');
	const checkboxes = checkPart.querySelectorAll('input');
	for (var i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i].checked == true) {
			return false;
		}
	}
	alert("거래 방법을 선택하세요");
	return true;
}
function addFile() {
	var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
	$("#file-list").append(str);
	$("a[name='file-delete']").on("click", function(e) {
		e.preventDefault();
		deleteFile($(this));
	});
}
function deleteFile(obj) {
	obj.parent().remove();
}
</script>



<!-- <script type="text/javascript" src="../resources/js/pUpdateView.js"></script> -->
  
</head>
<body>


<!-- head -->
	<div>
		<jsp:include page="../includes/nav.jsp" />
	</div>
	<div >
		<jsp:include page="../includes/header.jsp" />
	</div>
	
<!-- head end -->

	<div  id="wapper" >

		<h2>게시글 수정하기</h2>
		<br>
		<a  style="float: right;"  href="/product/list" >[목록으로]</a>

		<form name="updateForm" enctype="multipart/form-data" method="POST" >
		<input  name="pno" type="hidden"  value="${update.pno }"  >
<input id="dlist" name="dlist" type="hidden"  value="" > 
			<table    >
				<tr>
					<td>
						<h4>[ 상품 카테고리 ]</h4>
					</td>
					<td><select name="p_type">
							<option value="전자기기" <c:out value="${scri.productType eq '전자기기'  ? 'selected' : ''}" />>전자기기</option>
							<option value="상품권/쿠폰" <c:out value="${scri.productType eq '상품권/쿠폰'  ? 'selected' : ''}" />>상품권/쿠폰</option>
							<option value="남성의류" <c:out value="${scri.productType eq '남성의류' ?  'selected' : ''}" />>남성 의류</option>
							<option value="여성의류" <c:out value="${scri.productType eq '여성의류' ?  'selected' : ''}" />>여성 의류</option>
							<option value="아동용품" <c:out value="${scri.productType eq '아동용품' ?  'selected' : ''}" />>아동 용품</option>
							<option value="가구" <c:out value="${scri.productType eq '가구' ?  'selected' : ''}" />>가구</option>
							<option value="신발" <c:out value="${scri.productType eq '신발' ?  'selected' : ''}" />>신발</option>
							<option value="가방" <c:out value="${scri.productType eq '가방' ?  'selected' : ''}" />>가방</option>
							<option value="기타" <c:out value="${scri.productType eq '기타' ?  'selected' : ''}" />>기타</option>
					</select></td>
				</tr>
				<tr>
					<td><h4>판매 가격</h4></td>
					<td><input name="p_cost" type="text" value="${update.p_cost}" placeholder="가격을 입력해 주세요" style="width: 150px; height: 30px; font-size: 15px;" class="chk" title="가격을 입력하세요"> 원</td>
				</tr>

				<tr>
					<td>
						<h4>상품 상태</h4>
					</td>

					<td>

						<div>

							<div style="display: inline;">

								<label class="rach"><input type="radio" id="con" name="p_con" value="미개봉" <c:out value="${update.p_con eq '미개봉' ?  'checked' : ''}" /> /><span>미개봉</span></label>

							</div>

							<div style="display: inline;">
								<label class="rach"><input type="radio" id="con" name="p_con" value="거의 새것" <c:out value="${update.p_con eq '거의 새것' ?  'checked' : ''}" /> /><span>거의 새것</span></label>
							</div>

							<div style="display: inline;">
								<label class="rach"><input type="radio" id="con" name="p_con" value="사용감 있음" <c:out value="${update.p_con eq '사용감 있음' ?  'checked' : ''}" /> /><span>사용감 있음</span></label>
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

					<td><input type="text" id="p_local" size="20" name="p_local" style="display: none;" placeholder="거래가능지역을 입력하세요" value="${update.p_local }"></td>
				</tr>

				<tr>
					<td><h4>제목</h4></td>
					<td><input name="p_title" id="p_title" value="${update.p_title }" class="chk" title="제목을 입력하세요" type="text"></td>

				</tr>
				<tr>
					<td colspan="2"><textarea id="summernote" class="chk" title="내용을 입력하세요" name="p_content" rows="25" cols="80" placeholder="제품의 상세 정보를 기입해주세요. 직거래시 가능한 장소도 알려주세요.">${update.p_content}</textarea></td>
				</tr>
				</table>
				<!-- 저장된 사진정보 불러오기  -->
				<table>
				<tr>
					<td>
                         <c:forEach items="${filelist }" var="filelist" >
                        
						<div style="display: inline-block;"  id="${filelist.fno }" > <img  width="150px;" height="150px;"  src="${filelist.filepath }"  >  <br>
						 <button  type="button"   style="margin-left: 48px;" class=" btn btn-light imgbtn"  value="${filelist.fno }"  >삭제</button> </div> 
                        </c:forEach>
					</td>


				</tr>


				<tr>
					<td colspan="2">
					
						<div class="form-group" id="file-list">
				 <br>
							<a href="#this" onclick="addFile()">[ 파일추가 ]</a>
							<div class="file-group">
							
								<input  style="display: inline-block;"  type="file" name="file" ><a href='#this' name='file-delete'>[ 삭제 ]</a>
							</div>
						</div>

					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class=" btn btn-light write_btn">저 장</button>
						<button type="reset" class=" btn btn-light write_btn">다시작성</button>

					</td>
				</tr>


			</table>





		</form>
	</div>

<!-- footer -->
<div id="footer">
			<jsp:include page="../includes/footer.jsp" />
		</div>
<!-- footer end -->






</body>
</html>