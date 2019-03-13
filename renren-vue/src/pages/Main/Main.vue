<template>
  <div class="msite">
    <!--首页头部-->
    <HeaderTop :title="'首页'">
    </HeaderTop>

    <!--首页banner-->
    <nav class="msite_banner">
      <div v-if="banners.length>0" class="swiper-container" style="margin-top: -16px;">
        <div class="swiper-wrapper">
          <div class="swiper-slide" v-for="(cs,index) in banners" :key="index">
            <img class="banner-img" :src="cs.imgUrl" alt="">
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
      <img src="./images/msite_back.svg" v-else>
    </nav>
    <!--首页nav-->
    <div class="tpl-wrapper">
      <nav class="msite_nav" view-name="DFrameLayout">
        <div class="msite-nav-item" view-name="DLinearLayout" v-for="(nv,index) in navTop" :key="index">
          <div view-name="HGifView">
            <img class="msite-nav-item-img" :src="nv.imgUrl" alt="">
          </div>
          <div class="msite-nav-item-text" view-name="DTextView">
            {{nv.navName}}
          </div>
        </div>
      </nav>
      <nav class="msite_nav"  view-name="DFrameLayout">
        <div class="msite-nav-item" style="margin-top: 0.1rem" view-name="DLinearLayout" v-for="(nv,index) in navBottom" :key="index">
          <div view-name="HGifView">
            <img class="msite-nav-item-img" :src="nv.imgUrl" alt="">
          </div>
          <div class="msite-nav-item-text" view-name="DTextView">
            {{nv.navName}}
          </div>
        </div>
      </nav>
    </div>

    <div class="msite_shop_list">
      <GoodsList></GoodsList>
    </div>

  </div>
</template>

<script>
  import "swiper/dist/css/swiper.min.css"
  import Swiper from 'swiper'

  import HeaderTop from '../../components/HeaderTop/HeaderTop'
  import GoodsList from '../../components/GoodsList/GoodsList'

  import {mapActions,mapState,mapGetters}  from 'vuex'

  export default {
    methods:{
      ...mapActions(['getGoods','getBannerAndNav'])
    },

    mounted(){
      //获取商品列表
      this.getGoods();
      //banner
      this.getBannerAndNav(()=>{
        this.$nextTick(()=>{
          new Swiper ('.swiper-container', {
            direction: 'horizontal',
            loop: true,
            autoplay:true,
            pagination: {
              el: '.swiper-pagination',
            }
          })
        })
      });
    },
    components: {
      HeaderTop,
      GoodsList
    },
    computed:{
      ...mapState(['banners','navs']),
      ...mapGetters(['navTop','navBottom'])
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  $bannerHeight = 3.5;

  .msite //首页
    width 100%
    .msite_banner
      bottom-border-1px(#e4e4e4)
      margin-top 45px
      height $bannerHeight rem
      background #fff
      .swiper-container
        width 100%
        height $bannerHeight rem
        .swiper-wrapper
          width 100%
          height $bannerHeight rem
          .swiper-slide
            display flex
            justify-content center
            align-items flex-start
            flex-wrap wrap
            .banner-img
              width 100%
              height $bannerHeight rem
            .link_to_food
              width 25%
              .food_container
                display block
                width 100%
                text-align center
                padding-bottom 10px
                font-size 0
                img
                  display inline-block
                  width 50px
                  height 50px
              span
                display block
                width 100%
                text-align center
                font-size 13px
                color #666
        .swiper-pagination
          > span.swiper-pagination-bullet-active
            background #3190E8
    .msite_shop_list
      top-border-1px(#e4e4e4)
      /*margin-top 10px*/
      background #fff
      .shop_header
        padding 10px 10px 0
        .shop_icon
          margin-left 5px
          color #999
        .shop_header_title
          color #999
          font-size 14px
          line-height 20px

    .tpl-wrapper
      margin-top: -10px;
      overflow: hidden;
      .msite_nav
        display: flex;
        overflow: hidden;
        width: 100%;
        place-self: flex-start;
        position: relative;
        height 2.5 rem
        background #fff
        .msite-nav-item
          display: flex;
          flex: 1;
          overflow: hidden;
          margin-left: 9.6px;
          margin-top: 0.35rem;
          -webkit-box-orient: vertical;
          flex-direction: column;
          .msite-nav-item-img
            width 1.8rem;
            height 1.5rem;
          .msite-nav-item-text
            display: inline-block;
            overflow: hidden;
            font-size: 0.28rem;
            height: auto;
            margin-top: 4.8px;
            text-align: center;
            color: rgb(102, 102, 102);
            text-overflow: ellipsis;
            white-space: nowrap;
            line-height: 0.38rem;
</style>
