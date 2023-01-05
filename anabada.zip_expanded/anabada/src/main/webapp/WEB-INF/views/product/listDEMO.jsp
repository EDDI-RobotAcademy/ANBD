<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<meta charset="UTF-8">
<title>중고 게시판 목록</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
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
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script>
	$(function() {

		// 검색어 입력하고 검색 눌렀을떄 
		$('.searchBtn').on(
				"click",
				function() {

					var chbtn = $("input[type='radio']:checked").val();

					alert("$('input[id=con]:checked').val()");
					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ '&searchType='
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val())
							+ "&productType=" + encodeURIComponent(chbtn);
				});

		// 카테고리 버튼 클릭 이벤트 
		$("input[type='radio']").click(
				function() {

					var chbtn = $("input[type='radio']:checked").val();

					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ '&searchType='
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val())
							+ "&productType=" + encodeURIComponent(chbtn);

				})

		//내글쓰기 버튼 눌렀을때 
		$('#writebtn').on("click", function() {

			var id = "${member.id}";
			if (id = null) {
				alert('회원 전용 서비스입니다. 로그인 후 이용하세요 ');
				return null;
			}

			location.href = "/product/writeView";
		})

	});
</script>

</head>
<body>
	<div>
		<h1>게시판</h1>
		<div>${userId}</div>



		<form role="form" method="get">

			<div>

				<table>
					<tr>
						<td width="30%"><select name="searchType"  style="text-align: center; "  >

								<option   value="t" <c:out value="${scri.searchType eq 't' ? 'selected' :''} "/>>제 목</option>
								<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' :''} "/>>내 용</option>
								<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' :''} "/>>작성자</option>
						</select></td>
						<td><input type="text" name="keyWord" id="keywordInput" value="${scri.keyword }">
							<button class="searchBtn" type="button">검색</button> &nbsp; &nbsp;
							<button id="writebtn" type="button">내글쓰기</button></td>
					</tr>

				</table>



			</div>
			<br>

			<div>


				<div style="display: inline;">

					<label class="rach"> <input type="radio" id="con" name="p_type" value="" <c:out value="${ empty scri.productType ? 'checked' :''} "/> /><span>전체</span></label>

				</div>


				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="전자기기" <c:out value="${scri.productType eq '전자기기' ? 'checked' :''} "/> /><span>전자기기</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="상품권/쿠폰" <c:out value="${scri.productType eq '상품권/쿠폰' ? 'checked' :''} "/> /><span>상품권/쿠폰</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="남성의류" <c:out value="${scri.productType eq '남성의류' ? 'checked' :''} "/> /><span>남성 의류</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="여성의류" <c:out value="${scri.productType eq '여성의류' ? 'checked' :''} "/> /><span>여성 의류</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="아동용품" <c:out value="${scri.searchType eq '아동용품' ? 'checked' :''} "/> /><span>아동 용품</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="가구" <c:out value="${scri.searchType eq '가구' ? 'checked' :''} "/> /><span>가구</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="신발" <c:out value="${scri.searchType eq '신발' ? 'checked' :''} "/> /><span>신발</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="가방" <c:out value="${scri.searchType eq '가방' ? 'checked' :''} "/> /><span>가방</span></label>

				</div>

				<div style="display: inline;">

					<label class="rach"><input type="radio" id="con" name="p_type" value="기타" <c:out value="${scri.searchType eq '기타' ? 'checked' :''} "/> /><span>기타</span></label>

				</div>


			</div>
			<table>
				<thead>
					<tr>
						<th>no</th>
						<th>제목</th>
						<th>카테고리</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>❤</th>
					</tr>
				</thead>

				<!-- 반복 -->
				<c:set var="i" value="10" />
				<c:forEach items="${list }" var="list">

					<tr align="center" onmouseover="this.style.backgroundColor = '#D0FBFF' " onmouseout="this.style.backgroundColor = ''">
						<td><c:out value="${i }" /></td>
						<td><a style="text-decoration: none; color: black;" href="/product/readView?pno=${list.pno}&p_type=${list.p_type}&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyoword=${scri.keyword }&productType=${scri.productType}  "> <c:out value="${list.p_title }" />
						</a></td>
						<td><c:out value="${list.p_type }"></c:out></td>
						<td><c:out value="${list.id }"></c:out></td>
						<td><fmt:formatDate value="${list.p_regdate }" pattern="yyyy.MM.dd" /></td>
						<td><c:out value="${list.p_count }"></c:out></td>
						<td><c:out value="${list.p_heart }"></c:out></td>

					</tr>
					<c:set var="i" value="${i-1 }" />

				</c:forEach>


			</table>
			
			<br><br><br><br>
			
			<!-- 페이징 처리 구현 -->
			<nav   >
  <ul class="pagination">
    <li class="page-item">
    <c:if test="${pageMaker.prev }">
      <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1 )}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/> ><a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx }</a></li>
    </c:forEach>
    
    
    <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
    <li class="page-item">
      <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
			
			


		</form>





	</div>

</body>
</html>