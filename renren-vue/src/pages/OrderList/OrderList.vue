<template>
  <div>
    <header class="fixed-top">
      <div class="fixed-wrap">
        <div class="tab-bar-container">
          <tab>
            <tab-item selected @on-item-click="onItemClick">
              <router-link to="/shop/goods" replace>点餐</router-link>
            </tab-item>
            <tab-item @on-item-click="onItemClick">
              <router-link to="/shop/goods" replace>点餐</router-link>
            </tab-item>
            <tab-item @on-item-click="onItemClick">
              <router-link to="/shop/goods" replace>点餐</router-link>
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
        & a
          color: #000;
</style>
