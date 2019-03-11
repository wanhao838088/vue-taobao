<template>
  <div class="navi-bar">
    <div style="position: relative;width: 100%">
      <button class="btn-back"><i class="iconfont icon-fanhui1"></i></button>
      <button class="btn-cart"><i class="iconfont icon-gouwuche-01"></i></button>
    </div>
  </div>
</template>

<script>
  /**
   * 商品顶部
   *  返回 和 加入购物车
   * 组件
   */
  export default {
    name: "GoodsBar"
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .navi-bar
    width: 100%;
    position: absolute;
    top: 0.2rem;
    left: 0;
    z-index: 110;
    padding: 0 0.1rem;
    .btn-back
      position: absolute;
      width: 0.8rem;
      height: 0.8rem;
      border: 0;
      left: 10px;
      top 1px;
      border-radius: 100%;
      text-align: center;
      background: rgba(0, 0, 0, 0.4);
      color: #fff;
      .iconfont
        font-size: 0.8rem;
    .btn-cart
      position: absolute;
      width: 0.8rem;
      height: 0.8rem;
      right 30px;
      top 1px;
      border: 0;
      border-radius: 100%;
      text-align: center;
      background: rgba(0, 0, 0, 0.4);
      color: #fff;
      .iconfont
        font-size: 0.8rem;
</style>
