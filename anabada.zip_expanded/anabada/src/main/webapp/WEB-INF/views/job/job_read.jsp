<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="../resources/css/j_styles.css">
<meta charset="UTF-8">
<title>알바 공고 상세보기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function () {

      var readForm = $("form[name='readForm']");
      
      $("#update").on("click", function () { // 수정 버튼 눌렀을 때
         readForm.attr("action", "/job/job_update"); // 수정 컨트롤러로 돌아감
         readForm.attr("method", "get");
         readForm.submit();
      });
      
      $("#delete").on("click", function () { // 삭제 버튼 눌렀을 때
         if (!confirm("삭제하시겠습니까?")) {
              return false;
          } else {
             
             // 삭제될때 최근 본 게시물도 삭제
             var data = sessionStorage.getItem("recent_job");
             data = JSON.parse(data);
             
             var j_bno = ${j_read.j_bno};
                 
             data.splice('j_bno', 1); // 삭제될때 최근 본 게시물도 삭제
             sessionStorage.setItem("recent_job", JSON.stringify(data));
             
            readForm.attr("action", "/job/job_delete"); // 삭제 컨트롤러로
            readForm.attr("method", "get"); // 여기서는 페이징처리 필요없으니까 post
            readForm.submit();
          }
      });
      
      $("#job_list").on("click", function () { 

    	 // 목록으로 돌아감(페이징처리함)
         readForm.attr("action", "/job/job_list"); 
         readForm.attr("method", "get");
         readForm.submit();
      });
      
      // 알바 지원하기 컨트롤러로 이동
      $("#resume").on("click", function () { 
         
         if(${empty id}){
            alert("로그인 후 이용해주세요.");
            return false;
         
         }else{
            
            $.ajax({
                 type: "get",
                 url : "/resume/resume_chk.ajax",
                 dataType : "json",
                 traditional : true,
                 data : {
                       j_bno: ${j_read.j_bno},
                     id: '${id}'
                 },
                 success:function(chk){
                     if(chk == 1){
                         if(confirm("이미 지원을 완료한 게시물입니다.\n내 알바 지원목록으로 이동하시겠습니까?")){
                           location.href="/resume/my_resume";
                        }else{
                           return false;
                        }
                     }else{
                         location.href= "/resume/resume_insert" + 
                      '?page=' + '${scri.page }' +
                      '&perPageNum=' + '${scri.perPageNum }' +
                      '&j_bno=' + '${j_read.j_bno}' + // resume_job.jsp에서 j_bno이름으로 값 받음
                      '&j_addr1=' + encodeURIComponent('${scri.j_addr1}') + 
                      '&j_term=' + encodeURIComponent('${scri.j_term}') + 
                      '&j_day=' + encodeURIComponent('${scri.j_day}') + 
                      '&j_cate=' + encodeURIComponent('${scri.j_cate}');
                     }
                 },
                 error : function(request, status, error) {
                     alert("오류:" + error);
               }
             });
         }
            
      });
      
      // 알바 지원자들 보기 컨트롤러로 이동. 페이징 처리 안했음
      $("#show_resume").on("click", function () { // 알바 지원자들 보기 버튼 눌렀을 때
         location.href = "/resume/resume_list?" + 
            "j_bno=" + '${j_read.j_bno}';
         
      });
      
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
      
      
      // 최근 본 알바!!!!!!!!sessionStroage
      function recent_item(){
          //세션에서 최초로 데이터 꺼내오기
          //세션이 비어있을 경우에 객체를 넣어야 함으로
          //비어있는지 유무를 파악
          var data = sessionStorage.getItem("recent_job");
           
          if(data){//만약 데이터가 들어있다면
              //alert("들어있음")
              //데이터가 있을 경우 json으로 파싱
              data = JSON.parse(data);
              //alert("사이즈 : "+data.length);
              
              var j_bno = ${j_read.j_bno};
              
              //중복될 번호들을 따로 뽑아
              //배열에 넣은후 값을 비교 한후
              var bno = [];
              for(var i = 0; i < data.length; i++){
                  bno.push(data[i].j_bno);
              }
              
              var idxOf = bno.indexOf(j_bno);
              //alert("중복 결과 : "+idxOf);
       
              if(idxOf<0){
                  //alert("중복안됨")
                  //중복이 되지 않으면 객체 삽입
                  //즉, 찾고자 하는 값이 배열에 들어 있지 않은 경우
                  data.unshift({
                         "j_bno":${j_read.j_bno},
                         "j_title":'${j_read.j_title}',
                         "j_img":'${j_read.j_img}'
                          });
              }else{
                  //alert("중복됨");
                 // 이미 봤다면 이전 기록 삭제하고 다시 추가
                 data.splice(idxOf, 1);
                  data.unshift({
                         "j_bno":${j_read.j_bno},
                         "j_title":'${j_read.j_title}',
                         "j_img":'${j_read.j_img}'
                          });
              };//if
              //alert("성공");
              
          }else{
          //세션에 데이터가 없을 경우 
          //새로운 배열 생성후
          //객체를 넣어줌
              //alert("비어있음")
              data=[{
                     "j_bno":${j_read.j_bno},
                     "j_title":'${j_read.j_title}',
                     "j_img":'${j_read.j_img}'
                      }];
          }//if
          
          //준비된 data배열을 넣고
          //JSON으로 저장
          sessionStorage.setItem("recent_job", JSON.stringify(data));
      }     
      
      // 최근 본 알바 불러오기. sessionStorage
      function get_recent_item(){
			
		   	
		//sessionStorage.clear(); 
		var $recentItemList = $("#recentItemList");
			    
		var items = sessionStorage.getItem("recent_job");
			    
		if(items == null){
			var li = "<br><br><li>최근 본 상품이 없습니다.</li>"
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
		           	   
		       //파싱된 객체의 길이로 for문 돌리기
		       for (var i = 0; i < 6; i++) {
			      		        
			      if(data.includes(realitem[i].j_bno)){
				       var j_bno = realitem[i].j_bno;
				       //alert(j_bno);
				       var j_title = realitem[i].j_title;
				       var j_img = realitem[i].j_img;
				       //alert("이미지 + /" + j_img + "/");
				       		        	
				       if(j_img != ""){
				       		var li = "<li><a href='/job/job_read?j_bno="+j_bno+"'><img width='100' height='100' src='/upload/"+j_img+"'/>"
				       			+ "<br><div class='word'>" + j_title+ "</div>" + "</a></li>";
				       	    //alert(i);
				       }else{
				       		var li = "<li><a href='/job/job_read?j_bno="+j_bno+"'><img width='100' height='100' src='../resources/images/아나바다2.png'/>"
				       			+ "<br><div class='word'>" + j_title+ "</divs>" + "</a></li>";
				       		//alert(i);
				       }
			      //ul에 붙이기
			      $recentItemList.append(li);
			      }
			      		    		
			   }
		      		 
		    },
		    error : function(request, status, error) {
				alert("삭제 실패:" + error);
			}
		});
			
      }
      
      $(".recent_btn").click(function () {
         var ih = $(this).index() == 0 ? -135 : 135; //위아래로 움직이는 px 숫자
         var obj = $('.recent_list');
         obj.animate({ scrollTop:obj.scrollTop() + ih }, 100);
       });
      
      //찜버튼 이벤트 
      $("#heart").on("click", function() {
         
         if(${empty id}){
            alert("로그인 후 이용해주세요.");
            return false;
         }else{
            
            if ($(this).prop('checked')) {
               $(".himg").attr("src", "../../resources/images/하트2.png");
   
               var params = {
                  j_bno : "${j_read.j_bno}",
                  id : "${id}"
               }
   
               $.ajax({
   
                  type : "POST",
                  url : "/job/addHeart",
                  data : params,
                  dataType : "json",
                  contetnType : "application/json",
                  success : function(res) {
                     //res.getEncoding('utf-8');
                     //var list = JSON.parse(res);
                     const element = document.getElementById('heartCh');
                     element.innerText = res.hnum;
   
                  },
                  error : function(request, status, error) {
                     alert("error:" + error);
                  }
   
               });
            } else {
               $(".himg").attr("src", "../../resources/images/하트1.png");
   
               var params = {
                  j_bno : "${j_read.j_bno}",
                  id : "${id}"
               }
   
               $.ajax({
   
                  type : "POST",
                  url : "/job/subHeart",
                  data : params,
                  dataType : "json",
                  contetnType : "application/json",
                  success : function(res) {
                     const element = document.getElementById('heartCh');
                     element.innerText = res.hnum;
                  },
                  error : function(XMLRequest, textStatus, errorThrown) {
                     alert("error:" + error);
                  }
   
               });
   
            }
         }
      }); // 하트 이벤트 끝
      
      // 신고버튼 눌렀을 때
      $("#report").click(function(){
         
         if(${empty id}){
            alert("로그인 후 이용해주세요.");
            return false;
         }else{
            
            // 신고된 적 있는지 확인
            $.ajax({
                  type: "get",
                  url : "/job/report_chk.ajax",
                  dataType :  'json',
                 traditional : true,
                  data : {
                     id: '${id}',
                     c_bno: ${j_read.j_bno},
                     board_type: 'job'
                  },
                  success:function(data){
                     
                     if(data == 1){
                        alert("이미 신고했습니다.");
                     }else{
                        window.open("/job/job_report?j_bno=${j_read.j_bno}", "신고", "width=450, height=500, left=0, top=0");
                     }
                      
                  },
                  error : function(request, status, error) {
                  alert("신고 실패:" + error);
               }
              });
         }
         
         
      });   
      
      recent_item();
      get_recent_item();
      
       
   });

