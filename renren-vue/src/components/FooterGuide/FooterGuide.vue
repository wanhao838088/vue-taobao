<template>
  <div class="tb-toolbar-container" data-spm="toolbar">
      <span class="tab" :class="{active: '/main'===$route.path}" @click="goTo('/main')">
        <span class="iconfont icon-shouye"></span>
        <p class="text">首页</p>
      </span>

    <span class="tab" :class="{active: '/buyCart'===$route.path}" @click="goTo('/buyCart')">
      <span class="iconfont icon-gouwuche1"></span>
      <p class="text">购物车</p>
    </span>

    <span class="tab" :class="{active: '/orderList'===$route.path}" @click="goTo('/orderList')">
      <span class="iconfont icon-dingdan1"></span>
      <p class="text">订单列表</p>
    </span>

    <span class="tab" :class="{active: '/myTb'===$route.path}" @click="goTo('/myTb')">
      <span class="iconfont icon-wode1"></span>
      <p class="text">我的淘宝</p>
    </span>

    <span class="tab" :class="{active: '/more'===$route.path}" @click="goTo('/more')">
      <span class="iconfont icon-gengduo"></span><p class="text">更多</p>
    </span>

  </div>
</template>

<script>
  export default {
    name: "FooterGuide",
    methods:{
      goTo (path) {
        this.$router.replace(path)
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .tb-toolbar-container
    box-sizing: border-box;
    display: flex;
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    z-index: 1001;
    background-color: #ffffff;
    border-top: 1px solid #e7e7e7;
    border-bottom: 1px solid #f8f8f8;
    justify-content: space-between;
    align-items: center;
    padding-top: 2px;
    padding-bottom: constant(safe-area-inset-bottom);
    padding-bottom: env(safe-area-inset-bottom);
    .active
      color orangered !important;
    .tab
      color: #5d656b;
      flex 1
      text-decoration: none;
      display: block;
      text-align: center;
      .iconfont
        font-size 0.5rem
      .text
        font-size: 0.35rem;
        transform: scale(0.83333333);
</style>
