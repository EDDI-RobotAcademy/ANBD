<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<link href="../resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>알바 지원 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/css/j_styles.css'/>">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$(".detail").on("click", function () {
        	$('#careerModal').modal("show"); 
        	
		});
	})


</script>
<style>
    .j_img{
    	width: 100px; height: 100px; 
    	float: left; 
    	margin-right: 10px;
    	border-radius: 0.25rem;
    }
    table.r_list{
    	width: 100%;
    }
    .r_list tr,.r_list th,.r_list td{
    	border-top: 1px solid #ced4da;
        padding: 10px;
    }
    .r_list th{
    	text-align: center;
    }
    .r_list tr .content{
    	text-align: center;
    }
</style>
</head>
<body>

	<div>
       <jsp:include page="../includes/nav.jsp" />
    </div>
      
    <div>
       <jsp:include page="../includes/header.jsp" />
    </div>
    
    <section class="container">
		<table class="r_list">
		
			<tr>
			    <td colspan="6"><font style="font-size: 30px;">알바 지원자 목록</font></td>
		    </tr>
				
			<tr>
			    <td colspan="6" style="border-top: 1px solid #ced4da;">
			    	<c:choose>
	                <c:when test="${empty j_read.j_img}">
	                    <img class="j_img" src="../resources/images/아나바다2.png">
	                </c:when>
	                <c:otherwise>
	                    <img class="j_img" src="/upload/${j_read.j_img }">
	                </c:otherwise>
	                </c:choose>
	                <font style="font-size: 20px;">${j_read.j_title }</font><br>
					${j_read.j_company }<br>
					${j_read.j_addr1 }&nbsp;${j_read.j_addr2 }<br>
					${j_read.j_method }&nbsp;${j_read.j_pay }
				</td>
			</tr>
			
			<tr>
				<th width="10%">이름</th>
				<th width="10%">나이</th>
				<th width="5%">성별</th>
				<th width="15%">전화번호</th>
				<th colspan="3" width="45%">경력</th>
				<th width="15%">지원날짜</th>
			</tr>
			
			<!-- 반복 -->
			<c:if test="${not empty r_list}">
			<c:forEach items="${r_list}" var="r_list">
			
			<tr>
				<td class="content">${r_list.r_name }</td>
				<td class="content">${r_list.r_age }</td>
				<td class="content">${r_list.r_gender }</td>
				<td class="content">${r_list.r_tel }</td>
				<td class="content">
					<c:set var="company_list" value="${fn:split(r_list.r_company, ',')}" />
					<c:forEach var="company" items="${company_list}" varStatus="varStatus">
					${company}<br>
					</c:forEach>
				</td>
				<td class="content">
					<c:set var="start_list" value="${fn:split(r_list.r_start, ',')}" />
					<c:forEach var="start" items="${start_list}" varStatus="varStatus">
					${start}<br>
					</c:forEach>
				</td>
				<td class="content">
					<c:set var="end_list" value="${fn:split(r_list.r_end, ',')}" />
					<c:forEach var="end" items="${end_list}" varStatus="varStatus">
					${end}<br>
					</c:forEach>
				</td>
				<td class="content">
					${r_list.r_date }
				</td>
			</tr>
		</c:forEach>	
			
			<!-- 페이징 -->
			<tr>
				<td colspan="8" style="text-align: center">
					<c:if test="${pageMaker.prev }">
						<a href="resume_list${pageMaker.makeSearch(pageMaker.startPage - 1 )}&j_bno=${j_bno}">이전</a>
						<!-- j_title을 보내줘야지 새로고침하거나 페이지 달라져도 제목 유지됨. 11줄 -->
					</c:if>									
					
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						<%-- <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/> --%>
						&nbsp;<a href="resume_list${pageMaker.makeSearch(idx)}&j_bno=${j_bno}">${idx }</a>
					</c:forEach>
										
					<c:if test="${pageMaker.next && pageMakerendPage > 0 }">
						<a href="resume_list${pageMaker.makeSearch(pageMaker.endPage + 1)}&j_bno=${j_bno}">다음</a>
					</c:if>
				</td>
			</tr>
			</c:if>
			
			<c:if test="${empty r_list }">
			<tr>
				<td colspan="8" style="text-align: center">지원자가 없습니다.
				<br>
				</td>
			</tr>
			</c:if>
				
		</table>
	</section>
	
	
	<div>
      <jsp:include page="../includes/footer.jsp" />
    </div>

</body>
</html>