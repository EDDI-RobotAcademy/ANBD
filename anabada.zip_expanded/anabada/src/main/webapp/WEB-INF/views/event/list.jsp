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
</head>
<body>




	<!--================Home Gallery Area =================-->
	<section class="home_gallery_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>🌎아나바다와 함께하는 이벤트🌎</h2>
				<p>Our One Step for the Environment</p>
			</div>
			<div class="isotope_fillter">
				<ul class="gallery_filter list">
					<li class="active" data-filter="*"><a href="#">All</a></li>
					<li data-filter=".ing"><a href="#">진행중인 이벤트</a></li>
					<li data-filter=".eng"><a href="#">완료된 이벤트</a></li>
				</ul>
				<div style="text-align: right;">
					<c:if test="${id == 'admin'}">
						<button onclick="location.href='/event/writeView'">이벤트 등록</button>
					</c:if>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="gallery_f_inner row imageGallery1">
			
			
			

				<c:forEach items="${list }" var="list">
					<div class="col-lg-4 col-md-4 col-sm-6 ${list.e_type} design print">
						<div class="h_gallery_item" onclick="location.href='/event/readView?eno=${list.eno}&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }'">

							<div class="g_img_item" style=" width: 340px; height: 340px; ">

								
										<img class="img-fluid" width="340px;" height="340px;" src="${list.e_filePath }" alt="">
										<a class="light"><img src="../resources/eve_list/img/gallery/icon.png" alt=""></a>
								
							</div>


							<div class="g_item_text">
								<h4>${list.e_title }</h4>
								<p>${list.e_start}~${list.e_end}</p>
							</div>
						</div>
					</div>
				</c:forEach>


				<div class="more_btn">
					<a class="main_btn" href="#">Load More Items</a>
				</div>
			</div>
	</section>
	<!--================End Home Gallery Area =================-->

	<!--================Footer Area =================-->





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
</body>
</html>