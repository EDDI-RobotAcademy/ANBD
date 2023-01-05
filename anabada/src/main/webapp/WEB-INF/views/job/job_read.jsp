<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="<c:url value='/css/j_styles.css'/>">
<meta charset="UTF-8">
<title>알바 공고 상세보기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		var readForm = $("form[name='readForm']");
		
		$("#update").on("click", function () { // 수정 버튼 눌렀을 때
			readForm.attr("action", "/job/updateView_boss"); // 수정 컨트롤러로 돌아감
			readForm.attr("method", "get");
			readForm.submit();
		});
		
		$("#delete").on("click", function () { // 삭제 버튼 눌렀을 때
			if (!confirm("삭제하시겠습니까?")) {
		        return false;
		    } else {
				readForm.attr("action", "/job/delete_boss"); // 삭제 컨트롤러로
				readForm.attr("method", "post"); // 여기서는 페이징처리 필요없으니까 post
				readForm.submit();
		    }
		});
		
		$("#job_list").on("click", function () { 
			readForm.attr("action", "/job/job_list"); 
			readForm.attr("method", "get");
			readForm.submit();
		});
		
		// 알바 지원하기 컨트롤러로 이동
		$("#putIn").on("click", function () { 
			location.href= "/putIn/putIn_job" + 
				'?page=' + '${scri.page }' +
				'&perPageNum=' + '${scri.perPageNum }' +
				'&j_bno=' + '${j_read.j_bno}' + // putin_job.jsp에서 j_bno이름으로 값 받음
				'&j_addr1=' + encodeURIComponent('${scri.j_addr1}') + 
				'&j_term=' + encodeURIComponent('${scri.j_term}') + 
				'&j_day=' + encodeURIComponent('${scri.j_day}') + 
				'&j_cate=' + encodeURIComponent('${scri.j_cate}');
		});
		
		// 알바 지원자들 보기 컨트롤러로 이동. 페이징 처리 안했음
		$("#show_putIn").on("click", function () { // 삭제 버튼 눌렀을 때
			location.href = "/putIn/putIn_list?" + 
				"j_bno=" + '${j_read.j_bno}';
			
			/* readForm.attr("action", "/putIn/putIn_list"); // 삭제 컨트롤러로
			readForm.attr("method", "post");
			readForm.submit(); */
		});
		
		// 알바 지원자들 보기 컨트롤러로 이동. 페이징 처리 안했음
		$("#show_writeList").on("click", function () { // 삭제 버튼 눌렀을 때
			location.href = "/job/my_jobList?" +
				"id=" + "${id}";
		});
		
		
		// 최근 본 알바!!!!!!!!sessionStroage
		function recent_item(){
		    //세션에서 최초로 데이터 꺼내오기
		    //세션이 비어있을 경우에 객체를 넣어야 함으로
		    //비어있는지 유무를 파악
		    var data = sessionStorage.getItem("recent_job");
		     
		    if(data){//만약 데이터가 들어있다면
		        alert("들어있음")
		        //데이터가 있을 경우 json으로 파싱
		        data = JSON.parse(data);
		        //alert("사이즈 : "+data.length);
		        
		        var j_bno = '${j_read.j_bno}';
		        
		        //중복될 번호들을 따로 뽑아
		        //배열에 넣은후 값을 비교 한후
		        var bno = [];
		        for(var i = 0; i < data.length; i++){
		            bno.push(data[i].j_bno);
		        }
		        
		        var idxOf = bno.indexOf(j_bno);
		        //alert("중복 결과 : "+idxOf);
		 
		        if(idxOf<0){
		            alert("중복안됨")
		            //중복이 되지 않으면 객체 삽입
		            //즉, 찾고자 하는 값이 배열에 들어 있지 않은 경우
		            data.unshift({
		                   "j_bno":'${j_read.j_bno}',
		                   "j_title":'${j_read.j_title}',
		                   "j_img":'${j_read.j_img}'
		                    });
		        }else{
		            alert("중복됨");
		        	// 이미 봤다면 이전 기록 삭제하고 다시 추가
		        	data.splice(idxOf, 1);
		            data.unshift({
		                   "j_bno":'${j_read.j_bno}',
		                   "j_title":'${j_read.j_title}',
		                   "j_img":'${j_read.j_img}'
		                    });
		        };//if
		        //alert("성공");
		        
		    }else{
		    //세션에 데이터가 없을 경우 
		    //새로운 배열 생성후
		    //객체를 넣어줌
		        alert("비어있음")
		        data=[{
		               "j_bno":'${j_read.j_bno}',
		               "j_title":'${j_read.j_title}',
		               "j_img":'${j_read.j_img}'
		                }];
		    }//if
		    
		    //준비된 data배열을 넣고
		    //JSON으로 저장
		    sessionStorage.setItem("recent_job", JSON.stringify(data));
		}     
		 
		function get_recent_item(){
		    
		    var $recentItemList = $("#recentItemList");
		    
		    var items = sessionStorage.getItem("recent_job");
		    //alert(key)
		    
		    var realitem = JSON.parse(items);
		    
		    //파싱된 객체의 길이로 for문 돌리기
		     for (var i = 0; i < realitem.length; i++) {
		        var no = realitem[i].no;
		        var name = realitem[i].name;
		        var image = realitem[i].image;
		 
		        var li = "<li><a href='/item_detail/"+no+"'><img width='70' height='70' src='"+image+"' alt='' title='"+name+"' /></a></li>";
		 
		        //ul에 붙이기
		        $recentItemList.append(li);
		        
		    }
		    
		}
		
		recent_item();
		get_recent_item();
		
		
		//찜버튼 이벤트 
		$("#heart").on("click", function() {

			if ($(this).prop('checked')) {
				$(".himg").attr("src", "../../resources/images/heartB.png");

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
				$(".himg").attr("src", "../../resources/images/heartA.png");

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
		}); // 하트 이벤트 끝
		 
	});

