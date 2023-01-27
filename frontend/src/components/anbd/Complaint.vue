<template>
    <v-container>
          <h3>게시물 목록</h3>
          
          <v-data-table
              :headers="headerTitle"
              :items="complaint"
              :items-per-page="10"
              @click:row="readRow"
              class="elevation-1"
              show-selecte/>
    </v-container>
  </template>
    
    <script>
    export default {
      name: "Complaint",
      props: {
        complaint: {
          type: Object,
          required: true,
        }
      },
      data () {
          return {
              headerTitle: [
                  { text: '신고자', value: 'id', width: "100px" },
                  { text: '신고 내용', value: 'c_content', width: "200px" },
                  { text: '게시물 번호', value: 'c_bno', width: "100px" },
                  { text: '게시물 유형', value: 'boardType', width: "100px" },
              ],
          }
      }
    }
    </script>
    
    <style scoped>
    
    </style>
  
  