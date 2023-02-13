<template>
  <v-container>

    <v-btn class="ma-2" color="gray" @click="onDelete"> 삭제 </v-btn>
      <v-data-table
          :headers="headerTitle"
          :items="complaint"
          :items-per-page="10"
          @click:row="readRow"
          class="elevation-1"
          item-key="comNum"
          show-select
          v-model="selectedItems">
      
        <template v-slot:top>
          <v-toolbar flat>
            <v-toolbar-title>전체 신고내역</v-toolbar-title>
          </v-toolbar>
        </template>

        <template v-slot:[`item.boardType`]="{ item }">
          <span v-if="item.boardType === 'job'">알바</span>
          <span v-if="item.boardType === 'note'">쪽지</span>
          <span v-if="item.boardType === 'pboard'">중고</span>
          <span v-if="item.boardType === 'a_board'">동네생활</span>
          <span v-if="item.boardType === 'review'">리뷰</span>
        </template>

 <template v-slot:[`item.details`]="{ item }">
  <v-layout justify-center>
          <v-dialog v-model="dialog" persisten max-width="800"  :retain-focus="false"  >
            <template v-slot:activator="{on}">
              <v-btn color="primary" dark v-on="on"  @click="details(item.c_bno, item.boardType)" >상세보기</v-btn>
            </template>

            <v-card>
                 <v-card-title class="headline">
                 총 신고 횟수  {{complaintTotal.totalNum}} 회
              </v-card-title>
                        <v-card-text>
                
              
              <table   class="resonTable"  >
              <tr>  
              <td>  <div class="box"><span v-if="item.boardType === 'pboard'">   판매 금지 물품 판매  </span> <span  v-else>욕설, 비방, 차별, 혐오 </span> {{complaintTotal.type1}} </div>     </td>    <td> <div class="box"> 홍보,영리목적 {{complaintTotal.type2}} </div> </td>  
               <td><div class="box"> 불법 정보 {{complaintTotal.type3}} </div></td> 
               </tr>

               <tr>  
                <td><div class="box">음란, 청소년 유해 {{complaintTotal.type4}} </div></td>   
              
              <td> <div class="box"><span v-if="item.boardType === 'pboard'">  사기 글이에요 </span>   <span  v-else>  개인 정보 노출, 유포, 거래 </span>  {{complaintTotal.type5}} </div>    </td>    <td><div class="box">도배 스팸 {{complaintTotal.type6}}</div> </td> 
               </tr>

              </table>
              </v-card-text>
             <v-card-text>
 
기타 {{complaintTotal.type7}}건 
   <v-data-table
            :headers="resonTitle"
            :items="resonList"
            :items-per-page="10"
           
            class="elevation-1"/>

              
</v-card-text>
     <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="teal darken-1" text @click="btnClick">
                  닫기
                </v-btn>
               
              </v-card-actions>


            </v-card>
          </v-dialog>
        </v-layout>
 </template>






        <template v-slot:[`item.show`]="{ item }">
          <a @click="popup(item.c_bno, item.boardType)">확인</a>
          {{item.c_bno}} && {{item.boardType}}
        </template>

      </v-data-table>
      <h5>Selected: {{selectedItems}}</h5>
      {{complaint}}
  </v-container>
</template>
  
<script>
  export default {
    name: "ComplaintAll",
 props: {
      complaint: {
        type: Object,
        required: true,
      },
  
       complaintTotal:{
        type : Object,
        required : true,

      },
      resonList:{
        type: Object,
         required : true,
  
      }
    },
    data () {
        return {
          dialog : false,
            selectedItems: [],
            headerTitle: [
             
              { text: '신고 내용', value: 'c_content', width: "200px" },
              { text: '게시물 번호', value: 'c_bno', width: "100px" },
              { text: '게시물 유형', value: 'boardType', width: "100px" },
              {text : '상세 사유' , value : 'details', width : "100px"},
              { text: '게시물 보기', value: 'show', width: "100px" },
            ],
              resonTitle :[
              
              { text  : '신고 내역' , value : 'c_content' , width : "150px"}



            ]
            
            
        }
    },
    methods:{
      onDelete (){
        this.$emit('Delete', this.selectedItems) //상위로 연결됨
      },
      
      popup(c_bno, boardType){
        // 이 부분에 각자 이동할 url 작성
        if(boardType === 'job'){
          window.open("http://localhost:8080/job/complaint_job?j_bno=" + c_bno + "&href=all",  "_blank", 'width=1000px,height=1000px')
        }else if(boardType === 'note'){
          window.open("http://localhost:8080/note/complaint_note?n_bno=" + c_bno + "&href=all", "_blank", 'width=460px, height=500px')
        }else if(boardType === 'pboard'){
          window.open("http://localhost:8080/pcomplaint/complaintBoard?pno=" + c_bno + "&href=all",'_blank', 'width=700px,height=700px')
        }else if(boardType === 'a_board'){
          window.open("http://localhost:8080//a_board/complaintReadView?a_bno=" + c_bno + "&href=all",'_blank', 'width=1000px,height=1000px')
        }else if(boardType === 'review'){
          // 리뷰 url은 유진언니가 달기!!
          window.open("http://localhost:8080/pcomplaint/complaintReview?r_no=" + c_bno + "&href=all",'_blank', 'width=500px,height=400px')
        }
        
      },
      async details(c_bno,boardType){
   
        this.dialog = true
      
        await this.$emit('onDetails' , {c_bno , boardType})
      },
    
      async btnClick(){
  
       this.dialog = false
       
        
      }




    },
}
</script>
  
  <style scoped>
  
.resonTable{
padding: 20px;

}
.resonTable tr td{
  padding : 10px;

}
.box{
 border-radius: 7px;
	padding: 5px;
	background-color: #AFAFAF;
	text-align: center;
	font-weight: bold;
	color: white;
}


  </style>