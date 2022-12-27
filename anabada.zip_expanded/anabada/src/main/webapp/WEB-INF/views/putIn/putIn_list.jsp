<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원자들 목록 보기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	$(window).on("load", function () {
		var null_chk = <c:out value="${p_list}"/>;
		if(null_chk == null || null_chk == ""){
			alert("지원자가 없습니다.");
			history.go(-1);
		}
	});
	
</script>

</head>
<body>
	<table style="margin: auto; width: 1000px" border="2px">
		<tr>
			<td>구인 게시물 제목</td>
			<td>${j_title }</td>
		</tr>
		
		<tr>
			<td colspan="6">지원자들 목록</td>
		</tr>
		
		<tr>
			<th>이름</th><th>나이</th><th>성별</th><th>전화번호</th><th colspan="2">경력</th>
		</tr>
		
		<c:forEach items="${p_list}" var="p_list">
		<tr>
			<td>${p_list.p_name }</td>
			<td>${p_list.p_age }</td>
			<td>${p_list.p_gender }</td>
			<td>${p_list.p_tel }</td>
			<td>
				<c:if test="${not empty p_list.p_company1 }">
				${p_list.p_company1 }<br>
				</c:if>
				<c:if test="${not empty p_list.p_company2 }">
				${p_list.p_company2 }<br>
				</c:if>
				<c:if test="${not empty p_list.p_company3 }">
				${p_list.p_company3 }
				</c:if>
			</td>
			<td>
				<c:if test="${not empty p_list.p_start1 && not empty p_list.p_end1 }">
				${p_list.p_company1 } ~ ${p_list.p_company1 }<br>
				</c:if>
				<c:if test="${not empty p_list.p_start2 && not empty p_list.p_end2 }">
				${p_list.p_company2 } ~ ${p_list.p_company2 }<br>
				</c:if>
				<c:if test="${not empty p_list.p_start3 && not empty p_list.p_end3 }">
				${p_list.p_company3 } ~ ${p_list.p_company3 }<br>
				</c:if>
			</td>
		</tr>
		</c:forEach>	
		
		<!-- 페이징 -->
		<tr>
			<td>
				<c:if test="${pageMaker.prev }">
					<a href="putIn_list${pageMaker.makeSearch(pageMaker.startPage - 1 )}&j_bno=${j_bno}">이전</a>
					<!-- j_title을 보내줘야지 새로고침하거나 페이지 달라져도 제목 유지됨. 11줄 -->
				</c:if>									
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<%-- <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/> --%>
					&nbsp;<a href="putIn_list${pageMaker.makeSearch(idx)}&j_bno=${j_bno}">${idx }</a>
				</c:forEach>
									
				<c:if test="${pageMaker.next && pageMakerendPage > 0 }">
					<a href="putIn_list${pageMaker.makeSearch(pageMaker.endPage + 1)}&j_bno=${j_bno}">다음</a>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td><button type="button" id="back">이전으로 돌아가기</button></td>
		</tr>
			
		
	</table>

</body>
</html>