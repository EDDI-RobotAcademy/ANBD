<template>

    <v-container>
      <button>
              <router-link :to="{ name: 'complaint-all-view'}">
                전체
              </router-link>
            </button>&nbsp;
            <button>
              <router-link :to="{ name: 'complaint-view',
                                  params: { boardType: 'note'.toString() }}">
                쪽지
              </router-link>
            </button>&nbsp;
            <button>
              <router-link :to="{ name: 'complaint-view', 
                                  params: { boardType: 'job'.toString() }}">
                알바 게시물
              </router-link>
            </button>&nbsp;
            <button>
              <router-link :to="{ name: 'complaint-view', 
                                  params: { boardType: 'product'.toString() }}">
                중고 게시물
              </router-link>
            </button>&nbsp;
            <button>
              <router-link :to="{ name: 'complaint-view',
                                  params: { boardType: 'commuity'.toString() }}">
                동네생활
              </router-link>
            </button>&nbsp;
            <button>
              <router-link :to="{ name: 'complaint-view',
                                  params: { boardType: 'review'.toString() }}">
                리뷰
              </router-link>
            </button>&nbsp;
            <complaint :complaint="complaint"/>
            
        </v-container>
       
        
        
        
      
        
    </template>
    
    <script>
    
    import { mapState, mapActions } from "vuex";
    import Complaint from "@/components/anbd/Complaint";
    
    export default {
      name: "ComplaintView",
      components: {Complaint},
      props: { 
        // 이때 boardNo는 JpaBoardList.vue => index.js를 거쳐서 전달된 값임 
        boardType: { 
          type: String,
          required: true
          //required: true 지정시 해당 props를 넘겨받지 않으면 에러 발생시킨다.
        }
      },
      computed: {
        ...mapState(['complaint'])
      },
      mounted() {
        this.requestComplaintFromSpring(this.boardType)
      },
      methods: {
        ...mapActions([
            'requestComplaintFromSpring',
        ]),
      },
      created() {
        this.requestComplaintFromSpring(this.boardType)
      }
    }
    </script>
    
    