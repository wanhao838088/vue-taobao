<template>
  <div>
    <header class="fixed-top">
      <div class="fixed-wrap">
        <div class="tab-bar-container">
          <tab :scroll-threshold="5" bar-active-color="#FF5000">
            <tab-item selected @on-item-click="onItemClick">
              <router-link to="/orderList/all" replace>全部</router-link>
            </tab-item>
            <tab-item @on-item-click="onItemClick">
              <router-link to="/orderList/waitPayment" replace>待付款</router-link>
            </tab-item>
            <tab-item @on-item-click="onItemClick">
              <router-link to="/orderList/waitDelivery" replace>待发货</router-link>
            </tab-item>
            <tab-item @on-item-click="onItemClick">
              <router-link to="/orderList/waitReceive" replace>待收货</router-link>
            </tab-item>
            <tab-item @on-item-click="onItemClick">
              <router-link to="/orderList/waitComment" replace>待评价</router-link>
            </tab-item>
          </tab>
        </div>
      </div>
    </header>

    <keep-alive>
      <router-view></router-view>
    </keep-alive>

  </div>
</template>

<script>
  import { Tab, TabItem } from 'vux'

  /**
   * 订单列表
   */
  export default {
    name: "OrderList",
    methods:{
      /**
       * 点击item
       */
      onItemClick(){

      }
    },
    components: {
      Tab,
      TabItem
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .fixed-top
    height: 40px;
    .fixed-wrap
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      z-index: 100;
      .tab-bar-container
        width: 100%;
        flex-shrink: 0;
        flex-grow: 0;
        .vux-tab-selected a
          color: #FF5000
        & a
          color: #000;
          text-decoration: none;
</style>
