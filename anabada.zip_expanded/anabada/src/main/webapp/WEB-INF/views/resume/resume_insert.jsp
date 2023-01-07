<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../resources/images/favicon.ico">
<link rel="manifest" href="../resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<link href="../resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/n_styles.css'/>">
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
			$("#r_company1").val("");			
			$("#r_company2").val("");			
			$("#r_company3").val("");
			$("#r_start1").val("");
			$("#r_start2").val("");
			$("#r_start3").val("");
			$("#r_end1").val("");
			$("#r_end2").val("");
			$("#r_end3").val("");
		});
		
		// submit할 때 체크해야 할 것들
		$("button[type='submit']").click(function () {
			
			var name = $("input[name='r_name']").val();
			var tel = $("input[name='r_tel']").val();
			var age = $("input[name='r_age']").val();
			var gender = $("input[name='r_gender']").is(":checked");
			
			var company1 = $("input[id='r_company1']").val();
			var company2 = $("input[id='r_company2']").val();
			var company3 = $("input[id='r_company3']").val();
			
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
			
		    var n_start1 = $("#r_start1").val().replace(/-/gi, '');
		    var n_start2 = $("#r_start2").val().replace(/-/gi, '');
		    var n_start3 = $("#r_start3").val().replace(/-/gi, '');
		    
		    var n_end1 = $("#r_end1").val().replace(/-/gi, '');
		    var n_end2 = $("#r_end2").val().replace(/-/gi, '');
		    var n_end3 = $("#r_end3").val().replace(/-/gi, '');
		    
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
		width: 900px;
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
<link href="../resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div>
       <jsp:include page="../includes/nav.jsp" />
    </div>
      
    <div>
       <jsp:include page="../includes/header.jsp" />
    </div>
    
    <section class="container">
	    <div class="minicon">
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
						${j_read.j_method }&nbsp;${j_read.j_pay }
					</td>
				</tr>
				
				<tr>
					<td class="info">이름</td>
					<td>
						<input type="text" name="r_name" id="r_name" class="form-control" >
						<br>
						<div id="n_null"></div>
					</td>
				</tr>
				
				<tr>
					<td class="info">나이</td>
					<td>
						<input type="text" name="r_age" id="r_age" class="form-control" style="width: 40%">&nbsp;살
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
					<td class="info">알바 경력(선택)<br>최대 3개 가능</td>
					<td>
						<div id="career1" style="display:inline-block; margin-bottom: 5px;">
							회사명 <input type="text" name="r_company1" id="r_company1" class="form-control" style="display: inline; width: 260px">&nbsp;
							시작 <input type="text" name="r_start1" id="r_start1" class="form-control" style="display: inline; width: 160px">&nbsp;
							종료 <input type="text" name="r_end1" id="r_end1" class="form-control" style="display: inline; width: 160px">
						</div>
						<!-- 이 부분 반복문으로 돌리기 -->
						<%for(int i = 2; i <= 3; i++) {%>
						<div id="career<%=i%>" style="display:none; margin-bottom: 5px;">
							회사명 <input type="text" name="r_company<%=i%>" id="r_company<%=i%>" class="form-control" style="display: inline; width: 260px">&nbsp;
							시작 <input type="text" name="r_start<%=i%>" id="r_start<%=i%>" class="form-control" style="display: inline; width: 160px">&nbsp;
							종료 <input type="text" name="r_end<%=i%>" id="r_end<%=i%>" class="form-control" style="display: inline; width: 160px">
						</div>
						<%} %>
						<div style="text-align: center">
							<button type="button" id="add" class="n_btn3" style="display: inline-block; width: 100px;">경력 추가하기</button>
							<button type="button" id="reset" class="n_btn3" style="display: inline-block; width: 120px;">경력 모두 지우기</button>
						</div>
						<div id="max"></div>
						<br>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<button type="submit" class="n_btn1" style="display: block; margin: auto">지원하기</button>
					</td>
				</tr>
			</table>
			<br>
		</form>
		</div>
	</section>
	
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
			selectedYear: 2022,
			startYear: 2000,
			finalYear: 2022,
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
						
		/* MonthPicker Set */
		$('#r_start1').monthpicker(options);
		$('#r_start2').monthpicker(options);
		$('#r_start3').monthpicker(options);
		$('#r_end1').monthpicker(options);
		$('#r_end2').monthpicker(options);
		$('#r_end3').monthpicker(options);
						
	});
				 
</script>
</html>