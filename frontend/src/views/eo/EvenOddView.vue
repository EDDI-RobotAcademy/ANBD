<template>
    <form @submit.prevent="clickSubmit">
        <div>숫자를 입력하세요.</div>
        <input type="text" v-model="eoNumber"/>
        <button type="submit">확인하기</button>
    </form>
</template>

<script>

export default {
    name: "EvenOddVeiw",
    data () {
        return {
            text: ''
        }
    },
    methods: {
        clickSubmit () {
            if (this.eoNumber % 2 == 0) {
                alert('짝수입니다.')
            
            } else {
                alert('홀수입니다.')
            }
        }
    }
}

</script>