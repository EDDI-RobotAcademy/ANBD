<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.anabada.web.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>



<meta charset="UTF-8">
<title>${read.p_title}</title>
<style type="text/css">
img {
	width: 500px;
	height: 500px;
}

.rach input[type='checkbox'] {
	display: none;
}

.rach input[type='checkbox']+span {
	display: inline-block;
	padding: 5px 5px;
	border: 1px solid #AEB6BF;
	border-radius: 10px;
	background-color: #F7ECEC;
	text-align: center;
	cursor: pointer;
	color: #E55555;
}

.rach input[type='checkbox']:checked+span {
	background-color: #FD7D7D;
	color: white;
	border-radius: 10px;
}

.slick-arrow {
	z-index: 2; /* prev버튼은 위치 이동시 이미지 뒤로 숨겨짐 */
	position: absolute; /* 원하는 위치에 지정  */
	top: 50%;
	width: 50px;
	height: 50px;
	transform: translateY(-25px);
}

.slick-prev.slick-arrow { /* prev 이전 */
	position: absolute;
	left: 0px;
}

.slick-next.slick-arrow { /* next 다음 */
	right: 10px;
}

/* 아래점 */
.slick-dots {
	text-align: center;
}

.slick-dots li {
	display: inline-block;
	margin: 0 5px;
}

#textbox {
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	height: 200px;
	border-radius: 20px;
	border: 2px solid #E2E2E2;
	padding: 17px;
	margin-top: 40px;
}

#re {
	text-align: center;
	font-weight: bold;
	color: white;
	background-color: #AFAFAF;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	height: 30px;
	border-bottom: 2px;
}

.box {
	display: inline;
	border-radius: 7px;
	padding: 5px;
	background-color: #AFAFAF;
	text-align: center;
	font-weight: bold;
	color: white;
	margin-right: 0px;
	letter-spacing: 2px;
}

#userBK{
	width: 100px;
	display: inline-block;
	border-radius: 7px;
	padding: 5px;
	background-color: #AFAFAF;
	text-align: center;
	font-weight: bold;
	color: white;
	margin-right: 10px;
	letter-spacing: 2px;



}

#btndiv {
	float: right;
	margin-bottom: 30px;
}

