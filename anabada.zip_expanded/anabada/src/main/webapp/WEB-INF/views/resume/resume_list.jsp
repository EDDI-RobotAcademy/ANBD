<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link href="../resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/n_styles.css'/>">
<meta charset="UTF-8">
<title>지원자들 목록 보기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<style>
    .j_img{
    	width: 100px; height: 100px; 
    	float: left; 
    	margin-right: 10px;
    	border-radius: 0.25rem;
    }
    table{
    	width: 1000px;
    }
    tr,th,td{
    	border-top: 1px solid #ced4da;
        padding: 10px;
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
	    <div class="minicon">
		<table>
		
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
				<th>이름</th><th>나이</th><th>성별</th><th>전화번호</th><th colspan="2">경력</th><th>지원날짜</th>
			</tr>
			
			<c:if test="${not empty r_list}">
			<c:forEach items="${r_list}" var="r_list">
			<tr>
				<td>${r_list.r_name }</td>
				<td>${r_list.r_age }</td>
				<td>${r_list.r_gender }</td>
				<td>${r_list.r_tel }</td>
				<td>
					<c:if test="${not empty r_list.r_company1 }">
					${r_list.r_company1 }<br>
					</c:if>
					<c:if test="${not empty r_list.r_company2 }">
					${r_list.r_company2 }<br>
					</c:if>
					<c:if test="${not empty r_list.r_company3 }">
					${r_list.r_company3 }
					</c:if>
				</td>
				<td>
					<c:if test="${not empty r_list.r_start1 && not empty r_list.r_end1 }">
					${r_list.r_start1 } ~ ${r_list.r_end1 }<br>
					</c:if>
					<c:if test="${not empty r_list.r_start2 && not empty r_list.r_end2 }">
					${r_list.r_start2 } ~ ${r_list.r_end2 }<br>
					</c:if>
					<c:if test="${not empty r_list.r_start3 && not empty r_list.r_end3 }">
					${r_list.r_start3 } ~ ${r_list.r_end3 }<br>
					</c:if>
				</td>
				<td>
					${r_list.r_date }
				</td>
			</tr>
			</c:forEach>	
			
			<!-- 페이징 -->
			<tr>
				<td colspan="6" style="text-align: center">
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
				<td colspan="6" style="text-align: center">지원자가 없습니다.
				<br>
				</td>
			</tr>
			</c:if>
				
		</table>
		</div>
	</section>
	
	<div>
      <jsp:include page="../includes/footer.jsp" />
    </div>

</body>
</html>