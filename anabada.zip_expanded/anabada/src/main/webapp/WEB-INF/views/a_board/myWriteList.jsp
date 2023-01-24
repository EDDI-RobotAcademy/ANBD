<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 게시글 목록</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/header.jsp"/>
</div> 

<section class="container">
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
      <c:forEach items="${myWriteList }" var="myWriteList" varStatus="status">
         <tr>
            <td>
               <input type="hidden" id="a_bno" name="a_bno" value="${myWriteList.a_bno }"/>
               <c:out value="${myWriteList.loca }"/>
            </td>
            
            <td>
               <c:choose>
                  <c:when test="${myWriteList.a_type == 1 }">
                     <c:out value="동네생활"/>
                  </c:when>
                  <c:when test="${myWriteList.a_type == 2 }">
                     <c:out value="동네맛집"/>
                  </c:when>
                  <c:otherwise>
                     <c:out value="같이해요"/>
                  </c:otherwise>
               </c:choose>            
            </td>
            
            <td>
               <a href="/a_board/readView?a_bno=${myWriteList.a_bno }&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }&cateType=${scri.cateType }&id=${scri.id }">
               <c:out value="${myWriteList.a_title }"/>
               </a>
            </td>
            
            <td><c:out value="${myWriteList.nick }"/></td>
            <td><fmt:formatDate value="${myWriteList.a_regdate }" pattern="yyyy-MM-dd"/></td>
            <td><c:out value="${myWriteList.a_cnt }"/></td>
         </tr>
      	</c:forEach>
   	</table>
   <!-- 게시글 목록 끝 -->
   
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
</section>
</body>
</html>