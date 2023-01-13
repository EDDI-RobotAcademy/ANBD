<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.anabada.web.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">


<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>



<meta charset="UTF-8">
<title>${read.p_title}</title>
<style type="text/css">
/*  img {
   width: 500px;
   height: 500px;
}
 */
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
   
   width: 490px;
   height: 320px;
   border-radius: 20px;
   border-top-left-radius: 0px;
   border: 2px solid #AFAFAF;
   padding: 17px;
   
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
.reBox{
padding: 5px;
   background-color: #AFAFAF;
   text-align: center;
   font-weight: bold;
   color: white;
   letter-spacing: 2px;
   border-top-left-radius: 7px;
   border-top-right-radius: 7px;
   width: 100px;
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
   .sideword {
        width:110px;
     overflow: hidden;
     text-overflow: ellipsis;
     white-space: nowrap;
      
   }
/*레이아웃 */
#wapper {
   width: 1200px;
   margin: auto;
   height: auto;
}
.nav, .aside, .section {
   margin: 3px; /*간격*/
}
.nav, .section, .aside {
   float: left;
}
.nav {
   width: 70px;
}
.section {
   /* background-color: #f9f9f9;    */
   width: 1000px;
   border: 0px;
   border-collapse: collapse;
}
.aside {
   
}
.sideBanner {
   width: 120px;
   position: absolute;
   height: 470px;
   top: 100px;
   background-color: white;
   border: 1px solid #0C6BBC;
   text-align: center;
   margin-left: 10px;
   margin-top: 10px;
}
.recent_list {
   height: 405px;
   overflow: hidden;
}
/*최근 본 알바 ul*/
#recentItemList {
   list-style: none;
   float: left;
   text-align: center;
}
#recentItemList li {
   height: 130px;
   display: inline-block;
   text-align: center;
   margin-bottom: 5px;
}
ul {
    list-style: none;
    margin:0px; padding:0px;
}
#reviewBox{
margin-top: 70px;
}
#reviewBox td{
 width: 510px;
}
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
      /*display: none;*/
   }
   
   .p_img { 
        width: 110px;
        height: 110px;
        border-radius: 10px;
    }
/*끝 */

.noReview{
text-align: center;
color: #AFAFAF;
margin-top:50px;
font-size: 20px;
}

.cunsumer{

border-radius: 7px;
background-color: #AFAFAF;
display: inline-block;
color: white;
font-size:11px;
padding:  0px 2px 0px 2px;
}

</style>
<script type="text/javascript">

</script>

</head>
<body>

<!-- header -->

<div id="anbdHead" >
   <div>
      <jsp:include page="../includes/nav.jsp" />
   </div>
   <div >
      <jsp:include page="../includes/header.jsp" />
   </div>
   </div>

