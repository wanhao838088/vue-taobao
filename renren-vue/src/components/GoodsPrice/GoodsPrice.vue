<template>
  <div class="d-price">
    <div class="present-price">
      <div class="main-price-wrapper">
        <p class="o-t-price">
          <span class="num" v-if="goodsDetail.goodsMaxPrice">
          {{goodsDetail.goodsMinPrice}}-{{goodsDetail.goodsMaxPrice}}
          </span>
          <span class="num" v-else>
          {{goodsDetail.goodsMinPrice}}
          </span>
        </p>
        <p class="txt"><span>巨优惠</span></p>
      </div>
    </div>
    <!--原价-->
    <div class="original-price" v-show="goodsDetail.orgMinPrice">
      <div style="float: left;margin-right: 0.24rem;">
        价格:￥
        <del v-if="goodsDetail.orgMaxPrice">
          {{goodsDetail.orgMinPrice}}-{{goodsDetail.orgMaxPrice}}
        </del>
        <del v-else>
          {{goodsDetail.orgMinPrice}}
        </del>
      </div>
    </div>
  </div>
</template>

<script>
  /**
   * 商品详情价格组件
   */
  export default {
    name: "GoodsPrice",
    props:{
      goodsDetail:Object
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .d-price
    line-height: 1;
    width 100%
    padding: 0 0.12rem;
    .original-price
      padding-top: 0.15rem;
      font-size: 0.1rem;
      color: #999;
    .present-price
      padding-top: 0.18rem;
      width 100%
      .main-price-wrapper
        display: flex;
        flex-direction: row;
        align-items: flex-end;
        .txt
          display: flex;
          align-items: center;
          height: 0.14rem;
          background-color: #FFF1EB;
          border-radius: 0.2rem;
          padding: 0.1rem;
          padding-left 0.3rem;
          color: #ff5000;
          padding-right: 0.1rem;
        .o-t-price
          color: #ff5000;
          font-size: .7rem;
          &:before
            content: '\FFE5';
            display: inline-block;
            font-size: 0.15rem;
            padding-left: -0.035rem;
</style>
