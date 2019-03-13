<template>
  <div class="bottom-bar">
    <div style="flex: 1;">
      <i class="iconfont icon-dianpu" style="color: #ff5000;"></i>
      <span class="btn-text">店铺</span>
    </div>
    <div style="flex: 1;">
      <i class="iconfont icon-kefu"></i>
      <span class="btn-text">客服</span>
    </div>

    <div style="flex: 1;">
      <i class="iconfont icon-shoucang"></i>
      <span class="btn-text">收藏</span>
    </div>
    <div class="bottom-bar-btn cart ">
      <span class="btn-title">加入购物车</span>
    </div>

    <div class="bottom-bar-btn buy" style="margin-right: 0.11rem;">
      <span class="btn-title">立即购买</span>
    </div>
  </div>
</template>

<script>
  /**
   * 商品底部购物bar
   */
  export default {
    name: "GoodsBottomBar"
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .bottom-bar
    position: fixed;
    bottom: 0;
    width: 100%;
    color white;
    background-color: #fff;
    height 1.6rem;
    display: flex;
    z-index: 110;
    flex-direction: row;
    align-items: center;
    box-shadow: rgba(0, 0, 0, 0.15) 0 -0.01rem 0.06rem 0;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    padding-bottom: env(safe-area-inset-bottom);
    div
      display: flex;
      flex-direction: column;
      justify-content: center;
      width: 1rem;
      height: 1rem;
      font-size 0.37rem;
      white-space: nowrap;
      align-items: center;
      color: #999;
      padding: 0 0.1rem;
    .iconfont
      font-size 0.6rem;
    .bottom-bar-btn
      width: 2.97rem;
      font-weight: bold;
      color #fff;
      height: 1.1rem;
      text-align center;
      border-radius: 0.8rem 0 0 0.8rem;
      background-image: -webkit-linear-gradient(left, #FFC500, #FF9402);
      background-image: linear-gradient(to right, #FFC500, #FF9402)
    .buy
      border-radius: 0 0.6rem 0.6rem 0;
      background-image: -webkit-linear-gradient(left, #FF7A00, #FE560A);
      background-image: linear-gradient(to right, #FF7A00, #FE560A);
</style>
