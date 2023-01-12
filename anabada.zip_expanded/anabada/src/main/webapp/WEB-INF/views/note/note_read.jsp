<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="manifest" href="resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="<c:url value='/css/n_styles.css'/>">
<meta charset="UTF-8">
<title>쪽지 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   $(document).ready(function () {
      
      $('.search_who').click(function () {
         location.href = "note_list" + '?who=' + '${scri.who}';
      });
      
      var readForm = $("form[name='readForm']");
      $("button[name=n_delete]").on("click", function () {
         if(confirm("삭제하시겠습니까?")){
            
            if("<c:out value='${scri.who}'/>" == "receive"){ // 받은 메시지라면 받은 아이디가 같음
               var n_receiver = '${id}';
               var n_sender = "${n_read.n_sender}";
             }else if("<c:out value='${scri.who}'/>" == "send"){ // 보낸 메시지라면 보낸 아이디가 같음
                var n_sender = '${id}';
                var n_receiver = "${n_read.n_receiver}";
             }

            $.ajax({
                    type: "get",
                    url : "/note/delete_chk2.ajax",
                    data: {
                       n_bno : '${n_read.n_bno}',
                       n_receiver : n_receiver, 
                       n_sender: n_sender
                       },
                    dataType :  'json',   // 데이터 타입을 Json으로 변경
                    traditional : true,
                    success: function(data){
                        alert("삭제했습니다.");
                         location.href = "/note/note_list" +
                     '?n_bno=' + '${n_read.n_bno}' +
                     '&page=' + '${scri.page }' +
                     '&perPageNum=' + '${scri.perPageNum }' +
                     '&who=' + '${scri.who}';
                        
                    },
                    error : function(request, status, error) {
                     alert("삭제 실패:" + error);
                  }
              });
         }else{
            return;
         }
         
      });
      
      // 쪽지 보내기 버튼 눌렀을 떄 모달창 띄우기
      $("button[name=n_send]").on("click", function () { 
         $("#pno").val("0"); // 쪽지보낼때 pno은 0
         $("#n_content").attr("placeholder", "");
         $("#n_content").val("");
         $("#n_receiver").attr("placeholder", "");
         $("#n_receiver").val("");
         $("#n_receiver").attr("readonly", false);
         $('#noteModal').modal("show"); 
      });
      
      // 답장 버튼 눌렀을 때 모달창 띄우기
      $("button[name=n_reply]").on("click", function () { 
         $("#pno").val('${n_read.pno}'); // 답장할 때는 그 게시글 pno를 적음
         $("#n_content").attr("placeholder", "");
         $("#n_content").val("");
         
         if('${scri.who eq receive}'){ // 받는 사람 아이디 부분
            $("#n_receiver").val("<c:out value='${n_read.n_sender}'/>");
         }else{
            $("#n_receiver").val("<c:out value='${n_read.n_receiver}'/>");
         }
         $("#n_receiver").attr("readonly", true);
         $('#noteModal').modal("show"); 
      });
      
   
      // 모달창에서 쪽지보내기 버튼 눌렀을 때
       $("#note_submit").click(function(){
          
          if($("#n_content").val() == null || $("#n_content").val() == ""){
             $("#n_content").attr("placeholder", "내용을 작성해주세요.");
             return false;
          }
          if($("#n_receiver").val() == null || $("#n_receiver").val() == ""){
             $("#n_receiver").attr("placeholder", "받는 아이디를 작성해주세요.");
             return false;
          }
          
           $.ajax({
               type: "get",
               url : "/note/note_insert.ajax",
                dataType : "json",
               data : $("#note_form").serialize(),
               success:function(data){
                   alert("쪽지 전송 완료");
                   alert($("#pno").val());
               },
               error : function(request, status, error) {
               alert("쪽지 전송 실패:" + error);
            }
           });
           
           $("#noteModal").modal("hide");
       });
      
       $("button[name=list]").on("click", function () {
         location.href = "/note/note_list" +
         '?n_bno=' + '${n_read.n_bno}' +
         '&page=' + '${scri.page }' +
         '&perPageNum=' + '${scri.perPageNum }' +
         '&who=' + '${scri.who}';
      });
       
       
       // 후기 작성 모달창 띄우기
      $("button[name=review]").on("click", function () { 
         
         $.ajax({
               type: "get",
               url : "/review/review_chk.ajax",
                dataType : "json",
                traditional : true,
               data : {
                  pno: ${n_read.pno}
               },
               success:function(chk){
                   if(chk == 1){
                     alert("이미 후기를 작성했습니다.");
                     return false;
                   }else{
                      $('#reviewModal').modal("show"); 
                   }
               },
               error : function(request, status, error) {
               alert("오류:" + error);
            }
           });
         
      });
       
      // 모달창에서 후기 작성 완료 버튼 눌렀을 때
       $("#review_submit").click(function(){
          
          var chk = $('input[name=r_score]').is(":checked");
          if(!chk){
             alert("선택해주세요."); // 멘트 다시
             return false;
          }
          
           $.ajax({
               type: "get",
               url : "/review/review_register.ajax",
                dataType : "json",
               data : $("#review_form").serialize(),
               success:function(data){
                   alert("후기 작성 완료");
                   window.location.reload();
               },
               error : function(request, status, error) {
               alert("후기 작성 실패:" + error);
            }
           });
           
           $("#reviewModal").modal("hide");
       });
       
      
   })