<!-- header end -->

   <div id="wapper" >
   <section class="nav"></section>
   <section class="section" style="border-top: 1px solid #e5e5e5">

   
   
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
               <td colspan="6" rowspan="10" style="background-color: white;">

                  <div class="single-item" id="slick" style="width: 500px; height: 500px;">

                     <c:choose>
                        <c:when test="${ empty filelist }">

                           <div class="imgbox" >
                              <img width="500px;" height="500px;"  src="/tomcatImg/img.png">
                           </div>
                        </c:when>
                        <c:otherwise>

                           <c:forEach items="${filelist}" var="list">
                              <div class="imgbox" >
                                 <img width="500px;" height="500px;" src="${list.filepath }" name="p_file">
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
                        <div     id="userBK"  > </div>

                     </c:otherwise>

                  </c:choose></td>

            </tr>
            <tr><td>&nbsp;</td> <td colspan="3" >게시일 : <fmt:formatDate  pattern="yyyy.MM.dd" value="${read.p_regdate }"/></td> </tr>
            

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
                  <c:if test="${read.id != id }">
                  <div>
                  
                  <button type="button" name="n_send" class="n_btn1" style="display: block; margin: auto;">쪽지 보내기</button>
                  </div>
                  </c:if>
                  <c:if test="${read.id == id }"> <br>  <br> </c:if>
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
                  <td  ><c:choose>
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

         
      <!-- 상품 상세 설명  및 구매자 후기 -->   
      <table id="reviewBox"  >
      <tr> <td> <div class="reBox" >상 품 상 태</div> </td>  <td> <div class="reBox" > 상점 후기 </div> </td>  </tr>
      <tr> <td> <div id="textbox" > ${read.p_content } </div> </td>  
      
      
      
      <td> 
       <div id="textbox"  style="padding-top: 3px;  ">
      
      <c:choose>
      <c:when test="${reviewList[0] != null }">
         <!-- 상점 후기  -->
      <table   >
      <c:forEach items="${reviewList }"  var="review" >
      <tr>  <td>  <div class="cunsumer" >작성자</div>  ${review.r_consumer}</td> 
       <td style="font-size: small;" >       
       
       <c:if test="${review.r_score == 0.3 }"> ⭐⭐⭐⭐ </c:if>
       <c:if test="${review.r_score == 0.2 }"> ⭐⭐⭐ </c:if>
       <c:if test="${review.r_score == 0.1 }"> ⭐⭐ </c:if>
       <c:if test="${review.r_score == -0.1 }"> ⭐ </c:if>
       
           </td> 
       
       
       
       <td>  <font style="font-size: small; color: gray;" >🕗  ${review.r_date}</font>  </td></tr>
      <tr>
       <td colspan="3" >  ${review.r_content }  <hr style="margin: 5px 0px 5px 0px" > </td>
        </tr>
       
      </c:forEach>
      </table>
      <!-- 후기 끝 -->
      </c:when>
      
      <c:otherwise>
      <div class="noReview" >
      등록된 후기가 없습니다. 
      </div>
      </c:otherwise>
      
      </c:choose>
      
      
      
   

      
      
      
            
<!-- 후기 게시판 페이지 네이션 -->
                  <nav style="margin-left: 50%">
                  <ul class="pagination">
                     <li class="page-item"><c:if test="${pageMaker.prev }">
                           <a class="page-link" href="href="readView${pageMaker.makeSearch(pageMaker.startPage - 1,read.pno,read.p_type )}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                           </a></li>
                     </c:if>
                     <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        <li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>><a class="page-link" href="readView${pageMaker.makeSearch(idx,read.pno,read.p_type)}">${idx }</a></li>
                     </c:forEach>


                     <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                        <li class="page-item"><a class="page-link" href="readView${pageMaker.makeSearch(pageMaker.endPage + 1,read.pno,read.p_type)}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                     </c:if>
                  </ul>
               </nav>
      
      
      <!-- 페이지 네이션 끝 -->
      </div> 

      </td>   
      
      
      
      
      
      
      </tr>
      </table>
      
      
      <!-- 상품 상세 설명 및 구매자 후기  끝  -->
         
         
         
         




      </form>
      </section>
                     <!-- 사이드바 - 최근본 상품 목록 -->
         <section class="aside">
            <div class="sideBanner" >
               최근 본 상품
               <div class="r_btn">
                  <button class="recent_btn">▲</button>
                  <button class="recent_btn">▼</button>
               </div>
               <div class="recent_list ">
                  <ul id="recentItemList">
                  </ul>
               </div>
            </div>
         </section>
         <!-- 최근본 상품 끝  -->
      
   </div>
   
   
   
   
   <!-- footer -->
   <div id="footer">

      <div id="footer">
         <jsp:include page="../includes/footer.jsp" />
      </div>
   </div>
   <!-- footer end -->
   
   
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
                                 ${read.p_title}<br>
                                 ${read.p_cost}<br>
                                 <!-- 
                                 ${p_read.p_title}<br>
                                 ${p_read.p_cost}<br>
                                 -->
                              </td>
                          </tr>
                                
                                <c:forEach items="${m_list }" var="m_list">

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
   <!-- 모달 end  -->
   
   <!-- 쪽지 모달 -->
   <div class="modal fade" id="noteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">쪽지</h1>
                </div>
                <form id="note_form">
                    <input type="hidden" name="n_review" value="no">
                    <input type="hidden" name="pno" id="pno" value="${read.pno}">
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
                                       id="n_receiver" name="n_receiver" class="form-control" value="${read.id }" readonly/>
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
   
   




</body>
</html>