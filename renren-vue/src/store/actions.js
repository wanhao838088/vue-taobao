import {
  reqGoods
}
from '../api'

import {
  SAVE_USER_INFO,
  RECEIVE_GOODS
}
from './mutation-types'

export default {

  /**
   * 保存用户信息
   * @param commit
   * @param state
   * @param user
   */
  saveUserInfo({commit, state},user){
    commit(SAVE_USER_INFO,{user});
  },

  // 异步获取商家列表
  async getGoods({commit, state}) {
    const result = await reqGoods();
    let goods = [];
    if (result.code == 0) {
      goods = result.goodsList;
    }
    commit(RECEIVE_GOODS, {goods});
  },


}

