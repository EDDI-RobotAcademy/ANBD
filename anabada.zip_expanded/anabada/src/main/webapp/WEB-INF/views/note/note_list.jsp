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
<title>아나바다</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/n_styles.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   $(document).ready(function () {
     
	  // 보낸 쪽지함, 받은 쪽지함
	  $('.search_who').click(function () {
         location.href = "note_list" + '${pageMaker.makeQuery(1)}' + 
         '&who=' + $("input[name=who]:checked").val(); 
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
            var delete_array = new Array(); //n_bno를 담음
            $('input[name=delete]:checked').each(function (i) {
               delete_array.push($(this).val());
               //alert($(this).val());
            });
            
             if("<c:out value='${who}'/>" == "receive"){ // 받은 메시지라면 받은 아이디가 같음
               var n_receiver = '${id}';
               var n_sender = "several";
             }else if("<c:out value='${who}'/>" == "send"){ // 보낸 메시지라면 보낸 아이디가 같음
                var n_sender = '${id}';
                var n_receiver = "several";
             }
             
             $.ajax({
                 type: "get",
                 url : "/note/delete_chk.ajax",
                 data: {
                    delete_array : delete_array, 
                    n_receiver : n_receiver, 
                    n_sender : n_sender
                    },
                 dataType :  'json',   // 데이터 타입을 Json으로 변경
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
      
      
      // 모달창 띄우기
      $('#send').on("click", function () { 
         $("#n_content").attr("placeholder", "");
         $("#n_content").val("");
         $("#n_receiver").attr("placeholder", "");
         $("#n_receiver").val("");
         $('#noteModal').modal("show"); 
      });
      
   
      // 쪽지 보내기 버튼 눌렀을 떄
      $("#note_submit").click(function(){
    	  
    	 var n_sender = $("#n_sender").val().trim(); 
    	 var n_content = $("#n_content").val().trim();
    	 var n_receiver = $("#n_receiver").val().trim();
    	 var n_type = $("input[name=n_type]").val();
    	 var n_rno = $("input[name=n_rno]").val();
          
         if(n_content == null || n_content == ""){
            $("#n_content").attr("placeholder", "내용을 작성해주세요.");
            return false;
         }
         if(n_receiver == null || n_receiver == ""){
            $("#n_receiver").attr("placeholder", "받는 아이디를 작성해주세요.");
            return false;
         }
          
         if(n_receiver == '${id}'){
        	 alert("본인에게 쪽지를 보낼 수 없습니다.");
        	 return false;
         }
         
         if(n_receiver == 'admin' || n_receiver == '관리자'){
        	 alert("관리자에게는 쪽지를 보낼 수 없습니다.");
        	 return false;
         }
         
          
         // 쪽지 받는 아이디 회원 존재하는지 체크하고 쪽지 보냄
         $.ajax({
             type: "get",
             url : "/note/id_chk.ajax",
             dataType : "json",
             data : {
            	 id: n_receiver
             },
             success:function(data){
                 if(data != 1){
                	 alert("존재하지 않는 id입니다.");
                 }else{ // 아이디가 존재할 땐
                	 
                	 $.ajax({
                         type: "get",
                         url : "/note/note_insert.ajax",
                         dataType : "json",
                         data : {
                        	 n_sender: n_sender,
                        	 n_content: n_content,
                        	 n_receiver: n_receiver,
                        	 n_rno: n_rno,
                        	 n_type: n_type
                         },
                         success:function(data){
                             alert("쪽지 전송 완료");
                             window.location.reload();
                         },
                         error : function(request, status, error) {
            			  alert("쪽지 전송 실패:" + error);
            			 }
                     });
                	 $("#noteModal").modal("hide");
                 }
                 
             },
             error : function(request, status, error) {
				  alert("아이디 체크 실패:" + error);
			 }
         });
         
      });
      
      
   });

</script>
<style>
	.paging{
		position: absolute;
 		bottom: 0;
 		text-align: center;
 		margin: auto;
 		display: block;
 		padding-bottom: 5px;
 		width: 100%;
	}
	.minicon3{
		position: relative;
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
   <form name="noteForm" action="/note/note_list" method="get">
        <!-- 바 -->
        <div class="sidemenu3">
        	<br>
        	<div style="text-align: center">${id } 님</div>
        	<br><br>
        	<div style="padding-top: 10px">
	        	<button type="button" name="send" id="send" class="n_btn1" style="display: block; margin: auto;">쪽지 보내기</button>
	        	<ul style="margin-top: 5px;">
		        	<li style="text-align: left">
		        		<label>
		        			<input type="radio" class="search_who" name="who" value="receive" <c:if test="${scri.who eq 'receive'}">checked</c:if>>
		        			<font <c:if test="${scri.who eq 'receive'}"> style="font-weight: bold;" </c:if>>받은 쪽지함</font>
		        		</label>
		        	</li>
	        		<li style="text-align: left">
	        			<label>
	        				<input type="radio" class="search_who" name="who" value="send"  <c:if test="${scri.who eq 'send'}">checked</c:if>>
        					<font <c:if test="${scri.who eq 'send'}"> style="font-weight: bold;" </c:if>>보낸 쪽지함</font>
        				</label>
        			</li>
        		</ul>
        	</div>
        </div>
        
        <!-- 내용 -->
        <div class="minicon3" style="height: 580px;">
		    
            <table class="n_list">
            <tr>
            	<td colspan="4">
            	<button type="button" name="delete_btn" class="n_btn2">
            	삭제</button>
            	<c:if test="${who eq 'receive'}">
            	&nbsp;읽지 않은 메시지 ${no_read }
            	</c:if>
            	</td>
            </tr>
            <tr>
               <td width="30px;" style="text-align: center">
                  <input type="checkbox" name="delete" value="0" id="delete_all">
               </td>
               <c:choose>
	               <c:when test="${who eq 'receive'}">
	                  <td width="150px" style="text-align: center">보낸 사람</td>
	               </c:when>
	               <c:otherwise>
	                  <td width="150px" style="text-align: center">받는 사람</td>
	               </c:otherwise>
               </c:choose>
               <td width="350px" style="text-align: center">내용</td>
               <td width="170px" style="text-align: center">날짜</td>
            </tr>
            
            <!-- 안읽으면 1, 읽으면 0 -->
            <!-- 받은 쪽지함 -> 보낸 쪽지함 -->
            <c:forEach items="${n_list}" var="n_list">
            <c:choose>
            <c:when test="${who eq 'receive'}">
            <tr onmouseover="this.style.backgroundColor = '#f9f9f9'" onmouseout="this.style.backgroundColor = ''">
               <td style="text-align: center">
                  <input type="checkbox" name="delete" class="delete" value="${n_list.n_bno}">
               </td>
               <td>
               	  <div class="word">
                  <c:if test="${not empty n_list.n_sender && n_list.n_sender ne 'admin'}">${n_list.n_sender }</c:if>
                  </div>
                  <c:if test="${empty n_list.n_sender}">(알수없음)</c:if>
                  <c:if test="${n_list.n_sender eq 'admin'}">관리자</c:if>
               </td>
               <td>
               	  <div class="word2">
                  <a href="/note/note_read?n_bno=${n_list.n_bno}&n_rno=${n_list.n_rno }&n_type=${n_lsit.n_type}&page=${scri.page }&perPageNum=${scri.perPageNum }&who=${scri.who}">
                     <c:if test="${n_list.n_read_chk eq 1}">
                     <img src="../resources/images/new.png" width="14px" height="14px">
                     </c:if>
                     ${n_list.n_content }
                  </a>
                  </div>
               </td>
               <td>${n_list.n_s_time }</td>
            </tr>
            </c:when>
            <c:when test="${who eq 'send'}">
               <tr onmouseover="this.style.backgroundColor = '#e5e5e5'" onmouseout="this.style.backgroundColor = ''">
               <td style="text-align: center">
                  <input type="checkbox" name="delete" class="delete" value="${n_list.n_bno}">
               </td>
               <td>
                  <c:if test="${not empty n_list.n_receiver}">
                  	<div class="word">${n_list.n_receiver }</div>
                  </c:if>
                  <c:if test="${empty n_list.n_receiver}">(알수없음)</c:if>
               </td>
               <td>
               	  <div class="word2">
                  <a href="/note/note_read?n_bno=${n_list.n_bno}&n_rno=${n_list.n_rno }&n_type=${n_lsit.n_type}&page=${scri.page }&perPageNum=${scri.perPageNum }&who=${scri.who}">
                     ${n_list.n_content }
                  </a>
                  </div>
               </td>
               <td>${n_list.n_s_time }</td>
            </tr>
            </c:when>
            </c:choose>
            </c:forEach>
         </table>
         
         <div class="paging">
            <c:if test="${pageMaker.prev }">
               <a href="note_list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a>
            </c:if>
                           
            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
               <%-- <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/> --%>
               &nbsp;<a href="note_list${pageMaker.makeSearch(idx)}">${idx }</a>
            </c:forEach>
                           
            <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
               <a href="note_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
            </c:if>
         </div>
        </div>
      </form>
   </section>
   
   <div>
      <jsp:include page="../includes/footer.jsp" />
   </div>
   
   <!-- 쪽지보내기 모달 -->
   <div class="modal fade" id="noteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">쪽지</h1>
                </div>
                <form id="note_form">
                    <input type="hidden" name="n_type" value="no">
                    <input type="hidden" name="n_rno" value="0">
                    <div class="modal-body">
                        <table style="width: 100%">
                            <tbody>
                                <tr>
                                    <th>보내는 아이디</th>
                                    <td>
                                       <input type="text" id="n_sender" name="n_sender" class="form-control" value="${id }"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                       <textarea name="n_content" id="n_content" class="form-control"
                                       style="height: 300px; resize: none;">
                                       </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>받는 아이디</th>
                                    <td>
                                       <input type="text" id="n_receiver" name="n_receiver" class="form-control"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" id="note_submit">보내기</button>
                    <button class="btn btn-primary" type="button" id="finsh" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript"></script>
</body>
</html>