#book option, #book {
	text-align: center;
	font-weight: bold;
	color: #3D3D3D;
	font-size: 17px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		//목록으로 가기 버튼
		$("#listbtn").on("click", function() {
			location.href = "/product/list";
		})
		//수정하기 버튼
		$("#rebtn").on("click", function() {

			formObj.attr("action", "/product/updateView");
			formObj.attr("method", "get");
			formObj.submit();

		})

		//삭제하기 버튼 
		$("#delbtn").on("click", function() {
			if (confirm("게시글을 삭제하시겠습니까?   삭제한 게시글은 복구 할 수 없습니다.")) {
				formObj.attr("action", "/product/delete");
				formObj.attr("method", "post");
				formObj.submit();

			} else {
				return false;
			}
		})

		//슬라이드쇼 구현 
		$("#slick").slick({
			infinite : true, /* 맨끝이미지에서 끝나지 않고 다시 맨앞으로 이동 */
			slidesToShow : 1, /* 화면에 보여질 이미지 갯수*/
			slidesToScroll : 1, /*  스크롤시 이동할 이미지 갯수 */
			autoplay : true, /* 자동으로 다음이미지 보여주기 */
			arrows : true, /* 화살표  */
			dots : true, /*  아래점  */
			autoplaySpeed : 1500,/* 다음이미지로 넘어갈 시간 */
			speed : 1000, /* 다음이미지로 넘겨질때 걸리는 시간 */
			pauseOnHover : true, /*  마우스 호버시 슬라이드 이동 멈춤 */
			//vertical:true,/*  세로방향으로 슬라이드를 원하면 추가하기// 기본값 가로방향 슬라이드*/
			responsive : [ { /* 반응형웹*/
				breakpoint : 960, /*  기준화면사이즈 */
				settings : {
					slidesToShow : 2
				}
			/*  사이즈에 적용될 설정 */
			}, { /* 반응형웹*/
				breakpoint : 768, /*  기준화면사이즈 */
				settings : {
					slidesToShow : 1
				}
			/*  사이즈에 적용될 설정 */
			} ]
		});

		//찜버튼 이벤트 
		$("#heart").on("click", function() {

			if ($(this).prop('checked')) {
				$(".himg").attr("src", "../../resources/images/heartB.png");

				var params = {
					pno : "${read.pno}",
					id : "${id}"
				}

				$.ajax({

					type : "POST",
					url : "/product/addHeart",
					data : params,
					dataType : "json",
					contetnType : "application/json",

					success : function(res) {

						//res.getEncoding('utf-8');
						//var list = JSON.parse(res);

						const element = document.getElementById('heartCh');
						element.innerText = res.hnum;

					},
					error : function(request, status, error) {

						alert("error:" + error);

					}

				});
			} else {
				$(".himg").attr("src", "../../resources/images/heartA.png");

				var params = {
					pno : "${read.pno}",
					id : "${id}"
				}

				$.ajax({

					type : "POST",
					url : "/product/subHeart",
					data : params,
					dataType : "json",
					contetnType : "application/json",

					success : function(res) {

						const element = document.getElementById('heartCh');
						element.innerText = res.hnum;

					},
					error : function(XMLRequest, textStatus, errorThrown) {

						alert("error:" + error);

					}

				});

			}
		}); // 하트 이벤트 끝

		//사용자가 상품 판매 상태 변경시 
		$("#book").on("change", function() {

			var book = document.getElementById('book');
			var str = $("#book option:selected").val(); // 선택된 값

			var params = {
				pno : "${read.pno}",
				p_buy : str
			}

			$.ajax({
				type : "POST",
				url : "/product/change",
				data : params,
				dataType : "json",
				contetnType : "application/json",

				success : function(res) {

				},
				error : function(request, status, error) {

					alert("error:" + error);

				}

			});

		}); //상품 상태 변경 끝 

		bookCh();

	})

	//User가 제품 판매 상태 보기 
	function bookCh() {

		var p_buy = "${read.p_buy}";
		const element = document.getElementById("userBK");

		if (p_buy == 'ing') {

			element.innerText = '판매중';

		} else if (p_buy == 'book') {
			element.innerText = '예약중';
		} else {
			element.innerText = '판매완료';
		}
	}
</script>

