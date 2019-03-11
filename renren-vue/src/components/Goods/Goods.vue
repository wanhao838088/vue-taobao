<template>
  <div>
    <div class="main-layout">
      <div class="navi-bar">
        <div style="position: relative;width: 100%">
          <button class="btn-back"><i class="iconfont icon-fanhui1"></i></button>
          <button class="btn-cart"><i class="iconfont icon-gouwuche-01"></i></button>
        </div>
      </div>

      <div class="pic-gallery-wrapper">
        <img class="goods-img" :src="detail.goodsImg" alt="">
        <p>{{detail.goodsTitle}}</p>
        <p>原价: {{detail.goodsPrice}}</p>
        <p>秒杀价: {{detail.miaoshaPrice}}</p>
        <p>库存数量: {{detail.stockCount}}</p>
        <p>秒杀开始时间: {{detail.startTime | date-format}}</p>
        <div v-if="miaoshaStatus==1">
          秒杀进行中
        </div>
        <div v-else-if="miaoshaStatus==0">
          秒杀倒计时: <span ref="remainSeconds">{{remainSeconds}}秒</span>
        </div>
        <div v-else>
          秒杀已结束
        </div>
        <el-button type="primary" @click="doSecKill" :disabled="miaoshaStatus!=1" style="width: 100%;margin-top: .2rem;" >
          立即秒杀
        </el-button>
      </div>
      <div class="main-bottom">

      </div>



    </div>
  </div>
</template>

<script>

  import {mapActions}  from 'vuex'
  import {reqGoodsDetail,reqSecKill,reqSecKillResult}  from '../../api'

  import {getToken}  from '../../utils/utils'
  import HeaderTop from '../../components/HeaderTop/HeaderTop'
  import { MessageBox } from 'element-ui'
  import { Message } from 'element-ui'

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
       * 轮询获取结果
       */
      async getSecKillResult(goodsId){
        let result = await reqSecKillResult({goodsId});
        if (result.code == 0) {
          //判断状态
          if(result.msg<0){
            Message.error({
              showClose: true,
              message: '秒杀失败',
              type: 'error'
            });
          }else if(result.msg==0){
            //继续轮询
            setTimeout(()=>{
              this.getSecKillResult(this.$route.query.goodsId);
            },100);
          }else {
            //秒杀成功了
            this.$router.push("/orderDetail");
          }
        }
      },

        /**
       * 商品秒杀
       */
      async doSecKill(){
        let token = getToken();
        let goodsId = this.$route.query.goodsId;

        if (token) {
          let result = await reqSecKill({goodsId});
          console.log(result);

          switch (result.code) {
            case 0:
              //轮询是否下单成功
              this.getSecKillResult(goodsId);
              break;
            case 500:
              Message.error({
                showClose: true,
                message: '服务器内部错误',
                type: 'error'
              });
              break;
            case 300:
              Message.error({
                showClose: true,
                message: result.msg,
                type: 'warning'
              });
              break;
            case 10086:
              //token 过期跳转到登录
              this.$router.push("/login");
              break;
          }
        }else {
          MessageBox.alert('请先登录!','提示', {
            confirmButtonText: '确定',
            callback: action => {
              console.log(action);
              if (action=='confirm') {
                //跳转到登录
                this.$router.push("/login");
              }
            }
          })
        }
      },
      /**
       * 获取商品详情
       * @returns {Promise<void>}
       */
      async getDetail(){
        let id = this.$route.query.goodsId;
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
      HeaderTop,
    }

  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .main-layout
    width 100%
    overflow hidden
    background-color: #FFF;
    .navi-bar
      width: 100%;
      position: absolute;
      top: 0.2rem;
      left: 0;
      z-index: 110;
      padding: 0 0.1rem;
      .btn-back
        position: absolute;
        width: 0.8rem;
        height: 0.8rem;
        border: 0;
        left: 10px;
        top 1px;
        border-radius: 100%;
        text-align: center;
        background: rgba(0, 0, 0, 0.4);
        color: #fff;
        .iconfont
          font-size: 0.8rem;
      .btn-cart
        position: absolute;
        width: 0.8rem;
        height: 0.8rem;
        right 30px;
        top 1px;
        border: 0;
        border-radius: 100%;
        text-align: center;
        background: rgba(0, 0, 0, 0.4);
        color: #fff;
        .iconfont
          font-size: 0.8rem;
    .pic-gallery-wrapper
      width 100%
      position absolute;
      top 0;
      .goods-img
        width 100%
        height 9.5rem;
    .main-bottom
      position: absolute;
      bottom: 1px;
      height 1rem;
      width 100%;
      background-color red;
</style>
