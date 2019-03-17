<template>
  <div class="shop_container">
    <ul class="shop_list" v-if="goods">
      <li class="shop_li" v-for="(item, index) in goods" :key="index" @click="toGoodsDetail(item.id)">
        <div class="list-item">
          <div class="p">
            <img class="p-pic" :src="item.goodsImg" style="visibility: visible;">
            <span class="flag c-icon-p4p"></span>
          </div>

          <div class="d">
            <h3 class="d-title">{{item.goodsTitle}}</h3>
            <p class="d-price">
              <em class="h">
                <span class="price-icon">¥</span>
                <span class="font-num">{{item.goodsMinPrice}}</span>
              </em>
              <del v-show="item.orgMinPrice">
                <span class="price-icon">¥</span>
                <span class="font-num">{{item.orgMinPrice}}</span>
              </del>
            </p>
            <div class="d-main">
              <p class="d-freight">{{item.deliveryFree==0?'免运费':`¥ ${item.deliveryFree}`}}</p>
              <p class="d-num">
                <span class="font-num">1614人付款</span>
              </p>
              <p class="d-area">{{item.location}}</p>
            </div>
          </div>

        </div>
        <div class="icons-group">
          <div class="item-icons-jinbi">金币抵2%</div>
        </div>

      </li>
    </ul>
    <ul v-else>
      <li v-for="item in 6">
        <img class="shop_img" src="./images/shop_back.svg">
      </li>
    </ul>
  </div>
</template>

<script>
  import {mapState} from 'vuex'

  export default {
    methods:{

      /**
       * 跳转到详情页面
       */
      toGoodsDetail(id){
        this.$router.push({
          path: `/goods`,
          query: {
            goodsId: id,
          }
        })
      }
    },
    computed:{
      ...mapState(['goods'])
    },
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .shop_container
    margin-bottom 50px
    .shop_list
      overflow hidden
      .shop_li
        height 3rem
        bottom-border-1px(#f1f1f1)
        width 100%
        padding: 12px 6px;
        border-bottom: 1px solid #dbdbdb;
        position: relative;
        .list-item
          display: -webkit-box;
          .p
            display: inline-block;
            text-align: center;
            margin-right: 0.3rem;
            margin-left: 8px;
            overflow: hidden;
            .c-icon-p4p
              background-size: contain;
            .flag
              position: absolute;
              width: 20px;
              height: 20px;
              left: 0;
              top: 0;
            .p-pic
              width 2.8rem
              height 2.8rem
          .d
            margin: 4px 15px 6px 0;
            -webkit-box-flex: 1;
            .d-price
              line-height: 0.7rem;
              display flex
              color: #999;
              font-size: 0.49rem;
              .h
                color: #eb5211;
                display: flex;
              del
                display flex
                font-size: 0.35rem;
                margin-left: 5px;
            .d-main
              display: -webkit-box;
              margin-top: 0.36rem;
              height: 20px;
              overflow: hidden;
              p
                color #999
                font-size: 0.33rem;
              .d-freight
                overflow: hidden;
              .d-num
                -webkit-box-flex: 1;
                font-size: 0.33rem;
                text-align: center;
              .d-area
                text-align: right;
                font-size: 0.33rem;
                .price-icon
                  font-family: arial;
                  padding-right: 4px;
            .d-title
              line-height: 0.5rem;
              margin-bottom: 3px;
              position: relative;
              overflow: hidden;
              text-align left
              font-weight bolder
              font-size: 0.39rem;
              height: 1.2rem;
              display: -webkit-box;
              word-break: break-all;
              color: #4b566a;
        .icons-group
          position: absolute;
          right: 0;
          top: 0;
          margin-right 10px;
          color: white;
          line-height: 16px;
          height: 16px;
          div
            float: right;
            font-size: 12px;
            padding: 0 3px;
          .item-icons-jinbi
            background-color: #ff9700;
</style>
