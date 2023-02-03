<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.anabada.web.vo.MemberVO"%>
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



<meta charset="UTF-8">
<title>${read.p_title}</title>
<style type="text/css">
/*  img {
   width: 500px;
   height: 500px;
}
 */
.rach input[type='checkbox'] {
	display: none;
}

.rach input[type='checkbox']+span {
	display: inline-block;
	padding: 5px 5px;
	border: 1px solid #AEB6BF;
	border-radius: 10px;
	background-color: #F7ECEC;
	text-align: center;
	cursor: pointer;
	color: #E55555;
}

.rach input[type='checkbox']:checked+span {
	background-color: #FD7D7D;
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

#textbox {
	width: 490px;
	height: 320px;
	border-radius: 20px;
	border-top-left-radius: 0px;
	border: 2px solid #AFAFAF;
	padding: 17px;
}

#re {
	text-align: center;
	font-weight: bold;
	color: white;
	background-color: #AFAFAF;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	height: 30px;
	border-bottom: 2px;
}

.box {
	display: inline;
	border-radius: 7px;
	padding: 5px;
	background-color: #AFAFAF;
	text-align: center;
	font-weight: bold;
	color: white;
	margin-right: 0px;
	letter-spacing: 2px;
}

.reBox {
	padding: 5px;
	background-color: #AFAFAF;
	text-align: center;
	font-weight: bold;
	color: white;
	letter-spacing: 2px;
	border-top-left-radius: 7px;
	border-top-right-radius: 7px;
	width: 100px;
}

#userBK {
	width: 100px;
	display: inline-block;
	border-radius: 7px;
	padding: 5px;
	background-color: #AFAFAF;
	text-align: center;
	font-weight: bold;
	color: white;
	margin-right: 10px;
	letter-spacing: 2px;
}

#btndiv {
	float: right;
	margin-bottom: 30px;
}

#book option, #book {
	text-align: center;
	font-weight: bold;
	color: #3D3D3D;
	font-size: 17px;
}

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

#reviewBox {
	margin-top: 70px;
	margin-bottom: 70px;
}

#reviewBox td {
	width: 510px;
}

#select_table {
	width: 100%;
}

.info, .info td {
	padding-bottom: 10px;
}

.m_label {
	width: 100%;
	border: 1px solid #e9e9e9;
	cursor: pointer;
	padding: 10px;
}

.n_receiver { /*모달창 사람들 라디오버튼*/
	display: none;
}

.p_img {
	width: 110px;
	height: 110px;
	border-radius: 10px;
}
/*끝 */
.noReview {
	text-align: center;
	color: #AFAFAF;
	margin-top: 50px;
	font-size: 20px;
}

.cunsumer {
	border-radius: 7px;
	background-color: #AFAFAF;
	display: inline-block;
	color: white;
	font-size: 11px;
	padding: 0px 2px 0px 2px;
}

#alarm {
	background: no-repeat;
	border: none;
}
.n_btn1{

width: 200px;
height: 50px;
font-weight: bold;
font-size: 20px;


}
#btnDiv{

