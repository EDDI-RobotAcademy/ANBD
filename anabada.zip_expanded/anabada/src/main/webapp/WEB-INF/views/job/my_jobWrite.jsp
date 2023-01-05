<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 알바 구인 공고 목록</title>
<style>
	body {
	  font: 16px "Helvetica Neue", sans-serif;
	  background: white;
	  color: black;
	  padding: 50px 0; /*위아래, 왼오 안 여백*/
	}
	
	.container {
	  width: 1000px; /*고정 크기*/
	  /* max-width: 1200px; */
	  margin: 0 auto;
	}
	
	.boxes {
	  list-style: none;
	  display: flex;
	  flex-wrap: wrap;
	  padding: 0;
	  margin: 0 -10px;
	}
	
	.boxes li {
	  width: 250px; /*이걸로 해야지 1000px에 알바 게시물 4개 보임*/
	  padding: 0 5px; /*알바 게시물들 양옆 간격 5px*/
	  margin-top: 20px;
	  box-sizing: border-box;
	}
	
	.search_format li { /*검색 li*/
	  width: 250px;
	  padding: 0 20px;
	  margin-top: 20px;
	  box-sizing: border-box;
	}
	
	.boxes li a {
	  display: block;
	  padding: 5px; /*알바 게시물 안 4면 여백*/
	  text-align: left; 
	  text-decoration: none;
	  background: white; /*알바 게시물 배경 흰색*/
	  color: #000;
	  outline: 2px solid skyblue; 
	}
	
	.boxes li a:focus {
	  /* outline: 2px solid red; */
	}
	
	.boxes .details { /*box
	  display: flex;
	  flex-wrap: wrap;
	  justify-content: center;
	  text-align: left;
	  display: inline-block; /*이렇게 해야지 알바게시물에 글자 몇개 없어도 왼쪽에 딱 붙어 나옴*/
	}
	
	img { 
	/*
	이렇게 크기 해야지 div안에 딱 맞음
	div안 li 크기가 250px일때. div(container) padding 양옆(5px*2) + li padding 양옆(5px*2)여서 width는 230px
	*/
	  width: 230px;
	  height: 230px;
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
   
   <c:choose>
   <c:when test="${not empty my_jobList}">
   <form>
      <div class="container">
         <!-- 여기부터는 게시물들 -->
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
      </div>
      
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
   
   </form>
   </c:when>
   <c:otherwise><!-- 이거 되는지 실행안해봤음 -->
      <div style="text-align: center">
      작성한 게시글이 없습니다.<br>
      <img src="../resources/images/아나바다.png"/>
      </div>
   </c:otherwise>
   </c:choose>

</body>

</html>