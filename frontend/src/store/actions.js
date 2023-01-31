import {
    REQUEST_COMPLAINT_FROM_SPRING,
} from './mutation-types'

// npm install axios --save-dev
import axios from 'axios'
import router from '@/router'

export default {

    requestComplaintFromSpring ({ commit }, boardType) {
        console.log('requestComplaintFromSpring()')
        console.log(boardType)

        return axios.get(`http://localhost:7777/complaint/boardType/${boardType}`)
            .then((res) => {
                commit(REQUEST_COMPLAINT_FROM_SPRING, res.data)
                console.log('성공')
                console.log(JSON.stringify(res.data))
            })
    },

    requestComplaintAllFromSpring ({ commit }) {
        console.log('requestComplaintAllFromSpring()')

        return axios.get('http://localhost:7777/complaint/all/list')
            .then((res) => {
                commit(REQUEST_COMPLAINT_FROM_SPRING, res.data)
                console.log('성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestDeleteComplaintToSpring ({ }, payload) {
        console.log('requestDeleteComplaintToSpring()')

        alert("길이" + Object.keys(payload).length)
        alert(JSON.stringify(payload))
        for(var i=0; i<Object.keys(payload).length;i++){
            alert("순서" + i)
            alert(JSON.stringify(payload[i]))
            alert(JSON.stringify(payload[i].c_bno))
            alert(JSON.stringify(payload[i].boardType).replaceAll("\"", ""))
            const c_bno = JSON.stringify(payload[i].c_bno)
            const boardType = JSON.stringify(payload[i].boardType).replaceAll("\"", "")

            axios.get(`http://localhost:7777/complaint/delete/${c_bno}/${boardType}`)

            // 삭제 다했으면 마지막에 새로고침
            if(i == Object.keys(payload).length - 1) {
                router.go(0)
                alert("삭제되었습니다.")
            }   
        }
          
 
    },
    
}