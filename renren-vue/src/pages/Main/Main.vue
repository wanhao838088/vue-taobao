<template>
  <div class="msite">
    <!--首页头部-->
    <HeaderTop :title="'首页'">
    </HeaderTop>

    <!--首页导航-->
    <nav class="msite_nav">
      <div v-if="banners.length>0" class="swiper-container">
        <!--类型分类-->
        <div class="swiper-wrapper">
          <!--  一共有2片区域  -->
          <div class="swiper-slide" v-for="(cs,index) in banners" :key="index">
            <img class="banner-img" :src="cs.imgUrl" alt="">
          </div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
      </div>
      <img src="./images/msite_back.svg" v-else>
    </nav>

    <div class="msite_shop_list">
      <div class="shop_header">
        <i class="iconfont icon-xuanxiang"></i>
        <span class="shop_header_title">商品列表</span>
      </div>
      <GoodsList></GoodsList>
    </div>

  </div>
</template>

<script>
  import "swiper/dist/css/swiper.min.css"
  import Swiper from 'swiper'

  import HeaderTop from '../../components/HeaderTop/HeaderTop'
  import GoodsList from '../../components/GoodsList/GoodsList'

  import {mapActions,mapState}  from 'vuex'

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
            direction: 'horizontal', // 垂直切换选项
            loop: true, // 循环模式选项
            // 如果需要分页器
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
      ...mapState(['banners','navs'])
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  $bannerHeight = 3.5;

  .msite //首页
    width 100%
    .msite_nav
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

</style>
