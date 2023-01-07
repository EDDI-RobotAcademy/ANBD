<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="manifest" href="resources/images/manifest.json">
<link rel="stylesheet" href="<c:url value='/css/j_styles.css'/>">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>알바 구인 게시판</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>

   .boxes {
     list-style: none;
     display: flex;
     flex-wrap: wrap;
     padding: 0;
   }
   
   .boxes li {
     width: 250px; /*이걸로 해야지 1000px에 알바 게시물 4개 보임*/
     padding: 3px; /*알바 게시물들 양옆 간격 3px*/
     margin-top: 3px; /*게시물들 위아래 간격 3px*/
     box-sizing: border-box;
   }
   
   .search_format li { /*검색 li*/
     width: 250px;
     padding: 0 20px;
     margin-top: 20px;
     box-sizing: border-box;
   }
   
   .boxes li a {
     display: block;
     padding: 0px; /*알바 게시물 안 4면 여백*/
     text-align: left; 
     text-decoration: none;
     background: white; /*알바 게시물 배경 흰색*/
     color: #000;
     border: 1px solid #E2E2E2;
   }
   
   .j_img { 
      width: 237px;
      height: 237px;
   }
   
   .search{
      margin: auto; 
      width: 1000px;
   }
   .search label{
      padding: 10px;
   }
   .search td{
      border-bottom: 1px solid #E5E5E5;
   }
   .search tr:first-child, .search td:first-child{
   	  padding-bottom: 15px;
   }
   .search .j_info{/*근무기간, 근무횟수, 업직종 쓴 칸*/
   	  padding-top: 10px;
   	  padding-bottom: 10px;
   	  text-align: center;
   	  width: 100px;
   }
   select{
      width: 100px;
      height: 30px;
   }
   
   /*레이아웃*/
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
   
   /*글자 자르게*/
   .word {
   	  width:110px;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  white-space: nowrap;
   }
   
   
</style>
<body>
<div>
   <jsp:include page="../includes/nav.jsp" />
</div>
<div>
   <jsp:include page="../includes/header.jsp" />
</div>

