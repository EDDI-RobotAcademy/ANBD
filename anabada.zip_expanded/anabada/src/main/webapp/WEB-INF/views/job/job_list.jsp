<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<link rel="stylesheet" href="../resources/css/j_styles.css">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>알바 게시판</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>

   .boxes {
     list-style: none;
     display: flex;
     flex-wrap: wrap;
     padding: 0;
   }
   
   .boxes > div {
     width: 240px; /*이걸로 해야지 1000px에 알바 게시물 4개 보임*/
     margin-top: 5px; /*게시물들 위아래 간격 3px*/
     box-sizing: border-box;
     border: 1px solid #E2E2E2;
     margin: 5px; /*게시물 간 간격*/
     border-radius: 5px; 
   }
   
   .boxes > div > .read {
     text-align: left; 
     color: #000;
     cursor: pointer;
   }
   
   .boxes > div > div > .word2{
     padding-bottom: 3px;
     padding-top: 3px;
     padding-right: 10px; 
     padding-left: 10px;
     
   }
   
   .j_img { 
      width: 239px;
      height: 200px;
      border-radius: 5px 5px 0px 0px;
   }
   
   /*선택검색*/
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
      width: 100px;
   }
   .section {
      width: 1000px; 
      border: 0px; 
      border-collapse: collapse;
   }
   
   .sideBanner {
      width: 120px; 
      position: absolute;
      max-height: 490px;
      min-height: 200px;
      top: 100px;
      background-color: white;
      border: 1px solid #E2E2E2;
      text-align: center;
      margin-left: 10px;
      margin-top: 10px;
      /* border-radius: 5px; */
   }
   .recent_list{
      height: 405px; 
      /*
      405인 이유: li높이 130(검사에서 확인)+margin bottom 5px이 3개씩 보일거라
      130*3 = 390임.
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
   
   .word2{
       width:225px;
       overflow: hidden;
       text-overflow: ellipsis;
       white-space: nowrap;
   }
   
   .recent_btn{
   	   all: unset; 
   	   cursor: pointer;
   }
   
</style>
<body>
<div id="anbdHead">
<div>
   <jsp:include page="../includes/nav.jsp" />
</div>
<div>
   <jsp:include page="../includes/miniHeader.jsp" />
</div>
</div>

<div id="wapper" >
   <section class="nav"></section>
   
   <!-- 콘텐츠부분 -->
   <section class="section">
   <form name="jobForm" method="get">
      <input type="button" class="j_btn1" id="job_insert" value="알바 구인 공고 작성하기" style="float: right; margin-top: 10px;">
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
                     <c:set var="term" value="${scri.j_term }"/>
                     <label>
                      <input type="checkbox" class="search_term" id="j_term1" name="j_term"
                      value="모두" <c:if test = "${fn:contains(term, '모두')}">checked</c:if>>
                      <span>모두</span>
                   </label>
                   <label>
                      <input type="checkbox" class="search_term" id="j_term2" name="j_term"
                      value="하루" <c:if test = "${fn:contains(term, '하루')}">checked</c:if>>
                      <span>하루</span>
                   </label>
                   <label>
                      <input type="checkbox" class="search_term" id="j_term3" name="j_term"
                      value="3개월이하" <c:if test = "${fn:contains(term, '3개월이하')}">checked</c:if>>
                      <span>3개월 이하</span>
                   </label>
                   <label>   
                      <input type="checkbox" class="search_term" id="j_term4" name="j_term"
                      value="3~6개월" <c:if test = "${fn:contains(term, '3~6개월')}">checked</c:if>>
                      <span>3~6개월</span>
                   </label>
                   <label>   
                      <input type="checkbox" class="search_term" id="j_term5" name="j_term"
                      value="6개월~1년" <c:if test = "${fn:contains(term, '6개월~1년')}">checked</c:if>>
                      <span>6개월~1년</span>
                   </label>
                   <label>   
                      <input type="checkbox" class="search_term" id="j_term6" name="j_term"
                      value="1년이상" <c:if test = "${fn:contains(term, '1년이상')}">checked</c:if>>
                      <span>1년 이상</span>
                   </label>
               </td>
           </tr>
           <tr>        
               <td class="j_info">근무횟수</td>
               <td>
                    <c:set var="day" value="${scri.j_day }"/>
                    <label>
                      <input type="checkbox" class="search_day" id="j_day1" name="j_day"
                      value="모두" <c:if test = "${fn:contains(day, '모두')}">checked</c:if>>
                      <span>모두</span>
                  </label>
                  <label>
                      <input type="checkbox" class="search_day" id="j_day1" name="j_day"
                      value="주1" <c:if test = "${fn:contains(day, '주1')}">checked</c:if>>
                      <span>주1</span>
                  </label>
                  <label>
                      <input type="checkbox" class="search_day" id="j_day2" name="j_day"
                      value="주2" <c:if test = "${fn:contains(day, '주2')}">checked</c:if>>
                      <span>주2</span>
                  </label>
                  <label>   
                      <input type="checkbox" class="search_day" id="j_day3" name="j_day"
                      value="주3" <c:if test = "${fn:contains(day, '주3')}">checked</c:if>>
                      <span>주3</span>
                  </label>
                  <label>
                      <input type="checkbox" class="search_day" id="j_day4" name="j_day"
                      value="주4" <c:if test = "${fn:contains(day, '주4')}">checked</c:if>>
                      <span>주4</span>
                  </label>
                  <label>
                      <input type="checkbox" class="search_day" id="j_day5" name="j_day"
                      value="주5" <c:if test = "${fn:contains(day, '주5')}">checked</c:if>>
                      <span>주5</span>
                  </label>
                  <label>
                      <input type="checkbox" class="search_day" id="j_day5" name="j_day"
                      value="주말" <c:if test = "${fn:contains(day, '주말')}">checked</c:if>>
                      <span>주말</span>
                  </label>
               </td>
           </tr>
           <tr>
              <td class="j_info">업직종</td>
              <td>
                  <c:set var="cate" value="${scri.j_cate }"/>
                  <label>
                      <input type="checkbox" class="search_cate" id="j_cate1" name="j_cate"
                      value="모두" <c:if test = "${fn:contains(cate, '모두')}">checked</c:if>>
                      <span>모두</span>
                  </label>
                  <label>   
                      <input type="checkbox" class="search_cate" id="j_cate2" name="j_cate"
                      value="서빙" <c:if test = "${fn:contains(cate, '서빙')}">checked</c:if>>
                      <span>서빙</span>
                  </label>
                  <label>      
                      <input type="checkbox" class="search_cate" id="j_cate3" name="j_cate"
                      value="매장관리/판매" <c:if test = "${fn:contains(cate, '매장관리')}">checked</c:if>>
                      <span>매장관리/판매</span>
                  </label>
                  <label>      
                      <input type="checkbox" class="search_cate" id="j_cate4" name="j_cate"
                      value="주방보조" <c:if test = "${fn:contains(cate, '주방보조')}">checked</c:if>>
                      <span>주방보조</span>
                  </label>
                  <label>      
                      <input type="checkbox" class="search_cate" id="j_cate5" name="j_cate"
                      value="사무보조" <c:if test = "${fn:contains(cate, '사무보조')}">checked</c:if>>
                      <span>사무보조</span>
                  </label>
                  <label>      
                      <input type="checkbox" class="search_cate" id="j_cate6" name="j_cate"
                      value="음료제조" <c:if test = "${fn:contains(cate, '음료제조')}">checked</c:if>>
                      <span>음료 제조</span>
                  </label>
                  <label>      
                      <input type="checkbox" class="search_cate" id="j_cate9" name="j_cate"
                      value="배달" <c:if test = "${fn:contains(cate, '배달')}">checked</c:if>>
                      <span>배달</span>
                  </label>
                  <label>      
                      <input type="checkbox" class="search_cate" id="j_cate10" name="j_cate"
                      value="기타" <c:if test = "${fn:contains(cate, '기타')}">checked</c:if>>
                      <span>기타</span>
                  </label> 
               </td>
            </tr>
         </tbody>
      </table>
      <br>
         
      <div class="container">
         <!-- 여기부터는 게시물들 -->
          <c:if test="${empty j_list }">
          <div style="text-align: center; height: 200px;">
             선택된 조건과 일치하는 게시물이 존재하지 않습니다.
             <br><br><br>
             <img class="j_img" src="../resources/images/minilogo.png" style="width: 250px; height: 80px;"/>
             <br><br>
          </div>
          </c:if>
          <div class="boxes">
             <c:forEach var="j_list" items="${j_list}">
                 <div>
                   <div class="read" onclick="readView(${j_list.j_bno})">
                    <!-- a태그 누르면  -->   
                       <c:choose>
                          <c:when test="${empty j_list.j_img}">
                             <img class="j_img" src="../resources/images/아나바다2.png"/>
                          </c:when>
                          <c:otherwise>
                             <img class="j_img" src="/upload/${j_list.j_img }"/>
                          </c:otherwise>
                       </c:choose>
                       <div class="word2">${j_list.j_company }</div>
                       <div class="word2"><font style="font-weight: bolder;">${j_list.j_title }</font></div>
                       <div class="word2" style="font-size: 15px; color: #424242; padding-bottom: 0px;">${j_list.j_day }&nbsp;${j_list.j_start }:00 ~ ${j_list.j_end }:00</div>
                       <div class="word2" style="font-size: 15px; color: #424242; padding-bottom: 0px; padding-top: 1px">${j_list.j_method }&nbsp;${j_list.j_pay }원</div>
                       <div class="word2" style="font-size: 15px; color: #424242; padding-top: 1px">${j_list.j_addr1 }&nbsp;${j_list.j_addr2 }</div>
                       <!--<div class="word2">직종 : ${j_list.j_cate }</div>
                       <div class="word2">근무기간 : ${j_list.j_term }</div>-->
                    </div>
                </div>
             </c:forEach>
         </div>
      </div>
      
      <!-- 페이징 -->
      <div style="text-align: center">
         <c:if test="${pageMaker.prev }">
            <a href="job_list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a>
            <!-- page=2&perPageNum=10&searchType=tc&keyword=aaaaa "/list"로 이동(기본이 get방식) -->
         </c:if>
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
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
      <div class="sideBanner" style="padding-top: 10px; padding-bottom: 10px;">
        최근 본 알바
          <div>
          <button class="recent_btn" style="padding: 5px;"><img src="../resources/images/up.png" width="10px;" height="10px;"></button>
          <button class="recent_btn" style="padding: 5px;"><img src="../resources/images/down.png" width="10px;" height="10px;"></button>
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
     
     // 근무기간, 카테고리, 날짜 체크박스
     $("[class^='search_']").click(function () {
      
      var chk_name = $(this).attr("name");
      var chk_all = $(this).val();
      
      
      // 1)근무기간
      var chk_arr1 = [];
      var count1 = $("input[name=j_term]:checked").length;
      if(count1 < 4 || (count1 == 4 && chk_all == "모두")){
         $("input[name=j_term]:checked").each(function () {
               var chk1 = $(this).val();
            chk_arr1.push(chk1);
          });
      }else{
          alert("근무기간은 3개까지 선택가능합니다.");
          return false;
      }
      
      if(chk_name == "j_term" && chk_all == '모두'){ // 근무기간이 모두일때
         if($("#j_term1").is(":checked")){ // 모두선택한 상태에서 모두를 눌렀을 때
            chk_arr1 = [];
            chk_arr1.push(chk_all); // 모두만 담음
           }else{ // 모두 안눌렀을 때 모두 눌렀을때
              chk_arr1 = [];
              chk_arr1.push(chk_all); // 모두만 담음
          }
      }else if(chk_name == "j_term" && chk_all != '모두'){ // 모두 아닐때
         var index = chk_arr1.indexOf("모두"); // 모두가 있다면 인덱스 찾음
         if(index >= 0){
            chk_arr1.splice(index, 1); // a부터 1만큼 삭제 ( 자기자신 )
         }
      }
      
      if(chk_arr1.length == 0){ // 만약 모두 아니고 다른 거 하나 선택했는데 그거 해제했을 때(이거 처리안해주면 null 나옴)
         chk_arr1.push("모두");
      }
      
      
      // 2)근무횟수
      var chk_arr2 = [];
      var count2 = $("input[name=j_day]:checked").length;
      if(chk_arr1.length == 1 && chk_arr1[0] == "하루" && chk_name == "j_day" && chk_all != "모두"){
    	 alert("근무기간이 하루일때는 근무횟수를 선택할 수 없습니다.");
    	 return false;
      
      }else if(count2 < 4 || (count2 == 4 && chk_all == "모두")){ // 1)근무기간이 하루로 하나만 선택되어 있는데, 근무횟수 선택하려고 할 때
         $("input[name=j_day]:checked").each(function () {
            var chk2 = $(this).val();
            chk_arr2.push(chk2);
          });
      
      	  if(chk_name == "j_term" && chk_all != "하루" && chk_arr1.length == 1 && chk_arr1[0] == "하루" && chk_arr2[0] != "모두"){ //2) 근무횟수가 주?일로 이미 선택되어 있는데, 다른 근무기간을 해제해서 근무기간이 하루만 남을때
         	 alert("근무기간이 하루일때는 근무횟수를 선택할 수 없습니다.");
         	 return false;
      	  }
      	  
      	  if(chk_name == "j_term" && chk_all == "하루" && chk_arr1.length == 1 && chk_arr1[0] == "하루" && chk_arr2[0] != "모두"){ //3)근무횟수가 주?일로 이미 선택되어있는데, 근무기간을 하루만 하나 선택했을 때
        	 alert("근무기간이 하루일때는 근무횟수를 선택할 수 없습니다.");
        	 return false;
     	  }
      	  
      }else{
         alert("근무횟수는 3개까지 선택가능합니다.");
         return false;
      }

      if(chk_name == "j_day" && chk_all == '모두'){ // 근무기간이 모두일때
         if($("#j_day1").is(":checked")){ // 모두선택한 상태에서 모두를 눌렀을 때
            chk_arr2 = [];
            chk_arr2.push(chk_all); // 모두만 담음
           }else{ // 모두 안눌렀을 때 모두 눌렀을때
              chk_arr2 = [];
              chk_arr2.push(chk_all); // 모두만 담음
          }
      }else if(chk_name == "j_day" && chk_all != '모두'){ // 모두 아닐때
         var index = chk_arr2.indexOf("모두"); // 모두가 있다면 인덱스 찾음
         if(index >= 0){
            chk_arr2.splice(index, 1); // a부터 1만큼 삭제 ( 자기자신 )
         }
      }
      
      if(chk_arr2.length == 0){ // 만약 모두 아니고 다른 거 하나 선택했는데 그거 해제했을 때(이거 처리안해주면 null 나옴)
         chk_arr2.push("모두");
      }
      
      // 3)근무카테고리
      var chk_arr3 = [];
      var count3 = $("input[name=j_cate]:checked").length;
      if(count3 < 4 || (count3 == 4 && chk_all == "모두")){
         $("input[name=j_cate]:checked").each(function () {
            var chk3 = $(this).val();
            chk_arr3.push(chk3);
          });
      }else{
         alert("업직종은 3개까지 선택 가능합니다.");
         return false;
      }

      if(chk_name == "j_cate" && chk_all == '모두'){ // 근무기간이 모두일때
         if($("#j_cate1").is(":checked")){ // 모두선택한 상태에서 모두를 눌렀을 때
            chk_arr3 = [];
            chk_arr3.push(chk_all); // 모두만 담음
           }else{ // 모두 안눌렀을 때 모두 눌렀을때
              chk_arr3 = [];
              chk_arr3.push(chk_all); // 모두만 담음
          }
      }else if((chk_name == "j_cate" && chk_all != '모두')){ // 모두 아닐때
         var index = chk_arr3.indexOf("모두"); // 모두가 있다면 인덱스 찾음
         if(index >= 0){
            chk_arr3.splice(index, 1); // a부터 1만큼 삭제 ( 자기자신 )
         }
      }
      
      if(chk_arr3.length == 0){ // 만약 모두 아니고 다른 거 하나 선택했는데 그거 해제했을 때(이거 처리안해주면 null 나옴)
         chk_arr3.push("모두");
      }
      
      // 마지막 링크 이동
      location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
         '&j_addr1=' + $("#search_addr1 option:selected").val() + 
         '&j_term=' + chk_arr1 + 
         '&j_day=' + chk_arr2 + 
         '&j_cate=' + chk_arr3;
      
     }); 
      
     
     // 주소 select 박스 선택할때
      $('#search_addr1').change(function () {
         
        // 1)근무기간
        var chk_arr1 = [];
        $("input[name=j_term]:checked").each(function () {
           var chk1 = $(this).val();
           chk_arr1.push(chk1);
        });
        
        
        var chk_arr2 = [];
        $("input[name=j_day]:checked").each(function () {
           var chk2 = $(this).val();
           chk_arr2.push(chk2);
        });

        // 3)근무카테고리
        var chk_arr3 = [];
        $("input[name=j_cate]:checked").each(function () {
           var chk3 = $(this).val();
           chk_arr3.push(chk3);
        });
      
        // 마지막 링크 이동
        location.href = "job_list" + '${pageMaker.makeQuery(1)}' + 
         '&j_addr1=' + $("#search_addr1 option:selected").val() + 
         '&j_term=' + chk_arr1 + 
         '&j_day=' + chk_arr2 + 
         '&j_cate=' + chk_arr3;
     });
   

      // 알바 구인공고 쓰기 버튼 눌렀을 때
     $("#job_insert").click(function () {
         
         if(${empty id}){
            alert("로그인 후 이용해주세요.");
            return false;
         }else if(${id eq 'admin'}){
        	alert("관리자 모드입니다."); 
        	return false;
         }else{
               location.href = "job_insert";
         }
      })
      
      
      // 최근 본 알바 플로팅배너
      // 기본 위치(top)값
      var floatPosition = parseInt($(".sideBanner").css('top'));
      var floatHei = parseInt($(".sideBanner").outerHeight()); // 플로팅 배너 길이
      var footerTop = $('#footer').outerHeight(); // footer가 높이한 위치
      var headTop = $('#anbdHead').outerHeight();
      
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
          if (currentTop < headTop) {
              $(".sideBanner").stop().animate({
                 "top" : headTop
              }, 500);
           }
   
      }).scroll(); 
      
      
      $(".recent_btn").click(function () {
         var ih = $(this).index() == 0 ? -135 : 135; //위아래로 움직이는 px 숫자
         var obj = $('.recent_list');
         obj.animate({ scrollTop:obj.scrollTop() + ih }, 100);
       });
      
      
      // 최근 본 알바 불러오기. sessionStorage
      function get_recent_item(){
         
            
         //sessionStorage.clear(); 
         var $recentItemList = $("#recentItemList");
             
         var items = sessionStorage.getItem("recent_job");
             
         if(items == null){
              var li = "<br><br><br><br><li>최근 본 알바가 없습니다.</li>"
             $recentItemList.append(li);
         }
         
         var realitem = JSON.parse(items);
             
         var recent_array = new Array();
         //최근 본 게시물 삭제 체크
         for (var j = 0; j < 6; j++) {
                
             if(JSON.stringify(realitem[j]) != null){
                var recent = JSON.stringify(realitem[j].j_bno);
                recent_array.push(recent);
                //alert(recent_array);
             }
         }
             
         $.ajax({
              type: "get",
              url : "/job/recent_chk.ajax",
              data: {
                 recent_array : recent_array, 
              },
              traditional : true,
              success: function(data){
                 //alert("성공");
                 //alert(data);
                 //alert(JSON.stringify(realitem));
                       
                 //파싱된 객체의 길이로 for문 돌리기
                 for (var i = 0; i < 6; i++) {
                     
                     if(data.includes(realitem[i].j_bno)){
                         var j_bno = realitem[i].j_bno;
                         var j_title = realitem[i].j_title;
                         var j_img = realitem[i].j_img;
                         //alert("이미지 + /" + j_img + "/");
                                    
                         if(j_img != ""){
                            var li = "<li><a href='javascript:void(0);' onclick='readView(" + j_bno +")'><img style='border-radius: 5px;' width='100' height='100' src='/upload/"+j_img+"'/>"
                                + "<br><div class='word' style='font-size:14px;'>" + j_title+ "</div>" + "</a></li>";
                            //alert(i);
                         }else{
                             var li = "<li><a href='javascript:void(0);' onclick='readView(" + j_bno +")'><img style='border-radius: 5px;' width='100' height='100' src='../resources/images/아나바다2.png'/>"
                                + "<br><div class='word' style='font-size:14px;'>" + j_title+ "</div>" + "</a></li>";
                               //alert(i);
                         }
                     //ul에 붙이기
                     $recentItemList.append(li);
                     }
                }
                   
              },
              error : function(request, status, error) {
              	//alert("삭제 실패:" + error);
            }
          });
         
      }
      
      get_recent_item();
      // 이거 젤 마지막에 둬야지 정상적으로 실행됨

   });
   
   function readView(param) {
		
 	  var bno = param;
 	  
 	  // 게시물 상세보기로 이동할때 삭제된 게시물인지 유효성 체크
      $.ajax({
           type: "get",
           url : "/job/read_chk.ajax",
           data: {
              j_bno : bno, 
           },
           traditional : true,
           success: function(data){
              
              if(data > 0){
                  location.href="/job/job_read?j_bno=" + bno + 
                   "&page=${scri.page }&perPageNum=${scri.perPageNum }" + 
                   "&j_addr1=${scri.j_addr1 }" + 
                   "&j_term=${scri.j_term }" +
                   "&j_day=${scri.j_day}" + 
                   "&j_cate=${scri.j_cate}";
              }else{
                 alert("해당게시물은 삭제되었습니다.");
                 return false;
              }
                
           },
           error : function(request, status, error) {
              alert("상세보기 ajax 실패:" + error);
           }
       });
 	  
   }
   
</script>
</html>