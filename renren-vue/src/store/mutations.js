/*
vuex 的 mutations 模块
*/
import Vue from 'vue'

import {
  SAVE_USER_INFO,
} from './mutation-types'

export default {
  [SAVE_USER_INFO] (state, {user}) {
    state.user = user
  },

}
