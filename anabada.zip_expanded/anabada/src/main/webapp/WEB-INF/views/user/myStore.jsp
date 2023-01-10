<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<table  class="infoTable"  onmouseover="this.style.backgroundColor = '#F4F4F4' " onmouseout="this.style.backgroundColor = ''" >

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



</form>




</body>
</html>