<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${update.p_title}</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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

img{
width: 150px; height: 150px;
}

</style>



<script type="text/javascript" src="../resources/js/pUpdateView.js"></script>
  
</head>
<body>


	<div>

		<h2>게시글 수정하기</h2>
		<a href="/product/list" >목록으로</a>

		<form name="updateForm" enctype="multipart/form-data" method="POST" >
		<input  name="pno" type="hidden"  value="${update.pno }"  >
<input id="dlist" name="dlist" type="hidden"  value="" > 
			<table>
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
					<td colspan="2"><textarea class="chk" title="내용을 입력하세요" id="p_content" name="p_content" rows="30" cols="80" placeholder="제품의 상세 정보를 기입해주세요. 직거래시 가능한 장소도 알려주세요.">${update.p_content}</textarea></td>
				</tr>
				</table>
				<!-- 저장된 사진정보 불러오기  -->
				<table>
				<tr>
					<td>
                         <c:forEach items="${filelist }" var="filelist" >
                        
						<div style="display: inline-block;"  id="${filelist.fno }" > <img src="${filelist.filepath }"  >  <button  type="button"  class="imgbtn"  value="${filelist.fno }"  >삭제</button> </div> 
                        </c:forEach>
					</td>


				</tr>


				<tr>
					<td colspan="2">
						<div class="form-group" id="file-list">
							<a href="#this" onclick="addFile()"> 파일추가</a>
							<div class="file-group">
								<input type="file" name="file" > <a href='#this' name='file-delete'>삭제</a>
							</div>
						</div>

					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="write_btn">저 장</button>
						<button type="reset" class="write_btn">다시작성</button>

					</td>
				</tr>


			</table>





		</form>
	</div>








</body>
</html>