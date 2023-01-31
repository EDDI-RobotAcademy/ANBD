<template>
  <v-container>
    <v-btn class="ma-2" color="gray" @click="onDelete"> 삭제 </v-btn>
    
    <v-data-table
      :headers="headerTitle"
      :items="complaint"
      :items-per-page="10"
      class="elevation-1"
      show-select
      item-key="comNum"
      v-model="selectedItems">

      <template v-slot:top>
        <v-toolbar flat>
          <v-toolbar-title>
            <span v-if="boardType === 'job'">알바 신고내역</span>
            <span v-if="boardType === 'note'">쪽지 신고내역</span>
            <span v-if="boardType === 'pboard'">중고 신고내역</span>
            <span v-if="boardType === 'a_board'">동네생활 신고내역</span>
            <span v-if="boardType === 'review'">리뷰 신고내역</span>
          </v-toolbar-title>
        </v-toolbar>
      </template>

      <template v-slot:[`item.boardType`]="{ item }">
        <span v-if="item.boardType === 'job'">알바</span>
        <span v-if="item.boardType === 'note'">쪽지</span>
        <span v-if="item.boardType === 'pboard'">중고</span>
        <span v-if="item.boardType === 'a_board'">동네생활</span>
        <span v-if="item.boardType === 'review'">리뷰</span>
      </template>

      <template v-slot:[`item.show`]="{ item }">
        <a href="#">확인</a>
        {{item.c_bno}} && {{item.boardType}}
      </template>

  </v-data-table>
  <h5>Selected: {{selectedItems}}</h5>
  </v-container>

</template>

  
<script>

  export default {
    name: "Complaint",
    props: {
      complaint: {
        type: Object,
        required: true,
      },
      boardType: {
        type: String,
        required: true,
      },
    },
    data () {
        return {
            selectedItems: [],
            headerTitle: [
                { text: '신고횟수', value: 'count', width: "100px" }, // 신고횟수 임의로 count라고 함
                { text: '신고 내용', value: 'c_content', width: "200px" },
                { text: '게시물 번호', value: 'c_bno', width: "100px" },
                { text: '게시물 유형', value: 'boardType', width: "100px" },
                { text: '게시물 보기', value: 'show', width: "100px" },
            ],

            

        }
    },
    methods:{
      onDelete (){
        this.$emit('Delete', this.selectedItems) //상위로 연결됨
      } 
      
    }
}
  </script>
  
  <style scoped>
  
  </style>

