<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바 지원 페이지</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		// 경력 추가하기 버튼 눌렀을 때
		$("#add").on("click", function () {
			if($("#career2").css("display") == "none"){
				$("#career2").css("display", "inline-block");
				return;
			}
				
			if($("#career3").css("display") == "none"){
				$("#career3").css("display", "inline-block");
				return;
			}
			
			if($("#career3").css("display") == "inline-block"){
				/* $("#max").text("경력은 3개까지만 작성할 수 있습니다.");
				$("#max").css("color", "red"); */
				return;
			}
			
		});
		
		// 경력 지우기
		$("#reset").on("click", function () {
			$("#p_company1").val("");			
			$("#p_company2").val("");			
			$("#p_company3").val("");			
			$(".monthpicker").val("");			
		});
		
		// submit할 때 체크해야 할 것들
		$("button[type='submit']").click(function () {
			
			var name = $("input[name='p_name']").val();
			var tel = $("input[name='p_tel']").val();
			var age = $("input[name='p_age']").val();
			var gender = $("input[name='p_gender']").is(":checked");
			
			var company1 = $("input[id='p_company1']").val();
			var company2 = $("input[id='p_company2']").val();
			var company3 = $("input[id='p_company3']").val();
			
			// 경력 추가가 화면에 보여지는지
			var career2 = $("#career2").css("display") == "inline-block";
			var career3 = $("#career3").css("display") == "inline-block";
			
			// 시작기간, 끝기간 계산위해
			var now = new Date();
		    var year = now.getFullYear();
		    var month = now.getMonth() + 1;//1월이 0으로 되기때문에 +1을 함.
		    var date = now.getDate();
		    var today = year+"-"+(("00"+month.toString()).slice(-2)); // 오늘 날짜(문자)
		    var n_today = today.replace(/-/gi,''); //오늘 날짜(숫자로 ex)202012)
			
		    var n_start1 = $("#p_start1").val().replace(/-/gi, '');
		    var n_start2 = $("#p_start2").val().replace(/-/gi, '');
		    var n_start3 = $("#p_start3").val().replace(/-/gi, '');
		    
		    var n_end1 = $("#p_end1").val().replace(/-/gi, '');
		    var n_end2 = $("#p_end2").val().replace(/-/gi, '');
		    var n_end3 = $("#p_end3").val().replace(/-/gi, '');
		    
		    var plus1 = n_end1 - n_start1 >= 0;
		    var plus2 = n_end2 - n_start2 >= 0;
		    var plus3 = n_end3 - n_start3 >= 0;
		    
		    
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
			}else{
				$("#t_null").text("");
			}
			
			// 5.경력 null 체크(1)
			if(company1 != "" && n_start1 != "" && n_end1 != ""){ // 다 기입했을 때
				if(plus1){ // 시작기간이 끝기간보다 먼저일때
					$("#max").text("");
				}else{ // 끝기간이 시작기간보다 먼저일때
					$("#max").text("경력을 확인해주세요.");
		    		$("#max").css("color", "red");
		    		return false;
				}
			}else if(company1 != "" || n_start1 != "" || n_end1 != ""){
				$("#max").text("경력을 확인해주세요.");
	    		$("#max").css("color", "red");
	    		return false;
			}
			// 5.경력 null 체크(2)
			if(company2 != "" && n_start2 != "" && n_end2 != ""){
				if(plus2){
					$("#max").text("");
				}else{
					$("#max").text("경력을 확인해주세요.");
		    		$("#max").css("color", "red");
		    		return false;
				}
			}else if(company2 != "" || n_start2 != "" || n_end2 != ""){
				$("#max").text("경력을 확인해주세요.");
	    		$("#max").css("color", "red");
	    		return false;
			}
			// 5.경력 null 체크(3)
			if(company3 != "" && n_start3 != "" && n_end3 != ""){
				if(plus3){
					$("#max").text("");
				}else{
					$("#max").text("경력을 확인해주세요.");
		    		$("#max").css("color", "red");
		    		return false;
				}
			}else if(company3 != "" || n_start3 != "" || n_end3 != ""){
				$("#max").text("경력을 확인해주세요.");
	    		$("#max").css("color", "red");
	    		return false;
			}
			
		});
	
		
	});

</script>
<style>
	table{
		width: 1000px;
		margin: auto;
	}
	table tr td{ 
		width: 30px; /*이거 고정해야지 경력 추가할 때 크기가 고정됨. 안그러면 경력 추가할 때마다 크기가 줄어듦*/
	}
</style>
<link href="../resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="/putIn/putIn_done" method="get">
		<input type="hidden" name="id" value="${id }">
		<input type="hidden" name="j_bno" value="${j_bno }">
		<input type="hidden" name="page" value="${scri.page }">
		<input type="hidden" name="perPageNum" value="${scri.perPageNum }">
		<input type="hidden" name="j_term" value="${scri.j_term }">
		<input type="hidden" name="j_addr1" value="${scri.j_addr1 }">
		<input type="hidden" name="j_day" value="${scri.j_day }">
		<input type="hidden" name="j_cate" value="${scri.j_cate }">
	
		<table border="1px">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="p_name" id="p_name">
					<br>
					<div id="n_null"></div>
				</td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td>
					<input type="text" name="p_age" id="p_age">
					<br>
					<div id="a_null"></div>
				</td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="p_gender" id="p_men" value="남">남
					<input type="radio" name="p_gender" id="p_woman" value="여">여
					<br>
					<div id="g_null"></div>
				</td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="p_tel" id="p_tel">
					<br>
					<div id="t_null"></div>
				</td>
			</tr>
			
			<tr>
				<td>알바 경력(선택)<br>최대 3개 가능</td>
				<td>
					<div id="career1" style="display:inline-block;">
						회사명 <input type="text" name="p_company1" id="p_company1">
						시작 <input class="monthpicker" type="text" name="p_start1" id="p_start1">
						종료 <input class="monthpicker" type="text" name="p_end1" id="p_end1">
					</div>
					<!-- 이 부분 반복문으로 돌리기 -->
					<%for(int i = 2; i <= 3; i++) {%>
					<div id="career<%=i%>" style="display:none">
						회사명 <input type="text" name="p_company<%=i%>" id="p_company<%=i%>">
						시작 <input class="monthpicker" type="text" name="p_start<%=i%>" id="p_start<%=i%>">
						종료 <input class="monthpicker" type="text" name="p_end<%=i%>" id="p_end<%=i%>">
					</div>
					<%} %>
					<br>
					<div>
						<button type="button" id="add">경력 추가하기</button>
						<button type="button" id="reset">경력 지우기</button><br>
					</div>
					<div id="max"></div>
				</td>
			</tr>
			
			<script type="text/javascript" src="../resources/js/jquery-1.11.1.min.js"></script>
			<script type="text/javascript" src="../resources/js/jquery-ui.min.js"></script>
			<script type="text/javascript" src="../resources/js/jquery.mtz.monthpicker.js"></script>
			<script>
				 $(function () {
					 /* MonthPicker 옵션 */
						options = {
							pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
							selectedYear: 2022,
							startYear: 2000,
							finalYear: 2022,
							monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
						};
						
						/* MonthPicker Set */
						$('.monthpicker').monthpicker(options);
						
				 });
				 
			</script>
			
			<tr>
				<td colspan="2">
					<button type="submit">지원하기</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>