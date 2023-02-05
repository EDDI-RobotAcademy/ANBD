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
		
		$("button[name=delete]").on("click", function () {
			
			if(confirm("알바 게시물을 삭제하시겠습니까?")){
				
				var data = sessionStorage.getItem("recent_job");
			    data = JSON.parse(data);
			    
			    var j_bno = ${j_read.j_bno};
			        
			    data.splice('j_bno', 1); // 삭제될때 최근 본 게시물도 삭제
			    sessionStorage.setItem("recent_job", JSON.stringify(data));
			 	// 삭제될때 최근 본 게시물도 삭제
				
				$.ajax({
				        type: "get",
				        url : "/job/delete_admin.ajax",
				        data: {
				        	id: '${j_read.id}',
				        	j_bno : ${j_read.j_bno},
				        	j_img : '${j_read.j_img}'
				        },
				        dataType :  'json',   // 데이터 타입을 Json으로 변경
				        traditional : true,
				        success: function(data){
				            alert("삭제했습니다.");
				            
				            if(${href eq 'all'}){
								alert("전체 새로고침");
						    	window.opener.top.location.href = "http://localhost:8081/complaint-all-view/";
						    	
						    }else if(${href eq 'job'}){
						    	alert("알바만 새로고침");
						    	window.opener.top.location.href = "http://localhost:8081/complaint-view/job";
						    }
				            		
				            window.close();
				        },
				        error : function(request, status, error) {
							alert("삭제 실패:" + error);
						}
				  });
			}else{
				return;
			}
			
		});
		 
	});

</script>
<style>
	table{
		width: 100%;
		border-top: 1px solid #c9cdd2;
	}
	tr, td{
		border-bottom: 1px solid #c9cdd2;
		border-left: 1px solid #c9cdd2;
    	padding: 10px;
	}
	tr td:first-child{
		border-left: none;
	}

</style>
</head>
<body onload="onload()">
    <div style="width: 980px">
   		
		<form name="readForm" role="form" method="post">
			<input type="hidden" name="j_img" value="${j_read.j_img }"><!-- 삭제할때 사용하려고 -->
	
			<table>
				<tr>
					<td colspan="5">
					    ${j_read.j_date }&nbsp;&nbsp;
						<button type="button" name="delete" class="j_btn3">삭제</button>
					</td>
					<td style="text-align: right">
						<span style="color: red; font-size: 30px;"> ❤</span>
						<div style="display: inline" id="heartCh">${j_read.j_heart }</div>
					</td>
				</tr>
		
				<tr>
					<td colspan="6">${j_read.j_company }</td>
				</tr>
				
				<tr>
					<td colspan="6">${j_read.j_title }</td>
				</tr>
				
				<tr>
					<td rowspan="2" width="250px;">
					<c:choose>
						<c:when test="${empty j_read.j_img}">
							<img src="../resources/images/아나바다2.png" width="250px" height="250px"/>
						</c:when>
						<c:otherwise>
							<img src="/upload/${j_read.j_img }" width="250px" height="250px"/>
						</c:otherwise>
					</c:choose>
					</td>
					<c:choose>
						<c:when test="${j_read.j_method eq '월급'}">
						<td>
							<img src="../resources/images/월급.png" width="100px" height="100px"/>
						</td>
						</c:when>
						<c:when test="${j_read.j_method eq '시급'}">
						<td>
							<img src="../resources/images/시급.png" width="100px" height="100px"/>
						</td>
						</c:when>
						<c:when test="${j_read.j_method eq '주급'}">
						<td>
							<img src="../resources/images/주급.png" width="100px" height="100px"/>
						</td>
						</c:when>
						<c:otherwise>
						<td>
							<img src="../resources/images/건당.png" width="100px" height="100px"/>
						</td>
						</c:otherwise>
					</c:choose>
					<td>근무기간</td>
					<td><img src="../resources/images/카테고리.png" width="100px" height="100px"/></td>
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
				
				<!-- 내용 있을 때만 출력 -->
				<c:if test="${j_read.j_content ne null}">
				<tr>
					<td colspan="6">
					${fn:replace(j_read.j_content, replaceChar, "<br/>")}
					</td>
				</tr>
				</c:if>
				
				<tr>
					<td colspan="6">
						<div id="addr">${j_read.j_addr1 } ${j_read.j_addr2 }</div>
						<br>
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
								
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>
					
					</td>
				</tr>
				
			</table>
		</form>
		
   	</div>
	
</body>
</html>