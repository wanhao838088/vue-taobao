/*
vuex 的 mutations 模块
*/
import Vue from 'vue'

import {
  RECEIVE_ADDRESS,
} from './mutation-types'

export default {
  [RECEIVE_ADDRESS] (state, {address}) {
    state.address = address
  },

}