<div id="wapper" >
   <section class="nav"></section>
   
   <!-- 콘텐츠부분 -->
   <section class="section" style="border-top: 1px solid #e5e5e5">
   <form name="jobForm" method="get">
      
      <input type="button" class="j_btn1" id="job_insert" value="알바 구인 공고 작성하기" style="float: right;">
      <br><br>
      
      <table class="search">
         <tbody>
         	<tr>
         		<td colspan="2" style="text-align: center">
         			지역 검색
         			<select name="j_addr1" id="search_addr1">
			            <option value="전국" <c:out value="${scri.j_addr1 eq '전국' ? 'selected' : ''}" />>전국</option>
			            <option value="서울" <c:out value="${scri.j_addr1 eq '서울' ? 'selected' : ''}" />>서울</option>
			            <option value="부산" <c:out value="${scri.j_addr1 eq '부산' ? 'selected' : ''}" />>부산</option>
			            <option value="대구" <c:out value="${scri.j_addr1 eq '대구' ? 'selected' : ''}" />>대구</option>
			            <option value="인천" <c:out value="${scri.j_addr1 eq '인천' ? 'selected' : ''}" />>인천</option>
			            <option value="광주" <c:out value="${scri.j_addr1 eq '광주' ? 'selected' : ''}" />>광주</option>
			            <option value="대전" <c:out value="${scri.j_addr1 eq '대전' ? 'selected' : ''}" />>대전</option>
			            <option value="울산" <c:out value="${scri.j_addr1 eq '울산' ? 'selected' : ''}" />>울산</option>
			            <option value="세종" <c:out value="${scri.j_addr1 eq '세종' ? 'selected' : ''}" />>세종</option>
			            <option value="경기" <c:out value="${scri.j_addr1 eq '경기' ? 'selected' : ''}" />>경기</option>
			            <option value="강원" <c:out value="${scri.j_addr1 eq '강원' ? 'selected' : ''}" />>강원</option>
			            <option value="충북" <c:out value="${scri.j_addr1 eq '충북' ? 'selected' : ''}" />>충북</option>
			            <option value="충남" <c:out value="${scri.j_addr1 eq '충남' ? 'selected' : ''}" />>충남</option>
			            <option value="전북" <c:out value="${scri.j_addr1 eq '전북' ? 'selected' : ''}" />>전북</option>
			            <option value="전남" <c:out value="${scri.j_addr1 eq '전남' ? 'selected' : ''}" />>전남</option>
			            <option value="경북" <c:out value="${scri.j_addr1 eq '경북' ? 'selected' : ''}" />>경북</option>
			            <option value="경남" <c:out value="${scri.j_addr1 eq '경남' ? 'selected' : ''}" />>경남</option>
			            <option value="제주" <c:out value="${scri.j_addr1 eq '제주' ? 'selected' : ''}" />>제주</option>
         			</select>
         		</td>
         	</tr>
            <tr>
               <td class="j_info">근무기간</td>
               <td> 
               	   <label>
                      <input type="radio" class="search_term" id="j_term1" name="j_term"
                      value="모두" <c:out value="${scri.j_term eq '모두' ? 'checked' : ''}" />><span>모두</span>
                   </label>
                   <label>
                      <input type="radio" class="search_term" id="j_term2" name="j_term"
                      value="하루" <c:out value="${scri.j_term eq '하루' ? 'checked' : ''}"/>><span>하루</span>
                   </label>
                   <label>
                      <input type="radio" class="search_term" id="j_term3" name="j_term"
                      value="3개월이하" <c:out value="${scri.j_term eq '3개월이하' ? 'checked' : ''}" />><span>3개월 이하</span>
                   </label>
                   <label>   
                      <input type="radio" class="search_term" id="j_term4" name="j_term"
                      value="3~6개월" <c:out value="${scri.j_term eq '3~6개월' ? 'checked' : ''}" />><span>3~6개월</span>
                   </label>
                   <label>   
                      <input type="radio" class="search_term" id="j_term5" name="j_term"
                      value="6개월~1년" <c:out value="${scri.j_term eq '6개월~1년' ? 'checked' : ''}" />><span>6개월~1년</span>
                   </label>
                   <label>   
                      <input type="radio" class="search_term" id="j_term6" name="j_term"
                      value="1년이상" <c:out value="${scri.j_term eq '1년이상' ? 'checked' : ''}" />><span>1년 이상</span>
                   </label>
               </td>
           </tr>
           <tr>        
               <td class="j_info">근무횟수</td>
               <td>
               	  <label>
                      <input type="radio" class="search_day" id="j_day1" name="j_day"
                      value="모두" <c:out value="${scri.j_day eq '모두' ? 'checked' : ''}" />><span>모두</span>
                  </label>
                  <label>
                      <input type="radio" class="search_day" id="j_day1" name="j_day"
                      value="주1" <c:out value="${scri.j_day eq '주1' ? 'checked' : ''}" />><span>주1</span>
                  </label>
                  <label>
                      <input type="radio" class="search_day" id="j_day2" name="j_day"
                      value="주2" <c:out value="${scri.j_day eq '주2' ? 'checked' : ''}" />><span>주2</span>
                  </label>
                  <label>   
                      <input type="radio" class="search_day" id="j_day3" name="j_day"
                      value="주3" <c:out value="${scri.j_day eq '주3' ? 'checked' : ''}" />><span>주3</span>
                  </label>
                  <label>
                      <input type="radio" class="search_day" id="j_day4" name="j_day"
                      value="주4" <c:out value="${scri.j_day eq '주4' ? 'checked' : ''}" />><span>주4</span>
                  </label>
                  <label>
                      <input type="radio" class="search_day" id="j_day5" name="j_day"
                      value="주5" <c:out value="${scri.j_day eq '주5' ? 'checked' : ''}" />><span>주5</span>
                  </label>
                  <label>
                      <input type="radio" class="search_day" id="j_day5" name="j_day"
                      value="주말" <c:out value="${scri.j_day eq '주말' ? 'checked' : ''}" />><span>주말</span>
                  </label>
               </td>
           </tr>
           <tr>
              <td class="j_info">업직종</td>
              <td>
                  <label>
                      <input type="radio" class="search_cate" id="j_cate1" name="j_cate"
                      value="모두" <c:out value="${scri.j_cate eq '모두' ? 'checked' : ''}" />><span>모두</span>
                  </label>
                  <label>   
                      <input type="radio" class="search_cate" id="j_cate2" name="j_cate"
                      value="서빙" <c:out value="${scri.j_cate eq '서빙' ? 'checked' : ''}" />><span>서빙</span>
                  </label>
                  <label>      
                      <input type="radio" class="search_cate" id="j_cate3" name="j_cate"
                      value="매장관리/판매" <c:out value="${scri.j_cate eq '매장관리/판매' ? 'checked' : ''}" />><span>매장관리/판매</span>
                  </label>
                  <label>      
                      <input type="radio" class="search_cate" id="j_cate4" name="j_cate"
                      value="주방보조" <c:out value="${scri.j_cate eq '주방보조' ? 'checked' : ''}" />><span>주방보조</span>
                  </label>
                  <label>      
                      <input type="radio" class="search_cate" id="j_cate5" name="j_cate"
                      value="사무보조" <c:out value="${scri.j_cate eq '사무보조' ? 'checked' : ''}" />><span>사무보조</span>
                  </label>
                  <label>      
                      <input type="radio" class="search_cate" id="j_cate6" name="j_cate"
                      value="음료제조" <c:out value="${scri.j_cate eq '음료제조' ? 'checked' : ''}" />><span>음료 제조</span>
                  </label>
                  <label>      
                      <input type="radio" class="search_cate" id="j_cate9" name="j_cate"
                      value="배달" <c:out value="${scri.j_cate eq '배달' ? 'checked' : ''}" />><span>배달</span>
                  </label>
                  <label>      
                      <input type="radio" class="search_cate" id="j_cate10" name="j_cate"
                      value="기타" <c:out value="${scri.j_cate eq '기타' ? 'checked' : ''}" />><span>기타</span>
                  </label> 
               </td>
            </tr>
         </tbody>
      </table>
      <br>
         
      <div class="container">
         <!-- 여기부터는 게시물들 -->
          <ul class="boxes">
             <c:forEach var="j_list" items="${j_list}">
                 <li>
                   <a href="/job/job_read?j_bno=${j_list.j_bno }&page=${scri.page }&perPageNum=${scri.perPageNum }&j_addr1=${scri.j_addr1 }&j_term=${scri.j_term }&j_day=${scri.j_day}&j_cate=${scri.j_cate}">
                    <!-- a태그 누르면  -->   
                       <div class="details">
                          <c:choose>
                             <c:when test="${empty j_list.j_img}">
                                <img class="j_img" src="../resources/images/아나바다2.png"/>
                             </c:when>
                             <c:otherwise>
                                <img class="j_img" src="/upload/${j_list.j_img }"/>
                             </c:otherwise>
                          </c:choose>
                          &nbsp;${j_list.j_company }<br>
                          &nbsp;${j_list.j_title }<br>
                          &nbsp;직종 : ${j_list.j_cate }<br>
                          &nbsp;날짜 : ${j_list.j_day }<br>
                          &nbsp;${j_list.j_term }&nbsp;${j_list.j_start }:00 ~ ${j_list.j_end }:00<br>
                          &nbsp;${j_list.j_method }&nbsp;${j_list.j_pay }<br>
                          &nbsp;${j_list.j_addr1 }
                       </div>
                   </a>
                  </li>
              </c:forEach>
         </ul>
      </div>
      
      <!-- 페이징 -->
      <div style="text-align: center">
         <c:if test="${pageMaker.prev }">
            <a href="job_list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a>
            <!-- 다시 쓰기!!!!!!!!!!!!!!!!
            page=2&perPageNum=10&searchType=tc&keyword=aaaaa 
            "/list"로 이동(기본이 get방식)
            -->
         </c:if>
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <%-- <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/> --%>
            &nbsp;<a href="job_list${pageMaker.makeSearch(idx)}">${idx }</a>
         </c:forEach>
         <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
            <a href="job_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
         </c:if>
      </div>
   
   </form>
   </section>
   
   <!-- 사이드바.ex)최근 본 항목 -->
   <section class="aside">
      <div class="sideBanner">
   	  최근 본 알바
      	 <div class="r_btn">
      	 	<button class="recent_btn">▲</button>
      	 	<button class="recent_btn">▼</button>
      	 </div>
      	 <div class="recent_list">
			 <ul id="recentItemList" style="margin-left:5px; margin-right: 5px; ">
			 </ul>
	     </div>
      </div>
   </section>
   </div>
   
   <div id="footer">
      <jsp:include page="../includes/footer.jsp" />
   </div>