</script>
<style>
	table{
		width: 1000px;
		border-top: 1px solid #c9cdd2;
	}
	tr, td{
		border-bottom: 1px solid #c9cdd2;
    	border-left: 1px solid #c9cdd2;
    	padding: 10px;
	}
	td:first-child {
    	border-left: none;
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
</style>
</head>
<body>
	<div>
       <jsp:include page="../includes/nav.jsp" />
    </div>
      
    <div>
       <jsp:include page="../includes/header.jsp" />
    </div>

	<section class="container">
	<form name="readForm" role="form" method="post">
		<input type="hidden" name="j_bno" value="${j_read.j_bno }">
		<input type="hidden" name="page" value="${scri.page }">
		<input type="hidden" name="perPageNum" value="${scri.perPageNum }">
		<input type="hidden" name="j_term" value="${scri.j_term }">
		<input type="hidden" name="j_addr1" value="${scri.j_addr1 }">
		<input type="hidden" name="j_day" value="${scri.j_day }">
		<input type="hidden" name="j_cate" value="${scri.j_cate }">
		<input type="hidden" name="j_img"" value="${j_read.j_img }"><!-- 삭제할때 사용하려고 -->
	
	
	<table style="width: 1000px">
		<tr>
			<td colspan="4">
			    ${j_read.j_date }&nbsp;&nbsp;
				<c:if test="${j_read.id eq id}"><!-- 로그인한 아이디(세션에 저장된 아이디(id))와 작성자아이디(j_read.id)가 같으면 수정, 삭제 가능 -->
					<button type="button" id="update">수정</button>
					<button type="button" id="delete">삭제</button>
				</c:if>
			</td>
			<td>
				<label class="rach">
					<input type="checkbox" id="heart" name="j_heart" value="${j_read.j_heart }" /> 					<c:choose>
					<c:when test="${heart == 0 }">
						<img class="himg" style="width: 60px; height: 60px;" src="../../resources/images/heartA.png">
					</c:when>
					<c:otherwise>
						<img class="himg" style="width: 60px; height: 60px;" src="../../resources/images/heartB.png">
					</c:otherwise>
				    </c:choose>
				</label>
			</td>
			<td style="text-align: right">
				<span style="color: red; font-size: 30px;"> ❤</span>
				<div style="inline-block" id="heartCh">${j_read.j_heart }</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="6">${j_read.j_company }</td>
		</tr>
		
		<tr>
			<td colspan="6">${j_read.j_title }</td>
		</tr>
		
		<tr>
			<td rowspan="2">
			<c:choose>
				<c:when test="${empty j_read.j_img}">
					<img src="../resources/images/아나바다2.png" width="250px" height="250px"/>
				</c:when>
				<c:otherwise>
					<img src="/upload/${j_read.j_img }" width="250px" height="250px"/>
				</c:otherwise>
			</c:choose>
			</td>
			<td>${j_read.j_method }</td>
			<td>근무기간</td>
			<td>카테고리</td>
			<td>날짜</td>
			<td>시간</td>
		</tr>
		
		<tr>
			<td style="border-left: 1px solid #c9cdd2;">${j_read.j_pay }</td>
			<td>${j_read.j_term }</td>
			<td>${j_read.j_cate }</td>
			<td>${j_read.j_day }</td>
			<td>${j_read.j_start }:00 ~ ${j_read.j_end }:00</td>
		</tr>
		
		<tr>
			<td colspan="6">${j_read.j_content }</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<div id="addr">${j_read.j_addr1 } ${j_read.j_addr2 }</div>
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
			<td colspan="6" style="border-bottom: 0px">
				<button type="button" id="job_list">게시판으로 돌아가기</button>
				<c:if test="${j_read.id ne id}"><!-- 로그인한 아이디(세션에 저장된 아이디)와 작성자아이디가 같으면 수정, 삭제 가능 -->
					<button type="button" id="putIn">지원하기</button>
				</c:if>
				<c:if test="${j_read.id eq id}"><!-- 로그인한 아이디(세션에 저장된 아이디)와 작성자아이디가 같으면 수정, 삭제 가능 -->
					<button type="button" id="show_putIn">지원자들 보기</button>
				</c:if>
				
			</td>
		</tr>
		
	</table>
	<br><br>
			
	</form>
	</section>
	
	<div>
      <jsp:include page="../includes/footer.jsp" />
    </div>

</body>
</html>