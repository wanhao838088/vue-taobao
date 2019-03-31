<template>
  <div class="d-price">
    <div class="present-price">
      <div class="main-price-wrapper">
        <p class="o-t-price">
          <span class="num">
            {{goodsPriceRange}}
          </span>
        </p>
        <p class="txt"><span>巨优惠</span></p>
      </div>
    </div>
    <!--原价-->
    <div class="original-price" v-show="goodsDetail.orgMinPrice">
      <div style="float: left;margin-right: 0.24rem;">
        价格:￥
        <del>
          {{goodsOldPriceRange}}
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
    },
    computed:{
      goodsOldPriceRange(){
        let skus = this.goodsDetail.skus;
        if (!skus || !skus[0]){
          return;
        }
        let minPrice = skus[0].priceMoney;
        let maxPrice = skus[0].priceMoney;
        if (skus.length == 1) {
          return `￥ ${minPrice}`;
        }
        skus.forEach((sku)=>{
          if (sku.priceMoney<minPrice){
            minPrice = sku.priceMoney;
          }
          if (sku.priceMoney > minPrice) {
            maxPrice = sku.priceMoney;
          }
        });
        return `${minPrice+10}-${maxPrice+50}`;
      },
      /**
       * 计算价格区间
       *
       */
      goodsPriceRange(){
        let skus = this.goodsDetail.skus;
        if (!skus || !skus[0]){
          return;
        }
        let minPrice = skus[0].priceMoney;
        let maxPrice = skus[0].priceMoney;
        if (skus.length == 1) {
          return `￥ ${minPrice}`;
        }
        skus.forEach((sku)=>{
          if (sku.priceMoney<minPrice){
            minPrice = sku.priceMoney;
          }
          if (sku.priceMoney > minPrice) {
            maxPrice = sku.priceMoney;
          }
        });
        return `${minPrice}-${maxPrice}`;
      },
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
