<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<script>

$(document).ready(function() {
	var dlist=[];

$("#slick").slick({
    infinite : true, /* 맨끝이미지에서 끝나지 않고 다시 맨앞으로 이동 */
    slidesToShow : 1, /* 화면에 보여질 이미지 갯수*/
    slidesToScroll : 1, /*  스크롤시 이동할 이미지 갯수 */
    autoplay : true, /* 자동으로 다음이미지 보여주기 */
    arrows : true, /* 화살표  */
    dots : true, /*  아래점  */
    autoplaySpeed : 1500,/* 다음이미지로 넘어갈 시간 */
    speed : 1000, /* 다음이미지로 넘겨질때 걸리는 시간 */
    pauseOnHover : true, /*  마우스 호버시 슬라이드 이동 멈춤 */
    //vertical:true,/*  세로방향으로 슬라이드를 원하면 추가하기// 기본값 가로방향 슬라이드*/
    responsive : [ { /* 반응형웹*/
       breakpoint : 960, /*  기준화면사이즈 */
       settings : {
          slidesToShow : 2
       }
    /*  사이즈에 적용될 설정 */
    }, { /* 반응형웹*/
       breakpoint : 768, /*  기준화면사이즈 */
       settings : {
          slidesToShow : 1
       }
    /*  사이즈에 적용될 설정 */
    } ]
 });
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
.slick-arrow {
   z-index: 2; /* prev버튼은 위치 이동시 이미지 뒤로 숨겨짐 */
   position: absolute; /* 원하는 위치에 지정  */
   top: 50%;
   width: 50px;
   height: 50px;
   transform: translateY(-25px);
}
.slick-prev.slick-arrow { /* prev 이전 */
   position: absolute;
   left: 0px;
}
.slick-next.slick-arrow { /* next 다음 */
   right: 10px;
}
/* 아래점 */
.slick-dots {
   text-align: center;
}
.slick-dots li {
   display: inline-block;
   margin: 0 5px;
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
				<div class="single-item" id="slick">
				<c:forEach items="${blist}" var="blist">		
				<div class="imgbox">
					<div><img width="960px;" height="250px;" class="single-item" id="slick" src="${blist.a_file}" /></div>
				</div>
				</c:forEach>
				</div>
				
				<c:if test="${id == 'admin'}">
					<button type="button" onclick="location.href='/bannerForm'">폼 작성</button>
					<button type="button" onclick="location.href='/a_banner/bannerUpdate'">폼 수정</button>
				</c:if>
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