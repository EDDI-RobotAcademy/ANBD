<!-- nav.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	li{
		list-style: none;
		display: inline;
		padding: 6px;
	}
</style>

	<ul>
		<li>
			<!-- 여기서 member는 MemberController의 로그인 post 부분에 적힌 변수 member를 의미 -->
			<c:if test="${member != null || id != null}"><a href="/member/logout">로그아웃</a></c:if>
			<c:if test="${member == null && id == null}"><a href="/">로그인</a></c:if>
		</li>
		<li>
			<c:if test="${member != null }">
				<p>&nbsp;&nbsp;&nbsp;${member.id }님 안녕하세요.</p>
			</c:if>
			
			<c:if test="${id != null }">
				<p>&nbsp;&nbsp;&nbsp;${id }님 안녕하세요.</p>
			</c:if>
		</li>
		<li><a href="/a_board/list">목록</a></li>
		<c:if test="${member != null || id != null }">
		<li><a href="/a_board/writeView">글 작성</a></li>
		</c:if>
	</ul>
	