</script>
<style type="text/css">
   .n_read{
      margin: auto;
         width: 100%;
       
   }
   .n_read tr, .n_read td{
       border-bottom: 1px solid #e5e5e5;
          padding: 10px;
   }
   
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
   
   input[name=who]{
         display: none;
         margin: 10px; 
   }
   
   input[name=who] + label{
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
   
   input[type=who]:radio + label{
         background-image: none;
         background-color: #3598dc;
      color:#fff;
   }
   
   .myImg {
       background-color: #f9f9f9; 
       text-align: center; 
       padding-bottom: 5px; 
       border-bottom: 1px solid #e9e9e9; 
       border-top: 1px solid #e9e9e9;
   }
   .p_img { 
      width: 110px;
      height: 110px;
      border-radius: 10px;
   }
   
   /*후기 테이블*/
   .review_table{
        width: 100%
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
   <form name="readForm">
      <!-- 좌측 바 -->
      <div class="sidemenu">
         <div class="myImg">
            <img src="../resources/images/아나바다.png" width="150px" height="150px"/>
              <br>
              ${id } 님
           </div>
           <div style="padding-top: 10px">
            <button type="button" name="n_send" class="n_btn1" style="display: block; margin: auto;">쪽지 보내기</button>
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
      
      <!-- 내용 부분 -->
      <div class="minicon" style="background-color: white; border-top: 1px solid #e9e9e9; border-left: 1px solid #e9e9e9">
         <table class="n_read">
            <tr>
               <td colspan="2">
                  <button type="button" name="n_delete" class="d_btn">삭제</button>
                  <button type="button" name="n_reply" class="d_btn">답장</button>
                  <button type="button" name="list" class="d_btn">목록</button>
               </td>
            </tr>
            <c:choose>
            <c:when test="${n_read.n_sender eq id }"><!-- 보낸 사람과 현재 로그인한 사람이 같을 때 -->
            <tr>
               <td colspan="2">보낸 메시지</td>
            </tr>
            <tr>
               <td colspan="2">
               받은 사람&nbsp;&nbsp;${n_read.n_receiver }<br>
               보낸 시간&nbsp;&nbsp;${n_read.n_s_time }<br>
               </td>
            </tr>
            </c:when>
            <c:otherwise>
            <tr>
               <td colspan="2">받은 메시지</td>
            </tr>
            <tr>   
               <td colspan="2">
               보낸 사람&nbsp;&nbsp;${n_read.n_sender }<br>
               받은 시간&nbsp;&nbsp;${n_read.n_s_time }<br>
               </td>
            </tr>
            
            </c:otherwise>
            </c:choose>
            
            <!-- 중고게시글과 관련된 쪽지일때 -->
            <c:if test="${n_read.pno ne 0 && n_read.n_review eq 'no'}">
            <tr>
               <td width="130px;">
                  <a href="product/readView/pno=${n_read.pno}">
                     <img class="p_img" src="">
                  </a>
               </td>
               <td>
               
                  ${p_read.p_title}<br>
                  ${p_read.p_cost}<br>
                   
                   <!-- 이 부분은 나중에 -->
               </td>
            </tr>
            </c:if>
            
            <!-- 후기 쪽지일때 -->
            <!-- 원래는 아래 코드로 실행해야함 -->
            <%-- <c:if test="${n_read.pno ne 0 && n_read.n_review eq 'yes'}"> --%>
            <c:if test="${n_read.n_review eq 'yes'}">
            <tr>
               <td width="130px;">
                  <a href="product/readView/pno=${n_read.pno}">
                     <img class="p_img" src="">
                  </a>
               </td>
               <td>
             
                   
                  ${p_read.p_title}<br>
                  ${p_read.p_cost}<br>
                  
                  <!-- 받은 사람만 후기 작성하기 버튼 누를수있도록 -->
                  <c:if test="${n_read.n_receiver eq id }">
                     <button type="button" class="review" name="review">후기 작성하기</button>
                  </c:if>
               </td>
            </tr>
            </c:if>
         </table>
         
         <div style="padding:10px">
         ${fn:replace(n_read.n_content, replaceChar, "<br/>")}
         </div>
      </div>
   </form>
   </section>
   
   <!-- 쪽지 모달 -->
   <div class="modal fade" id="noteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">쪽지</h1>
                </div>
                <form id="note_form">
                    <input type="hidden" name="n_review" value="no">
                    <input type="hidden" name="pno" id="pno" value="${n_read.pno}">
                    <div class="modal-body">
                        <table style="width: 100%">
                            <tbody>
                                <tr>
                                    <th>보내는 아이디</th>
                                    <td>
                                       <input type="text" style="margin-left:10%; width:85%;" 
                                       id="n_sender" name="n_sender" class="form-control" value="${id }" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                       <textarea name="n_content" id="n_content" class="form-control"
                                       style="margin-left:10%; width: 85%; height: 300px; resize: none;">
                                       </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>받는 아이디</th>
                                    <td>
                                       <input type="text" style="margin-left:10%; width:85%;"  
                                       id="n_receiver" name="n_receiver" class="form-control"/>
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
    
    <!-- 후기 모달 -->
   <div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">거래 후기 남기기</h1>
                </div>
                <form id="review_form">
                
                    <input type="hidden" name="pno" value="${n_read.pno}">
                    <input type="hidden" name="r_seller" value="${n_read.n_sender}">
                    <input type="hidden" name="r_consumer" value="${id}">
                    
                    <div class="modal-body">
                        <table class="review_table">
                            <tbody>
                               <tr>
                                  <td style="text-align: center; padding: 10px;">
                                     <h5>${n_read.n_sender}님과의 거래가 어떠셨나요?</h5>
                                  </td>
                               </tr>
                               <tr>
                                  <td style="text-align: center; padding: 10px;">
                                     <label>
                                        <input type="radio" name="r_score" value="-0.2">별로예요.
                                     </label>
                                     &nbsp;&nbsp;&nbsp;
                                     <label>
                                        <input type="radio" name="r_score" value="0.1">보통이에요.
                                     </label>
                                     &nbsp;&nbsp;&nbsp;
                                     <label>
                                        <input type="radio" name="r_score" value="0.2">좋아요!
                                     </label>
                                     &nbsp;&nbsp;&nbsp;
                                     <label>
                                        <input type="radio" name="r_score" value="0.3">최고예요♥
                                     </label>
                                  </td>
                               </tr>
                               <tr>
                                  <td style="text-align: center; padding: 10px;">
                                     ${n_read.n_sender}님에게 감사 인사를 남겨보세요.<br>
                                     <textarea name="r_content" id="r_content" style="resize: none; height: 100px; width: 100%"></textarea>
                                  </td>
                               </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" id="review_submit">작성 완료</button>
                    <button class="btn btn-primary" type="button" id="finsh" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    
    <div>
        <jsp:include page="../includes/footer.jsp" />
    </div>

</body>
</html>