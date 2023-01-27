import {
    REQUEST_COMPLAINT_FROM_SPRING,
} from './mutation-types'

// npm install axios --save-dev
import axios from 'axios'

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

    
}