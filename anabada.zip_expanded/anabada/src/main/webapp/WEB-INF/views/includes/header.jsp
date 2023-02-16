<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<script type="text/javascript">
	$(function() {

		$('.searchBtn_h').on(
				"click",
				function() {
					

					var chbtn = $("input[type='radio']:checked").val();
					self.location = "http://localhost:8080/product/list?" 
							+ 'searchType='
							+ 'all' + "&keyword="
							+ encodeURIComponent($('#keywordInput_h').val());
				});

	})
</script>


</head>

<body>
	<!-- header 영역 -->
	<div class="container">
		<div class="header">
			<div class="logo-header">
				<a href="/"><img src="<c:url value='/images/logo.png'/>" style="width: 220px; height: 141px;"></a>
			</div>

			<div class="sbox">
				<div class="search-box">
					<input class="search-in" name="keyWord_h" id="keywordInput_h" type="text">
					<button class="search-but searchBtn_h ">
						<img src="<c:url value='/images/search.png'/>">
					</button>
				</div>
			</div>
		</div>

		<div class="cate" style="float: right;">
			<div>
				<ul class="cate-ul">
					<li class="cate-li"><a href="/product/list">중고게시판</a></li>
					<li class="cate-li"><a href="/job/job_list">알바게시판</a></li>
					<li class="cate-li"><a href="/a_board/list">동네생활</a></li>
					<li class="cate-li"><a href="/event/list">이벤트</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>