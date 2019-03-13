<template>
  <div class="shop_container">
    <ul class="shop_list" v-if="goods">
      <li class="shop_li" v-for="(item, index) in goods" :key="index" @click="toGoodsDetail(item.id)">
        <div class="list-item">
          <div class="p">
            <a href="" title="">
              <img class="p-pic" :src="item.goodsImg" style="visibility: visible;">
              <span class="flag c-icon-p4p"></span>
            </a>
          </div>

          <div class="d">
            <a href="http://mclick.simba.taobao.com/cc_im?p=%B5%E7%CA%D3%BB%FA&amp;s=1617384869&amp;k=609&amp;e=iBxVE%2B6DCWR0VlZ%2BSYE3Wk4JTtfdSQ8qEm%2FmDz8ow%2FKmumtUpBAUqfPX57kpTQ%2BDe%2Bqz%2BpMC0XuqlrqCjH2RzmTK4tJJ%2BctMN9FYeqvPrEMeuiHBFbs60Ky56rOUMT%2FKE7Zs2rhqOcwhc1aLbgkWX8hoQPpk0g1at2wlBMkdMtbKCzxZwnk8ZIwfK1UFZ2CZKSry2uyC4b2%2FyLc8rqXDeEoNT19jBY70HKq0Ry7esYTSlSgi83UQVaePVLEv7DMKzELi2Onu8gPQz1PlNeKuEB2hXB%2BtAdIF3KyiNLYuYCGfd4cpiPbvqFj2d2n4jl3JstsEz4C0GIUF%2BqHGMp3BYRPRWyDt24QLUANcJKkHAhjH6WZsxSGTjK%2FQufA0xZr08xLmMgLchjY%2FKZvpAkO7NSJKfeANAhE7owUGM36VZtdkPK8g7nRvuMHAc1wuYS6UN8TFl4DXTyNsyum%2FfpOe5KcEcYWCJfxCao2y1tBKaRGKC1h1zY20azFJbLFrxJVIDHoLPgj5JkzzEuYyAtyGNm083n9RmI87frCfGM42wgmqnxXzRgHfBLNucK4dXsH2MEXwVYk6vAU3YjtFDmIZuBxTyZaPmieV" title="">
              <h3 class="d-title">{{item.goodsTitle}}</h3>
            </a>
            <p class="d-price">
              <em class="h">
                <span class="price-icon">¥</span>
                <span class="font-num">{{item.goodsPrice}}</span>
              </em>
              <del>
                <span class="price-icon">¥</span>
                <span class="font-num">{{item.orgPrice}}</span>
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
    data(){
      return{

      }
    },
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
              background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAGXRFW…XgUNcQJakG5wASTqchVEgrkYIjfdFI57CwOhUM4Tf+FWAAtC1CL45Fd5EAAAAASUVORK5CYII=') no-repeat;
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
            padding: 0px 3px;
          .item-icons-jinbi
            background-color: #ff9700;
        > a
          clearFix()
          display block
          box-sizing border-box
          padding 15px 8px
          width 100%
          .shop_left
            box-sizing border-box
            height 75px
            padding-right 10px
            flex 35
            .shop_img
              display block
              width 100%
              height 100%
          .shop_right
            flex 65
            .goods_left_price
              margin-top .3rem
              color orangered
              display flex
            .shop_detail_header
              clearFix()
              width 100%
              .shop_title
                float left
                width 100%
                color #333
                font-size .4rem
                line-height .4rem
                text-align left
                font-weight 700
                .icon-service-tianmao
                  background-position: -213px -199px;
                  width: 16px;
                  height: 16px;
                  display: inline-block;
                  display: inline;
                  zoom: 1;
                  font-size: 0;
                  background: url(//img.alicdn.com/tps/i3/TB1bh5IMpXXXXacaXXXrG06ZpXX-316-272.png);
                  background-repeat: no-repeat;
              .shop_detail_ul
                float right
                margin-top 3px
                .supports
                  float left
                  font-size 10px
                  color #999
                  border 1px solid #f1f1f1
                  padding 0 2px
                  border-radius 2px
            .shop_rating_order
              clearFix()
              width 100%
              margin-top 18px
              margin-bottom 8px
              .shop_rating_order_left
                float left
                color #ff9a0d
                .star //2x图 3x图
                  float left
                  font-size 0
                  .star-item
                    display inline-block
                    background-repeat no-repeat
                  &.star-48
                    .star-item
                      width 20px
                      height 20px
                      margin-right 22px
                      background-size 20px 20px
                      &:last-child
                        margin-right: 0
                      &.on
                        bg-image('./images/stars/star48_on')
                      &.half
                        bg-image('./images/stars/star48_half')
                      &.off
                        bg-image('./images/stars/star48_off')
                  &.star-36
                    .star-item
                      width 15px
                      height 15px
                      margin-right 6px
                      background-size 15px 15px
                      &:last-child
                        margin-right 0
                      &.on
                        bg-image('./images/stars/star36_on')
                      &.half
                        bg-image('./images/stars/star36_half')
                      &.off
                        bg-image('./images/stars/star36_off')
                  &.star-24
                    .star-item
                      width 10px
                      height 10px
                      margin-right 3px
                      background-size 10px 10px
                      &:last-child
                        margin-right 0
                      &.on
                        bg-image('./images/stars/star24_on')
                      &.half
                        bg-image('./images/stars/star24_half')
                      &.off
                        bg-image('./images/stars/star24_off')
                .rating_section
                  float left
                  font-size 10px
                  color #ff6000
                  margin-left 4px
                .order_section
                  float left
                  font-size 10px
                  color #666
                  transform scale(.8)
              .shop_rating_order_right
                float right
                font-size 0
                .delivery_style
                  transform-origin 35px 0
                  transform scale(.7)
                  display inline-block
                  font-size 12px
                  padding 1px
                  border-radius 2px
                .delivery_left
                  color #fff
                  margin-right -10px
                  background-color #02a774
                  border 1px solid #02a774
                .delivery_right
                  color #02a774
                  border 1px solid #02a774
            .shop_distance
              clearFix()
              width 100%
              font-size 12px
              .shop_delivery_msg
                float left
                transform-origin 0
                transform scale(.9)
                color #666
              .segmentation
                color #ccc
</style>
