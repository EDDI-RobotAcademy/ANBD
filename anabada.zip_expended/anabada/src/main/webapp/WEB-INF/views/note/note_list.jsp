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
<link rel="stylesheet" href="<c:url value='/css/n_styles.css'/>">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
   .n_list{
      margin: auto;
      width: 95%;
   }
   .n_list tr, .n_list td{
      border-bottom: 1px solid #e5e5e5;
      padding: 10px;
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
   
   .myImg {
       background-color: #f9f9f9; 
       text-align: center; 
       padding-bottom: 5px; 
       border-bottom: 1px solid #e9e9e9; 
       border-top: 1px solid #e9e9e9;
   }
</style>
<script type="text/javascript">
   $(document).ready(function () {
      $('.search_who').click(function () {
         location.href = "note_list" + '${pageMaker.makeQuery(1)}' + 
         '&who=' + $("input[name=who]:checked").val(); 
      });
      
      
      // 삭제 전체 선택, 해제
      $('#delete_all').on("click", function () {
         if($("#delete_all").is(":checked")){
            $("input[name=deletes]").prop("checked", true);
         }else{
            $("input[name=deletes]").prop("checked", false);
         }
      });
      
      //삭제 버튼 눌렀을 때. ajax 처리
      $('button[name=delete]').on("click", function () {
         
         if($("input:checkbox[name=deletes]").is(":checked") == false) {
            alert("선택된 쪽지가 없습니다.");
            return;
         }
         
         
         if(confirm("삭제하시겠습니까?")){
            // 배열로 선언
            var delete_array = new Array(); //bno를 담음
            $('input[name=deletes]:checked').each(function (i) {
               delete_array.push($(this).val());
               //alert($(this).val());
            });
            
             if("<c:out value='${who}'/>" == "receive"){ // 받은 메시지라면 받은 아이디가 같음
               var r_id = '${id}';
               var s_id = "several";
             }else if("<c:out value='${who}'/>" == "send"){ // 보낸 메시지라면 보낸 아이디가 같음
                var s_id = '${id}';
                var r_id = "several";
             }
             
             $.ajax({
                 type: "get",
                 url : "/note/delete_chk.ajax",
                 data: {
                    delete_array : delete_array, 
                    r_id : r_id, 
                    s_id: s_id
                    },
                 dataType :  'json',   // 데이터 타입을 Json으로 변경
                 traditional : true,
                 success: function(data){
                     alert("삭제했습니다.");
                     window.location.reload();
                 }
              });
         
         }else{
            return;
         }
         
      });
      
      
      // 모달창 띄우기
      $('#send').on("click", function () { 
         $("#content").attr("placeholder", "");
         $("#content").val("");
         $("#r_id").attr("placeholder", "");
         $("#r_id").val("");
         $('#noteModal').modal("show"); 
      });
      
   
      // 쪽지 보내기 버튼 눌렀을 떄
       $("#note_submit").click(function(){
          
          if($("#content").val() == null || $("#content").val() == ""){
             $("#content").attr("placeholder", "내용을 작성해주세요.");
             return false;
          }
          if($("#r_id").val() == null || $("#r_id").val() == ""){
             $("#r_id").attr("placeholder", "받는 아이디를 작성해주세요.");
             return false;
          }
          
           $.ajax({
               type: "get",
               url : "/note/note_insert.ajax",
                dataType : "json",
               data : $("#note_form").serialize(),
               success:function(data){
                   alert("쪽지 전송 완료");
                   window.location.reload();
               },
           });
           
           $("#noteModal").modal("hide");
       });
      
      
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
   <form name="noteForm" action="/note/note_list" method="get">
        <!-- 바 -->
        <div class="sidemenu">
        	<div class="myImg">
        		<img src="../resources/images/아나바다2.png" width="150px" height="150px"/>
        		<br>
        		${id } 님
        	</div>
        	<div style="padding-top: 10px">
	        	<button type="button" name="send" id="send" class="n_btn1" style="display: block; margin: auto;">쪽지 보내기</button>
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
        
        <!-- 내용 -->
        <div class="minicon" style="background-color: white; border-top: 1px solid #e9e9e9">
		    
            <table class="n_list">
            <tr>
            	<td colspan="4">
            	<button type="button" name="delete" class="n_btn2">
            	삭제</button>
            	&nbsp;읽지 않은 메시지 ${no_read }
            	</td>
            </tr>
            <tr>
               <td width="50px;" style="text-align: center">
                  <input type="checkbox" name="deletes" value="0" id="delete_all">
               </td>
               <c:choose>
               <c:when test="${who eq 'receive'}">
                  <td width="200px" style="text-align: center">보낸 사람</td>
               </c:when>
               <c:otherwise>
                  <td width="150px" style="text-align: center">받는 사람</td>
               </c:otherwise>
               </c:choose>
               <td width="400px" style="text-align: center">내용</td>
               <td width="250px" style="text-align: center">날짜</td>
            </tr>
            
            <!-- 안읽으면 1, 읽으면 0 -->
            <!-- 쪽지함에서 삭제했으면 0, 안했으면 1 -->
            <!-- 받은 쪽지함 -> 보낸 쪽지함 -->
            <c:forEach items="${n_list}" var="n_list">
            <c:choose>
            <c:when test="${who eq 'receive' && n_list.r_delete_chk eq 1}">
            <tr onmouseover="this.style.backgroundColor = '#f9f9f9'" onmouseout="this.style.backgroundColor = ''">
               <td style="text-align: center">
                  <input type="checkbox" name="deletes" class="delete" value="${n_list.bno}">
               </td>
               <td>
                  <c:if test="${not empty n_list.s_id}">${n_list.s_id }</c:if>
                  <c:if test="${empty n_list.s_id}">(알수없음)</c:if>
               </td>
               <td>
                  <a href="/note/note_readView?bno=${n_list.bno}&pno=${n_list.pno }&page=${scri.page }&perPageNum=${scri.perPageNum }&who=${scri.who}">
                     <c:if test="${n_list.read_chk eq 1}">
                     <img src="../resources/images/new.png" width="14px" height="14px">
                     </c:if>
                     <c:choose>
                       <c:when test="${fn:length(n_list.content) >  26}">
                          <c:out value="${fn:substring(n_list.content, 0, 25)}"/>...
                       </c:when>
                       <c:otherwise>
                          <c:out value="${n_list.content}"/>
                       </c:otherwise>
                     </c:choose>
                  </a>
               </td>
               <td>${n_list.s_time }</td>
            </tr>
            </c:when>
            <c:when test="${who eq 'send' && n_list.s_delete_chk eq 1}">
               <tr onmouseover="this.style.backgroundColor = '#e5e5e5'" onmouseout="this.style.backgroundColor = ''">
               <td style="text-align: center">
                  <input type="checkbox" name="deletes" class="delete" value="${n_list.bno}">
               </td>
               <td>
                  <c:if test="${not empty n_list.r_id}">${n_list.r_id }</c:if>
                  <c:if test="${empty n_list.r_id}">(알수없음)</c:if>
               </td>
               <td>
                  <a href="/note/note_readView?bno=${n_list.bno}&page=${scri.page }&perPageNum=${scri.perPageNum }&who=${scri.who}">
                     <c:choose>
                       <c:when test="${fn:length(n_list.content) >  26}">
                          <c:out value="${fn:substring(n_list.content, 0, 25)}"/>...
                       </c:when>
                       <c:otherwise>
                          <c:out value="${n_list.content}"/>
                       </c:otherwise>
                     </c:choose>
                  </a>
               </td>
               <td>${n_list.s_time }</td>
            </tr>
            </c:when>
            </c:choose>
            </c:forEach>
         </table>
         <div style="margin-bottom: 0px; text-align: center">
            <c:if test="${pageMaker.prev }">
               <a href="note_list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a>
               <!-- 
               ex) 1페이지에서 제목+내용 선택하고 aaaaa 입력한 뒤 검색 버튼 누르고 -> 그 검색 목록 중에서 [2]페이지 눌렀을 때 
               http://localhost:8080/board/list?page=2&perPageNum=10&searchType=tc&keyword=aaaaa 
               [이전] 누르면 파라미터 값들 가지고 BoardController "/list"로 이동(기본이 get방식)
               -->
               </c:if>
                           
            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
               <%-- <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/> --%>
               &nbsp;<a href="note_list${pageMaker.makeSearch(idx)}">${idx }</a>
            </c:forEach>
                           
            <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
               <a href="note_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
            </c:if>
         </div>
        </div><!-- 미니콘 -->
        </form>
   </section>
   <div>
      <jsp:include page="../includes/footer.jsp" />
   </div>
   
    <!-- 모달내용 -->
   <div class="modal fade" id="noteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">쪽지</h1>
                </div>
                <form id="note_form">
                    <!-- 
                    <input type="hidden" id="s_id" name="s_id" vlaue="${id}"/>현재 로그인한 아이디
                    <input type="hidden" id="r_id" name="r_id" value=""/>받을 사람 아이디
                    -->
                    <input type="hidden" name="confirm" value="no">
                    <div class="modal-body">
                        <table style="width: 100%">
                            <tbody>
                                <tr>
                                    <th>보내는 아이디</th>
                                    <td>
                                       <input type="text" id="s_id" name="s_id" class="form-control" value="korea"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                       <textarea name="content" id="content" class="form-control"
                                       style="height: 300px; resize: none;">
                                       </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>받는 아이디</th>
                                    <td>
                                       <input type="text" id="r_id" name="r_id" class="form-control" value="money"/>
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