<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 댓글 목록 보기</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/header.jsp"/>
</div>

<section class="container">
<div class="sidemenu2">
				<p class="side-t">회원정보</p>
				<ul class="side-ul">
					<br>
					<li class="side-li"><a href="/member/memberUpdateView">내 정보 관리</a></li>
					<li class="side-li"><a href="/member/passUpdateView">비밀번호 변경</a></li>
					<br><hr><br>
					<li class="side-li"><a href="/userProduct/myStore">내 상점 보기</a></li>
					<li class="side-li"> <a href="/userProduct/myHeartList" >내 찜 목록 보기</a> </li>
					<li class="side-li">참여한 이벤트</li>
					<br><hr><br>
					<li class="side-li"><a href="/a_board/myWriteList">내가 쓴 게시글</a></li>
					<li class="side-li">내가 쓴 댓글</li>
					<br><hr><br>
					<li class="side-li"><a href="/job/my_job">아르바이트 공고</a></li>
					<li class="side-li"><a href="/resume/my_resume">아르바이트 지원</a></li>
					<li class="side-li"><a href="/job/my_heart">아르바이트 찜</a></li>
					<br><hr><br>
					<li class="side-li">나의 걸음수</li>
					<br><hr><br>
					<li class="side-li"><a href="/member/memberDeleteView">회원 탈퇴</a></li>
				</ul>
			</div>
			
<div class="minicon">
<table class="table">
      <thead>
         <tr>
         <th scope="col">게시글 제목</th>
         <th scope="col">댓글 작성자</th>
         <th scope="col">댓글 내용</th>
         <th scope="col">댓글 작성일</th>
         </tr>
      </thead>
      
      <c:forEach items="${myReplyList }" var="myReplyList">
      	<tr>
      		<td>
				 <a href="/a_board/readView?a_bno=${myReplyList.a_bno }&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }&cateType=${scri.cateType }&id=${scri.id }">
				 <c:out value="${myReplyTitle.a_title }"/>
				 </a>
      		</td>
      		<td><c:out value="${myReplyList.nick }"/></td>
      		<td><c:out value="${myReplyList.r_content }"/></td>
      		<td><fmt:formatDate value="${myReplyList.r_regdate }" pattern="yyyy-MM-dd"/></td>
      	</tr>
      </c:forEach>
   </table>
  </div>
</section>

</body>
</html>