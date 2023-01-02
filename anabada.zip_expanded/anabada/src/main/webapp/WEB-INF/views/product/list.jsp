<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아나바다 중고장터</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
   
/*    
.card-img-top img {
	width: 299.33px;
	height: 300px;
}
 */
 
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

.word{

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
      margin: 3px;/*간격*/
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
      height: 450px;
      top: 100px;
      background-color: white;
      border: 1px solid #0C6BBC;
      text-align: center;
      margin-left: 10px;
      margin-top: 10px;
   }
   .recent_list{
      height: 405px; 
      /*
      396인 이유: li높이 128(검사에서 확인)+margin bottom 5px이 3개씩 보일거라
      132*3 = 396임.
      */
      overflow: hidden;
   }
   
   /*최근 본 알바 ul*/
   #recentItemList{
   	  list-style: none;
   	  float: left;
   	  text-align: center;
   }
   #recentItemList li{
      height: 130px;
	  display: inline-block;
	  text-align: center;
	  margin-bottom: 5px;
   }
   
   /*끝 */

</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function() {

		// 검색어 입력하고 검색 눌렀을떄 
		$('.searchBtn').on(
				"click",
				function() {

					var chbtn = $("input[type='radio']:checked").val();

					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ '&searchType='
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val())
							+ "&productType=" + encodeURIComponent(chbtn);
				});

		// 카테고리 버튼 클릭 이벤트 
		$("input[type='radio']").click(
				function() {

					var chbtn = $("input[type='radio']:checked").val();

					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ '&searchType='
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val())
							+ "&productType=" + encodeURIComponent(chbtn);

				})

		//내글쓰기 버튼 눌렀을때 
		$('#writebtn').on("click", function() {

			var id = "${id}";
			if (id = null) {
				alert('회원 전용 서비스입니다. 로그인 후 이용하세요 ');
				return null;
			}

			location.href = "/product/writeView";
		})
		
		//최근본 목록
		// 최근 본 알바 플로팅배너
		   // 기본 위치(top)값
			var floatPosition = parseInt($(".sideBanner").css('top')); //100
			var floatHei = parseInt($(".sideBanner").outerHeight()); // 플로팅 배너 길이 450
			var footerTop = $('#footer').outerHeight(); // footer가 위치한 높이 
			
			
			
			// scroll 인식
			$(window).scroll(function() {
			  
			    // 현재 스크롤 위치
			    var currentTop = $(window).scrollTop();
			    var bannerTop = currentTop + floatPosition + "px";
			    var val = $(document).height() - footerTop;
			    var hei = currentTop + floatPosition + floatHei;
			   

			    
			
			    
			    //이동 애니메이션
			    if (hei < footerTop){
			    	$(".sideBanner").stop().animate({
			   	    	"top" : bannerTop
			   	    }, 500);
			    	
			    }

			}).scroll(); 
		   
		    // 최근 본 알바 불러오기. sessionStorage
		    function get_recent_item(){
			   
			    //sessionStorage.clear(); 
			    var $recentItemList = $("#recentItemList");
			    
			    var items = sessionStorage.getItem("recent_product");
			    
			    if(items == null){
			    	var li = "<br><br><li>최근 본 상품이 없습니다.</li>"
			    	$recentItemList.append(li);
			    }
			
			    //alert(key)
			    
			    var realitem = JSON.parse(items);
			    
	
			    
			}
			
			$(".recent_btn").click(function () {
				var ih = $(this).index() == 0 ? -135 : 135; //위아래로 움직이는 px 숫자
				var obj = $('.recent_list');
				obj.animate({ scrollTop:obj.scrollTop() + ih }, 100);
		    });
			
			// 이거 젤 마지막에 둬야 함
			get_recent_item();
			//최근본 목록 끝 
		
		

	});
</script>

</head>
<body>
	<!-- Navigation-->
<!-- 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">🌎아나바다.com</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">All Products</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">Popular Items</a></li>
							<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
						</ul></li>
				</ul>
				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</form>
			</div>
		</div>
	</nav> -->
	<!-- Header-->
<!-- 	<header class="bg-dark py-5" >
		<div class="container px-4 px-lg-5 my-5"  >
			<div class="text-center text-white"  >
				<h1 class="display-4 fw-bolder"> 아나바다.com </h1>
				<p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
			</div>
		</div>
	</header>
	 -->
 	
	<div>
   <jsp:include page="../includes/nav.jsp" />
