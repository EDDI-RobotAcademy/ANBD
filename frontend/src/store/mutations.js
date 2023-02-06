import {
    REQUEST_COMPLAINT_FROM_SPRING,
    REQUEST_COMPLAINT_DETAIL_SPRING,
} from './mutation-types'

export default {
    [REQUEST_COMPLAINT_FROM_SPRING] (state, passingData) {
        console.log(JSON.stringify(passingData))
        state.complaint = passingData
        console.log(JSON.stringify(state.complaint))
    },

    [REQUEST_COMPLAINT_DETAIL_SPRING] (state, passingData) {
        console.log(JSON.stringify(passingData))
        state.complaintDetails = passingData
        console.log(JSON.stringify(state.complaintDetails))
    }


}