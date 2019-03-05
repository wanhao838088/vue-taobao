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
      <p>秒杀开始时间: {{detail.startTime | date-format}}</p>

    </div>
    <div v-if="miaoshaStatus==1">
      秒杀进行中
    </div>
    <div v-else-if="miaoshaStatus==0">
      秒杀倒计时: <span ref="remainSeconds">{{remainSeconds}}秒</span>
    </div>
    <div v-else>
      秒杀已结束
    </div>
    <el-button type="primary" :disabled="miaoshaStatus!=1" style="width: 100%;margin-top: .2rem;" >
      立即秒杀
    </el-button>

  </div>
</template>

<script>

  import {mapActions}  from 'vuex'
  import {reqGoodsDetail}  from '../../api'

  import HeaderTop from '../../components/HeaderTop/HeaderTop'

  export default {
    data(){
      return{
        detail:{},//商品详情
        miaoshaStatus:0,
        remainSeconds:0,
      }
    },
    mounted(){
      this.getDetail();
    },

    methods:{

      /**
       * 获取商品详情
       * @returns {Promise<void>}
       */
      async getDetail(){
        let id = this.$route.params.goodsId;
        //获取商品详情
        let result = await reqGoodsDetail({id});
        if (result.code == 0) {
          this.detail = result.goodsDetail;
          this.miaoshaStatus = result.miaoshaStatus;
          this.remainSeconds = result.remainSeconds;
          this._initSeconds();
          console.log(result);
        }
      },

      /**
       * 初始化倒计时
       * @private
       */
      _initSeconds(){
        let remainSeconds = this.remainSeconds;

        if(remainSeconds>0){
          //开启倒计时
          this.timeId = setTimeout(()=>{
            this.remainSeconds-=0.01;
            this.remainSeconds = this.remainSeconds.toFixed(2);
            this._initSeconds();
          },10)
        }else if(remainSeconds<=0){
          clearTimeout(this.timeId);
          //开始秒杀
          this.miaoshaStatus =1;
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
