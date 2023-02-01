<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>내 알바 구인 공고</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/n_styles.css">
<style type="text/css">
   input[type=radio]{
         display: none;
         margin: 10px; 
   }
   
   input[type=radio] + label{
         display: inline-block;
         margin:-2px;
         padding: 8px 10px;
         background-color: #f5f5f5;
         border: 1px solid #ccc;
         font-size: 13px !important;
         width: 110px;
         text-align: center;
   }
   
   label{ /*보낸 쪽지함, 받은 쪽지함 선택할 떄 마우스 모양 바뀌게*/
         cursor: pointer;
   }
   
   input[type=radio]:radio + label{
         background-image: none;
         background-color: #3598dc;
      color:#fff;
   }
   
   .j_img { 
      width: 110px;
      height: 110px;
      border-radius: 10px;
   }
   
   .myImg {
       background-color: #f9f9f9; 
       text-align: center; 
       padding-bottom: 5px; 
       border-bottom: 1px solid #e9e9e9; 
       border-top: 1px solid #e9e9e9;
   }
   
   .mj_list{
      margin: auto;
      width: 95%;
      /* border-top: 1px solid #e5e5e5; */
      /* border-collapse: collapse; */
   }
   .mj_list tr, .mj_list td{
      border-bottom: 1px solid #e5e5e5;
      padding: 10px;
   }
   
   .resume{
	  all: unset;
	  width: 70px;
	  height: 30px;
	  border-radius: 5px 5px;
	  color: black;
	  text-align: center;
	  cursor: pointer;
	  border: 1px solid #ced4da;
	  background-color: #ced4da;
   }
   .word{ /*글자 잘림*/
   	  width:300px;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  white-space: nowrap;
   }
   
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		//지원자 보기 버튼 누르면 지원자 목록 페이지로 이동
		$(".resume").on("click", function () {
			
			var j_bno = $(this).attr("id");
			
			location.href = "/resume/resume_list" +
				'?j_bno=' + j_bno;
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
	           alert("선택된 쪽지가 없습니다.");
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
	               url : "/job/delete_chk.ajax",
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
</head>
<body>
   <div>
      <jsp:include page="../includes/nav.jsp" />
   </div>
   <div>
      <jsp:include page="../includes/miniHeader.jsp" />
   </div>
   
   <section class="container">
   <form>
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
					<li class="side-li"><a href="/a_board/myReplyList">내가 쓴 댓글</a></li>
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

        
        
        <!-- 내용 -->
        <div class="minicon" style="background-color: white; border-top: 1px solid #e9e9e9">
        	<table class="mj_list">
        		<tr>
            		<td colspan="5">
            			<button type="button" name="delete_btn" class="n_btn2">
            			삭제</button>
            		</td>
            	</tr>
            	
        		<tr>
        			<td style="text-align: center">
                  		<input type="checkbox" name="delete" value="0" id="delete_all">
               		</td>
        			<td colspan="2" style="text-align: center">내용</td>
        			<td style="text-align: center">등록일</td>
        			<td style="text-align: center">지원자 보기</td>
        		</tr>
                
            	<c:if test="${not empty my_jobList}">
                <c:forEach var="mj_list" items="${my_jobList}">
                <tr>
                	<td style="text-align: center" width="10px;">
                  		<input type="checkbox" name="delete" class="delete" value="${mj_list.j_bno}">
               		</td>
				   	<td style="width: 100px;">
                        <c:choose>
                        <c:when test="${empty mj_list.j_img}">
                            <a href="/job/job_read?j_bno=${mj_list.j_bno }&page=${cri.page }&perPageNum2=${cri.perPageNum2 }">
                                <img class="j_img" src="../resources/images/아나바다2.png"/>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/job/job_read?j_bno=${mj_list.j_bno }&page=${cri.page }&perPageNum2=${cri.perPageNum2 }">
                                <img class="j_img" src="/upload/${mj_list.j_img }"/>
                            </a>
                        </c:otherwise>
                        </c:choose>
                    </td>
                    <td width="320px;">
                    	<div class="word">
                        	<font style="font-size: 20px;">${mj_list.j_title }</font>
                        </div>
						<div class="word">${mj_list.j_company }</div>
                    </td>
                    <td width="150px;" style="text-align: center">
                        ${mj_list.j_date }
                    </td>
                    <td style="text-align: center">
						<button type="button" class="resume" id="${mj_list.j_bno }">지원자</button>
					</td>
                </tr>
            </c:forEach>
            </c:if>
            
            <c:if test="${empty my_jobList}">
            <tr>
            	<td colspan="4" style="text-align: center">
				작성한 알바 구인 공고가 없습니다.            	
            	</td>
            </tr>
            </c:if>
         </table>
            
         <c:if test="${not empty my_jobList}">
         <div style="text-align: center">
             <c:if test="${pageMaker.prev }">
                <a href="my_job${pageMaker.makeSearch2(pageMaker.startPage - 1 )}">이전</a>
             </c:if>
                              
             <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                &nbsp;<a href="my_job${pageMaker.makeSearch2(idx)}">${idx }</a>
             </c:forEach>
                              
             <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
                <a href="my_job${pageMaker.makeSearch2(pageMaker.endPage + 1)}">다음</a>
             </c:if>
          </div>
          </c:if>
          
       </div><!-- 미니콘 -->
   </form>
   </section>
   
   <div>
      <jsp:include page="../includes/footer.jsp" />
   </div>
   
</body>
</html>