<template>
  <div class="msite">
    <!--首页头部-->
    <header class="sc-bxivhb QclmN">
      <div class="header-bd" @click="$router.push('/searchPage')">
        <a class="placeholder">
         <span class="text iconfont icon-sousuo">寻找宝贝店铺</span>
        </a>
      </div>
    </header>

    <!--首页banner-->
    <nav class="msite_banner">
      <div v-if="banners.length>0" class="swiper-container" style="margin-top: -26px;">
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

    <!--滚动新闻-->
    <div class="tp-wrapper">
      <div class="news-wrapper">
        <div class="image-wrapper">
          <div style="width: 100%; height: 100%; background-image: url(https://gw.alicdn.com//tfs//TB1TBEMXU6FK1Jjy1XdXXblkXXa-105-107.png_.webp); background-repeat: no-repeat; background-position: center center; background-size: contain;"></div>
        </div>
        <!--新闻内容-->
        <div class="toutiao-container">
          <marquee  :item-height="mqHeight" :itemHeight="mqHeight" class="toutiao-marquee">
            <marquee-item v-for="(obj,index) in pageNews" :key="index"
                          class="toutiao-item" >
              <div class="news-item-wrapper" ref="mqItem">
                <a class="news-a" href="javascript:;">
                  <div class="news-row-div">
                    <span class="news-span-hot">热门</span>
                    <span class="news-span-content">{{obj.news1}}</span>
                  </div>
                  <div class="news-row-div">
                    <span class="news-span-hot">热门</span>
                    <span class="news-span-content">{{obj.news2}}</span>
                  </div>
                </a>
                <!--右侧图片区域-->
                <div class="news-right">
                  <div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url(https://img.alicdn.com/tfs/TB1bLfqgvBNTKJjy0FdXXcPpVXa-513-339.png);"></div>
                  <div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url(https://gw.alicdn.com/mt/TB1tzxrrTtYBeNjy1XdXXXXyVXa-390-255.png);"></div>
                </div>
              </div>

            </marquee-item>
          </marquee>
        </div>
      </div>
    </div>

    <!--商品列表-->
    <div class="msite_shop_list">
      <GoodsList></GoodsList>
    </div>

    <loading :show="show" :text="text"></loading>

  </div>

</template>

<script>
  import "swiper/dist/css/swiper.min.css"
  import Swiper from 'swiper'
  import { Alert,Loading,Marquee, MarqueeItem  } from 'vux'
  import HeaderTop from '../../components/HeaderTop/HeaderTop'
  import GoodsList from '../../components/GoodsList/GoodsList'

  import {mapActions,mapState,mapGetters}  from 'vuex'

  export default {
    data() {
      return {
        show: false,
        text: "加载中...",
        mqHeight:0
      };
    },
    beforeCreate(){
      this.show = true;
      //获取窗口宽度 750下的高度为120
      let width = document.body.clientWidth;
      console.log(width);

      this.mqHeight = width / 750.0 * 120.0;

    },
    methods:{
      ...mapActions(['getGoods','getBannerAndNav'])
    },

    mounted(){
      //获取商品列表
      this.getGoods();
      //banner
      this.getBannerAndNav(()=>{
        this.show = false;
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
      GoodsList,
      Alert,
      Loading,
      Marquee,
      MarqueeItem
    },
    computed:{
      ...mapState(['banners','navs']),
      ...mapGetters(['navTop','navBottom','pageNews']),

    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  $bannerHeight = 3.5;

  .msite //首页
    width 100%
    .tp-wrapper
      overflow: hidden;
      .news-wrapper
        display: flex;
        overflow: hidden;
        background-color: rgb(255, 255, 255);
        height: 1.619rem ;
        width: 100%;
        place-self: flex-start;
        position: relative;
        .toutiao-container
          display: block;
          overflow: hidden;
          height: 100%;
          width: 100%;
          padding-left: 1.565rem;
          top: 0px;
          left: 0px;
          position: absolute;
          .toutiao-marquee
            height: 0.667rem
            margin-top: 0.233rem
            /*height: 100% !important;*/
            .toutiao-item
              height: 100% !important;
              .news-item-wrapper
                display: flex;
                height: 100%;
                box-sizing: border-box;
                margin-top: 2px;
                margin-bottom: 2px;
                -webkit-box-orient: horizontal;
                flex-direction: row;
                .news-right
                  position: absolute;
                  right 0.533rem
                  width: 2.267rem
                  height: 100%;
                .news-a
                  -webkit-box-flex: 1;
                  flex: 1 1 0%;
                  text-decoration none
                  display: flex;
                  -webkit-box-orient: vertical;
                  flex-direction: column;
                  -webkit-box-pack: center;
                  justify-content: center;
                  min-width: 0px;
                  .news-row-div
                    display: flex;
                    overflow: hidden;
                    line-height: 0.507rem
                    -webkit-box-align: center;
                    align-items: center;
                    -webkit-box-orient: horizontal;
                    flex-direction: row;
                    .news-span-content
                      color: rgb(51, 51, 51);
                      text-align left
                      -webkit-box-flex: 1;
                      flex: 1 1 0%;
                      font-size: 0.32rem
                      white-space: nowrap;
                      overflow: hidden;
                      text-overflow: ellipsis;
                    .news-span-hot
                      display: flex;
                      width: 0.747rem
                      height: 0.347rem
                      font-size: 0.28rem
                      -webkit-box-align: center;
                      align-items: center;
                      -webkit-box-pack: center;
                      justify-content: center;
                      color: rgb(230, 10, 31);
                      border: 2px solid rgb(230, 10, 31);
                      border-radius: 6px;
                      margin-right: 8px;
        .image-wrapper
          display: flex;
          overflow: hidden;
          height: 0.945rem
          width: 0.945rem
          margin-left: 0.324rem
          margin-top: 0.337rem
          position: absolute;
    .tb-toolbar-container
      box-sizing: border-box;
      display: flex;
      position: fixed;
      left: 0;
      bottom: 0;
      width: 100%;
      z-index: 1001;
      background-color: #ffffff;
      border-top: 1px solid #e7e7e7;
      border-bottom: 1px solid #f8f8f8;
      justify-content: space-between;
      align-items: center;
      padding-top: 2px;
      padding-bottom: constant(safe-area-inset-bottom);
      padding-bottom: env(safe-area-inset-bottom);
      .tab
        color: #5d656b;
        flex 1
        text-decoration: none;
        display: block;
        text-align: center;
        .iconfont
          font-size 0.5rem
        .text
          font-size: 0.35rem;
          transform: scale(0.83333333);
    .QclmN
      position: fixed;
      left: 0;
      top: 0;
      z-index: 1000;
      width: 100%;
      background-color: #FF852A
      .header-bd
        width: 86%;
        padding-left: 42px;
        padding-top: 6px;
        padding-bottom: 6px;
        background-image: url('./images/tb_top.png');
        background-repeat: no-repeat;
        background-size: 27px 20px;
        background-position: 9px center;
        .placeholder
          display: block;
          font-size: 0;
          background-color: #FF4E22;
          text-align: center;
          border-radius: 4px;
          .text
            height: 0.65rem;
            line-height: 0.65rem;
            font-size: 0.3rem;
            display: inline-block;
            color: #F0E0DC;
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
