import {
  reqGoods,
  reqBannerAndNav
}
from '../api'

import {
  SAVE_USER_INFO,
  RECEIVE_GOODS,
  SAVE_BANNERS,
  SAVE_NAVS
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

  // 异步获取商品列表
  async getGoods({commit, state}) {
    const result = await reqGoods();
    let goods = [];
    if (result.code == 0) {
      goods = result.goodsList;
    }
    commit(RECEIVE_GOODS, {goods});
  },

  // 异步获取商品详情
  async getBannerAndNav({commit, state},callBack) {
    const result = await reqBannerAndNav();
    if (result.code == 0) {
      commit(SAVE_BANNERS,{banners:result.banners});
      commit(SAVE_NAVS,{navs:result.navs});
      //回调
      callBack && callBack.call();
    }
  },

}

