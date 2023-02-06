<template>

  <v-container>
        <router-link :to="{ name: 'complaint-all-view'}">
          <v-btn color="blue" class="button">전체</v-btn>
        </router-link>
        &nbsp;
        <router-link :to="{ name: 'complaint-view',
                            params: { boardType: 'note'.toString() }}">
          <v-btn color="blue" class="button">쪽지</v-btn>
        </router-link>
        &nbsp;
        <router-link :to="{ name: 'complaint-view', 
                            params: { boardType: 'job'.toString() }}">
          <v-btn color="blue" class="button">알바</v-btn>
        </router-link>
        &nbsp;
        <router-link :to="{ name: 'complaint-view', 
                            params: { boardType: 'pboard'.toString() }}">
          <v-btn color="blue" class="button">중고</v-btn>
        </router-link>
        &nbsp;
        <router-link :to="{ name: 'complaint-view',
                            params: { boardType: 'a_board'.toString() }}">
          <v-btn color="blue" class="button">동네생활</v-btn>
        </router-link>
        &nbsp;      
        <router-link :to="{ name: 'complaint-view',
                            params: { boardType: 'review'.toString() }}">
          <v-btn color="blue" class="button">리뷰</v-btn>
        </router-link>
        &nbsp;
        
        <v-btn color="green" class="button">
          <a href="http://localhost:8080/">
          홈
          </a>
        </v-btn>
  
        <complaint :complaint="complaint" :boardType="boardType"  :complaintTotal="complaintTotal"  :resonList ="resonList"   @Delete="onDelete"   @onDetails="onDetails" />
        






        </v-container>
        
          
      </template>
      
      <script>
      
      import { mapState, mapActions } from "vuex";
      import Complaint from "@/components/anbd/Complaint";
      
      export default {
        name: "ComplaintView",
        components: {Complaint},
        props: { 
          boardType: { 
            type: String,
            required: true
            //required: true 지정시 해당 props를 넘겨받지 않으면 에러 발생시킨다.
          }
        },
        computed: {
          ...mapState(['complaint','resonList','complaintTotal'] )
        },
  
        mounted() {
          this.requestComplaintFromSpring(this.boardType)
        },
  
        methods: {
          ...mapActions([
              'requestComplaintFromSpring',
              'requestDeleteComplaintToSpring',
              'requestComplaintDetail',
          ]),
          // 동적 라우팅 감지
          data() {
            this.requestComplaintFromSpring(this.boardType)
          },
          // 신고내역 삭제하는 메소드
          async onDelete (payload) {
              if(confirm("삭제하시겠습니까?")){
                await this.requestDeleteComplaintToSpring(payload); 
              }else{
                return false
              }
          },
          async onDetails(payload){
            await this.requestComplaintDetail(payload)
            //alert("111");
            //alert(this.complaintTotal);
          }



        },
        created() {
          this.requestComplaintFromSpring(this.boardType)
          this.data(this.$route.params);
        },
        
        // 동적 라우팅 감지
        watch: {
          $route(to, form) {
          if (to.path !== form.path) this.data(this.$route.params);
          }
        }
      }
      </script>
  
  <style scoped>
  a {
    text-decoration: none;
    color: black;
  }
  a:link {
    color : black;
  }
  a:visited {
    color : black;
  }
  a:hover {
    color : black;
  }
  a:active {
    color : black;
  
  }
  </style>
      
      