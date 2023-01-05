<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.anabada.web.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">








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

	width: 500px;
	height: 500px;
}
 */

img {
	width: 500px;
	height: 500px;
}



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


	
	width: 490px;
	height: 320px;
	border-radius: 20px;
	border-top-left-radius: 0px;
	border: 2px solid #AFAFAF;
	padding: 17px;
	

	margin-left: auto;
	margin-right: auto;
	width: 50%;
	height: 200px;

	border-radius: 20px;
	border-top-left-radius: 0px;
	border: 2px solid #AFAFAF;
	padding: 17px;

	

	margin-top: 40px;


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
.reBox{
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

.reBox{
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



#userBK{
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
    margin:0px; padding:0px;
}


#reviewBox{
margin-top: 70px;
}
#reviewBox td{
 width: 510px;

}


/*끝 */






</style>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");
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
			if (hei < footerTop) {
				$(".sideBanner").stop().animate({
					"top" : bannerTop
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
		      
		 
		        var li = "<li  ><a href='/product/readView?pno="
							+ pno
							+ "'><img width='100' height='100' src='"+p_img+"'/>"
							+ "<br><font  >" + pno + p_title + "</font>"
							+ "</a></li>";
		        //ul에 붙이기
		        $recentItemList.append(li);
		        
		    }
		    
		}
		
		
		
		
		
		
		recent_item();
		get_recent_item();
		//최근본 목록 끝
		
		
		
		
		
		
		

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
			if (hei < footerTop) {
				$(".sideBanner").stop().animate({
					"top" : bannerTop
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
		      
		 
		        var li = "<li  ><a href='/product/readView?pno="
							+ pno
							+ "'><img width='100' height='100' src='"+p_img+"'/>"
							+ "<br><font  >" + pno + p_title + "</font>"
							+ "</a></li>";
		        //ul에 붙이기
		        $recentItemList.append(li);
		        
		    }
		    
		}
		
		
		
		
		
		
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
			

		


			if(confirm("게시글을 수정하시겠습니까 ? ")){
				formObj.attr("action", "/product/updateView");
				formObj.attr("method", "get");
				formObj.submit();
			}else{
				return false;
			}
			

		

			formObj.attr("action", "/product/updateView");
			formObj.attr("method", "get");
			formObj.submit();



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

		//사용자가 상품 판매 상태 변경시 
		$("#book").on("change", function() {

			var book = document.getElementById('book');
			var str = $("#book option:selected").val(); // 선택된 값


			// 모달창 띄우는 쿼리 
			//모달창에서 id 선택  var dd + ''
			var params = {
				pno : "${read.pno}",
				p_buy : str
				// 변수 전달 구매자 아이디 

			// 모달창 띄우는 쿼리 
			//모달창에서 id 선택  var dd + ''
			var params = {
				pno : "${read.pno}",
				p_buy : str
				// 변수 전달 구매자 아이디 

			var params = {
				pno : "${read.pno}",
				p_buy : str


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

					alert("error:" + error);

				}

			});

		}); //상품 상태 변경 끝 

		bookCh();
		
		
		




		// 최근 본 목록 구현 - sessionStroage
		function recent_item(){
		    //세션에서 최초로 데이터 꺼내오기
		    //세션이 비어있을 경우에 객체를 넣어야 함으로
		    //비어있는지 유무를 파악
		    var data = sessionStorage.getItem("recent_product");
		     
		    if(data){//만약 데이터가 들어있다면
		        alert("들어있음")
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
		            alert("중복안됨")
		            //중복이 되지 않으면 객체 삽입
		            //즉, 찾고자 하는 값이 배열에 들어 있지 않은 경우
		            //.unshift() : 배열의 맨 앞에 값을 추가한다.
		            data.unshift({
		                   "pno":'${read.pno}',
		                   "p_title":'${read.p_title}',
		                   "p_img":'${filelist[0].filepath}'
		                    });
		        }else{
		            alert("중복됨");
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
		        alert("비어있음")
		        data=[{
		        	  "pno":'${read.pno}',
	                   "p_title":'${read.p_title}',
	                   "p_img":'${filelist[0].filepath}'
		                }];
		    }//if
		    
		    //준비된 data배열을 넣고
		    //JSON으로 저장
		    sessionStorage.setItem("recent_product", JSON.stringify(data));
		    //alert(   "pno : "+"${read.pno}"+", title : "+"${read.p_title}"+", img : "+ "${filelist[0].filepath}"  );
		    //pno : 4, title : 레이저 마우스 검은색 팝니다, img : /tomcatImg/85bed4d7-8fc8-4399-815d-51fff5a16ea5.jpg
		  
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
		        alert(pno+", "+p_title+", "+p_img);
		      
		 
		        var li = "<li><a href='/readView/"+pno+"'><img width='70' height='70' src='"+p_img+"' alt='' title='"+p_title+"' /></a></li>";
		        //ul에 붙이기
		        $recentItemList.append(li);
		        
		    }
		    
		}
		
		recent_item();
		get_recent_item();
		//최근본 목록 끝


		
		
		
		
		
		

	});

	//User가 제품 판매 상태 보기 
	function bookCh() {

		var p_buy = "${read.p_buy}";
		const element = document.getElementById("userBK");

		if (p_buy == 'ing') {

			element.innerText = '판매중';

		} else if (p_buy == 'book') {
			element.innerText = '예약중';
		} else {
			element.innerText = '판매완료';
		}
	}
