<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
<style>
	body {
		background-color: #F9F9F9;
	}
	.report-background {
		background-color: white;
		width: 485px;
		height: 500px;
		text-align: left;
		margin: 15px auto;
		padding: 5px 12px 12px;
		overflow: auto;
	}
	.report-background h3 {
		text-align:center;
	}
	
	hr {
		background-color: #F1F1F1;
		height: 1px;
		border: 0 none;
	}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	// 유효성 체크 부분 
	if("${msg}" == "이미 신고한 게시물입니다." ){
		alert("${msg}");
		window.close();
	}
	if("${msg}" == "ok" ){
		alert("신고가 접수되었습니다.");
		window.close();
	}
	
	
	
	$('input[name="report"]').change(function() {
		if($('input[name="report"]:checked').val() == '1') {
			$("#1c").css('display', 'block');
			$("#2c").hide();
			$("#3c").hide();
			$("#4c").hide();
			$("#5c").hide();
			$("#6c").hide();
			$("#7c").hide();
		}
		else if($('input[name="report"]:checked').val() == '2') {
			$("#1c").hide();
			$("#2c").show();
			$("#3c").hide();
			$("#4c").hide();
			$("#5c").hide();
			$("#6c").hide();
			$("#7c").hide();
		}
		else if($('input[name="report"]:checked').val() == '3') {
			$("#1c").hide();
			$("#2c").hide();
			$("#3c").show();
			$("#4c").hide();
			$("#5c").hide();
			$("#6c").hide();
			$("#7c").hide();
		}
		else if($('input[name="report"]:checked').val() == '4') {
			$("#1c").hide();
			$("#2c").hide();
			$("#3c").hide();
			$("#4c").show();
			$("#5c").hide();
			$("#6c").hide();
			$("#7c").hide();
		}
		else if($('input[name="report"]:checked').val() == '5') {
			$("#1c").hide();
			$("#2c").hide();
			$("#3c").hide();
			$("#4c").hide();
			$("#5c").show();
			$("#6c").hide();
			$("#7c").hide();
		}
		else if($('input[name="report"]:checked').val() == '6') {
			$("#1c").hide();
			$("#2c").hide();
			$("#3c").hide();
			$("#4c").hide();
			$("#5c").hide();
			$("#6c").show();
			$("#7c").hide();
		}
		else if($('input[name="report"]:checked').val() == '7') {
			$("#1c").hide();
			$("#2c").hide();
			$("#3c").hide();
			$("#4c").hide();
			$("#5c").hide();
			$("#6c").hide();
			$("#7c").show();
		}
		else if($('input[name="report"]:checked').val() == null){
			$("#1c").hide();
			$("#2c").hide();
			$("#3c").hide();
			$("#4c").hide();
			$("#5c").hide();
			$("#6c").hide();
			$("#7c").hide();
		}
	});
});
function reportSubmit() {
	var chkValue = document.getElementsByName("report");
	
	var	 c_content="";
		
		if($('input:radio[name=report]').is(':checked')) {
		 var inputValue = $("input[name='report']:checked").val(); // 체크한 것의 value
		
		 if(inputValue=="1"){
			 c_content ="욕설, 비방, 차별, 혐오";
		 }else if(inputValue=="2"){
			 c_content ="홍보,영리목적";
		 }else if(inputValue=="3"){
			 c_content ="불법 정보";
		 }else if(inputValue=="4"){
			 c_content ="음란, 청소년 유해";
		 }else if(inputValue=="5"){
			 c_content ="개인 정보 노출, 유포, 거래";
		 }else if(inputValue=="6"){
			 c_content ="도배 스팸";
		 }else if(inputValue=="7"){
			 c_content =$("#reson").val();
		 }
		 
			
			$("#c_content").attr('value', c_content);
		 
		 
		 $("form[name='reportForm']").submit();
		}
		else{
			window.open("/a_board/reportError", "경고", "width=250, height=100, left=50, top=50");
		}
	
}
</script>
</head>
<body>
<form  name="reportForm" action="/product/submit_reviewReport" method="post" >

<!-- 넘길 정보 값들 -->
<input   type="hidden" name="c_bno" value="${r_no}" >
<input   type="hidden" name="id" value="${id}" >
<input type="hidden" name="c_content"  id="c_content" >
<input type="hidden" name="board_type" value="review" >

	<!-- 신고 팝업창 -->
	<div class="report-background">
	<h3>신고하기</h3>
	<hr>
	<h4>게시글을 신고하는 사유를 선택해 주세요</h4>

<label for="report1"><input type="radio" name="report" id="report1" value="1"> 욕설, 비방, 차별, 혐오 </label>
	<div id="1c" style="display:none;">
		욕설을 사용하여 타인을 비방하거나 모욕하는 행위
		지역, 장애, 성별 등을 차별하거나 혐오감을 조장하는 행위
		타인읙 감정을 상하게 하거나 불쾌감을 유발하는 행위
	</div>
	<hr>

	<label for="report2"><input type="radio" name="report" id="report2" value="2"> 홍보, 영리목적 </label>
	<div id="2c" style="display:none;">
		상업적 · 홍보 · 영리 목적으로 서비스를 이용하는 행위
		상업적 · 홍보 · 영리 목적으로 계정을 생성 · 이용하는 행위
	</div>
	<hr>

	<label for="report3"><input type="radio" name="report" id="report3" value="3"> 불법 정보 </label> 
	<div id="3c" style="display:none;">
		불법적인 사행성・도박 사이트를 홍보하는 행위
		불법 제품을 판매하거나 홍보하는 행위
		범법 행위에 대한 정보를 제공하는 행위
	</div>
	<hr>

	<label for="report4"><input type="radio" name="report" id="report4" value="4"> 음란, 청소년 유해 </label> 
	<div id="4c" style="display:none;">
		과도한 신체 노출이나 음란한 행위를 묘사하는 행위
		성적 수치심이나 불쾌감을 유발할 수 있는 내용을 게시하는 행위
		성매매 관련 정보를 공유하는 행위
	</div>
	<hr>

	<label for="report5"><input type="radio" name="report" id="report5" value="5"> 개인 정보 노출, 유포, 거래 </label>
	<div id="5c" style="display:none;">
		타인의 개인정보를 탈취・유포・거래하려는 행위
		계정을 타인에게 판매・양도・대여하는 행위
		타인의 개인정보를 다수에게 공개된 게시판 등에 노출하는 행위
	</div>
	<hr>

	<label for="report6"><input type="radio" name="report" id="report6" value="6"> 도배, 스팸 </label>
	<div id="6c" style="display:none;">
		동일한 내용을 반복적으로 등록하는 행위
		시스템의 취약점을 이용하여 유해한 내용을 게시하는 행위
	</div>
	<hr>

	<label for="report7"><input type="radio" name="report" id="report7" value="7"> 기타 </label> 
	<div id="7c" style="display:none;">
		<textarea cols="45" rows="3"  id="reson" placeholder="신고 사유 직접 입력 (최대 250자)"></textarea>
	</div>
	</div>
	</form>

	<!-- 신고, 취소 버튼 -->
	<button type="button" onclick="reportSubmit();">신고</button>
	<button type="reset" onclick="javascript:window.close();">취소</button>	

	<p id="warn"></p>
</body>
</html>