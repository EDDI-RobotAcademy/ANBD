<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="manifest" href="resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>내 알바 구인 공고</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/css/n_styles.css'/>">
<style type="text/css">
   .d_btn {
     all: unset;
     width: 45px;
     height: 30px;
     border-radius: 2px 2px;
     color: black;
     font-size: 15px;
     text-align: center;
     cursor: pointer;
     border: 1px solid gray;
   }
   
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
   <form>
      <div class="sidemenu">
         <!-- 여기부터는 게시물들 -->
           <div class="myImg">
              <img src="../resources/images/아나바다2.png" width="150px" height="150px"/>
              <br>
              ${id } 님
           </div>
           <div style="padding-top: 10px">
              <ul style="margin-top: 5px;">
                 <li style="text-align: left">
                 	<label>
                 		<input type="radio" class="" name="" value="">중고거래
                 	</label>
                 </li>
                 <li style="text-align: left">
                 	<label>
                 		<input type="radio" class="m_job" name="m_job" value="job">알바 구인
                 	</label>
                 </li>
                 <li style="text-align: left">
                 	<label>
                 		<input type="radio" class="" name="" value="">알바 지원
                 	</label>
                 </li>
                 <li style="text-align: left">
                 	<label>
                 		<input type="radio" class="" name="" value="">내 쪽지함
                 	</label>
                 </li>
              </ul>
           </div>
        </div>
        
        
        <!-- 내용 -->
        <div class="minicon" style="background-color: white; border-top: 1px solid #e9e9e9">
            <c:choose>
            <c:when test="${not empty my_jobList}">
        	<table class="mj_list">
        		<tr>
        			<td colspan="2" style="text-align: center">내용</td>
        			<td>등록일</td>
        		</tr>
                
                <c:forEach var="mj_list" items="${my_jobList}">
                <tr>
				   	<td style="width: 130px;">
                        <c:choose>
                        <c:when test="${empty mj_list.j_img}">
                            <a href="/job/job_readView?j_bno=${mj_list.j_bno }&page=${cri.page }&perPageNum=${cri.perPageNum }">
                                <img class="j_img" src="../resources/images/아나바다2.png"/>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/job/job_readView?j_bno=${mj_list.j_bno }&page=${cri.page }&perPageNum=${cri.perPageNum }">
                                <img class="j_img" src="/upload/${mj_list.j_img }"/>
                            </a>
                        </c:otherwise>
                        </c:choose>
                    </td> 
                    <td>
                        ${mj_list.j_title }<br>
                        ${mj_list.j_company }<br>
                        ${mj_list.j_day }&nbsp;${mj_list.j_start }:00 ~ ${mj_list.j_end }:00<br>
                        ${mj_list.j_method }&nbsp;${mj_list.j_pay }<br>
                        ${mj_list.j_addr1 }&nbsp;${mj_list.j_addr2 }
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </c:forEach>
            </table>
            
            <div style="text-align: center">
                <c:if test="${pageMaker.prev }">
                   <a href="my_jobList${pageMaker.makeSearch2(pageMaker.startPage - 1 )}">이전</a>
                </c:if>
                              
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                &nbsp;<a href="my_jobList${pageMaker.makeSearch2(idx)}">${idx }</a>
                </c:forEach>
                              
                <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
                    <a href="my_jobList${pageMaker.makeSearch2(pageMaker.endPage + 1)}">다음</a>
                </c:if>
            </div>
            </c:when>
       
            <c:otherwise><!-- 이거 되는지 실행안해봤음 -->
                <div style="text-align: center">
            	   작성한 게시글이 없습니다.
                </div>
            </c:otherwise>
            </c:choose>
       </div><!-- 미니콘 -->
   </form>
   </section>
   
   <div>
      <jsp:include page="../includes/footer.jsp" />
   </div>
   
</body>
</html>