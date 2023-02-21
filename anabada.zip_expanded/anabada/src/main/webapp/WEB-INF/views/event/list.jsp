<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="img/favicon.png" type="image/png">
<title>이벤트</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../resources/eve_list/css/bootstrap.css">
<link rel="stylesheet" href="../resources/eve_list/vendors/linericon/style.css">
<link rel="stylesheet" href="../resources/eve_list/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/eve_list/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/eve_list/vendors/lightbox/simpleLightbox.css">
<link rel="stylesheet" href="../resources/eve_list/vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="../resources/eve_list/vendors/animate-css/animate.css">
<link rel="stylesheet" href="../resources/eve_list/vendors/popup/magnific-popup.css">
<link rel="stylesheet" href="../resources/eve_list/vendors/flaticon/flaticon.css">
<!-- main css -->
<link rel="stylesheet" href="../resources/eve_list/css/style.css">
<link rel="stylesheet" href="../resources/eve_list/css/responsive.css">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style type="text/css">
#keywordBox {
	width: 400px;
}

.btn-secondary1 { -
	--bs-btn-color: #272a2e; 
	--bs-btn-bg: #e9ecef; 
	--bs-btn-border-color: #ced4da; 
	--bs-btn-hover-color: #fff; 
	--bs-btn-hover-bg: #a1a5a9; 
	--bs-btn-hover-border-color: #a1a5a9; 
	--bs-btn-focus-shadow-rgb: 130, 138, 145; 
	--bs-btn-active-color: #fff; 
	--bs-btn-active-bg: #a1a5a9; 
	--bs-btn-active-border-color: #a1a5a9; 
	--bs-btn-active-shadow: inset 0 3px 5pxrgba(0, 0, 0, 0.125); 
	--bs-btn-disabled-color: #fff; 
	--bs-btn-disabled-bg: #a1a5a9; 
	--bs-btn-disabled-border-color: #a1a5a9;
}

.searchBox {
	width: 400px;
	margin: auto;
}

.textBox {
	width: 300px;
	margin: auto;
}
#ImgBox{
width: 335px;
}
#emptyBox{
color:#DEDEDE;
font-size:40px;
width:1000px;
margin-top:70px;

text-align: center;

}


</style>
</head>
<body>

	<div>
		<jsp:include page="../includes/nav.jsp" />
	</div>
	<div>
		<jsp:include page="../includes/eventHeader.jsp" />
	</div>
	<div>
		<jsp:include page="../includes/eventNav.jsp" />
	</div>

	<section class="home_gallery_area p_120"   style="width: 1000px;  margin: auto;" >
		<div class="container">



			<div class="searchBox">
				<!-- 검색 기능 -->
				<div class="input-group mb-3" id="keywordBox">
					<span class="input-group-text" id="basic-addon1">제 목</span> <input type="text" id="keywordInput" class="form-control" placeholder="검색어를 입력하세요 ">
					<button type="button" id="searchBtn" class="btn btn-secondary1"  >검색</button>
				</div>



				<div class="isotope_fillter textBox ">

					<ul class="gallery_filter list">
						<li class="active" data-filter="*"><a href="#">All</a></li>
						<li class="active" data-filter=".ing"><a href="#">진행중인 이벤트</a></li>
						<li class="active" data-filter=".end"><a href="#">완료된 이벤트</a></li>

					</ul>


				</div>
			</div>
			<div style="text-align: right;">
				<c:if test="${id == 'admin'}">
					<button type="button" class="btn btn-outline-primary" onclick="location.href='/event/writeView'">이벤트 등록</button>
				</c:if>
			</div>
		</div>

		<br> 

		
			<div style="width: 1200px; margin: auto;" class="gallery_f_inner row imageGallery1">


           <c:choose>
           <c:when test="${not empty list}">
           
           			<c:forEach items="${list }" var="list">
					<div class="col-lg-4 col-md-4 col-sm-6 ${list.e_type} design print" id="ImgBox" >
						<div class="h_gallery_item" onclick="location.href='/event/readView?eno=${list.eno}&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }'">

							<div class="g_img_item" style="width: 300px; height: 340px;">


								<img class="img-fluid" width="300px;" height="340px;" src="${list.e_filePath }" alt=""> <a class="light"><img src="../resources/eve_list/img/gallery/icon.png" alt=""></a>

							</div>


							<div class="g_item_text">
								<h4>${list.e_title }</h4>
								<p>${list.e_start}~${list.e_end}</p>
							</div>
						</div>
					</div>
				</c:forEach>
           
           </c:when>
           <c:otherwise>
           <div id="emptyBox" > 현재 진행 중인 이벤트가 없습니다. </div>
           </c:otherwise>
           
           </c:choose>

	


				<!-- 	<div class="more_btn">
					<a class="main_btn" href="#">Load More Items</a>
				</div> -->
			</div>
			
			
	</section>
	<!--================End Home Gallery Area =================-->
	<!-- 페이징 -->
	<!-- 페이징 처리 부분 -->
	<nav style="margin-left: 50%">
		<ul class="pagination">
			<li class="page-item"><c:if test="${pageMaker.prev }">
					<a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1 )}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>><a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx }</a></li>
			</c:forEach>


			<c:if test="${pageMaker.next && pageMakerendPage > 0 }">
				<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
	<!-- 페이징 끝  -->



	<!--================Footer Area =================-->

	<div id="footer"  >
			<jsp:include page="../includes/footer.jsp" />
		</div>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../resources/eve_list/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/eve_list/js/popper.js"></script>
	<script src="../resources/eve_list/js/bootstrap.min.js"></script>
	<script src="../resources/eve_list/js/stellar.js"></script>
	<script src="../resources/eve_list/vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="../resources/eve_list/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="../resources/eve_list/vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="../resources/eve_list/vendors/isotope/isotope.pkgd.min.js"></script>
	<script src="../resources/eve_list/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="../resources/eve_list/vendors/popup/jquery.magnific-popup.min.js"></script>
	<script src="../resources/eve_list/js/jquery.ajaxchimp.min.js"></script>
	<script src="../resources/eve_list/vendors/counter-up/jquery.waypoints.min.js"></script>
	<script src="../resources/eve_list/vendors/counter-up/jquery.counterup.min.js"></script>
	<script src="../resources/eve_list/js/mail-script.js"></script>
	<script src="../resources/eve_list/js/theme.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {

					$("#searchBtn").on(
							"click",
							function() {
								self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());

							});

				})
	</script>

</body>
</html>