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
                              params: { boardType: 'pboard'.toString() }}">
            중고 게시물
          </router-link>
        </button>&nbsp;
        <button>
          <router-link :to="{ name: 'complaint-view',
                              params: { boardType: 'a_board'.toString() }}">
            동네생활
          </router-link>
        </button>&nbsp;
        <button>
          <router-link :to="{ name: 'complaint-view',
                              params: { boardType: 'review'.toString() }}">
            리뷰
          </router-link>
        </button>&nbsp;
        <ComplaintAll :complaint="complaint"/>
        
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
    ]),
  },
  created() {
    this.requestComplaintAllFromSpring()
  }
}



</script>