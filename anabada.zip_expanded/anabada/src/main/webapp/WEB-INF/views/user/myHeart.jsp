<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.title{
font-size: 15px;
font-weight: bold;
}
.info{
font-size: 13px;
}
.rowStyle{

   background-color: #E1E1E1;
        height:2px;
       width:600px;
        border: none;
        margin-bottom: 0px;
        margin-top: 0px;
    
}
.infoTable{
width: 600px;

}
#totalTable{

  border-collapse: separate;
  border-spacing: 0px 0px;


}
.headTr{
background-color: #B6B4B5;
color: white;
text-align: left;
}
#userBK{
	width: 70px;
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


</style>

<script type="text/javascript">

$(document).ready(function() {
	
	
});



</script>

</head>
<body>
<form action=""  >

<table style="margin: auto;"   id="totalTable" >
<tr class="headTr" > <td> <input type="checkbox" > 전체 선택 ${id}</td>   <td colspan="6" >  </td>   </tr>
<!-- 반복 -->

<c:forEach items="${list }"  var="list" >  
<tr>
<td colspan="7"   >
<table  class="infoTable"   onclick="location.href='/product/readView?pno=${list.pno}'"   onmouseover="this.style.backgroundColor = '#F4F4F4' " onmouseout="this.style.backgroundColor = ''" >

<tr > <td rowspan="2" width="40px;"  >  <input type="checkbox"  value="${list.pno}"   >  </td>
<td colspan="2" rowspan="2" >              <img width="100px;" height="100px;"  src="${list.p_filepath} ">       </td>
<td colspan="4"  class="title" >        ${list.p_title }   </td>
 </tr>
 <tr class="info" > <td>조회수 : ${list.p_count } </td>  <td> 찜수 : ${list.p_heart} </td>  <td><fmt:formatDate value="${ list.p_regdate}" pattern="yyyy.MM.dd" />   </td><td> <div id="userBK" >   <c:if test="${list.p_buy == 'book' }">예약중</c:if>  <c:if test="${list.p_buy == 'end' }">판매완료</c:if>    <c:if test="${list.p_buy == 'ing' }">판매중</c:if>   </div> </td>   </tr>
 
 </table>
 </td>
 </tr>
 <tr  > <td colspan="7"   > <hr class="rowStyle" > </td> </tr>


</c:forEach>


<!-- 반복 끝 -->
</table>


<!-- 페이징 처리 -->

			<nav style="margin-left: 50%">
						<ul class="pagination">
							<li class="page-item"><c:if test="${pageMaker.prev }">
									<a class="page-link" href="myHeartList${pageMaker.makeSearch(pageMaker.startPage - 1 )}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>><a class="page-link" href="myHeartList${pageMaker.makeSearch(idx)}">${idx }</a></li>
							</c:forEach>


							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
								<li class="page-item"><a class="page-link" href="myHeartList${pageMaker.makeSearch(pageMaker.endPage + 1)}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>


<!-- 페이징 끝 -->



</form>




</body>
</html>