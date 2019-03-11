<template>
  <div class="tpl-wrapper">
    <div class="comments_container">
      <div class="comments_left">
        宝贝评价(666)
      </div>
      <div class="comments_right">
        查看全部
      </div>
      <div class="comments_arrow">
        <i class="iconfont icon-arrow-right-copy-copy-copy"></i>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "GoodsComments",
    props:{
      goodsDetail:Object
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .comments_container
    overflow: hidden;
    width 100%;
    height: 0.8rem;
    background-color: rgb(255, 255, 255);
    position: relative;
    .comments_left
      overflow: hidden;
      position: absolute;
      font-size: 0.4rem;
      line-height 0.9rem;
      margin-left: 0.2rem;
      color: rgb(51, 51, 51);
    .comments_right
      margin-right: 0.5rem;
      font-size: 0.4rem;
      line-height 0.9rem;
      position: absolute;
      right 0.2rem;
      color: rgb(255, 80, 0);
    .comments_arrow
      position: absolute;
      right 0.1rem;
      color: rgb(255, 80, 0);
      line-height 0.9rem;
</style>
