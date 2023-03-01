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
<title>알바 상세보기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function () {

      var readForm = $("form[name='readForm']");
      
      $("#update").on("click", function () { // 수정 완료(페이징처리안함)
    	 
    	 location.href = "/job/job_update" + '?j_bno=' + ${j_read.j_bno};
    	 
      });
      
      $("#delete").on("click", function () { // 삭제하고(페이징처리 안함)
         if (!confirm("삭제하시겠습니까?")) {
              return false;
              
          } else {
            
            readForm.attr("action", "/job/job_delete");
            readForm.attr("method", "get"); 
            readForm.submit();
          }
      });
      
      $("#job_list").on("click", function () { // 게시판 목록으로 돌아감

    	 // 목록으로 돌아감(페이징처리함)
    	 location.href = "/job/job_list" + 
    	  '?page=' + ${scri.page} +
    	  '&perPageNum=' + ${scri.perPageNum} +
          '&j_addr1=' + '${scri.j_addr1}' + 
          '&j_term=' + '${scri.j_term}' + 
          '&j_day=' + '${scri.j_day}' + 
          '&j_cate=' + '${scri.j_cate}';
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
                      		'&j_bno=' + ${j_read.j_bno} + // resume_job.jsp에서 j_bno이름으로 값 받음
                      		'&j_addr1=' + '${scri.j_addr1}' + 
                      		'&j_term=' + '${scri.j_term}' + 
                      		'&j_day=' + '${scri.j_day}' + 
                      		'&j_cate=' + '${scri.j_cate}';
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
		           	   
		       //파싱된 객체의 길이로 for문 돌리기
		       for (var i = 0; i < 6; i++) {
			      		        
			      if(data.includes(realitem[i].j_bno)){
				       var j_bno = realitem[i].j_bno;
				       //alert(j_bno);
				       var j_title = realitem[i].j_title;
				       var j_img = realitem[i].j_img;
				       //alert("이미지 + /" + j_img + "/");
				       		        	
				       if(j_img != ""){
				       		var li = "<li><a href='javascript:void(0);' onclick='readView(" + j_bno +")'><img style='border-radius: 5px;' width='100' height='100' src='/upload/"+j_img+"'/>"
				       			+ "<br><div class='word' style='font-size:14px; '>" + j_title+ "</div>" + "</a></li>";
				       	    //alert(i);
				       }else{
				       		var li = "<li><a href='javascript:void(0);' onclick='readView(" + j_bno +")'><img style='border-radius: 5px;' width='100' height='100' src='../resources/images/아나바다2.png'/>"
				       			+ "<br><div class='word' style='font-size:14px; '>" + j_title+ "</div>" + "</a></li>";
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
      
      $(".recent_btn").click(function () {
         var ih = $(this).index() == 0 ? -135 : 135; //위아래로 움직이는 px 숫자
         var obj = $('.recent_list');
         obj.animate({ scrollTop:obj.scrollTop() + ih }, 100);
       });
      
      
      // 찜되었는지 안되어있는지 확인
      if("${heart}"==1){
		 $("input:checkbox[id='heart']").prop("checked",true);
		
	  }
      
      //찜버튼 이벤트 
      $("#heart").on("click", function() {
         
         if(${empty id}){
            alert("로그인 후 이용해주세요.");
            return false;
         }else if(${id eq 'admin'}){
        	alert("관리자 모드입니다.");
        	return false;
         }else{
            
        	if ($("#heart").is(":checked")) {
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
   
    // 이미지 확대 새창
    function imgDetail() {

    	var imgTmp = new Image();
    	imgTmp.src = "${j_read.j_img}";
    	
    	var popupX = (window.screen.width/2) - (510/2); 
    	var popupY = (window.screen.height/2) - (400/2); 
    	
    	if(imgTmp.src == ""){
			return false;
    	}else{
    		 var imgWin = window.open("", "알바이미지", "width=510px, height=400px, left=" + popupX + ", top=" + popupY);
    	     imgWin.document.write("<html>"
    	        +"<body>"
    	        +"<div style='margin: 0 auto; width: 500px'><img src='/upload/${j_read.j_img}' width='500px' height='400px'/></div>"
    	        +"</body></html>");
    	}
	}
   

</script>
<style>
   table{
      width: 100%;
   }
   tr, td{
      border-bottom: 1px solid #E5E5E5;
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
      max-height: 490px;
      min-height: 200px;
      top: 100px;
      background-color: white;
      border: 1px solid #E2E2E2;
      text-align: center;
      margin-left: 10px;
      margin-top: 10px;
   }
   .recent_list{
      height: 405px; 
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
   
   .recent_btn{
   	   all: unset; 
   	   cursor: pointer;
   }
   
   img{
     cursor: pointer;
   }
</style>
</head>
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

      <section class="section">
      <form name="readForm">
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
               <td colspan="5" style="border-bottom: 2px solid #626262; " >
                  <div style="display: inline-block; float: left; height: 30px; line-height: 40px;">
                  등록일: ${j_read.j_date }
                  </div>
               	  <div style="display: inline; float: right;">
               	  <c:if test="${j_read.id eq id}"><!-- 로그인한 아이디(세션에 저장된 아이디(id))와 작성자아이디(j_read.id)가 같으면 수정, 삭제 가능 -->
                     <button type="button" id="update" class="j_btn3">수정</button>
                     <button type="button" id="delete" class="j_btn3">삭제</button>
                  </c:if>
                  <c:if test="${j_read.id ne id}">
                     <button type="button" id="report" class="j_btn3">신고</button>
                  </c:if>
                  </div>
               </td>
            </tr>
      
            <tr>
               <td colspan="5">
               	  ${j_read.j_company }&nbsp;&nbsp;&nbsp;
               	  <img style="width: 13px; height: 13px;" src="../../resources/images/하트2.png">
	              <div style="display: inline; color: gray; vertical-align: 10%; font-size: 13px;">찜</div>
	              <div style="display: inline; color: gray; font-size: 13px; vertical-align: 10%;" id="heartCh">
	                 <div style="display: inline">${j_read.j_heart }</div>
	              </div>
               <div style="float: right;">
                  <label class="rach" style="cursor: pointer;">
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
               </div>
               <br>
               <font style="font-size: 25px; font-weight: bolder;">${j_read.j_title }</font>
               </td>
            </tr>
            
            <tr>
               <td width="250px;" style="text-align: center">
               <c:choose>
                  <c:when test="${empty j_read.j_img}">
                     <img src="../resources/images/아나바다2.png" width="250px" height="150px" />
                  </c:when>
                  <c:otherwise>
                     <img src="/upload/${j_read.j_img }" width="250px" height="150px" onclick="imgDetail()"/>
                  </c:otherwise>
               </c:choose>
               <td width="120px;" style="text-align: center">
                  <img src="../resources/images/job_pay.png" width="50px" height="50px">
                  <br><br>
                  <c:if test="${j_read.j_method eq '월급'}">월급</c:if>
                  <c:if test="${j_read.j_method eq '시급'}">시급</c:if>
                  <c:if test="${j_read.j_method eq '주급'}">주급</c:if>
                  <c:if test="${j_read.j_method eq '건당'}">건당</c:if>
                  ${j_read.j_pay }원
               </td>
               <td width="120px;" style="text-align: center">
                  <img src="../resources/images/job_week.png" width="50px" height="50px"/>
                  <br><br>${j_read.j_term }
                  <!-- 근무기간 -->
               </td>
               <td style="text-align: center">
                  <img src="../resources/images/job_cate.png" width="50px" height="50px"/>
                  <br><br>${j_read.j_cate }
               </td>
               <td style="text-align: center">
                  <img src="../resources/images/job_time.png" width="50px" height="50px"/>
                  <br><br>${j_read.j_day }&nbsp;&nbsp;${j_read.j_start }:00 ~ ${j_read.j_end }:00
                  <!-- 근무요일과 시간 -->
               </td>
            </tr>
            
            <!-- 내용 있을 때만 출력 -->
            <tr>
               <td colspan="6" style="padding: 0px;">
               <div style="float:left; width: 465px; min-height: 300px; border-right: 1px solid #E5E5E5; padding: 10px; padding-right: 20px;">
	               <font style="font-weight: bolder;">상세 내용</font><br><br>
	               <c:if test="${j_read.j_content eq null}">
	               등록된 상세 내용이 없습니다.
	               </c:if>
	               <c:if test="${j_read.j_content ne null}">
	               ${fn:replace(j_read.j_content, replaceChar, "<br/>")}
	               </c:if>
	           </div>
            
               <div style="float:left; width: 465px; padding: 10px; padding-left: 20px;">
               <font style="font-weight: bolder;">주소</font><br><br>
                  <div id="addr" style="padding-bottom: 10px;">${j_read.j_addr1 } ${j_read.j_addr2 }</div>
                  <div id="map" style="width:100%;height:200px; margin: auto"></div>
               </div>
               
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
                  <c:if test="${j_read.id ne id && id ne 'admin'}"><!-- 로그인한 아이디(세션에 저장된 아이디)와 작성자아이디가 같으면 수정, 삭제 가능 -->
                     <button type="button" id="resume" class="j_btn1" style="display: inline; width: 100px">지원하기</button>
                  </c:if>
                  <c:if test="${j_read.id eq id && id ne 'admin'}"><!-- 로그인한 아이디(세션에 저장된 아이디)와 작성자아이디가 같으면 수정, 삭제 가능 -->
                     <button type="button" id="show_resume" class="j_btn1" style="display: inline; width: 100px">지원자 보기</button>
                  </c:if>
               </td>
            </tr>
            
         </table>
         <br><br>
         
      </form>
      </section>
      
      <section class="aside">
            <div class="sideBanner"style=" padding-top: 10px; padding-bottom: 10px;">
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
</html>