</script>

</head>
<body>

<!-- header -->

<!-- header -->

	<div>
		<jsp:include page="../includes/nav.jsp" />
	</div>
	<div>

		<jsp:include page="../includes/nav.jsp" />
	</div>
	<div>


		<jsp:include page="../includes/header.jsp" />
	</div>

<!-- header end -->

	<div id="wapper" >
	<section class="nav"></section>
	<section class="section" style="border-top: 1px solid #e5e5e5">

	
	




	<div>


		<button id="listbtn">목록으로가기</button>


		<form name="readForm" role="form">

			<input type="hidden" name="pno" value="${read.pno }">


			<table style="margin-left: auto; margin-right: auto;">
				<tr>



					<td colspan="10" style="text-align: right; padding-right: 20px;">


						<div style="display: inline;">

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


					<td colspan="6" rowspan="10" style="background-color: white;">

					<td colspan="6" rowspan="9" style="background-color: white;">



						<div class="single-item" id="slick" style="width: 500px; height: 500px;">

							<c:choose>
								<c:when test="${ empty filelist }">

									<div class="imgbox" >
										<img width="500px;" height="500px;"  src="/tomcatImg/img.png">



									<div>
										<img src="/tomcatImg/img.png">


									</div>
								</c:when>
								<c:otherwise>

									<c:forEach items="${filelist}" var="list">

										<div class="imgbox" >
											<img width="500px;" height="500px;" src="${list.filepath }" name="p_file">


										<div class="imgbox" >
											<img width="500px;" height="500px;" src="${list.filepath }" name="p_file">

										<div>
											<img src="${list.filepath }" name="p_file">


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
									<option value="end" <c:out value="${read.p_buy eq 'end' ? 'selected' :''} "/>>판매완료</option>

								</select>
							</c:when>
							<c:otherwise>
								<div  id="userBK"></div>

							</c:otherwise>

						</c:choose></td>

				</tr>
				<tr><td>&nbsp;</td> <td colspan="3" >게시일 : <fmt:formatDate  pattern="yyyy.MM.dd" value="${read.p_regdate }"/></td> </tr>
				

			<tr><td>&nbsp;</td> <td colspan="3" >게시일 : <fmt:formatDate  pattern="yyyy.MM.dd" value="${read.p_regdate }"/></td> </tr>
				



				<tr>
					<td colspan="4">
						<hr>
					</td>
				</tr>



				<tr>
					<td>&nbsp;</td>
					<td><span style="font-size: 30px;">👀</span> ${read.p_count }</td>
					<td>&nbsp;</td>
					<td><span style="color: red; font-size: 30px;"> ❤</span>
						<div style="display: inline-block;" id="heartCh">${read.p_heart }</div> <br></td>

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


					<td colspan="3">
						<div>채팅 버튼 자리</div>
					</td>
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

						<td  ><c:choose>


						<td  ><c:choose>

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
		<tr> <td> <div class="reBox" >상 품 상 태</div> </td>  <td> <div class="reBox" > 상점 후기 </div> </td>  </tr>
		<tr> <td> <div id="textbox" > ${read.p_content } </div> </td>  <td> <div id="textbox" ></div> </td>   </tr>
		</table>
		
		
		<!-- 상품 상세 설명 및 구매자 후기  끝  -->
			
			
			
			






		</form>
		</section>
							<!-- 사이드바 - 최근본 상품 목록 -->
			<section class="aside">
				<div class="sideBanner" >
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
	<div id="footer">

		<div id="footer">
			<jsp:include page="../includes/footer.jsp" />
		</div>
	</div>
	<!-- footer end -->


			<div id="textbox">
				<font style="font-size: 20px; font-weight: bold; color: #6F6F6F">[ 상품 상태 ]</font> <br> <br> ${read.p_content}
			</div>



		</form>
		</section>
							<!-- 사이드바 - 최근본 상품 목록 -->
			<section class="aside">
				<div class="sideBanner" >
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
	<div id="footer">

		<div id="footer">
			<jsp:include page="../includes/footer.jsp" />
		</div>
	</div>
	<!-- footer end -->





</body>
</html>