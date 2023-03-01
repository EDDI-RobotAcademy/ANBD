<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다 커뮤니티</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.chk input[type='radio'] {
   display:none;
}
.chk input[type='radio']+span {
   display:inline-block;
   padding:5px 5px;
   border:1px solid #AEB6BF;
   border-radius:6px;
   background-color:white;
   text-align:center;
   cursor:pointer;
   font-size:15px;
}
.chk input[type='radio']:checked+span {
   background-color:#0C6BBC;
   color:white;
   border-radius:6px;
   font-size:15px;
}
#searchBtn {
   display:inline-block;
   padding:5px 5px;
   border:1px solid #AEB6BF;
   border-radius:6px;
   background-color:white;
   text-align:center;
   cursor:pointer;
   font-size:14px;
   width:20px;
   height:32px;
}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	
	/* 검색 버튼, 라디오 버튼, 카테고리 버튼 스크립트 */
	$(function () {
   		$('#searchBtn').click(function () {
      		var chbtn = $("input[type='radio']:checked").val();
      		
      		if(chbtn == null) {
      			self.location = "loca_list" + '${pageMaker.makeQuery(1)}' + '&locaType=' + ${scri.locaType} + '&searchType=' + $("select option:selected").val() + 
               "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&cateType=";
      		}
      		else {
      			self.location = "loca_list" + '${pageMaker.makeQuery(1)}' + '&locaType=' + ${scri.locaType} + '&searchType=' + $("select option:selected").val() + 
                "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&cateType=" + encodeURIComponent(chbtn);
      		}
      	});

   		$("input[type='radio']").click(function() {
   			var rabtn = $("input[type='radio']:checked").val();
      			self.location = "loca_list" + '${pageMaker.makeQuery(1)}' + '&locaType=' + ${scri.locaType} + '&searchType=' + $("check option:checked").val()
         		+ "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&cateType=" + encodeURIComponent(rabtn);   
   		});
   		
   		//게시글 삭제 유효성 검사
		$(".delChk").on("click", function() {
			
			var a_bno = $("#a_bno").val();
			
			$.ajax({
				url: '/a_board/deleteChk',
				type: 'GET',
				data: {a_bno: a_bno },
				success: function(result) {
					if(result == 0) {
						alert("이미 삭제된 게시물 입니다");
						self.location = "/a_board/list";
					}
				}
			});
		});
	});
	
	/* 버튼 스크립트 끝 */
	
	
	/* 글 작성 로그인 유효성 검사 */
	function write_login() {
		var id = "${id}";
			
		if(id == "") {
			alert("로그인 후 작성하실 수 있습니다.");
		}
		else if(id == "admin") {
			alert("관리자 모드입니다.");
		}
		else {
			location.href = "/a_board/writeView";
		}
	}
	/* 글 작성 로그인 유효성 검사 끝 */
	
	
	
</script>
</head>
<body>

<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/miniHeader.jsp"/>
</div> 


