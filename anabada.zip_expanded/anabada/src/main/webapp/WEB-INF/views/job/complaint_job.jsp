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
    	padding: 10px;
	}

</style>
</head>
<body>
    <div style="width: 980px">
   		
		<form name="readForm" role="form" method="post">
			<input type="hidden" name="j_img" value="${j_read.j_img }"><!-- 삭제할때 사용하려고 -->
	
			<table>
				<tr>
					<td colspan="5">
					    ${j_read.j_date }&nbsp;&nbsp;
						<button type="button" name="delete" class="j_btn3">삭제</button>
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
				
			</table>
					
		</form>
		
   	</div>
	
</body>
</html>