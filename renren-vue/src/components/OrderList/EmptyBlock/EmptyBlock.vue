<template>
  <!--没有订单显示-->
  <div class="empty-block">
    <div>
      <img src="https://img.alicdn.com/tfs/TB1vJ_.vTqWBKNjSZFxXXcpLpXa-330-330.png"
           alt="empty" width="82" height="82">
      <div class="empty-title">您还没有相关的订单</div>
      <div class="empty-content">可以去看看有哪些想买的</div>

      <div class="empty-btn" style="display: block;">
        <span @click="$router.push('/main')">随便逛逛</span>
      </div>
    </div>
  </div>
</template>

<script>
  /**
   * 没有订单的时候显示
   */
  export default {
    name: "EmptyBlock"
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .empty-block
    text-align: center;
    margin-top: 1.2rem;
    .empty-btn
      display: block;
      & span
        display: inline-block;
        font-size: 0.373rem
        line-height: 0.773rem
        padding: 0 0.53rem;
        height: 0.773rem
        color: #ffffff;
        background-image: -webkit-linear-gradient(left, #fd9126, #ff5000);
        background-image: linear-gradient(to right, #fd9126, #ff5000);
        border-radius: 0.373rem
        margin-top: 0.385rem;
    .empty-content
      color: #999999;
      font-size: 0.25rem;
    .empty-title
      color: #333333;
      font-size: 0.36rem;
      margin: 0.06rem 0;
</style>