<section class="container" style="font-size:15px;">
<form>
   <!-- 지역 카테고리 -->
   	  <div class="sidemenu2">
		<p class="side-t">아나바다</p>   	  	
   	  		<ul class="side-ul">
				<li class="side-li"><a href="/a_board/list">전체글 보기</a></li>
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
      
     
      
      <!-- 말머리 카테고리 -->
     <div class="aboardcon">
     
     <h3>아나바다 커뮤니티</h3>
     <p style="font-size:13px;">아나바다 회원분들이 자유롭게 소통할 수 있는 공간입니다.</p>
     
      <div>
         <!-- input value값을 정하고 그 값으로 c:out 태그 안에 삼항 연산자를 적어줘서 어디에 체크표시가 되는지 구분해줌 -->
         <label class="chk"> 
            <input type="radio" id="cate" name="a_type" value=""<c:out value="${scri.cateType eq '' ? 'checked' : '' }"/>/><span>전체</span>
         </label>
         <label class="chk"> 
            <input type="radio" id="cate" name="a_type" value="1"<c:out value="${scri.cateType eq '1' ? 'checked' : ''}"/>/><span>동네생활</span>
         </label>
         <label class="chk">        
            <input type="radio" id="cate" name="a_type" value="2"<c:out value="${scri.cateType eq '2' ? 'checked' : ''}"/>/><span>동네맛집</span>
         </label>
         <label class="chk">
            <input type="radio" id="cate" name="a_type" value="3"<c:out value="${scri.cateType eq '3' ? 'checked' : ''}"/>/><span>같이해요</span>
         </label>
      </div>
      <!-- 말머리 카테고리 끝 -->
      <br>
      
      
      <!-- 게시글 목록 컬럼명 -->
     <table class="table">
      <thead>
         <tr>
         <th scope="col">지역</th>
         <th scope="col">말머리</th>
         <th scope="col">제목</th>
         <th scope="col">작성자</th>
         <th scope="col">작성일</th>
         <th scope="col">조회수</th>
         </tr>
      </thead>

	  <!-- 게시글 목록 -->
      <tbody>
      <c:forEach items="${list }" var="list">
         <tr>
            <td>
               <input type="hidden" id="a_bno" name="a_bno" value="${list.a_bno }"/>
               <c:choose>
			   <c:when test="${list.loca == 1 }">
			   		<c:out value="강원"/>
			   </c:when>
			    <c:when test="${list.loca == 2 }">
			   		<c:out value="경기"/>
			   </c:when>
			    <c:when test="${list.loca == 3 }">
			   		<c:out value="경남"/>
			   </c:when>
			    <c:when test="${list.loca == 4 }">
			   		<c:out value="경북"/>
			   </c:when>
			    <c:when test="${list.loca == 5 }">
			   		<c:out value="부산"/>
			   </c:when>
			    <c:when test="${list.loca == 6 }">
			   		<c:out value="서울"/>
			   </c:when>
			    <c:when test="${list.loca == 7 }">
			   		<c:out value="인천"/>
			   </c:when>
			    <c:when test="${list.loca == 8 }">
			   		<c:out value="전남"/>
			   </c:when>
			    <c:when test="${list.loca == 9 }">
			   		<c:out value="전북"/>
			   </c:when>
			    <c:when test="${list.loca == 10 }">
			   		<c:out value="제주"/>
			   </c:when>
			    <c:when test="${list.loca == 11 }">
			   		<c:out value="충남"/>
			   </c:when>
			    <c:when test="${list.loca == 12 }">
			   		<c:out value="충북"/>
			   </c:when>
               </c:choose>
            </td>
            
            <td>
               <c:choose>
                  <c:when test="${list.a_type == 1 }">
                     <c:out value="동네생활"/>
                  </c:when>
                  <c:when test="${list.a_type == 2 }">
                     <c:out value="동네맛집"/>
                  </c:when>
                  <c:otherwise>
                     <c:out value="같이해요"/>
                  </c:otherwise>
               </c:choose>            
            </td>
            <td class="delChk">
               <a href="/a_board/readView?a_bno=${list.a_bno}&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }&cateType=${scri.cateType }">
               <c:out value="${list.a_title }"/>
               </a>
            </td>
            <td><c:out value="${list.nick }"/></td>
            <td><fmt:formatDate value="${list.a_regdate }" pattern="yyyy-MM-dd"/></td>
            <td><c:out value="${list.a_cnt }"/></td>
         </tr>
      </c:forEach>
      </tbody>
      <!-- 게시글 목록 끝 -->
   </table>
   
   <!-- 글 작성 -->
   <div style="text-align:right;" class="writelink">
   		<a href="#" onclick="write_login()">글 작성</a>
   </div>

    <br>
    
    <!-- 검색 분류 및 검색 버튼 -->
  	<div class="row justify-content-center">
  		<div class="col-md-2">
      		<select name="searchType" class="form-select form-select-sm">
        		<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
         		<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
         		<option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : '' }"/>>제목+내용</option>
         		<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : '' }"/>>작성자</option>
      		</select>
    	</div>
   
   		<div class="col-md-4">
      		<input type="text" name="keyword" id="keywordInput" class="form-control form-control-sm" value="${scri.keyword }"/>
   		</div>
   
   		<div class="col-md-1">
      		<button type="button" id="searchBtn" style="width:50px;">검색</button>
  		</div>
 	</div>
   	<!-- 검색 분류 및 검색 버튼 끝-->
   	
   <br>
   
   <!-- 페이징 처리 -->
   <div style="text-align:center;">
         <c:if test="${pageMaker.prev }">
            <a href="list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a>
         </c:if>
                     
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <c:out value="${pageMaker.cri.page == idx ? '' : '' }"/>
               <a href="list${pageMaker.makeSearch(idx)}">${idx }</a>
         </c:forEach>
                  
         <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
            <a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
         </c:if>
   </div>
   <!-- 페이징 처리 끝 -->

</div>
</form> 
</section>

<div>
	<jsp:include page="../includes/footer.jsp" />
</div> 

</body>
</html>