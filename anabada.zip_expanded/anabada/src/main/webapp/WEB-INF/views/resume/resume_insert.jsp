<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<link href="../resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="../resources/css/j_styles.css" rel="stylesheet" type="text/css">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>알바 지원 등록 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/j_styles.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		// 경력 추가하기 버튼 눌렀을 때
		$("#add").on("click", function () {
			$("#company").attr("placeholder", "");
	        $("#company").val("");
	        $("#start").val("");
	        $("#end").val("");
	        $('#careerModal').modal("show");  
			
		});
		
		// 모달창에서 경력 등록 눌렀을 때
		$("#career_insert").on("click", function () {
			var company = $("#company").val();
			var start = $("#start").val();
			var end = $("#end").val();
			
			var now = new Date();
		    var year = now.getFullYear();
		    var month = now.getMonth() + 1;//1월이 0으로 되기때문에 +1을 함.
		    var date = now.getDate();
		    var today = year+"-"+(("00"+month.toString()).slice(-2)); // 오늘 날짜(문자)
		    var n_today = today.replace(/-/gi,''); //오늘 날짜(숫자로 ex)202012)
		    var n_start = $("#start").val().replace(/-/gi, '');
			var n_end = $("#end").val().replace(/-/gi, '');
		    
		    var plus = n_end - n_start >= 0;
		    
		    // 회사명 null 체크
		    if(company == null || company == ""){
		    	$("#c_null").text("회사명을 입력해주세요.");
	    		$("#c_null").css("color", "red");
	    		return false;
		    }else{
		    	$("#c_null").text("");
		    }
		    
		    // 경력 체크
			if(company != "" && n_start != "" && n_end != ""){ // 다 기입했을 때
				if(plus && n_start <= n_today){ // 시작기간이 끝기간보다 먼저일때
					$("#p_null").text("");
				}else if(plus && n_start > n_today ){ // 끝기간이 시작기간보다 먼저일때
					$("#p_null").text("시작기간을 확인해주세요.");
		    		$("#p_null").css("color", "red");
		    		return false;
				}else{
					$("#p_null").text("경력을 확인해주세요.");
		    		$("#p_null").css("color", "red");
		    		return false;
				}
			
			}else if(company != "" || n_start != "" || n_end != ""){
				$("#p_null").text("경력을 확인해주세요.");
	    		$("#p_null").css("color", "red");
	    		return false;
			}
		    
			var career = "<div style='margin:5px;'>" +
				"회사명&nbsp;" + "<input type='text' name='r_company' class='form-control' style='width: 30%' readonly value=" + company + ">" +
				"&nbsp;&nbsp;&nbsp;시작&nbsp;" + "<input type='text' name='r_start' class='form-control' style='width: 15%' readonly value=" + start + ">&nbsp;&nbsp;~" +
				"&nbsp;&nbsp;끝&nbsp;" + "<input type='text' name='r_end' class='form-control' style='width: 15%' readonly value=" + end + ">" +
				"&nbsp;&nbsp;&nbsp;<button type='button' name='delete_btn' class='j_btn2' style='width: 50px;height:25px; display: inline' onclick='delete_btn();'>" + "삭제" + "</button>" +
				"<div>";
			var $career_list = $("#career_list");
			$career_list.append(career);
			
			$("#careerModal").modal("hide");
		});
		
		
		// submit할 때 체크해야 할 것들
		$("button[type='submit']").click(function () {
			
			var name = $("input[name='r_name']").val();
			var tel = $("input[name='r_tel']").val();
			var count = (tel.match(/-/g) || []).length;
			//alert((tel.match(/-/g) || []).length);
			
			var age = $("input[name='r_age']").val();
			var number = isNaN(age); // 숫자가 아니면 true
			
			var gender = $("input[name='r_gender']").is(":checked");
			
			// 1.이름 null 체크
			if(name == ""){
				$("#n_null").text("이름을 작성해주세요.");
	    		$("#n_null").css("color", "red");
	    		return false;
			}else{
				$("#n_null").text("");
			}
			
			// 2.나이 null 체크
			if(age == ""){
				$("#a_null").text("나이를 작성해주세요.");
	    		$("#a_null").css("color", "red");
	    		return false;
			}else if(number){
				$("#a_null").text("숫자로 작성해주세요.");
	    		$("#a_null").css("color", "red");
	    		return false;
			}else{
				$("#a_null").text("");
			}
			
			// 3.성별 null 체크
			if(!gender){
				$("#g_null").text("성별을 선택해주세요.");
	    		$("#g_null").css("color", "red");
	    		return false;
			}else{
				$("#g_null").text("");
			}
			
			// 4.전화번호 null 체크
			if(tel == ""){
				$("#t_null").text("전화번호를 작성해주세요.");
	    		$("#t_null").css("color", "red");
	    		return false;
			}else if(count < 2){
				$("#t_null").text("전화번호를 다시 작성해주세요.");
	    		$("#t_null").css("color", "red");
	    		return false;
			}else{
				$("#t_null").text("");
			}
			
			//6.필수 항목 모두 선택했는지
			if($('.essential:checked').length != $('.essential').length){
				$("#e_null").text("필수 항목에 동의해주세요.");
				$("#e_null").css("color", "red");
	    		return false;
			}
			
		});
		
		// 경력 지우기
		$(document).on('click', 'button[name=delete_btn]', function() {
		    alert('삭제합니다.');
		    $(this).closest("div").remove();
		});
		
	});
	

