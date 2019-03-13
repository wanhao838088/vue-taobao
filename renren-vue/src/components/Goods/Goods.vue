<template>
  <div>
    <div class="main-layout">
      <GoodsBar></GoodsBar>

      <div class="pic-gallery-wrapper">
        <!--轮播图-->
        <div class="tpl-wrapper">
          <div v-if="goodsImgs.length>0" class="swiper-container">
            <div class="swiper-wrapper">
              <div class="swiper-slide" v-for="(cs,index) in goodsImgs" :key="index">
                <img class="banner-img" :src="cs.imgUrl" alt="">
              </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
          </div>
        </div>

        <GoodsPrice :goodsDetail="detail"></GoodsPrice>

        <div class="detail_title_normal">
          <span class="detail_title">
              {{detail.goodsTitle}}
          </span>
        </div>

        <div class="tpl-wrapper">
          <div class="detail_subinfo" view-name="DFrameLayout">
            <div class="detail_subinfo_item" view-name="DTextView">
              <span class="detail_subinfo_item_text">
                快递: 免运费
              </span>
            </div>
            <div class="detail_subinfo_item" view-name="DTextView">
              <span class="detail_subinfo_item_text">
                月销: 656笔
              </span>
            </div>
            <div class="detail_subinfo_item" view-name="DTextView">
              <span class="detail_subinfo_item_text">
                山东济南
              </span>
            </div>
          </div>
        </div>

        <!--服务菜单-->
        <PageSplit></PageSplit>
        <MenuRow :serviceData="serviceData"></MenuRow>

        <!--规格菜单-->
        <PageSplit></PageSplit>
        <MenuRow :serviceData="specData"></MenuRow>

        <!--参数菜单-->
        <PageSplit></PageSplit>
        <MenuRow :serviceData="paramData"></MenuRow>

        <PageSplit></PageSplit>

        <!--评价部分-->
        <GoodsComments :commentsCount="commentsCount"></GoodsComments>

        <!--商品详情-->
        <GoodsDetailDesc :goodsDetailImgs="goodsDetailImgs"></GoodsDetailDesc>


        <!--商品服务说明部分-->
        <GoodsService :serviceEntities="serviceEntities"></GoodsService>


        <!--<p>库存数量: {{detail.stockCount}}</p>-->
        <!--<p>秒杀开始时间: {{detail.startTime | date-format}}</p>-->
        <!--<div v-if="miaoshaStatus==1">-->
          <!--秒杀进行中-->
        <!--</div>-->
        <!--<div v-else-if="miaoshaStatus==0">-->
          <!--秒杀倒计时: <span ref="remainSeconds">{{remainSeconds}}秒</span>-->
        <!--</div>-->
        <!--<div v-else>-->
          <!--秒杀已结束-->
        <!--</div>-->


        <el-button type="primary" @click="doSecKill" :disabled="miaoshaStatus!=1" style="width: 100%;margin-top: .2rem;" >
          立即秒杀
        </el-button>
      </div>

      <!--底部固定bar-->
      <GoodsBottomBar></GoodsBottomBar>

    </div>
  </div>
</template>

<script>

  import "swiper/dist/css/swiper.min.css"
  import Swiper from 'swiper'
  import { MessageBox } from 'element-ui'
  import { Message } from 'element-ui'

  import {reqGoodsDetail,reqSecKill,reqSecKillResult}  from '../../api'

  import {getToken}  from '../../utils/utils'
  import MenuRow from '../MenuRow/MenuRow'
  import PageSplit from '../PageSplit/PageSplit'
  import GoodsBar from '../GoodsBar/GoodsBar'
  import GoodsPrice from '../GoodsPrice/GoodsPrice'
  import GoodsComments from '../GoodsComments/GoodsComments'
  import GoodsBottomBar from '../GoodsBottomBar/GoodsBottomBar'
  import GoodsDetailDesc from '../GoodsDetailDesc/GoodsDetailDesc'
  import GoodsService from '../GoodsService/GoodsService'

  export default {
    data(){
      return{
        detail:{},//商品详情
        miaoshaStatus:0,
        remainSeconds:0,
        commentsCount:0,//评论总数
        goodsImgs:[],//商品顶部轮播图
        goodsDetailImgs:[],//商品详情图
        serviceEntities:[], //商品服务
        goodsProps:[], //商品属性
        //规格信息
        specData:{
          name:'规格',
          content:'已选：32寸高清屏【智能网络版】 黑色 '
        },
        //参数信息
        paramData:{
          name:'参数',
          content:'品牌 型号... '
        }
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
          //商品顶部图片
          this.goodsImgs = result.goodsImgs;
          //详情图
          this.goodsDetailImgs = result.goodsDetailImgs;
          //评论
          this.commentsCount = result.commentsCount;
          //服务entity
          this.serviceEntities = result.serviceEntities;
          //属性
          this.goodsProps = result.goodsProps;

          this._initSeconds();
          this._initTopImgs();
          console.log(result);
        }
      },
      /**
       * 初始化顶部轮播图
       */
      _initTopImgs(){
        this.$nextTick(()=>{
          new Swiper ('.swiper-container', {
            direction: 'horizontal', // 垂直切换选项
            loop: true, // 循环模式选项
            autoplay:true,
            // 如果需要分页器
            pagination: {
              el: '.swiper-pagination',
            }
          })
        })
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
    computed:{

      /**
       * 根据返回的服务计算页面显示内容
       */
      serviceData(){
        let serviceEntities = this.serviceEntities;
        let content = '';
        serviceEntities.forEach((obj,index)=>{
          if (index < serviceEntities.length-1) {
            content+=obj.serviceKey+' · ';
          }else if (index == serviceEntities.length - 1) {
            //最后一个没有  点
            content+=obj.serviceKey;
          }
        });
        return {
          name:'服务',
          content
        };
      }
    },
    components:{
      MenuRow,
      PageSplit,
      GoodsBar,
      GoodsPrice,
      GoodsComments,
      GoodsBottomBar,
      GoodsDetailDesc,
      GoodsService
    }

  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .main-layout
    width 100%
    overflow hidden
    background-color: #f2f2f2;
    .pic-gallery-wrapper
      width 100%
      position absolute;
      top 0;
      .banner-img
        width 100%
      .detail_subinfo
        display: flex;
        overflow: hidden;
        height: 1rem;
        background-color: rgb(255, 255, 255);
        position: relative;
        .detail_subinfo_item
          flex: 1;
          text-align: left;
          margin-top: 0.3rem;
          .detail_subinfo_item_text
            text-overflow: ellipsis;
            overflow: hidden;
            margin-left 0.2rem;
            color: rgb(153, 153, 153);
            font-size: 0.35rem;
            line-height: 0.5rem;
            white-space: nowrap;
      .detail_title_normal
        width 100%;
        .detail_title
          width 100%
          text-align: left;
          background-color: rgba(255, 255, 255, 0);
          color: rgb(51, 51, 51);
          font-weight: bold;
          font-size 0.4rem;
          margin-left 0.2rem
          text-overflow: ellipsis;
          overflow: hidden;
          word-wrap: break-word;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 2;
      .goods-img
        width 100%
        height 9.5rem;
</style>
