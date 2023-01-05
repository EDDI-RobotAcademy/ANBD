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

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		// 판매완료 select option 눌렀을 때 실행
		$('select[name=p_state]').change(function () {
			var state = $('select[name=p_state] option:selected').val();
			
			if(state == 'done'){ // 만약 판매완료 눌렀으면
				$('#selectModal').modal("show"); // 모달창 띄움
//				// 취소했다가 다시 띄우면 이전 눌렀던거 없애고 싶은데...다시 해보기
			}
		});
		
		// 모달창에서 선택 완료 버튼 누르면
	    $("#review_note").click(function(){
	    	
	    	// 사람 선택했는지 체크
	    	var chk = $('input[name=r_id]').is(":checked");
	    	if(!chk){
	    		alert("구매자를 선택해주세요.");
	    		return false;
	    	}
	    	
	    	if(confirm("구매자를 확정하시겠습니까?")){
		   	    var r_id = $("input[name=r_id]:checked").val();
		        
		    	if(r_id == "" || r_id == null){
		    		alert("구매를 확정했습니다.");
		    		$("#selectModal").modal("hide");
		    		return false;
//		    		// 해당 사항 없음을 선택하면 리뷰 쪽지 안가게 막음
//		    		// 이때도 readonly로 바뀌도록
		    	}
		    	
				$.ajax({
			        type: "get",
			        url : "/note/review_note.ajax",
			        data: {
			        	r_id : r_id,
			        	s_id : '${id}', 
			        	pno : 0, 
//원래는 이거임!!		    pno : '${p_read.pno}' // 원래는 이거 나중에 수정하기!!!
						content: '판매가 확정되었습니다. 후기를 작성해주세요.',
						confirm: 'yes'
			        	},
			        dataType :  'json',   // 데이터 타입을 Json으로 변경
			        traditional : true,
			        success: function(data){
			            alert("구매자가 확정되었습니다.");
			        }
		  		});
	   		
				$("#selectModal").modal("hide"); // 모달창 닫기
//				// 이때 readonly로 바꾸기
	    	
	    	}else{
	    		return false;
	    	}
	           
	   
	   });
	
	   // 사람 선택하면 색깔 바뀌는 코드
	   $('input[name=r_id]').change(function(){
		   $('.m_label').css('background-color', '#fff');
		   
		   if($(this).is(':checked')){
	    		$(this).closest('.m_label').css('background-color', '#e9e9e9');
		   }
	    		
	   });
		
	})
			

</script>
<style>
	#select_table{
		width: 100%;
	}
	
	.info, .info td{
		padding-bottom: 10px;
	}
	
	.m_label{
		width: 100%;
		border: 1px solid #e9e9e9;
		cursor: pointer;
		padding: 10px;
	}
	
	.r_id{ /*모달창 사람들 라디오버튼*/
		display: none;
	}
	
	.p_img { 
        width: 110px;
        height: 110px;
        border-radius: 10px;
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
   	  <div class="minicon" style="border-top: 1px solid #e9e9e9; width: 1000px;">
   	  
	  	 <h3>쪽지한 사용자 리스트 하하 ${p_read.pno }</h3>
	  	 <select name="p_state">
	  	 	<option value="stop">판매보류</option>
	  	 	<option value="ing">판매중</option>
	  	 	<option value="done">판매완료</option>
	  	 </select>
	  	 
   	  </div>
   </section>
   
   <!-- 모달 내용 -->
   <div class="modal fade" id="selectModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">구매자 선택하기</h1>
                </div>
                <form id="select_form">
                    <!-- 
                    <input type="hidden" id="s_id" name="s_id" vlaue="${id}"/>현재 로그인한 아이디
                    <input type="hidden" id="r_id" name="r_id" value=""/>받을 사람 아이디
                    -->
                    <div class="modal-body">
                       <table id="select_table">
                            <tbody>
                                <tr class="info">
            						<td width="130px;">
                  						<img class="p_img" src=""><!-- 해당 썸네일 이미지 경로 -->
            						</td>
            						<td>
						               제목<br>
						               비용<br>
						               <!-- 
						               ${p_read.p_title}<br>
						               ${p_read.p_cost}<br>
						               -->
						            </td>
						        </tr>
                                
                                <c:forEach items="${m_list }" var="m_list">
								<tr>
									<td colspan="2">
										<label class="m_label">
											<input type="radio" name="r_id" class="r_id" value="${m_list }">
											${m_list }
										</label>
									</td>
								</tr>
								</c:forEach>
								
								<tr>
									<td colspan="2">
										<label class="m_label">
											<input type="radio" name="r_id" class="r_id" value="">
											해당 사항 없음
										</label>
									</td>
								</tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" id="review_note">선택 완료</button>
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