</script>
<style>
	table{
		width: 100%;
		margin: auto;
	}
	tr, td{ 
      	padding: 10px;
		vertical-align: middle;
	}
   	td.info {
        width: 150px;
    }
    .form-control{
    	display: inline;
    	/*이래야지 부트스트랩으로 input 적용했을 때 아래 공백없어짐*/
    }
    .j_img{
    	width: 100px; height: 100px; 
    	float: left; 
    	margin-right: 10px;
    	border-radius: 0.25rem;
    }
</style>
</head>
<body>
	<div>
       <jsp:include page="../includes/nav.jsp" />
    </div>
      
    <div>
       <jsp:include page="../includes/miniHeader.jsp" />
    </div>
    
    <section class="container">
		<form action="/resume/resume_insert" method="post">
			<input type="hidden" name="id" value="${id }">
			<input type="hidden" name="j_bno" value="${j_read.j_bno }">
			<input type="hidden" name="page" value="${scri.page }">
			<input type="hidden" name="perPageNum" value="${scri.perPageNum }">
			<input type="hidden" name="j_term" value="${scri.j_term }">
			<input type="hidden" name="j_addr1" value="${scri.j_addr1 }">
			<input type="hidden" name="j_day" value="${scri.j_day }">
			<input type="hidden" name="j_cate" value="${scri.j_cate }">
			
			<table>
				<tr>
					<td colspan="2"><font style="font-size: 30px;">알바 지원서 작성</font></td>
				</tr>
				
				<tr>
					<td colspan="2" style="border-bottom: 1px solid #ced4da; border-top: 1px solid #ced4da;">
						<c:choose>
	                        <c:when test="${empty j_read.j_img}">
	                            <img class="j_img" src="../resources/images/아나바다2.png">
	                         </c:when>
	                         <c:otherwise>
	                            <img class="j_img" src="/upload/${j_read.j_img }">
	                         </c:otherwise>
	                    </c:choose>
	                    <font style="font-size: 20px;">${j_read.j_title }</font><br>
						${j_read.j_company }<br>
						${j_read.j_addr1 }&nbsp;${j_read.j_addr2 }<br>
						${j_read.j_method }&nbsp;${j_read.j_pay }원
					</td>
				</tr>
				
				<tr>
					<td class="info">이름</td>
					<td>
						<input type="text" name="r_name" id="r_name" class="form-control" style="width: 40%">
						<br>
						<div id="n_null"></div>
					</td>
				</tr>
				
				<tr>
					<td class="info">나이</td>
					<td>
						<input type="text" name="r_age" id="r_age" class="form-control" style="width: 40%" placeholder="숫자로 입력해주세요.">&nbsp;세
						<br>
						<div id="a_null"></div>
					</td>
				</tr>
				
				<tr>
					<td class="info">성별</td>
					<td>
						<label>
							<input type="radio" name="r_gender" id="r_men" value="남">&nbsp;남
						</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>
							<input type="radio" name="r_gender" id="r_woman" value="여">&nbsp;여
						</label>
						<br>
						<div id="g_null"></div>
					</td>
				</tr>
				
				<tr>
					<td class="info">전화번호</td>
					<td>
						<input type="text" name="r_tel" id="r_tel" class="form-control" placeholder="-을 넣어 작성해주세요.">
						<br>
						<div id="t_null"></div>
					</td>
				</tr>
				
				<tr>
					<td class="info">알바 경력(선택)
					<td>
						<div id="career_list"></div>
						<button type="button" id="add" class="j_btn2">경력 추가하기</button>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
					<input type="checkbox" class="essential">&nbsp;(필수)개인정보 수집 및 이용 동의<br>
					<input type="checkbox" class="essential">&nbsp;(필수)개인정보 제 3자 제공 동의
					<br>
					<div id="e_null"></div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<button type="submit" class="j_btn1">지원하기</button>
					</td>
				</tr>
			</table>
			<br>
		</form>
	</section>
	
	<!-- 모달내용 -->
    <div class="modal fade" id="careerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">쪽지</h1>
                </div>
                    <div class="modal-body">
                        <table style="width: 100%">
                            <tbody>
                                <tr>
                                    <th style="width: 10%">회사명</th>
                                    <td>
                                       <input type="text" id="company" class="form-control"/><br>
                                       <div id="c_null"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>기간</th>
                                    <td>
                                    	시작 <input type="text" id="start" class="form-control" style="display: inline-block; width: 40%">&nbsp;
										종료 <input type="text" id="end" class="form-control" style="display: inline-block; width: 40%"><br>
										<div id="p_null"></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" id="career_insert">등록하기</button>
                    <button class="btn btn-primary" type="button" id="finsh" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
	
	<div>
      <jsp:include page="../includes/footer.jsp" />
    </div>

</body>
<script type="text/javascript" src="../resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery.mtz.monthpicker.js"></script>
<script>
   $(function () {
   /* MonthPicker 옵션 */
      options = {
         pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
         selectedYear: 2023,
         startYear: 2000,
         finalYear: 2023,
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
       };
                  
      /* MonthPicker Set */
      $('#start').monthpicker(options);
      $('#end').monthpicker(options);
                  
   });
             
</script>

</html>