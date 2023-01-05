<template>
    <div>
        <p>Hello {{ message }}</p>
        <h2>{{ message.length }}</h2>
        <h3>{{ list[2] }}</h3>
        <h4>{{ list[number] }}</h4>
        <p>{{ buttonClickCount }} 번 클릭했습니다.</p>
        <button v-on:click="buttonClickIncrementHandler">카운트하기</button>

        <!-- GlobalComponent.vue -->
        <!-- 부가적으로 현재 케이스에서 global-component 라는 이름 보다는
            :initial-test는 실제 global-component가 가지고 있는 정보이며
             이 정보로 전달되는 내용이 현재 컴포넌트의 counter임을 의미합니다.
             사실상 Vue의 시작이자 끝인 부분 - 컴포넌트(Component) -->
        <global-component :initial-test="counter"/>
        <local-component :initial-value="num"/><br />
        <button @click="plus">클릭해 봐!</button>
    </div>
</template>

<script>
import Vue from 'vue'
import GlobalComponent from '@/components/GlobalComponent.vue'
import LocalComponent from '@/components/LocalComponent.vue'

Vue.component(GlobalComponent.name, GlobalComponent)

export default {
    name: "TestView",
    components: {
        'local-component': LocalComponent
    },
    data () {
        return {
            message: "이렇게 html과 javascript가 변수화되어 연결이 가능하다.",
            list: ['apple', 'banana', 'grape', 'strawberry'],
            number: 1,
            buttonClickCount: 0,
            counter: 0,
            num: 0
        }
    },
    methods: {
        buttonClickIncrementHandler: function () {
            this.buttonClickCount += 1
        },
        plus () {
            this.num++
        }
    }
}
</script>