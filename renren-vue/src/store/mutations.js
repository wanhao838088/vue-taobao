/*
vuex 的 mutations 模块
*/
import Vue from 'vue'

import {
  SAVE_USER_INFO,
  RECEIVE_GOODS
} from './mutation-types'

export default {
  /**
   * 保存用户到vuex
   *
   * @param state
   * @param user
   */
  [SAVE_USER_INFO] (state, {user}) {
    state.user = user;
  },

  /**
   * 保存商品列表到vuex
   *
   * @param state
   * @param result
   */
  [RECEIVE_GOODS] (state, {goods}) {
    state.goods = goods;
  },

}