</script>
<style>
   table{
      width: 100%;
   }
   tr, td{
      border-bottom: 1px solid #c9cdd2;
       /*border-left: 1px solid #c9cdd2;*/
       padding: 10px;
   }
     
   /*레이아웃*/
   #wapper {
      width: 1200px;
      margin: auto;
      height: auto;
   }
   .nav, .section {
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
      height: 450px;
      top: 100px;
      background-color: white;
      border: 1px solid #0C6BBC;
      text-align: center;
      margin-left: 10px;
      margin-top: 10px;
      border-radius: 5px;
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
   
   .word {
        width:110px;
     overflow: hidden;
     text-overflow: ellipsis;
     white-space: nowrap;
   }
</style>
</head>
<body>
   <div>
       <jsp:include page="../includes/nav.jsp" />
    </div>
      
    <div>
       <jsp:include page="../includes/miniHeader.jsp" />
    </div>
    
    <div id="wapper" >
         <section class="nav"></section>

      <section class="section">
      <form name="readForm" role="form">
         <input type="hidden" name="j_bno" value="${j_read.j_bno }">
         <input type="hidden" name="page" value="${scri.page }">
         <input type="hidden" name="perPageNum" value="${scri.perPageNum }">
         <input type="hidden" name="j_term" value="${scri.j_term }">
         <input type="hidden" name="j_addr1" value="${scri.j_addr1 }">
         <input type="hidden" name="j_day" value="${scri.j_day }">
         <input type="hidden" name="j_cate" value="${scri.j_cate }">
         <input type="hidden" name="j_img" value="${j_read.j_img }"><!-- 삭제할때 사용하려고 -->
   
   
         <table>
            <tr>
               <td colspan="3">
                   ${j_read.j_date }&nbsp;&nbsp;
                  <c:if test="${j_read.id eq id}"><!-- 로그인한 아이디(세션에 저장된 아이디(id))와 작성자아이디(j_read.id)가 같으면 수정, 삭제 가능 -->
                     <button type="button" id="update" class="j_btn3">수정</button>
                     <button type="button" id="delete" class="j_btn3">삭제</button>
                  </c:if>
                  <c:if test="${id eq 'admin'}"><!-- 로그인한 아이디(세션에 저장된 아이디(id))와 작성자아이디(j_read.id)가 같으면 수정, 삭제 가능 -->
                     <button type="button" id="delete" class="j_btn3">삭제</button>
                  </c:if>
                  <c:if test="${j_read.id ne id && id ne 'admin'}">
                     <button type="button" id="report" class="j_btn3">신고</button>
                  </c:if>
               </td>
               <td style="border-left: none; text-align: right">
                  <label class="rach">
                     <input type="checkbox" id="heart" name="j_heart" value="${j_read.j_heart }" />                
                     <c:choose>
                     <c:when test="${heart == 0 }">
                        <img class="himg" style="width: 30px; height: 30px;" src="../../resources/images/하트1.png">
                     </c:when>
                     <c:otherwise>
                        <img class="himg" style="width: 30px; height: 30px;" src="../../resources/images/하트2.png">
                     </c:otherwise>
                     </c:choose>
                  </label>
               </td>
               <td style="border-left: none; text-align: right">
                  <img style="width: 30px; height: 30px;" src="../../resources/images/하트2.png">
                  <div style="display: inline" id="heartCh">${j_read.j_heart }</div>
               </td>
            </tr>
      
            <tr>
               <td colspan="5">
               ${j_read.j_company }<br>
               <font style="font-size: 20px; font-weight: bolder;">${j_read.j_title }</font>
               </td>
            </tr>
            
            <tr>
               <td width="250px;" style="text-align: center">
               <c:choose>
                  <c:when test="${empty j_read.j_img}">
                     <img src="../resources/images/아나바다2.png" width="250px" height="250px"/>
                  </c:when>
                  <c:otherwise>
                     <img src="/upload/${j_read.j_img }" width="250px" height="250px"/>
                  </c:otherwise>
               </c:choose>
               <td width="120px;" style="text-align: center">
                  <c:if test="${j_read.j_method eq '월급'}">
                     <img src="../resources/images/월급2.png" width="70px" height="70px"/>
                  </c:if>
                  <c:if test="${j_read.j_method eq '시급'}">
                     <img src="../resources/images/시급2.png" width="70px" height="70px"/>
                  </c:if>
                  <c:if test="${j_read.j_method eq '주급'}">
                     <img src="../resources/images/주급2.png" width="70px" height="70px"/>
                  </c:if>
                  <c:if test="${j_read.j_method eq '건당'}">
                     <img src="../resources/images/건당2.png" width="70px" height="70px"/>
                  </c:if>
                  <br><br>${j_read.j_pay }원
               </td>
               <td width="120px;" style="text-align: center">
                  <img src="../resources/images/달력2.png" width="70px" height="70px"/>
                  <br><br>${j_read.j_term }
                  <!-- 근무기간 -->
               </td>
               <td style="text-align: center">
                  <img src="../resources/images/카테고리2.png" width="70px" height="70px"/>
                  <br><br>${j_read.j_cate }
               </td>
               <td style="text-align: center">
                  <img src="../resources/images/시계.png" width="70px" height="70px"/>
                  <br><br>${j_read.j_day }&nbsp;&nbsp;${j_read.j_start }:00 ~ ${j_read.j_end }:00
                  <!-- 근무요일과 시간 -->
               </td>
            </tr>
            
            <!-- 내용 있을 때만 출력 -->
            <c:if test="${j_read.j_content ne null}">
            <tr>
               <td colspan="6">
               <font style="font-weight: bolder;">상세내용</font><br><br>
               ${fn:replace(j_read.j_content, replaceChar, "<br/>")}
               </td>
            </tr>
            </c:if>
            
            <tr>
               <td colspan="5">
               <font style="font-weight: bolder;">주소</font><br><br>
                  <div id="addr" style="padding-bottom: 10px;">${j_read.j_addr1 } ${j_read.j_addr2 }</div>
                  <div id="map" style="width:100%;height:200px; margin: auto"></div>
               
               <!-- 해당 주소에 해당하는 지도 띄우기 -->   
                  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd033a39a25f6e21dbc70db3f498f6e8&libraries=services"></script>
                  <script>
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                      mapOption = {
                          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                          level: 3 // 지도의 확대 레벨
                      };  
                  
                  // 지도를 생성합니다    
                  var map = new kakao.maps.Map(mapContainer, mapOption); 
                  
                  // 주소-좌표 변환 객체를 생성합니다
                  var geocoder = new kakao.maps.services.Geocoder();
                  
                  var addr = document.getElementById('addr').innerText;
                  // 주소로 좌표를 검색합니다
                  geocoder.addressSearch(addr, function(result, status) {
                  
                      // 정상적으로 검색이 완료됐으면 
                       if (status === kakao.maps.services.Status.OK) {
                  
                          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                  
                          // 결과값으로 받은 위치를 마커로 표시합니다
                          var marker = new kakao.maps.Marker({
                              map: map,
                              position: coords
                          });
                        
                          /*
                          // 인포윈도우로 장소에 대한 설명을 표시합니다
                          var infowindow = new kakao.maps.InfoWindow({
                              content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                          });
                          infowindow.open(map, marker);
                          */
                  
                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                          map.setCenter(coords);
                      } 
                  });    
                  </script>
               
               </td>
            </tr>
            <tr style="border-bottom: 0px">
               <td colspan="6" style="border-bottom: 0px; text-align: center">
                  <button type="button" id="job_list" class="j_btn1" style="display: inline; width: 100px">알바 게시판</button>
                  <c:if test="${j_read.id ne id}"><!-- 로그인한 아이디(세션에 저장된 아이디)와 작성자아이디가 같으면 수정, 삭제 가능 -->
                     <button type="button" id="resume" class="j_btn1" style="display: inline; width: 100px">지원하기</button>
                  </c:if>
                  <c:if test="${j_read.id eq id}"><!-- 로그인한 아이디(세션에 저장된 아이디)와 작성자아이디가 같으면 수정, 삭제 가능 -->
                     <button type="button" id="show_resume" class="j_btn1" style="display: inline; width: 100px">지원자 보기</button>
                  </c:if>
                  
               </td>
            </tr>
            
         </table>
         <br><br>
         
      </form>
      </section>
      
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
</html>