<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<div>

<a href="/product/list"> 상품 목록으로 가기  </a>
<br>
<a href="/product//writeView"> 상품 글쓰기 가기  </a>
<br>
<a href="/event/writeView"> 이벤트 글쓰기 가기  </a>
<br>
<a href="/event/list"> 이벤트 리스트가기  </a>
<br>
<a href="/userProduct//myStore" >내상점</a>



</div>


	
	<form action="/job/writeView_boss" method="get">
		<input type="submit" value="알바 구인 공고 쓰러가기">
	</form>
	<form action="/job/job_list" method="get">
		<input type="submit" value="알바 구인 게시판">
	</form>
	<form action="/job/my_jobList" method="get">
		<button type="submit" id="show_writeList">내 알바글 목록으로 돌아가기</button>
	</form>
	
	<br><br><br><br><br>
	
	<!-- 모달 -->
    <button type="button" id="modal">쪽지 보내기</button>
     
    <!-- 모달내용 -->
	<div class="modal fade" id="noteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                     <h1 class="modal-title fs-5" id="staticBackdropLabel">쪽지</h1>
                </div>
                <form id="note_form">
                    <!-- 
                    <input type="hidden" id="id" name="s_id" vlaue="koread"/>현재 로그인한 아이디.send.임의로함. 원래는 ${id}
                    <input type="hidden" id="id" name="r_id" value="money"/>글쓴이 아이디.recive. 원래는 ${raea.id} 
                    -->
                    <div class="modal-body">
                        <table style="width: 100%">
                            <tbody>
                                <tr>
                                    <th>보내는 아이디</th>
                                    <td>
                                    	<input type="text" style="margin-left:10%; width:85%;" 
                                    	id="s_id" name="s_id" class="form-control" value="korea"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                    	<textarea name="content" id="content" class="form-control"
                                    	style="margin-left:10%; width: 85%; height: 300px; resize: none;">
                                    	</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>받는 아이디</th>
                                    <td>
                                    	<input type="text" style="margin-left:10%; width:85%;"  
                                    	id="r_id" name="r_id" class="form-control" value="money"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" id="note_submit">보내기</button>
                    <button class="btn btn-primary" type="button" data-bs-dismiss="modal" id="finsh">취소</button>
                </div>
            </div>
        </div>
    </div>
    
    <form action="/note/note_list" method="get">
		<button type="submit">내 쪽지함</button>
	</form>
	
	<form action="/review/home_test" method="get">
		<button type="submit">지애</button>
	</form>
	


</body>

<script type="text/javascript">
	$(document).ready(function () {
		
		// 모달창 띄우기
		$('#modal').on("click", function () { 
			$("#content").attr("placeholder", "");
			$("#content").val("");
			$('#noteModal').modal("show"); 
		});
		
	
		/*쪽지 보내기 버튼 눌렀을 떄*/
	    $("#note_submit").click(function(){
	    	
	    	if($("#content").val() == null || $("#content").val() == ""){
	    		$("#content").attr("placeholder", "내용을 작성해주세요.");
	    		return false;
	    	}
	    	
	        $.ajax({
	            type: "get",
	            url : "/note/note_insert.ajax",
	          	dataType : "json",
	            data : $("#note_form").serialize(),
	            success:function(data){
	                alert("쪽지 전송 완료");
	            },
	        });
	        
	        $("#noteModal").modal("hide");
	    });
	
	});
    
</script>

</html>

