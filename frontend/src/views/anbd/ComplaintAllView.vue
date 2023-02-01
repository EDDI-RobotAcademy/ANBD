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

    <ComplaintAll :complaint="complaint" @Delete="onDelete" />
      
  </v-container>

  

  
</template>


<script>
import { mapState, mapActions } from "vuex";
import ComplaintAll from "@/components/anbd/ComplaintAll.vue";

export default {
name: "CompalintAllView",
components: {ComplaintAll},
computed: {
  ...mapState(['complaint'])
},
methods: {
  ...mapActions([
      'requestComplaintAllFromSpring',
      'requestDeleteComplaintToSpring',
      ''
  ]),
  async onDelete (payload) {
    if(confirm("삭제하시겠습니까?")){
      await this.requestDeleteComplaintToSpring(payload); 
    }else{
      return false
    }
  },
  
},
created() {
  this.requestComplaintAllFromSpring()
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