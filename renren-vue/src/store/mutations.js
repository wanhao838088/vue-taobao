/*
vuex 的 mutations 模块
*/

import {
  SAVE_USER_INFO,
  RECEIVE_GOODS,
  RECEIVE_BUY_CART,
  SAVE_BANNERS,
  SAVE_NAVS,
  SAVE_NEWS
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
  /**
   * navs
   * @param state
   * @param navs
   */
  [SAVE_NAVS] (state, {navs}) {
    state.navs = navs;
  },
  /**
   * banners
   * @param state
   * @param banners
   */
  [SAVE_BANNERS] (state, {banners}) {
    state.banners = banners;
  },
  /**
   * 保存新闻
   * @param state
   * @param news
   */
  [SAVE_NEWS] (state, {news}) {
    state.news = news;
  },
  /**
   * 保存新闻
   * @param state
   * @param news
   */
  [RECEIVE_BUY_CART] (state, {data}) {
    state.buyCart = data;
  },
}
