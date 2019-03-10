<template>
  <div class="shop_container">
    <ul class="shop_list" v-if="goods">
      <li class="shop_li" v-for="(item, index) in goods" :key="index" @click="toGoodsDetail(item.id)">
        <a style="display: flex;">
          <div class="shop_left">
            <img class="shop_img" :src="item.goodsImg">
          </div>
          <div class="shop_right">
            <section class="shop_detail_header">
              <h4 class="shop_title ellipsis">
                <span class="icon-service-tianmao"></span>
                {{item.goodsTitle}}
              </h4>
            </section>
            <div class="goods_left_price">
              <span style="flex: 1;text-align: left;">天猫 ￥<span>{{item.goodsPrice}}</span></span>
              <span style="flex: 1;text-align: left;">秒杀价 ￥<span>{{item.miaoshaPrice}}</span></span>
            </div>
          </div>
        </a>
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
        imgBaseUrl: '//elm.cangdu.org/img/', //图片域名地址
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
      .shop_li
        height 2.4rem
        bottom-border-1px(#f1f1f1)
        width 100%
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
