import {
  reqBannerAndNav,
  reqgetBuyCartData
}
from '../api'

import {
  SAVE_USER_INFO,
  RECEIVE_BUY_CART,
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
  // 异步获取商家商品列表
  async getBuyCart({commit},callBack) {
    const result = await reqgetBuyCartData();
    if (result.code === 0) {
      const data = result.data
      commit(RECEIVE_BUY_CART, {data});
      //调用回调
      callBack && callBack();
    }
  },
}

