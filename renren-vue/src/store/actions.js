import {
  reqBannerAndNav,
  reqgetBuyCartData,
  reqAddCartItem,
  reqDeleteCartItem
}
from '../api'

import {
  SAVE_USER_INFO,
  RECEIVE_BUY_CART,
  SAVE_BANNERS,
  SAVE_NAVS,
  SAVE_NEWS,
  SELECT_SKU_ITEM,
  ADD_SKU_ITEM_COUNT,
  SELECT_SHOP_SKU_ITEMS,
  SELECT_ALL_SKU,
  EDIT_SHOP_SKUS,
  DELETE_SKU
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
  /**
   * 在购物车里选择sku
   * @param commit
   * @param state
   * @param obj 一维下标
   */
  selectSkuItem({commit, state},obj){
    commit(SELECT_SKU_ITEM,obj);
  },
  /**
   * 增加或减少sku的购买数量
   * @param commit
   * @param state
   * @param obj
   */
  async addSkuItemCount({commit, state},obj){
    //请求接口
    const result = await reqAddCartItem(obj);
    if (result.code == 0) {
      commit(ADD_SKU_ITEM_COUNT,obj);
    }
  },
  /**
   * 全选店铺下的所有sku
   * @param commit
   * @param state
   * @param obj
   */
  selectShopSkuItems({commit, state},obj){
    commit(SELECT_SHOP_SKU_ITEMS,obj);
  },
  /**
   * 全选所有sku
   * @param commit
   * @param state
   * @param obj
   */
  selectAllSku({commit, state},obj){
    commit(SELECT_ALL_SKU,obj);
  },
  /**
   * 编辑店铺下所有sku
   * @param commit
   * @param state
   * @param obj
   */
  editShopSkus({commit, state},obj){
    commit(EDIT_SHOP_SKUS,obj);
  },
  /**
   * 删除单个sku
   * @param commit
   * @param state
   * @param obj
   */
  async deleteSku({commit, state},obj){
    //发送请求
    const result = await reqDeleteCartItem(obj);
    if (result.code == 0) {
      commit(DELETE_SKU,obj);
    }
  }
}

