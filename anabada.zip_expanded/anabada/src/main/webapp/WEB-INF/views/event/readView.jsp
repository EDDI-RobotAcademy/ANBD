<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="../resources/eve_list/img/favicon.png" type="image/png">
<title>이벤트 정보</title>
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
<!-- 슬라이드 -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />


</head>
<body>



	<style type="text/css">
.rach input[type='checkbox'] {
	display: none;
}

.rach input[type='checkbox']+span {
	font-weight: bold;
	width: 250px;
	height: 60px;
	font-size: 30px;
	display: inline-block;
	padding: 5px 5px;
	border: 1px solid #AEB6BF;
	border-radius: 10px;
	background-color: white;
	text-align: center;
	padding: 18px 0;
	cursor: pointer;
	margin-left: 60px;
}

.rach input[type='checkbox']:checked+span {
	background-color: #AEB6BF;
	color: white;
	border-radius: 10px;
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

.op {
	font-size: large;
	font-weight: bold;
	width: 120px;
}

#ev {
	text-align: center;
	background-color: #EEEEEE;
	margin-left: 30px;
	font-size: 30px;
	font-weight: bold;
	border-radius: 20px;
	color: #707070;
}


.homeArea{

width: 1000px;
margin: auto;
margin-top: 30px;
padding-top: 30px;
padding-bottom: 30px;
border-radius: 20px;

  box-shadow: 0px 5px 5px 5px #DEDEDE;
  background-color: white;
  

}




</style>
</head>



<body>

	<div>
		<jsp:include page="../includes/nav.jsp" />
	</div>
	
	
	

		<div >
		<jsp:include page="../includes/eventHeader.jsp" />
		
		<jsp:include page="../includes/eventNav.jsp" />
	</div> 
	


<div  style="background-color: #EEEEEE; padding-top: 50px;  " >

	<form name="readForm" role="form" >
		<input type="hidden" name="eno" value="${read.eno}">
		<!--================광고 이미지 칸  =================-->
		<!-- <section class="home_banner_area"   > -->
		<section class="homeArea" >

			<div class="container box_1620" style="width: 1000px;">
				<c:if test="${id=='admin' }">
					<div style="width: 970px; text-align: right; padding-right: 20px;">

						<button id="rebtn" style="background-color: white; border: none;" title="글 수정">
							<img src="../resources/images/edit.png" style="width: 40px; height: 40px;">
						</button>
						<button id="delbtn" style="background-color: white; border: none;" title="삭제">
							<img src="../resources/images/garbage.png" style="width: 40px; height: 40px;">
						</button>
					</div>
				</c:if>
				<div class="banner_inner d-flex align-items-center">
					<div class="banner_content">
						<div class="media">
							<!-- 슬라이드 구현 -->
							<div class="single-item" id="slick" style="width: 500px; height: 500px; margin-left:10px; margin-right: 20px;">
								<c:choose>
									<c:when test="${ empty filelist }">
										<div class="d-flex" style="width: 500px;">
											<img src="/eventImg/img.png" style="width: 500px; height: 500px;" alt="">
											<!-- 이벤트 사진 넣는 자리 -->
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${filelist}" var="list">
											<div class="d-flex" style="width: 500px;">
												<img src="${list.filepath }" style="width: 500px; height: 500px;" alt="">
												<!-- 이벤트 사진 넣는 자리 -->
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>

							</div>
							<!-- 슬라이드 끝  -->
							<div class="media-body">
								<div>
									<h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Step for the Earth 🌎</h6>
									<br>
									<h3>&nbsp; ${read.e_title }</h3>
									<br>
									<h5 style="color: #A2A2A2">&nbsp;아나바다와 함께하는 캠페인 ! 지금 참여하세요</h5>
									<div>${read.e_content}</div>
									<div class="personal_text">
										<ul class="list basic_info">
											<li>&nbsp;&nbsp;<a href="#"><i class="lnr lnr-calendar-full"></i> 응모기간 : ${read.e_start} ~ ${read.e_end} </a></li>
											<li>&nbsp;&nbsp;<a href="#"><i class="lnr lnr-calendar-full"></i>당첨자 발표 : ${read.e_win}</a></li>
											<li>&nbsp;&nbsp;<a href="#"><i class="lnr lnr-envelope"></i>궁금하신 사항은 문의 게시판으로 문의바랍니다.</a></li>
											<%-- <li>&nbsp;&nbsp;<a href="#"><i class="lnr lnr-home"></i> ${id} ~~~ ~~~ </a></li> --%>
										</ul>
										<br>


										<ul class="list personal_social">
											<c:choose>
												<c:when test="${id=='admin' }">

													<select class="op">


														<option value="ing" <c:out value="${read.e_type eq 'ing' ? 'selected' : '' }" />>진행중</option>
														<option value="end" <c:out value="${read.e_type eq 'end' ? 'selected' : '' }" />>완 료</option>
													</select>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													
												    <span id="adminBox" style="visibility: hidden;">

														<button id="completion" type="button" class="btn btn-outline-primary" <c:out value="${read.e_winner == null  ? '' :'disabled'} "/>>당첨자 발표</button>

													</span>



												</c:when>

												<c:otherwise>

													<c:choose>
														<c:when test="${read.e_type == 'ing' }">

															<div style="display: inline;">

																<label class="rach"> <c:choose>
																		<c:when test="${check==0 }">
																			<input type="checkbox" id="heart" />
																			<span id="chbox">참여하기</span>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="heart" checked="checked" />
																			<span id="chbox">참여완료</span>
																		</c:otherwise>
																	</c:choose>
																</label>

															</div>
														</c:when>
														<c:otherwise>
															<div id="ev">완료된 이벤트입니다.</div>
														</c:otherwise>

													</c:choose>


												</c:otherwise>
											</c:choose>




										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--================광고 이미지칸 끝  =================-->
		<!--================참여 정보 칸  =================-->
		<section class="welcome_area p_120">
			<div class="container">
				<div class="row welcome_inner">
					<div class="col-lg-6">
						<div class="welcome_text">
							<h4>🌳Event Status</h4>
							<p style="font-size: 13px;" > ‘아나바다’는<br> ‘아껴 쓰고 나눠 쓰고 바꿔 쓰고 다시 쓰기’를 줄인 말이에요. <br>
							물건을 아끼고 나누고 바꾸고 다시 쓰면서 <br>불필요한 소비를 줄이자는 뜻이에요.<br>
