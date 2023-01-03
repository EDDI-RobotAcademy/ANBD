<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="manifest" href="resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>쪽지한 사람 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/css/n_styles.css'/>">
<style>
   .p_img { 
      width: 110px;
      height: 110px;
      border-radius: 10px;
   }
   table{
      width: 1000px;
   }
   tr, td{
   	  border-bottom: 1px solid #e5e5e5;
   	  padding: 10px;
   }
   
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		//확정 버튼 눌렀을 때
		$('.confirm').click(function () {
			if(confirm("판매를 확정하시겠습니까?")){
				var user = $(this).attr("id"); // 리뷰쪽지 보낼 아이디
				
				$.ajax({
			        type: "get",
			        url : "/note/review_note.ajax",
			        data: {
			        	r_id : user,
			        	s_id : '${id}', 
			        	pno : 0, 
//원래는 이거임!!			pno : '${p_read.pno}' // 원래는 이거 나중에 수정하기!!!
						content: '판매가 확정되었습니다. 후기를 작성해주세요.',
						confirm: 'yes'
			        	},
			        dataType :  'json',   // 데이터 타입을 Json으로 변경
			        traditional : true,
			        success: function(data){
			            alert("판매가 확정되었습니다.");
			            //window.location.reload();
//			            //판매확정한 뒤 판매확정 버튼 안보이게 하려면 칼럼이 또 필요할거같은데...?
			        }
			  });
				
				
				
			}else{
				return;
			}
		})
	})

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
   	  <div class="minicon" style="border-top: 1px solid #e9e9e9; width: 1000px;">
	  	 <h3>쪽지한 사용자 리스트 하하 ${p_read.pno }</h3>
	  	 <table>
	  	 	<tr>
				<td width="130px;">
					<a href="product/readView/pno=${p_read.pno}">
						<img class="p_img" src="">
					</a>
				</td>
				<td>
					제목<br>
					비용<br>
					<!-- 
					${p_read.p_title}<br>
					${p_read.p_cost}<br>
					${p_read.p_cost}
					-->
					<!-- 이 부분은 나중에 -->
				</td>
			</tr>
			<tr>
				<td>사용자</td>
				<td>확정</td>
			</tr>
			
			<c:forEach items="${m_list }" var="m_list">
			<tr>
				<td>
					${m_list }
				</td>
				<td>
					<button class="confirm" id="${m_list }">판매 확정</button>
				</td>
			</tr>
			</c:forEach>
	  	 </table>
	  	 
	  	 <div style="margin-bottom: 0px; text-align: center">
            <c:if test="${pageMaker.prev }">
               <a href="product_note${pageMaker.makeQuery(pageMaker.startPage - 1 )}">이전</a>
               </c:if>
                           
            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
               &nbsp;<a href="product_note${pageMaker.makeQuery(idx)}">${idx }</a>
            </c:forEach>
                           
            <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
               <a href="product_note${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
            </c:if>
         </div>
   	  </div>
   </section>

   <div>
      <jsp:include page="../includes/footer.jsp" />
   </div>
</body>
</html>