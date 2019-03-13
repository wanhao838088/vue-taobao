<template>
  <div class="detail-desc">
    <div class="divide-bar">
      <span class="line"></span>

      <div class="icon-info">
        <i class="iconfont icon-tupian"></i>
        <span class="icon-text">详情</span>
      </div>
      <span class="line"></span>
    </div>
    <!--详情图片-->
    <img class="desc-img" v-lazy="gd.imgUrl"
         alt="" v-for="(gd,index) in goodsDetailImgs"
         :key="index"/>

  </div>
</template>

<script>
  export default {
    name: "GoodsDetailDesc",
    props:{
      goodsDetailImgs:Array
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .detail-desc
    width: 100%;
    background-color: #fff;
    min-height: 5rem;
    padding-top: 0.12rem;
    .desc-img
      display: block;
      max-width: 100%;
      margin: 0 auto;
      min-height: 0.5rem;
    .divide-bar
      background-color: #f2f2f2;
      color: #999;
      display: flex;
      height 0.8rem;
      justify-content: center;
      align-items: center;
      padding: 0.08rem 0;
      font-size: 0;
      .line
        display: inline-block;
        width: 1.4rem;
        border-top: 0.03rem solid #999;
      .icon-info
        position: relative;
        top: -0.01rem;
        margin: 0 0.08rem;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        .icon-text
          font-size: 0.3rem;
          padding-left: 0.1rem;
</style>
