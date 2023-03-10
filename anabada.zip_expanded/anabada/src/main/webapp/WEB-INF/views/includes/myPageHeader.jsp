<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="sidemenu2">
	<div class="sidepro" style="float: right;">
		<div class="sideimg">
			<c:if test="${member.lev <= 25}">
				<img src="<c:url value='/images/lev_1.png'/>" style="width: 55px; height: 55px;">
			</c:if>
			
			<c:if test="${member.lev >= 26 and member.lev <= 50}">
				<img src="<c:url value='/images/lev_2.png'/>" style="width: 55px; height: 55px;">
			</c:if>
			
			<c:if test="${member.lev >= 51 and member.lev <= 75}">
				<img src="<c:url value='/images/lev_3.png'/>" style="width: 55px; height: 55px;">
			</c:if>
			
			<c:if test="${member.lev >= 76}">
				<img src="<c:url value='/images/lev_4.png'/>" style="width: 55px; height: 55px;">
			</c:if>
		</div>
	</div>
	
	<div style="clear: both;"></div>
	
	<p style="font-size: 11px; margin-bottom: 20px; margin-right: 27px;">Lv.${member.lev}</p>
	
	<p class="side-t">회원정보</p>
	<ul class="side-ul">
		<c:choose>
			<c:when test="${member.id == 'admin'}">
				<li class="side-li"><a href="/member/memberUpdateView">내 정보 관리</a></li>
				<li class="side-li"><a href="/member/passUpdateView">비밀번호 변경</a></li>
				<li class="side-line"></li>
				<li class="side-li"><a href="/member/memberListView">회원 관리</a></li>
				<li class="side-li"><a href="/a_banner/bannerUpdate">배너 관리</a></li>
				<li class="side-li"><a href="/qna_board/list">1:1 문의 내역</a></li>
			</c:when>
			<c:otherwise>
				<li class="side-li"><a href="/member/memberUpdateView">내 정보 관리</a></li>
				<li class="side-li"><a href="/member/passUpdateView">비밀번호 변경</a></li>
				<li class="side-line"></li>
				<li class="side-li"><a href="/userProduct/myStore">내 상점 보기</a></li>
				<li class="side-li"> <a href="/userProduct/myHeartList" >내 찜 목록 보기</a> </li>
				<li class="side-line"></li>
				<li class="side-li"><a href="/a_board/myWriteList">내가 쓴 게시글</a></li>
				<li class="side-li"><a href="/a_board/myReplyList">내가 쓴 댓글</a></li>
				<li class="side-line"></li>
				<li class="side-li"><a href="/job/my_job">아르바이트 공고</a></li>
				<li class="side-li"><a href="/resume/my_resume">아르바이트 지원</a></li>
				<li class="side-li"><a href="/job/heart_job">아르바이트 찜</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
