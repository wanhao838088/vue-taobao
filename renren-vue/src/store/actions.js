import {
  reqBannerAndNav
}
from '../api'

import {
  SAVE_USER_INFO,
  RECEIVE_GOODS,
  SAVE_BANNERS,
  SAVE_NAVS,
  SAVE_NEWS
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


  // 异步获取商品详情
  async getBannerAndNav({commit, state},callBack) {
    const result = await reqBannerAndNav();
    if (result.code == 0) {
      console.log(result);
      commit(SAVE_BANNERS,{banners:result.banners});
      commit(SAVE_NAVS,{navs:result.navs});
      commit(SAVE_NEWS,{news:result.news});
      //回调
      callBack && callBack.call();
    }
  },

}

