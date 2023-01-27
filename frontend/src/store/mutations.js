import {
    REQUEST_COMPLAINT_FROM_SPRING,
} from './mutation-types'

export default {
    [REQUEST_COMPLAINT_FROM_SPRING] (state, passingData) {
        console.log(JSON.stringify(passingData))
        state.complaint = passingData
        console.log(JSON.stringify(state.complaint))
    }
}