</div>
<div>
   <jsp:include page="../includes/header.jsp" />
</div>
	
	
	<!-- 검색 기능 부분  -->
	<form role="form" method="get">
	<div id="wapper" >
	 <section class="nav"></section>
	<section class="section" style="border-top: 1px solid #e5e5e5">
		<div style="text-align: center;"  >

			<table>
				<tr>
					<td width="30%"><select name="searchType" style="text-align: center;">

							<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' :''} "/>>제 목</option>
							<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' :''} "/>>내 용</option>
							<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' :''} "/>>작성자</option>
					</select></td>
					<td><input type="text" name="keyWord" id="keywordInput" value="${scri.keyword }">
						<button class="searchBtn" type="button">검색</button> &nbsp; &nbsp;
						<button id="writebtn" type="button">내글쓰기</button></td>
				</tr>

			</table>



		</div>


		<div  >


			<div style="display: inline;">

				<label class="rach"> <input type="radio" id="con" name="p_type" value="" <c:out value="${ empty scri.productType ? 'checked' :''} "/> /><span>전체</span></label>

			</div>


			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="전자기기" <c:out value="${scri.productType eq '전자기기' ? 'checked' :''} "/> /><span>전자기기</span></label>

			</div>

			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="상품권/쿠폰" <c:out value="${scri.productType eq '상품권/쿠폰' ? 'checked' :''} "/> /><span>상품권/쿠폰</span></label>

			</div>

			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="남성의류" <c:out value="${scri.productType eq '남성의류' ? 'checked' :''} "/> /><span>남성 의류</span></label>

			</div>

			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="여성의류" <c:out value="${scri.productType eq '여성의류' ? 'checked' :''} "/> /><span>여성 의류</span></label>

			</div>

			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="아동용품" <c:out value="${scri.searchType eq '아동용품' ? 'checked' :''} "/> /><span>아동 용품</span></label>

			</div>

			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="가구" <c:out value="${scri.searchType eq '가구' ? 'checked' :''} "/> /><span>가구</span></label>

			</div>

			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="신발" <c:out value="${scri.searchType eq '신발' ? 'checked' :''} "/> /><span>신발</span></label>

			</div>

			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="가방" <c:out value="${scri.searchType eq '가방' ? 'checked' :''} "/> /><span>가방</span></label>

			</div>

			<div style="display: inline;">

				<label class="rach"><input type="radio" id="con" name="p_type" value="기타" <c:out value="${scri.searchType eq '기타' ? 'checked' :''} "/> /><span>기타</span></label>

			</div>
			</div>

			<!-- 내용 박스 부분 -->
			<section class="py-5">
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

						<c:forEach items="${list }" var="list">
							<!-- test -->
							<div class="col mb-5"    onclick="location.href='/product/readView?pno=${list.pno}&p_type=${list.p_type}&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }&productType=${scri.productType} '"  >
								<div class="card h-100">
									<!-- Product image-->
									<div style="height: 267px;"  >
									<img class="card-img-top"  height="265px;"  src="${list.p_filepath }" />
									</div>
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											
											 <div class="word" >
											<h5 class="fw-bolder">${list.p_title }</h5>
											</div>
											<!-- Product reviews-->
											<div class="d-flex justify-content-center small text-warning mb-2">
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
											</div>
											<!-- Product price-->
											₩ ${list.p_cost}
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
















					</div>
				</div>

				<!-- 페이징 처리 부분 -->
				<nav   style="margin-left: 50%" >
					<ul class="pagination">
						<li class="page-item">
						<c:if test="${pageMaker.prev }">
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


			</section>
			</section>
			<!-- 사이드바 - 최근본 상품 목록 -->
			   <section class="aside"   >
      <div class="sideBanner"   style="background-color: pink;  " >
   	  최근 본 상품
      	 <div class="r_btn">
      	 	<button class="recent_btn">▲</button>
      	 	<button class="recent_btn">▼</button>
      	 </div>
      	 <div class="recent_list"  >
			 <ul id="recentItemList">
			 </ul>
	     </div>
      </div>
   </section>
   <!-- 최근본 상품 끝  -->
			</div>
	</form>
	<!-- Footer-->
	<div id="footer" >
	
		   <div id="footer">
      <jsp:include page="../includes/footer.jsp" />
   </div>
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>