margin-left: 60px;
}
</style>
<script type="text/javascript">
   $(document).ready(function() {
      
      // 쪽지 보내기 버튼 눌렀을 떄 모달창 띄우기
      $("button[name=n_send]").on("click", function () { 
         $("#n_content").attr("placeholder", "");
         $("#n_content").val("");
         $("#n_receiver").attr("placeholder", "");
         $('#noteModal').modal("show"); 
      });
   
      // 모달창에서 쪽지보내기 버튼 눌렀을 때
       $("#note_submit").click(function(){
          
          if($("#n_content").val() == null || $("#n_content").val() == ""){
             $("#n_content").attr("placeholder", "내용을 작성해주세요.");
             return false;
          }
          if($("#n_receiver").val() == null || $("#n_receiver").val() == ""){
             $("#n_receiver").attr("placeholder", "받는 아이디를 작성해주세요.");
             return false;
          }
          
           $.ajax({
               type: "get",
               url : "/note/note_insert.ajax",
                dataType : "json",
               data : $("#note_form").serialize(),
               success:function(data){
                   alert("쪽지 전송 완료");
                   alert($("#pno").val());
               },
               error : function(request, status, error) {
               alert("쪽지 전송 실패:" + error);
            }
           });
           
           $("#noteModal").modal("hide");
       });
   
   
      
      var formObj = $("form[name='readForm']");
      var floatPosition = parseInt($(".sideBanner").css('top')); //100
      var floatHei = parseInt($(".sideBanner").outerHeight()); // 플로팅 배너 길이 450
      var footerTop = $('#footer').outerHeight(); // footer가 위치한 높이 
      var headTop = $('#anbdHead').outerHeight();
      // scroll 인식
      $(window).scroll(function() {
         // 현재 스크롤 위치
         var currentTop = $(window).scrollTop();
         var bannerTop = currentTop + floatPosition + "px";
         var val = $(document).height() - footerTop;
         var hei = currentTop +  floatHei;
         //이동 애니메이션
         if (hei < footerTop) {
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
      
      
      
      
      
      // 최근 본 목록 구현 - sessionStroage
      function recent_item(){
          //세션에서 최초로 데이터 꺼내오기
          //세션이 비어있을 경우에 객체를 넣어야 함으로
          //비어있는지 유무를 파악
          var data = sessionStorage.getItem("recent_product");
           
          if(data){//만약 데이터가 들어있다면
            
              //데이터가 있을 경우 json으로 파싱
              //JSON.parse() : json 문자열을 javascript객체로 변환
              data = JSON.parse(data);
              //alert("사이즈 : "+data.length);
              
              var pno = '${read.pno}';
              
              //중복될 번호들을 따로 뽑아
              //배열에 넣은후 값을 비교 한후
              var bno = [];
              for(var i = 0; i < data.length; i++){
                  bno.push(data[i].pno);
              }
              
              var idxOf = bno.indexOf(pno);
              //alert("중복 결과 : "+idxOf);
       
              if(idxOf<0){
                  
                  //중복이 되지 않으면 객체 삽입
                  //즉, 찾고자 하는 값이 배열에 들어 있지 않은 경우
                  //.unshift() : 배열의 맨 앞에 값을 추가한다.
                  data.unshift({
                         "pno":'${read.pno}',
                         "p_title":'${read.p_title}',
                         "p_img":'${filelist[0].filepath}'
                          });
              }else{
                 
                 // 이미 봤다면 이전 기록 삭제하고 다시 추가
                 data.splice(idxOf, 1);
                  data.unshift({
                      "pno":'${read.pno}',
                         "p_title":'${read.p_title}',
                         "p_img":'${filelist[0].filepath}'
                          });
              };//if
              //alert("성공");
           
          }else{
          //세션에 데이터가 없을 경우 
          //새로운 배열 생성후
          //객체를 넣어줌
          //    alert("비어있음")
              data=[{
                   "pno":'${read.pno}',
                      "p_title":'${read.p_title}',
                      "p_img":'${filelist[0].filepath}'
                      }];
          }//if
          
          //준비된 data배열을 넣고
          //JSON으로 저장
          sessionStorage.setItem("recent_product", JSON.stringify(data));
       
        
      }     
       
      function get_recent_item(){
          
          var $recentItemList = $("#recentItemList");
          
          var items = sessionStorage.getItem("recent_product");
          //alert(key)
          
          //인수로 전달받은 문자열을 자바스크립트 객체로 변환
          var realitem = JSON.parse(items);
          
          //파싱된 객체의 길이로 for문 돌리기
           for (var i = 0; i < realitem.length; i++) {
               var pno = realitem[i].pno;
              var p_title = realitem[i].p_title;
              var p_img = realitem[i].p_img; 
            //  alert(pno+", "+p_title+", "+p_img);
            
            if (p_img != null || p_img != "") {
               var li = "<li  ><a href='/product/readView?pno="
                     + pno
                     + "'><img width='100' height='100' src='"+p_img+"'/>"
                     + "<br><div class='sideword' >" + pno + p_title + "</div>"
                     + "</a></li>";
            }
            if (p_img == null || p_img == "") {
               var li = "<li  ><a href='/product/readView?pno="
                     + pno
                     + "'><img width='100' height='100' src='../resources/images/아나바다.png'/>"
                     + "<br><div class='sideword' >" + pno + p_title + "</div>"
                     + "</a></li>";
            }

            //ul에 붙이기
            $recentItemList.append(li);
         }
          
      }
      
      $(".recent_btn").click(function() {
         var ih = $(this).index() == 0 ? -130 : 130; //위아래로 움직이는 px 숫자
      //var ih = $(this).index() == 0 ? -405 : 405; //위아래로 움직이는 px 숫자
      // 위로 : 0 아래로 : 1 

      var obj = $('.recent_list');

       obj.animate({ scrollTop:obj.scrollTop() + ih }, 100);
   });
      
      
      
      
      recent_item();
      get_recent_item();
      //최근본 목록 끝
      
      
      
      
      
      
      
      //목록으로 가기 버튼
      $("#listbtn").on("click", function() {
         location.href = "/product/list";
      })
      //수정하기 버튼
      $("#rebtn").on("click", function() {
         
         if(confirm("게시글을 수정하시겠습니까 ? ")){
            formObj.attr("action", "/product/updateView");
            formObj.attr("method", "get");
            formObj.submit();
         }else{
            return false;
         }
         
      
      })
      //삭제하기 버튼 
      $("#delbtn").on("click", function() {
         if (confirm("게시글을 삭제하시겠습니까?   삭제한 게시글은 복구 할 수 없습니다.")) {
            formObj.attr("action", "/product/delete");
            formObj.attr("method", "post");
            formObj.submit();
         } else {
            return false;
         }
      })
      //슬라이드쇼 구현 
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
      //찜버튼 이벤트 
      $("#heart").on("click", function() {
         if ($(this).prop('checked')) {
            $(".himg").attr("src", "../../resources/images/heartB.png");
            var params = {
               pno : "${read.pno}",
               id : "${id}"
            }
            $.ajax({
               type : "POST",
               url : "/product/addHeart",
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
            $(".himg").attr("src", "../../resources/images/heartA.png");
            var params = {
               pno : "${read.pno}",
               id : "${id}"
            }
            $.ajax({
               type : "POST",
               url : "/product/subHeart",
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
      }); // 하트 이벤트 끝
      
      
      // 처음 화면에 들어올때 end 이면 수정 불가능 하도록 
      var book = document.getElementById('bookBK');
      var str = $("#book option:selected").val();
      if(str == 'end'){
    	  $("#book").prop('disabled',true);
      }
      
      
      
      
      //사용자가 상품 판매 상태 변경시 
      $("#book").on("change", function() {
         var book = document.getElementById('bookBK');
         var str = $("#book option:selected").val(); // 선택된 값
         
         
         if(str == 'end'){
            $('#selectModal').modal("show");
            
            $("#book").prop('disabled',true); // 판매 완료시 상태 변경 불가능 하도록 막음 
            
         }
         
         // 모달창 띄우는 쿼리 
         //모달창에서 id 선택  var dd + ''
         var params = {
            pno : "${read.pno}",
            p_buy : str
            // 변수 전달 구매자 아이디 
         }
         $.ajax({
            type : "POST",
            url : "/product/change",
            data : params,
            dataType : "json",
            contetnType : "application/json",
            success : function(res) {
            },
            error : function(request, status, error) {
             
            }
         });
      }); //상품 상태 변경 끝 
      
      
      
      
      if(${read.id != id }){
         bookCh();
      }
      
   
      
      
      
      
      //모달 
      // 모달창에서 선택 완료 버튼 누르면
       $("#review_note").click(function(){
          
          // 사람 선택했는지 체크
          var chk = $('input[name=n_receiver]').is(":checked");
          if(!chk){
             alert("구매자를 선택해주세요.");
             return false;
          }
          
          if(confirm("구매자를 확정하시겠습니까?")){
                var n_receiver = $("input[name=n_receiver]:checked").val();
              
             if(n_receiver == "" || n_receiver == null){
                alert("구매를 확정했습니다.");
                $("#selectModal").modal("hide");
                return false;
//                // 해당 사항 없음을 선택하면 리뷰 쪽지 안가게 막음
//                // 이때도 readonly로 바뀌도록
             }
             
             $.ajax({
                 type: "get",
                 url : "/note/review_note.ajax",
                 data: {
                    n_receiver : n_receiver,
                    n_sender : '${id}', 
                    n_rno : ${read.pno}, 
                    n_content: '판매가 확정되었습니다. 후기를 작성해주세요.',
                    n_type: 'review',
                    },
                 dataType :  'json',   // 데이터 타입을 Json으로 변경
                 traditional : true,
                 success: function(data){
                     alert("구매자가 확정되었습니다.");
                 }
              });
            
            $("#selectModal").modal("hide"); // 모달창 닫기
//            // 이때 readonly로 바꾸기
          
          }else{
             return false;
          }
              
      
      });
   
    // 사람 선택하면 색깔 바뀌는 코드
       $('input[name=n_receiver]').change(function(){
          $('.m_label').css('background-color', '#fff');
          if($(this).is(':checked')){
              $(this).closest('.m_label').css('background-color', '#e9e9e9');
          }
              
       });
      
      //모달 끝 
      
   
      
      
      //리뷰 신고 
      $(".reviewCom").on("click", function() {
		var btn_val = $(this).val(); 
		 if(  "${id}" ==""){
			   alert('로그인 후 이용해주세요');
			   return; 
		   }else{

			$.ajax({
		            type: "get",
		            url : "/product/reviewReport_chk",
		            dataType :  'json',
			        traditional : true,
		            data : {
		            	id: '${id}',
		            	c_bno: ${read.pno},
		            	board_type: 'review'
		            },
		            success:function(data){
		            	
		            	if(data == 1){
		            		alert("이미 신고한 게시글입니다.");
		            	}else{
		            		
		            		 var url = "/product/reviewReport?r_no="+btn_val;
		            		 window.open(url, "신고", "width=485, height=500, left=700, top=30");
		            	}
		                
		            },
		            error : function(request, status, error) {
						alert("신고 실패:" + error);
					}
		        });
		   }

		
	})
      
      
      
	
	
	

	
	
	

	
	
	
	
	
	
	
	
	
      
      
   });
   //User가 제품 판매 상태 보기 
    function bookCh() {
     
     
      var p_buy = "${read.p_buy}";
      const element = document.getElementById("userBK");
      
      
      console.log(element);
   
      if (p_buy == 'ing') {
         element.innerText = '판매중';
      } else if (p_buy == 'book') {
         element.innerText = '예약중';
      } else {
         element.innerText = '판매완료';
      }
   }


function complaint() {
	   if(  "${id}" ==""){
		   alert('로그인 후 이용해주세요');
		   return; 
	   }else{

		$.ajax({
	            type: "get",
	            url : "/product/report_chk",
	            dataType :  'json',
		        traditional : true,
	            data : {
	            	id: '${id}',
	            	c_bno: ${read.pno},
	            	board_type: 'pboard'
	            },
	            success:function(data){
	            	
	            	if(data == 1){
	            		alert("이미 신고한 게시글입니다.");
	            	}else{
	            		 window.open("/product/report?pno=${read.pno}", "신고", "width=485, height=500, left=700, top=30");
	            	}
	                
	            },
	            error : function(request, status, error) {
					alert("신고 실패:" + error);
				}
	        });



}
	
}
   
   
	   
   
</script>

</head>
<body>

	<!-- header -->

	<div id="anbdHead">
		<div>
			<jsp:include page="../includes/nav.jsp" />
		</div>
		<div>
			<jsp:include page="../includes/header.jsp" />
		</div>
	</div>

	<!-- header end -->

	<div id="wapper"  >
		<section class="nav"></section>
		<section class="section" style="border-top: 1px solid #e5e5e5">



	<!-- 		<button id="listbtn">목록으로가기</button> -->


			<form name="readForm" role="form">

				<input type="hidden" name="pno" value="${read.pno }">


				<table style="margin-left: auto; margin-right: auto;">
					<tr>



						<td colspan="10" style="text-align: right; padding-right: 20px;">


							<div style="display: inline;">
							<br> <br>

								<label class="rach"><input type="checkbox" id="heart" name="p_heart" value="${read.p_heart }" /> <c:choose>
										<c:when test="${heart==0 }">
											<img class="himg" style="width: 60px; height: 60px;" src="../../resources/images/heartA.png">
										</c:when>
										<c:otherwise>
											<img class="himg" style="width: 60px; height: 60px;" src="../../resources/images/heartB.png">
										</c:otherwise>
									</c:choose> </label>

							</div> <c:if test="${id == read.id }">

								<button id="rebtn" style="background-color: white; border: none;" title="글 수정">
									<img src="../resources/images/edit.png" style="width: 40px; height: 40px;">
								</button>
								<button id="delbtn" style="background-color: white; border: none;" title="삭제">
									<img src="../resources/images/garbage.png" style="width: 40px; height: 40px;">
								</button>

							</c:if>
						</td>

					</tr>




					<tr>
						<td colspan="10">
							<hr style="height: 2px; background-color: #DBD9D9;">
						</td>
					</tr>


					<tr style="height: 15px;">
						<td colspan="6" rowspan="10" style="background-color: white;">

							<div class="single-item" id="slick" style="width: 500px; height: 500px;">

								<c:choose>
									<c:when test="${ empty filelist }">

										<div class="imgbox">
											<img width="500px;" height="500px;" src="/tomcatImg/img.png">
										</div>
									</c:when>
									<c:otherwise>

										<c:forEach items="${filelist}" var="list">
											<div class="imgbox">
												<img width="500px;" height="500px;" src="${list.filepath }" name="p_file">
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>



						</td>

						<td>&nbsp;</td>
						<td colspan="3" style="font-weight: bold; font-size: 35px;">${read.p_title }</td>
					</tr>


					<tr>
						<td>&nbsp;</td>
						<td colspan="2">판매자 : ${read.id }</td>
						<td>&nbsp;</td>

					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="2">판매가격 : ${read.p_cost }원</td>
						<td><c:choose>
								<c:when test="${read.id== id }">
									<select id="book" class="form-select form-select-sm" aria-label=".form-select-sm example">
										<option value="ing" <c:out value="${read.p_buy eq 'ing' ? 'selected' :''} "/>>판매중</option>
										<option value="book" <c:out value="${read.p_buy eq 'book' ? 'selected' :''} "/>>예약중</option>
										<option value="end"   <c:out value="${read.p_buy eq 'end' ? 'selected' :''} "/>>판매완료</option>

									</select>
								</c:when>
								<c:otherwise>
									<div id="userBK"></div>

								</c:otherwise>

							</c:choose></td>

					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="3">게시일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${read.p_regdate }" /></td>
					</tr>


					<tr>
						<td colspan="4">
							<hr style="margin-top: 0px; margin-bottom: 0px;">
						</td>
					</tr>



					<tr height="60px;">
						<td>&nbsp;</td>
						<td><span style="font-size: 20px;">👀</span> ${read.p_count } &nbsp;&nbsp;&nbsp; <span style="color: red; font-size: 20px;"> ❤</span>
							<div style="display: inline-block;" id="heartCh">${read.p_heart }</div> <br></td>
						<td>&nbsp;</td>

						<td>
							<button type="button" value="1" id="alarm" onclick="complaint()">
								<img width="30px;" height="30px;" src="../resources/images/u_alarm.png"> <font style="color: gray;"> 신고하기 </font>
							</button>
						</td>

					</tr>




					<tr>
						<td>&nbsp;</td>
						<td>
							<div class="box">카테 고리</div> ${read.p_type }
						</td>
						<td colspan="2">&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td><div class="box">제품 상태</div> ${read.p_con }</td>
						<td colspan="2">&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td><div class="box">거래 유형</div> <c:if test="${read.sell_a != '0' }">${read.sell_a} [ ${read.p_local} ] </c:if> <c:if test="${read.sell_b != '0' }">${read.sell_b}</c:if></td>
						<td colspan="2">&nbsp;</td>

					</tr>

					<tr>


						<td colspan="3"><c:if test="${read.id != id }">
								<div id="btnDiv" >

									<button type="button" name="n_send" class="n_btn1 btn btn-outline-secondary " style="display: block; margin: auto;">쪽지 보내기</button>
								</div>
							</c:if> <c:if test="${read.id == id }">
								<br>
								<br>
							</c:if></td>
					</tr>
					<tr>
						<td colspan="10">
							<hr style="height: 2px; background-color: #DBD9D9;">
						</td>
					</tr>



				</table>





				<!-- 관련 상품 보여주기  -->
				<table style="margin-top: 50px; margin-left: auto; margin-right: auto;">
					<tr>
						<td id="re">관 련 상 품</td>
					</tr>


					<tr>
						<c:forEach items="${listImg}" var="listImg">
							<td><c:choose>
									<c:when test="${ empty listImg.s_filePath}">

										<div onclick="location.href='/product/readView?pno=${listImg.s_pno}&p_type=${listImg.s_p_type }'" style="display: inline-table;">
											<img src="/tomcatImg/img.png" onmouseover="this.style.opacity =0.2 " onmouseout="this.style.opacity =1" style="width: 200px; height: 200px;">

										</div>

									</c:when>
									<c:otherwise>
										<div onclick="location.href='/product/readView?pno=${listImg.s_pno}&p_type=${listImg.s_p_type }'" style="display: inline-table;">
											<img src="${listImg.s_filePath }" onmouseover="this.style.opacity =0.2 " onmouseout="this.style.opacity =1" style="width: 200px; height: 200px;">

										</div>


									</c:otherwise>
								</c:choose></td>
						</c:forEach>
					</tr>

					<tr>
						<c:forEach items="${listImg}" var="listImg">
							<td style="text-align: center; font-weight: bold;">${listImg.s_title}</td>
						</c:forEach>


					</tr>




				</table>

				<!-- 관련 상품 끝 -->


				<!-- 상품 상세 설명  및 구매자 후기 -->
				<table id="reviewBox"  >
					<tr>
						<td>
							<div class="reBox">상 품 상 태</div>
						</td>
						<td>
							<div class="reBox">상점 후기</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="textbox">${read.p_content }</div>
						</td>



						<td>
							<div id="textbox" style="padding-top: 3px;">

								<c:choose>
									<c:when test="${reviewList[0] != null }">
										<!-- 상점 후기  -->
										<table>
											<c:forEach items="${reviewList }" var="review">
												<tr>
													<td>
														<div class="cunsumer">작성자</div> ${review.r_consumer}
													</td>
													<td style="font-size: small;"><c:if test="${review.r_score == 0.3 }"> ⭐⭐⭐⭐ </c:if> <c:if test="${review.r_score == 0.2 }"> ⭐⭐⭐ </c:if> <c:if test="${review.r_score == 0.1 }"> ⭐⭐ </c:if> <c:if test="${review.r_score == -0.1 }"> ⭐ </c:if></td>



													<td><font style="font-size: small; color: gray;">🕗 ${review.r_date}</font></td>
													<td>
														<button type="button" value="${review.r_no}" id="alarm" class="reviewCom">
															<img width="15px;" height="15px;" src="../resources/images/u_alarm.png"> <font style="font-size: small; color: gray;"> 신고하기 </font>
														</button>
													</td>

												</tr>
												<tr>
													<td colspan="4">${review.r_content }
														<hr style="margin: 5px 0px 5px 0px">
													</td>
												</tr>

											</c:forEach>
										</table>
										<!-- 후기 끝 -->
									</c:when>

									<c:otherwise>
										<div class="noReview">등록된 후기가 없습니다.</div>
									</c:otherwise>

								</c:choose>









								<!-- 후기 게시판 페이지 네이션 -->
								<nav style="margin-left: 50%">
									<ul class="pagination">
										<li class="page-item"><c:if test="${pageMaker.prev }">
												<a class="page-link" href="href=" readView${pageMaker.makeSearch(pageMaker.startPage - 1,read.pno,read.p_type )}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
											<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>><a class="page-link" href="readView${pageMaker.makeSearch(idx,read.pno,read.p_type)}">${idx }</a></li>
										</c:forEach>


										<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
											<li class="page-item"><a class="page-link" href="readView${pageMaker.makeSearch(pageMaker.endPage + 1,read.pno,read.p_type)}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
									</ul>
								</nav>


								<!-- 페이지 네이션 끝 -->
							</div>

						</td>






					</tr>
				</table>


				<!-- 상품 상세 설명 및 구매자 후기  끝  -->








			</form>
		</section>
		<!-- 사이드바 - 최근본 상품 목록 -->
		<section class="aside">
			<div class="sideBanner">
				최근 본 상품
				<div class="r_btn">
					<button class="recent_btn">▲</button>
					<button class="recent_btn">▼</button>
				</div>
				<div class="recent_list ">
					<ul id="recentItemList">
					</ul>
				</div>
			</div>
		</section>
		<!-- 최근본 상품 끝  -->

	</div>





	<!-- footer -->
	<div id="footer"  >
		<div id="footer"  >
			<jsp:include page="../includes/footer.jsp" />
		</div>
	</div>
	<!-- footer end -->


	<!-- 모달 내용 -->
	<div class="modal fade" id="selectModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content ">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">구매자 선택하기</h1>
				</div>
				<form id="select_form">
					<div class="modal-body">
						<table id="select_table">
							<tbody>
								<tr class="info">
									<td width="130px;"><c:if test="${empty filelist[0].filepath }">
											<img class="p_img" src="/tomcatImg/img.png">
											<!-- 해당 썸네일 이미지 경로 -->
										</c:if> <c:if test="${not empty filelist[0].filepath }">
											<img class="p_img" src="${filelist[0].filepath }">
											<!-- 해당 썸네일 이미지 경로 -->
										</c:if></td>
									<td>${read.p_title}<br> ${read.p_cost}<br>
									</td>
								</tr>

								<c:forEach items="${m_list }" var="m_list">
									<tr>
										<td colspan="2"><label class="m_label"> <input type="radio" name="n_receiver" class="n_receiver" value="${m_list }"> ${m_list }
										</label></td>
									</tr>
								</c:forEach>

								<tr>
									<td colspan="2"><label class="m_label"> <input type="radio" name="n_receiver" class="n_receiver" value=""> 해당 사항 없음
									</label></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" id="review_note">선택 완료</button>
					<button class="btn btn-primary" type="button" id="finsh" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 end  -->

	<!-- 쪽지 모달 -->
	<div class="modal fade" id="noteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content ">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">쪽지</h1>
				</div>
				<form id="note_form">
					<input type="hidden" name="n_type" value="no"> <input type="hidden" name="n_rno" id="n_rno" value="${read.pno}">
					<div class="modal-body">
						<table style="width: 100%">
							<tbody>
								<tr>
									<th>보내는 아이디</th>
									<td><input type="text" style="margin-left: 10%; width: 85%;" id="n_sender" name="n_sender" class="form-control" value="${id }" readonly /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea name="n_content" id="n_content" class="form-control" style="margin-left: 10%; width: 85%; height: 300px; resize: none;">
                                    	</textarea></td>
								</tr>
								<tr>
									<th>받는 아이디</th>
									<td><input type="text" style="margin-left: 10%; width: 85%;" id="n_receiver" name="n_receiver" class="form-control" value="${read.id }" readonly /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" id="note_submit">보내기</button>
					<button class="btn btn-primary" type="button" id="finsh" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>






</body>
</html>