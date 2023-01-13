<template>
    <div>
        <button @click="clickHandler">click</button>
    </div>
</template>


<script>

import axios from 'axios'

export default {
    name: "LegacyConnectionTestView",
    methods: {
        clickHandler () {
            
            axios.get('http://localhost:8080/vue/data/test')
                .then(() => {
                    alert('데이터 전송 완료!')
                })
                .catch(() => {
                    alert('문제 발생!')
                })
            
        }
    }
}

</script>