</head>
<body>


	<div>
		<button id="listbtn">목록으로가기</button>


		<form name="readForm" role="form">

			<input type="hidden" name="pno" value="${read.pno }">


			<table style="margin-left: auto; margin-right: auto;">
				<tr>



					<td colspan="10" style="text-align: right; padding-right: 20px;">


						<div style="display: inline;">

							<label class="rach"><input type="checkbox" id="heart" name="p_heart" value="${read.p_heart }" /> <c:choose>
									<c:when test="${heart==0 }">
										<img class="himg" style="width: 60px; height: 60px;" src="../../resources/images/heartA.png">
									</c:when>
									<c:otherwise>
										<img class="himg" style="width: 60px; height: 60px;" src="../../resources/images/heartB.png">
									</c:otherwise>
								</c:choose> </label>

						</div> <c:if test="${id == read.id }">

							<button id="rebtn" style="background-color: white; border: none;" title="글 수정">
								<img src="../resources/images/edit.png" style="width: 40px; height: 40px;">
							</button>
							<button id="delbtn" style="background-color: white; border: none;" title="삭제">
								<img src="../resources/images/garbage.png" style="width: 40px; height: 40px;">
							</button>

						</c:if>
					</td>

				</tr>




				<tr>
					<td colspan="10">
						<hr style="height: 2px; background-color: #DBD9D9;">
					</td>
				</tr>


				<tr style="height: 15px;">
					<td colspan="6" rowspan="9" style="background-color: white;">

						<div class="single-item" id="slick" style="width: 500px; height: 500px;">

							<c:choose>
								<c:when test="${ empty filelist }">

									<div>
										<img src="/tomcatImg/img.png">
									</div>
								</c:when>
								<c:otherwise>

									<c:forEach items="${filelist}" var="list">
										<div>
											<img src="${list.filepath }" name="p_file">
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>



					</td>

					<td>&nbsp;</td>
					<td colspan="3" style="font-weight: bold; font-size: 35px;">${read.p_title }</td>
				</tr>


				<tr>
					<td>&nbsp;</td>
					<td colspan="2">판매자 : ${read.id }</td>
					<td>&nbsp;</td>

				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2">판매가격 : ${read.p_cost }원</td>
					<td><c:choose>
							<c:when test="${read.id== id }">
								<select id="book" class="form-select form-select-sm" aria-label=".form-select-sm example">
									<option value="ing" <c:out value="${read.p_buy eq 'ing' ? 'selected' :''} "/>>판매중</option>
									<option value="book" <c:out value="${read.p_buy eq 'book' ? 'selected' :''} "/>>예약중</option>
									<option value="end" <c:out value="${read.p_buy eq 'end' ? 'selected' :''} "/>>판매완료</option>

								</select>
							</c:when>
							<c:otherwise>
								<div  id="userBK"></div>

							</c:otherwise>

						</c:choose></td>

				</tr>

				<tr>
					<td colspan="4">
						<hr>
					</td>
				</tr>



				<tr>
					<td>&nbsp;</td>
					<td><span style="font-size: 30px;">👀</span> ${read.p_count }</td>
					<td>&nbsp;</td>
					<td><span style="color: red; font-size: 30px;"> ❤</span>
						<div style="display: inline-block;" id="heartCh">${read.p_heart }</div> <br></td>

				</tr>




				<tr>
					<td>&nbsp;</td>
					<td>
						<div class="box">카테 고리</div> ${read.p_type }
					</td>
					<td colspan="2">&nbsp;</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td><div class="box">제품 상태</div> ${read.p_con }</td>
					<td colspan="2">&nbsp;</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td><div class="box">거래 유형</div> <c:if test="${read.sell_a != '0' }">${read.sell_a} [ ${read.p_local} ] </c:if> <c:if test="${read.sell_b != '0' }">${read.sell_b}</c:if></td>
					<td colspan="2">&nbsp;</td>

				</tr>

				<tr>


					<td colspan="3">
						<div>채팅 버튼 자리</div>
					</td>
				</tr>
				<tr>
					<td colspan="10">
						<hr style="height: 2px; background-color: #DBD9D9;">
					</td>
				</tr>



			</table>





			<!-- 관련 상품 보여주기  -->
			<table style="margin-top: 50px; margin-left: auto; margin-right: auto;">
				<tr>
					<td id="re">관 련 상 품</td>
				</tr>


				<tr>
					<c:forEach items="${listImg}" var="listImg">
						<td><c:choose>
								<c:when test="${ empty listImg.s_filePath}">

									<div onclick="location.href='/product/readView?pno=${listImg.s_pno}&p_type=${listImg.s_p_type }'" style="display: inline-table;">
										<img src="/tomcatImg/img.png" onmouseover="this.style.opacity =0.2 " onmouseout="this.style.opacity =1" style="width: 200px; height: 200px;">

									</div>

								</c:when>
								<c:otherwise>
									<div onclick="location.href='/product/readView?pno=${listImg.s_pno}&p_type=${listImg.s_p_type }'" style="display: inline-table;">
										<img src="${listImg.s_filePath }" onmouseover="this.style.opacity =0.2 " onmouseout="this.style.opacity =1" style="width: 200px; height: 200px;">

									</div>


								</c:otherwise>
							</c:choose></td>
					</c:forEach>
				</tr>

				<tr>
					<c:forEach items="${listImg}" var="listImg">
						<td style="text-align: center; font-weight: bold;">${listImg.s_title}</td>
					</c:forEach>


				</tr>




			</table>

			<!-- 관련 상품 끝 -->

			<div id="textbox">
				<font style="font-size: 20px; font-weight: bold; color: #6F6F6F">[ 상품 상태 ]</font> <br> <br> ${read.p_content}
			</div>


		</form>
	</div>



</body>
</html>