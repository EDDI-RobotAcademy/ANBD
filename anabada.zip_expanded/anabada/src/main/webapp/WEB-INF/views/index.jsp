<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="manifest" href="resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta charset="UTF-8">
<title>아나바다</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>

$(document).ready(function() {
	var dlist=[];
});

</script>

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

.word {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
/*글자 자르게*/
.sideword {
	width: 110px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

/*레이아웃 */
#wapper {
	width: 1200px;
	margin: auto;
	height: auto;
}

.nav, .aside, .section {
	margin: 3px; /*간격*/
}

.nav, .section, .aside {
	float: left;
}

.nav {
	width: 70px;
}

.section {
	/* background-color: #f9f9f9;    */
	width: 1000px;
	border: 0px;
	border-collapse: collapse;
}

.aside {
	
}

.sideBanner {
	width: 120px;
	position: absolute;
	height: 470px;
	top: 100px;
	background-color: white;
	border: 1px solid #0C6BBC;
	text-align: center;
	margin-left: 10px;
	margin-top: 10px;
}

.recent_list {
	height: 405px;
	overflow: hidden;
}

/*최근 본 알바 ul*/
#recentItemList {
	list-style: none;
	float: left;
	text-align: center;
}

#recentItemList li {
	height: 130px;
	display: inline-block;
	text-align: center;
	margin-bottom: 5px;
}

ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

.searchDIV {
	margin: auto;
	margin-top: 10px;
	width: 650px;
}

.searchTable {
	text-align: center;
	width: 600px;
	margin: auto;
	margin-top: 40px;
}

/*끝 */
</style>
</head>

<body>
	<div>
		<jsp:include page="includes/nav.jsp" />
	</div>
	
	<div>
		<jsp:include page="includes/header.jsp" />
	</div>
	
	<div style="min-width: 1200px; width: 100%; border-bottom: 1px solid #f1f2f5;"></div>
	
	<form role="form" method="get">
	<section class="container">
		<div class="mcont" style="text-align: center;">
			<div style="width: 960px; height: 250px; background-color: #cccccc;">
				배너 부분
				<c:if test="${id == 'admin'}">
					<button type="button" onclick="location.href='/bannerForm'">폼 작성</button>
				</c:if>
				<c:forEach items="${blist}" var="blist">		
					<div><c:out value="${blist.a_no}" /></div>
					<div><img width="500px;" height="300px;" src="${blist.a_file}" /></div>
				</c:forEach>
			</div>

			<div id="wapper" style="width: 960px; min-height: 500px; height: 100%;">
				<!-- 내용 박스 부분 -->
				<section class="py-5">
					<div class="container px-4 mt-5" style="width: 960px;">
						<div style="width: 960px;" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<c:forEach items="${list}" var="list">
								<!-- test -->
								<div class="col mb-5 postExistence" id="postExistence" pno="${list.pno}" title="/product/readView?pno=${list.pno}&p_type=${list.p_type}&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }&productType=${scri.productType}" >
									<div class="card h-100">
										<!-- Product image-->
										<div style="height: 267px;">
											<img class="card-img-top" height="265px;" src="${list.p_filepath}" />
										</div>
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->

												<div class="word">
													<h5 class="fw-bolder">${list.p_title}</h5>
												</div>

												<!-- Product price-->
												₩ ${list.p_cost}
												<div style="margin-top: 10px;">
													<fmt:formatDate pattern="yyyy.MM.dd" value="${list.p_regdate}" />
												</div>
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto" href="#">살펴보기</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
	</form>
	
	<div>
		<jsp:include page="includes/footer.jsp" />
	</div>
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>