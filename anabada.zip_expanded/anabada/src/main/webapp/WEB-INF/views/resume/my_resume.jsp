<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="../resources/css/j_styles.css">
<meta charset="UTF-8">
<title>내 지원목록</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		// 지원서 수정 버튼 누르면 update.jsp로 이동
		$(".update").on("click", function () {
			
			var bno = $(this).attr("id");
			var [r_bno, j_bno] = bno.split(',');
			//alert(r_bno + j_bno);
			
			location.href = "/resume/resume_update_view" +
				'?r_bno=' + r_bno +
				'&j_bno=' + j_bno +
				'&page=' + '${cri.page }' +
    			'&perPageNum=' + '${cri.perPageNum }';
			
		});
		
		// 삭제 전체 선택, 해제
	    $('#delete_all').on("click", function () {
	    	if($("#delete_all").is(":checked")){
	           $("input[name=delete]").prop("checked", true);
	        }else{
	           $("input[name=delete]").prop("checked", false);
	        }
	     });
	     
	     //삭제 버튼 눌렀을 때. ajax 처리
	     $('button[name=delete_btn]').on("click", function () {
	        
	        if($("input:checkbox[name=delete]").is(":checked") == false) {
	           alert("선택된 지원서가 없습니다.");
	           return;
	        }
	        
	        
	        if(confirm("삭제하시겠습니까?")){
	           // 배열로 선언
	           var delete_array = new Array(); //j_bno를 담음
	           $('input[name=delete]:checked').each(function (i) {
	              delete_array.push($(this).val());
	              //alert($(this).val());
	           });
	           
	           $.ajax({
	               type: "get",
	               url : "/resume/delete_chk.ajax",
	               data: {
	                  delete_array : delete_array, 
	               },
	               traditional : true,
	               success: function(data){
	                   alert("삭제했습니다.");
	                   window.location.reload();
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
<style type="text/css">
   .j_img { 
      width: 80px;
      height: 80px;
      border-radius: 10px;
   }
   .mr_list{
      width: 100%;
      border-top: 1px solid #e5e5e5;
   }
   .mr_list tr, .mr_list td, .mr_list th{
      border-bottom: 1px solid #e5e5e5;
      padding: 10px;
      vertical-align: middle;
   }
   .mr_list th{
   	  text-align: center;
   }
   
   .update{ /*지원수정 버튼*/
   	  all: unset;
 	  width: 50px;
	  height: 30px;
	  border-radius: 5px 5px;
	  color: black;
	  font-size: 15px;
	  text-align: center;
	  cursor: pointer;
	  border: 1px solid #ced4da;
	  background-color: #ced4da;
   }
   .word{
    	width:380px;
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
       <jsp:include page="../includes/header.jsp" />
    </div>
    
    <section class="container">
    <form name="resumeForm">
    
    	<div class="sidemenu2">
				<p class="side-t">회원정보</p>
				<ul class="side-ul">
					<br>
					<li class="side-li"><a href="/member/memberUpdateView">내 정보 관리</a></li>
					<li class="side-li"><a href="/member/passUpdateView">비밀번호 변경</a></li>
					<br><hr><br>
					<li class="side-li"><a href="/userProduct/myStore">내 상점 보기</a></li>
					<li class="side-li"> <a href="/userProduct/myHeartList" >내 찜 목록 보기</a> </li>
					<li class="side-li">참여한 이벤트</li>
					<br><hr><br>
					<li class="side-li"><a href="/a_board/myWriteList">내가 쓴 게시글</a></li>
					<li class="side-li">내가 쓴 댓글</li>
					<br><hr><br>
					<li class="side-li"><a href="/job/my_job">아르바이트 공고</a></li>
					<li class="side-li"><a href="/resume/my_resume">아르바이트 지원</a></li>
					<li class="side-li"><a href="/job/my_heart">아르바이트 찜</a></li>
					<br><hr><br>
					<li class="side-li">나의 걸음수</li>
					<br><hr><br>
					<li class="side-li"><a href="/member/memberDeleteView">회원 탈퇴</a></li>
				</ul>
			</div>

    	
    	<div class="minicon">
		    <table class="mr_list">
		    	<tr>
		    		<td colspan="5">
		    			<font style="font-size: 30px;">알바 지원 목록</font>&nbsp;&nbsp;
            			<button type="button" name="delete_btn" class="j_btn3">
            			삭제</button>
            		</td>
		    	</tr>
		    	<tr>
		    		<th>
                  		<input type="checkbox" name="delete" value="0" id="delete_all">
		    		</th>
		    		<th colspan="2">
		    			지원한 게시물
		    		</th>
		    		<th>
		    			지원날짜
		    		</th>
		    		<th>
		    			지원 수정
		    		</th>
		    	</tr>
			    
			    <c:if test="${not empty mr_list}">
				<c:forEach items="${mr_list}" var="mr_list" varStatus="status">
		    	<tr>
					<td style="text-align: center" width="50px">
	                  	<input type="checkbox" name="delete" class="delete" value="${mr_list.r_bno}">
	               	</td>
					<td style="width: 100px;">
	                    <c:choose>
	                    <c:when test="${empty j_list[status.index].j_img}">
	                        <a href="/job/job_read?j_bno=${j_list[status.index].j_bno}">
	                            <img class="j_img" src="../resources/images/아나바다2.png"/>
	                        </a>
	                    </c:when>
	                    <c:otherwise>
	                        <a href="/job/job_read?j_bno=${j_list[status.index].j_bno}">
	                            <img class="j_img" src="/upload/${j_list[status.index].j_img}"/>
	                        </a>
	                    </c:otherwise>
	                    </c:choose>
	                </td>
	                <td style="width: 400px;">
						<div class="word">
							<font style="font-size: 20px;">${j_list[status.index].j_title}</font>
						</div>
						<div class="word">
							${j_list[status.index].j_company }
						</div>
						<div class="word">
							${j_list[status.index].j_addr1 }&nbsp;${j_list[status.index].j_addr2 }
						</div>
						<%-- <div class="word">
							${j_list[status.index].j_method }&nbsp;${j_list[status.index].j_pay }	
						</div>	 --%>	
					</td>
					<td style="width: 150px; text-align: center;">
						${mr_list.r_date }
					</td>
					<td style="width: 100px; text-align: center;">
						<button type="button" class="update" id="${mr_list.r_bno },${j_list[status.index].j_bno}">수정</button>
					</td>
				</tr>	
				</c:forEach>
				</c:if>
			
				<!-- 지원목록 없을 때 -->
				<c:if test="${ empty mr_list}">
				<tr>
					<td colspan="5" style="text-align: center">
					지원한 알바가 없습니다.
					</td>
				</tr>	
				</c:if>
		    </table>
		    
		    <c:if test="${not empty mr_list}">
			<div style="text-align: center;">
                <c:if test="${pageMaker.prev }">
                   <a href="my_resume${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a>
                </c:if>
                		
		        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		        &nbsp;<a href="my_resume${pageMaker.makeSearch(idx)}">${idx }</a>
		        </c:forEach>
                              
		        <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
		           <a href="my_resume${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
		   		</c:if>
		   	</div>
		   	</c:if>
		</div>
		
    </form>
    </section>
    
    

</body>
</html>