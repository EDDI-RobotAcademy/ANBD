<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="manifest" href="resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/css/n_styles.css'/>">
<meta charset="UTF-8">
<title>내 알바 구인 공고 목록</title>
<style>
   .boxes {
     list-style: none;
      display: flex;
      flex-wrap: wrap;
      padding: 0;
   }
   
   .boxes li {
     width: 250px; /*이걸로 해야지 1000px에 알바 게시물 4개 보임*/
     padding: 3px; /*알바 게시물들 양옆 간격 3px*/
      margin-top: px; /*게시물들 위아래 간격 3px*/
      box-sizing: border-box;
   }
   
   .boxes li a {
     display: block;
      padding: 0px; /*알바 게시물 안 4면 여백*/
      text-align: left; 
      text-decoration: none;
      background: white; /*알바 게시물 배경 흰색*/
      color: #000;
      border: 1px solid #E2E2E2;
   }
   
   img { 
     width: 237px;
      height: 237px;
   }
   
   .myImg {
       background-color: #f9f9f9; 
       text-align: center; 
       padding-bottom: 5px; 
       border-bottom: 1px solid #e9e9e9; 
       border-top: 1px solid #e9e9e9;
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
   
</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

   $(window).on("load", function () {
      
      if("<c:out value='${id}'/>" == ""){ // 로그인안했으면
         alert("로그인 후 이용해주세요.");
         history.go(-1); // 이거는 로인창으로 이동으로 바뀔뜻!!!!!!!!!!!!!!!!!
      }
      
   });
   
</script>
</head>
<body>

   <div>
      <jsp:include page="../includes/nav.jsp" />
   </div>
   
   <div>
      <jsp:include page="../includes/header.jsp" />
   </div>
   
   <section class="container">
   <c:choose>
   <c:when test="${not empty my_jobList}">
   <form>
      <div class="sidemenu">
         <!-- 여기부터는 게시물들 -->
         <div class="myImg">
            <img src="../resources/images/아나바다.png" width="150px" height="150px"/>
              <br>
              ${id } 님
           </div>
           <div style="padding-top: 10px">
              <button type="button" name="send" id="send" style="display: block; margin: auto;">쪽지 보내기</button>
              <ul style="margin-top: 5px;">
                 <li style="text-align: left">
                 <label>
                 <input type="radio" class="search_who" name="who" value="receive" <c:out value="${scri.who eq 'receive' ? 'checked' : ''}" />>받은 쪽지함
                 </label>
                 </li>
                 <li style="text-align: left">
                 <label>
                 <input type="radio" class="search_who" name="who" value="send" <c:out value="${scri.who eq 'send' ? 'checked' : ''}" />>보낸 쪽지함
                 </label>
                 </li>
              </ul>
           </div>
        </div>
        
        <div class="minicon" style="background-color: white; border-top: 1px solid #e9e9e9">
          <ul class="boxes">
             <c:forEach var="mj_list" items="${my_jobList}">
                 <li>
                   <a href="/job/job_readView?j_bno=${mj_list.j_bno }&page=${cri.page }&perPageNum=${cri.perPageNum }">
                    <!-- a태그 누르면  -->   
                       <div class="details">
                          <c:choose>
                             <c:when test="${empty mj_list.j_img}">
                                <img src="../resources/images/아나바다.png"/>
                             </c:when>
                             <c:otherwise>
                                <img src="/upload/${mj_list.j_img }"/>
                             </c:otherwise>
                          </c:choose>
                          ${mj_list.j_company }<br>
                          ${mj_list.j_title }<br>
                          직종 : ${mj_list.j_cate }<br>
                          날짜 : ${mj_list.j_day }<br>
                          ${mj_list.j_term }&nbsp;${mj_list.j_start }:00 ~ ${mj_list.j_end }:00<br>
                          ${mj_list.j_method }&nbsp;${mj_list.j_pay }<br>
                          ${mj_list.j_addr1 }
                       </div>
                   </a>
                 </li>
              </c:forEach>
           </ul>
     
         <!-- 페이징 -->
         <table style="margin: auto">
            <tr>
               <td>
                  <c:if test="${pageMaker.prev }">
                     <a href="my_jobList${pageMaker.makeSearch2(pageMaker.startPage - 1 )}">이전</a>
                        <!-- 다시 쓰기!!!!!!!!!!!!!!!!
                        ex) 1페이지에서 제목+내용 선택하고 aaaaa 입력한 뒤 검색 버튼 누르고 -> 그 검색 목록 중에서 [2]페이지 눌렀을 때 
                        http://localhost:8080/board/list?page=2&perPageNum=10&searchType=tc&keyword=aaaaa 
                        [이전] 누르면 파라미터 값들 가지고 BoardController "/list"로 이동(기본이 get방식)
                        -->
                  </c:if>
                              
                  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                     <%-- <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/> --%>
                     &nbsp;<a href="my_jobList${pageMaker.makeSearch2(idx)}">${idx }</a>
                     
                  </c:forEach>
                              
                  <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
                     <a href="my_jobList${pageMaker.makeSearch2(pageMaker.endPage + 1)}">다음</a>
                  </c:if>
               </td>
            </tr>
            
         </table>
      </div>   
   </form>
   </c:when>
   
   <c:otherwise><!-- 이거 되는지 실행안해봤음 -->
      <div style="text-align: center">
      작성한 게시글이 없습니다.
      </div>
   </c:otherwise>
   </c:choose>
   </section>
   
   <div>
      <jsp:include page="../includes/footer.jsp" />
   </div>

</body>

</html>