</body>


<script>
   $(document).ready(function () {
      $('#search_addr1').change(function () {
      location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
      '&j_addr1=' + encodeURIComponent($("#search_addr1 option:selected").val()) + 
      '&j_term=' + encodeURIComponent($("input[name=j_term]:checked").val()) + 
      '&j_day=' + encodeURIComponent($("input[name=j_day]:checked").val()) + 
      '&j_cate=' + encodeURIComponent($("input[name=j_cate]:checked").val());
                     /*
                     ex) 1페이지에서 제목+내용 선택하고 aaaaa 입력 후 검색버튼 눌렀을 때 url
                     http://localhost:8080/board/list?page=1&perPageNum=10&searchType=tc&keyword=aaaaa
                     즉, pageMaker.makeQuery(1) => ?page=1&perPageNum=10
                     
                     ex) 1페이지에서 작성자 선택하고 아무글도 입력하지 않고 검색버튼 눌렀을 때 url
                     http://localhost:8080/board/list?page=1&perPageNum=10&searchType=w&keyword=      
                        
                     [검색] 버튼 누르면 파라미터 값들 가지고 BoardController "/list"로 이동(기본이 get방식)
                     이때 넘어가는 파라미터는 page, perPageNum, serachType, keyword
                     */
   });
   
   $('.search_cate').click(function () {
      location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
      '&j_addr1=' + encodeURIComponent($("#search_addr1 option:selected").val()) + 
      '&j_term=' + encodeURIComponent($("input[name=j_term]:checked").val()) + 
      '&j_day=' + encodeURIComponent($("input[name=j_day]:checked").val()) + 
      '&j_cate=' + encodeURIComponent($("input[name=j_cate]:checked").val());
      
   });
   
   $('.search_day').click(function () {
      location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
      '&j_addr1=' + encodeURIComponent($("#search_addr1 option:selected").val()) + 
      '&j_term=' + encodeURIComponent($("input[name=j_term]:checked").val()) + 
      '&j_day=' + encodeURIComponent($("input[name=j_day]:checked").val()) + 
      '&j_cate=' + encodeURIComponent($("input[name=j_cate]:checked").val());
      
   });
   
   $('.search_term').click(function () {
      location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
      '&j_addr1=' + encodeURIComponent($("#search_addr1 option:selected").val()) + 
      '&j_term=' + encodeURIComponent($("input[name=j_term]:checked").val()) + 
      '&j_day=' + encodeURIComponent($("input[name=j_day]:checked").val()) + 
      '&j_cate=' + encodeURIComponent($("input[name=j_cate]:checked").val());
      
   });
   
   $("#job_insert").click(function () {
      location.href = "job_insert";
   })
   
   
   // 최근 본 알바 플로팅배너
   // 기본 위치(top)값
	var floatPosition = parseInt($(".sideBanner").css('top'));
	var floatHei = parseInt($(".sideBanner").outerHeight()); // 플로팅 배너 길이
	var footerTop = $('#footer').outerHeight(); // footer가 높이한 위치
	
	// scroll 인식
	$(window).scroll(function() {
	  
	    // 현재 스크롤 위치
	    var currentTop = $(window).scrollTop(); // 현재 윈도우 스크린 위치
	    var bannerTop = currentTop + floatPosition + "px"; // 
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
	    
	    var items = sessionStorage.getItem("recent_job");
	    
	    if(items == null){
	    	var li = "<br><br><li>최근 본 상품이 없습니다.</li>"
	    	$recentItemList.append(li);
	    }
	
	    //alert(key)
	    
	    var realitem = JSON.parse(items);
	    
	    //파싱된 객체의 길이로 for문 돌리기
	     for (var i = 0; i < 6; i++) {
	        var j_bno = realitem[i].j_bno;
	        var j_title = realitem[i].j_title;
	        var j_img = realitem[i].j_img;
	        
	        if(j_img != null || j_img != ""){
		        var li = "<li><a href='/job/job_read?j_bno="+j_bno+"'><img width='100' height='100' src='/upload/"+j_img+"'/>"
		        	+ "<br><div class='word'>" + j_title+ "</div>" + "</a></li>";
	        }
	        if(j_img == null || j_img == ""){
	        	var li = "<li><a href='/job/job_read?j_bno="+j_bno+"'><img width='100' height='100' src='../resources/images/아나바다2.png'/>"
		        	+ "<br><div class='word'>" + j_title+ "</divs>" + "</a></li>";
	        }
	 
	        //ul에 붙이기
	        $recentItemList.append(li);
	    }
	    
	}
	
	$(".recent_btn").click(function () {
		var ih = $(this).index() == 0 ? -135 : 135; //위아래로 움직이는 px 숫자
		var obj = $('.recent_list');
		obj.animate({ scrollTop:obj.scrollTop() + ih }, 100);
    });
	
	// 이거 젤 마지막에 둬야지 정상적으로 실행됨
	get_recent_item();

   
});
</script>
</html>