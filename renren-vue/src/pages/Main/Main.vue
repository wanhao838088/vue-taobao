<template>
  <div class="msite">
    <!--首页头部-->
    <HeaderTop :title="'首页'">

    </HeaderTop>

    <div class="msite_shop_list">
      <div class="shop_header">
        <i class="iconfont icon-xuanxiang"></i>
        <span class="shop_header_title">商品列表</span>
      </div>
      <ShopList></ShopList>
    </div>

  </div>
</template>

<script>
  import HeaderTop from '../../components/HeaderTop/HeaderTop'
  import ShopList from '../../components/ShopList/ShopList'

  import {mapActions}  from 'vuex'

  export default {
    methods:{
      ...mapActions(['getGoods'])
    },

    mounted(){
      //获取商品列表
      this.getGoods();

    },
    components: {
      HeaderTop,
      ShopList
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .msite //首页
    width 100%
    .msite_shop_list
      top-border-1px(#e4e4e4)
      margin-top 10px
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
