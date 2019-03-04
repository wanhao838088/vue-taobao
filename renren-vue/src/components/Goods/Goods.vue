<template>
  <div>
    <!--首页头部-->
    <HeaderTop :title="'商品详情'"></HeaderTop>
    <div>
      <img :src="detail.goodsImg" alt="">
      <p>{{detail.goodsTitle}}</p>
      <p>原价: {{detail.goodsPrice}}</p>
      <p>秒杀价: {{detail.miaoshaPrice}}</p>
      <p>库存数量: {{detail.stockCount}}</p>
    </div>
    <div>
      秒杀开始时间: {{detail.startTime | date-format}}
    </div>
    <mt-button type="danger" style="width: 100%" >立即秒杀</mt-button>

  </div>
</template>

<script>

  import {mapActions}  from 'vuex'
  import {reqGoodsDetail}  from '../../api'

  import HeaderTop from '../../components/HeaderTop/HeaderTop'

  export default {
    data(){
      return{
        detail:{}//商品详情
      }
    },
    mounted(){
      this.getDetail();
    },

    methods:{

      async getDetail(){
        let id = this.$route.params.goodsId;
        //获取商品详情
        let result = await reqGoodsDetail({id});
        if (result.code == 0) {
          this.detail = result.goodsDetail;
          console.log(result);
        }
      }
    },
    components:{
      HeaderTop
    }

  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .tab
    height 40px
    line-height 40px
    background #fff
    bottom-border-1px(rgba(7, 17, 27, 0.1))
    .tab-item
      float left
      width: 33.33333%
      text-align center
      font-size 14px
      color rgb(77, 85, 93)
      a
        display block
        position relative
        &.router-link-active
          color #02a774
          &::after
            content ''
            position absolute
            left 50%
            bottom 1px
            width 35px
            height 2px
            transform translateX(-50%)
            background #02a774
</style>