나에게 쓸모없던 물건이 다른 사람의 손에서 그 쓸모를 다하듯이<br>
지구를 생각하는 우리의 작은 한걸음 한 걸음이 모여 지구를 위한 쓸모 있는 행동이 될 수 있도록 아나바다가 여러분과 함께하고자 합니다.</p>
							<div class="row">
						<!-- 		<div class="col-md-4">
									<div class="wel_item">
										<i class="lnr lnr-database"></i>
										<h4>$2.5M</h4>
										<p>북마크</p>
									</div>
								</div> -->
								<div class="col-md-4">
									<div class="wel_item">
										<i class="lnr lnr-book"></i>
										<h4>${read.e_count}</h4>
										<p>조회수</p>
									</div>
								</div>
								<div class="col-md-4">
									<div class="wel_item">
										<i class="lnr lnr-users"></i>
										<h4 id="e_total">${read.e_total}</h4>
										<p>참여자수</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<c:if test="${read.e_winner != null }">
						<div class="col-lg-6" style="width: 585px; height: 348px; border: 1px #CDCDCD solid; border-radius: 8px;">
							<div class="tools_expert">
								<div class="skill_main" style="text-align: center;">
									<span style="font-weight: bold; font-size: 20px;">[ 당첨자 발표 ]</span>
									<div id="winner">${read.e_winner}</div>
								</div>
							</div>
						</div>
					</c:if>

				</div>
			</div>
		</section>
		<!--================참여정보 칸  =================-->

	</form>
	</div>
	<div id="footer">
			<jsp:include page="../includes/footer.jsp" />
		</div>

	<!-- 슬라이드 -->
	<script src="../resources/eve_list/js/jquery-3.3.1.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!-- 슬라이드 끝  -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="../resources/eve_list/js/jquery-3.3.1.min.js"></script> -->
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
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var formObj = $("form[name='readForm']");
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
							}); //슬라이드끝

							var opp = $(".op option:selected").val();
							if (opp == 'end') {
								$(".op").prop('disabled', true);
							}

							//관리자 삭제버튼 
							$("#delbtn")
									.on(
											"click",
											function() {
												if (confirm("게시글을 삭제하시겠습니까?   삭제한 게시글은 복구 할 수 없습니다.")) {
													formObj.attr("action",
															"/event/delete");
													formObj.attr("method",
															"post");
													formObj.submit();

												} else {
													return false;
												}
											})

							//관리자 수정하기 버튼
							$("#rebtn").on("click", function() {
								
								if (confirm("게시글을 수정하시겠습니까?")){

								formObj.attr("action", "/event/editView");
								formObj.attr("method", "get");
								formObj.submit();
								}

							})

			
							
							//이벤트 참여기능
							$("#heart")
									.on(
											"click",
											function() {
												
												if(${id == null}){
													alert("로그인 후 이용해주세요");
													return false;
												}
												
												if ($(this).prop('checked')) {
													const element = document
															.getElementById('chbox');
													element.innerText = '참여완료';
													var params = {
														eno : "${read.eno}",
														id : "${id}"
													}
													$.ajax({
																type : "POST",
																url : "/event/addHeart",
																data : params,
																dataType : "json",
																contetnType : "application/json",
																success : function(
																		res) {
																	const element = document
																			.getElementById('e_total');
																	element.innerText = res.hnum;
																},
																error : function(
																		request,
																		status,
																		error) {
																	alert("error:"
																			+ error);
																}
															});
												} else {
													if(  !(confirm("참여를 취소하시겠습니까?"))  ){
														return false;
													}
													
													const element = document
															.getElementById('chbox');
													element.innerText = '참여하기';
													var params = {
														eno : "${read.eno}",
														id : "${id}"
													}
													$
															.ajax({
																type : "POST",
																url : "/event/subHeart",
																data : params,
																dataType : "json",
																contetnType : "application/json",
																success : function(
																		res) {
																	const element = document
																			.getElementById('e_total');
																	element.innerText = res.hnum;
																},
																error : function(
																		XMLRequest,
																		textStatus,
																		errorThrown) {
																	alert("error:"
																			+ error);
																}
															});
												}
											}); //  이벤트 참여 기능 끝
							
							
											
											

											
											if($(
											".op option:selected")
											.val() == 'end'){
												$('#adminBox').attr("style","visibility:visible");
											}
							//이벤트 완료
							$(".op")
									.change(
											function() {
												var opt = $(
												".op option:selected")
												.val();

												var param = {
													eno : "${read.eno}"
												}
												if (opt == 'end') {

													if (confirm('이벤트를 완료하시겠습니까?')) {
														$(".op").prop(
																'disabled',
																true); // 변경불가로 만들기 
																$('#adminBox').attr("style","visibility:visible");
																
																
														$
																.ajax({

																	type : "POST",
																	url : "/event/endEvent",
																	data : param,
																	dataType : "json",
																	contetnType : "application/json",

																	success : function() {
																		//담청자 발표를 위한 버튼 생성 
																	
																		
														
																		
																	},
																	error : function(
																			XMLRequest,
																			textStatus,
																			errorThrown) {
																		alert("error:"
																				+ error);
																	}
																});
													}
												}
											})//end

							//당첨자 발표하기 
							$("#completion")
									.on(
											"click",
											function() {

												var num = prompt("당첨 인원을 입력하세요.(숫자만 입력하세요)");
												if (isNaN(num)) {
													alert("숫자만 입력 가능합니다. 다시 시도하세요");
													return false;
												}

												var param = {
													eno : "${read.eno}",
													num : num

												}

												$
														.ajax({

															type : "POST",
															url : "/event/winner",
															data : param,
															dataType : "json",
															contetnType : "application/json",

															success : function(
																	res) {
																const element = document
																		.getElementById('winner');
																element.innerText = res.winlist;
																const btn = document
																		.getElementById('completion');
																btn.disabled = true;

															},
															error : function(
																	XMLRequest,
																	textStatus,
																	errorThrown) {
																alert("error:"
																		+ error);
															}
														});

											})

						}) //read end
	</script>

</body>
</html>