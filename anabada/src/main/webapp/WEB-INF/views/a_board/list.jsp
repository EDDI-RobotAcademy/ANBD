<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다 커뮤니티</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function () {
   $('#searchBtn').click(function () {
      var chbtn = $("input[type='radio']:checked").val();
      self.location = "list" + '${pageMaker.makeQuery(1)}' + '&searchType=' + $("select option:selected").val() + 
               "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&cateType=" + encodeURIComponent(chbtn);
   });
});

$(function() {
   $("input[type='radio']").click(function() {
         var rabtn = $("input[type='radio']:checked").val();
      self.location = "list" + '${pageMaker.makeQuery(1)}' + '&searchType=' + $("check option:checked").val()
         + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&cateType=" + encodeURIComponent(rabtn);   
   });
}); 

$(function() {
   $("input[name='all']").click(function() {
      self.location = "/a_board/list";
   })
})

</script>
</head>
<body>
<header>
   <h1>아나바다 커뮤니티</h1>
</header>
<hr>
   
<div>
   <%@include file="nav.jsp" %>
</div>

<form>
   <table border="1">
      <div>
         <label class="chk">
            <input type="radio" id="all" name="all"/><span>전체</span>
         </label>
         <!-- input value값을 정하고 그 값으로 c:out 태그 안에 삼항 연산자를 적어줘서 어디에 체크표시가 되는지 구분해줌 -->
         <label class="chk"> 
            <input type="radio" id="life" name="a_type" value="1"<c:out value="${scri.cateType eq '1' ? 'checked' : ''}"/>/><span>동네생활</span>
         </label>
         <label class="chk">        
            <input type="radio" id="food" name="a_type" value="2"<c:out value="${scri.cateType eq '2' ? 'checked' : ''}"/>/><span>동네맛집</span>
         </label>
         <label class="chk">
            <input type="radio" id="with" name="a_type" value="3"<c:out value="${scri.cateType eq '3' ? 'checked' : ''}"/>/><span>같이해요</span>
         </label>
      </div>
      
      <thead>
         <tr><th>말머리</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
      </thead>
      
      <c:forEach items="${list }" var="list">
         <tr>
            <td>
               <input type="hidden" id="a_bno" name="a_bno" value="${list.a_bno }"/>
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
            <td>
               <a href="/a_board/readView?a_bno=${list.a_bno }&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }&cateType=${scri.cateType }"><c:out value="${list.a_title }"/></a>
            </td>
            <td><c:out value="${list.id }"/></td>
            <td><fmt:formatDate value="${list.a_regdate }" pattern="yyyy-MM-dd"/></td>
            <td><c:out value="${list.a_cnt }"/></td>
         </tr>
      </c:forEach>
   </table>
   
   <div>
      <select name="searchType">
         <option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
         <option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
         <option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : '' }"/>>제목+내용</option>
         <option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : '' }"/>>작성자</option>
      </select>
   </div>
   
   <div>
      <input type="text" name="keyword" id="keywordInput" value="${scri.keyword }"/>
      <button type="button" id="searchBtn">검색</button>
   </div>
   
   <div>
      <ul class="pagination">
         <c:if test="${pageMaker.prev }">
            <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a></li>
         </c:if>
                     
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>>
               <a href="list${pageMaker.makeSearch(idx)}">${idx }</a>
            </li>
         </c:forEach>
                  
         <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
            <li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
         </c:if>
      </ul>
   </div>
</form>   
</body>
</html>