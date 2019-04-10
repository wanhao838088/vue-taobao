/*
vuex 的 mutations 模块
*/
import Vue from 'vue'
import {
  SAVE_USER_INFO,
  RECEIVE_GOODS,
  RECEIVE_BUY_CART,
  SAVE_BANNERS,
  SAVE_NAVS,
  SAVE_NEWS,
  SELECT_SKU_ITEM,
  ADD_SKU_ITEM_COUNT
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
  /**
   * 在购物车里选择sku
   * @param state
   * @param obj
   */
  [SELECT_SKU_ITEM] (state,obj) {
    //切换sku的选择状态
    state.buyCart[obj.oneId].list[obj.twoId].isSelect = obj.isSelect;

    //检查这个组的sku是否全选了
    let firstList = state.buyCart[obj.oneId].list;
    let firstFlag = true;
    //执行过滤操作
    firstFlag = firstList.some((element, index, array)=>{
      return !element.isSelect;
    });

    state.buyCart[obj.oneId].isSelect = !firstFlag;
    Vue.set(state.buyCart[obj.oneId], 'isSelect', !firstFlag)
    let temp = state.buyCart;
    //重置一下 否则不触发getter更新数据
    state.buyCart = null;
    state.buyCart = temp;
  },
  /**
   * 在购物车里选择sku
   * @param state
   * @param obj
   */
  [ADD_SKU_ITEM_COUNT] (state,obj) {
    //切换sku的选择状态
    state.buyCart[obj.oneId].list[obj.twoId].amount += obj.number;

    let temp = state.buyCart;
    //重置一下 否则不触发getter更新数据
    state.buyCart = null;
    state.buyCart = temp;
  },
}
