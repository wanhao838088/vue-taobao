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
            <div class="custom-pagination"></div>
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
                  {{detail.location}}
              </span>
            </div>
          </div>
        </div>

        <!--服务菜单-->
        <PageSplit></PageSplit>
        <MenuRow @click.native="goodsServiceShow=!goodsServiceShow" :serviceData="serviceData"></MenuRow>

        <!--规格菜单-->
        <PageSplit></PageSplit>
        <MenuRow @click.native="goodsSkuShow=true" :serviceData="specData"></MenuRow>

        <!--参数菜单-->
        <PageSplit></PageSplit>
        <MenuRow @click.native="goodsPropsShow=!goodsPropsShow"  :serviceData="paramData"></MenuRow>

        <PageSplit></PageSplit>

        <!--评价部分-->
        <GoodsComments :commentsCount="commentsCount"></GoodsComments>

        <!--商品详情-->
        <GoodsDetailDesc :goodsDetailImgs="goodsDetailImgs"></GoodsDetailDesc>


        <!--商品服务说明部分-->
        <transition name="move">
          <GoodsService v-show="goodsServiceShow" @closeService="goodsServiceShow=false" :serviceEntities="serviceEntities"></GoodsService>
        </transition>

        <!--商品参数说明-->
        <transition name="move">
          <GoodsParam v-show="goodsPropsShow" @closeProps="goodsPropsShow=false" :goodsProps="goodsProps"></GoodsParam>
        </transition>


        <!--sku选择-->
        <transition name="move">
          <div v-show="goodsSkuShow" class="dialog-container" style="display: none;">
            <div class="dialog-wrapper"></div>
            <div class="dialog dialog-popup">
              <div class="dialog-content">
                <div class="dialog-xsku">
                  <div class="tb-sku-container">
                    <div class="sku-pro">
                      <div style="display: flex;flex-direction: row;align-items: flex-end;">
                        <div class="sku-img">
                          <p>
                            <img ref="skuImg" class="sku-img-sty" :src="detail.goodsImg">
                          </p>
                        </div>
                        <!--sku信息-->
                        <div class="sku-pro-info">
                          <div style="text-align: left;">
                            <h3 class="sku-title">{{detail.goodsTitle}}</h3>
                            <p class="h" ref="price">¥ {{goodsPriceRange}}</p>
                            <p ref="quantity" class="quantity">库存:{{goodsAllQuantity}}</p>
                            <p class="sku-txt">
                              <span ref="csku" class="c-sku"></span>
                              <span ref="uncsku" class="unc-sku">请选择: 颜色分类</span>
                            </p>
                          </div>
                        </div>

                        <!--关闭按钮-->
                        <div @click="goodsSkuShow=false" class="sku-closed iconfont  icon-shanchuguanbicha tb-sku-icon-close-circle"></div>
                      </div>
                    </div>

                    <!--sku信息-->
                    <div class="sku-info">
                      <div class="sku-delivery">
                        <h2 class="sku-delivery-h2">配送区域</h2>
                        <h3 class="delivery-title">临沂莒南</h3>
                      </div>
                      <!--sku集合展示-->
                      <div class="delivery-bottom">
                        <h2 class="delivery-bottom-h2">颜色分类</h2>
                        <ul class="delivery-bottom-ul">
                          <li @click="selectSku(index)" :class="index==skuSelectIndex?'sel':'normal'"
                              v-for="(sku,index) in detail.skus"
                              :key="index">
                            {{sku.skuName}}
                          </li>
                        </ul>
                      </div>
                      <!--购买数量-->
                      <div class="quantity-info">
                        <div class="sku-quantity">
                          <h2 class="quantity-h2">购买数量 <span></span></h2>
                          <!--减号-->
                          <p @click="decCount" :class="{'off':skuBuyCount<=1} " class="btn-minus iconfont icon-jianhao tb-sku-iconfont tb-sku-icon-minus">
                            <a class="btn minus" min=""></a>
                          </p>
                          <p class="btn-input">
                            <input @change="checkCount" class="input-tel" type="tel" v-model="skuBuyCount">
                          </p>
                          <!--加号-->
                          <p @click="incCount" class="btn-plus iconfont icon-hao tb-sku-iconfont tb-sku-icon-plus">
                            <a class="btn plus" max=""></a>
                          </p>
                        </div>
                      </div>
                    </div>

                    <!--底部 添加到购物车按钮 -->
                    <div>
                      <div class="sku-btns">
                        <div @click="addGoodsToCart" class="sku-btn addcart">加入购物车</div>
                        <div class="sku-btn gobuy">立即购买</div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
              </div>
          </div>
        </transition>

      </div>

      <!--底部固定bar-->
      <GoodsBottomBar @addToCart="addSkuToCart"></GoodsBottomBar>

    </div>

    <!--显示提示消息-->
    <TbToast :msg="msg" ref="TbToast"></TbToast>

  </div>
</template>

<script>

  import "swiper/dist/css/swiper.min.css"
  import Swiper from 'swiper'

  import {reqGoodsDetail,reqSecKill,reqSecKillResult,reqAddSku2Cart}  from '../../api'

  import {getToken}  from '../../utils/utils'
  import MenuRow from '../MenuRow/MenuRow'
  import PageSplit from '../PageSplit/PageSplit'
  import GoodsBar from '../GoodsBar/GoodsBar'
  import GoodsPrice from '../GoodsPrice/GoodsPrice'
  import GoodsComments from '../GoodsComments/GoodsComments'
  import GoodsBottomBar from '../GoodsBottomBar/GoodsBottomBar'
  import GoodsDetailDesc from '../GoodsDetailDesc/GoodsDetailDesc'
  import GoodsService from '../GoodsService/GoodsService'
  import GoodsParam from '../GoodsParam/GoodsParam'
  import TbToast from '../TbToast/TbToast'

  export default {
    data(){
      return{
        detail:{},//商品详情
        miaoshaStatus:0,
        remainSeconds:0,
        goodsServiceShow:false,
        goodsPropsShow:false,
        goodsSkuShow:false, //sku选择
        commentsCount:0,//评论总数
        goodsImgs:[],//商品顶部轮播图
        goodsDetailImgs:[],//商品详情图
        serviceEntities:[], //商品服务
        goodsProps:[], //商品属性
        skuSelectIndex:-1, //当前选中的sku下标
        skuSelectVal:{}, //当前选中的sku
        skuBuyCount:1 , //默认购买数量
        msg:'添加成功, 在购物车等你哦~',
        //规格信息
        specData:{
          name:'规格',
          content:'请选择 颜色分类 '
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
       * 真实操作购物车方法
       */
      async addGoodsToCart(){
        this.goodsSkuShow = false;
        //发送请求
        let param = {
          skuId:this.detail.skus[this.skuSelectIndex].id,
          amount:this.skuBuyCount,
        };
        let result = await reqAddSku2Cart(param);
        if (result.code == 0) {
          this.$refs.TbToast.showToast();
        }else if(result.code==10086){
          //从新登陆
          this.$router.push('/login');
        }
      },
      /**
       * 添加sku到购物车
       */
      addSkuToCart(){
        if (this.detail.skus.length>0) {
          //弹出选择sku
          this.goodsSkuShow = true;
          return;
        }
      },
      /**
       * 检查输入的数量
       */
      checkCount(){
        if (this.skuSelectIndex === -1) {
          return;
        }
        let {skuBuyCount} = this;
        let maxCount = this.detail.skus[this.skuSelectIndex].quantity;

        if (skuBuyCount <= 0) {
          skuBuyCount = 1;
        }else if(skuBuyCount>maxCount){
          skuBuyCount = maxCount;
        }
        this.skuBuyCount = skuBuyCount;
      },
      /**
       * 增加购买次数
       */
      incCount(){
        //不能超出库存
        if (this.skuSelectIndex === -1) {
          return;
        }
        let maxCount = this.detail.skus[this.skuSelectIndex].quantity;
        if (this.skuBuyCount == maxCount) {
          return;
        }
        this.skuBuyCount++;
      },
      /**
       * 减少购买数量
       */
      decCount(){
        if (this.skuSelectIndex === -1) {
          return;
        }
        if (this.skuBuyCount <= 1) {
          return;
        }
        this.skuBuyCount--;
      },
      /**
       * 选择sku
       */
      selectSku(selSku){
        this.skuSelectIndex = selSku;
        let sku = this.detail.skus[selSku];
        //显示商品名称
        this.$refs.csku.innerHTML = `已选: ${sku.skuName}`;
        this.specData.content = `已选: ${sku.skuName}`;
        this.$refs.uncsku.innerHTML = '';
        //price
        this.$refs.price.innerHTML = `￥ ${sku.priceMoney}`;
        this.$refs.quantity.innerHTML = `库存: ${sku.quantity}`;
        //skuImg
        this.$refs.skuImg.src = `${sku.skuImg}`;
      },
      /**
       * 关闭弹框
       */
      closeDialog(){
        this.goodsServiceShow = false;
        this.goodsPropsShow = false;
        this.goodsSkuShow = false;
      },
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

          switch (result.code) {
            case 0:
              //轮询是否下单成功
              this.getSecKillResult(goodsId);
              break;
            case 500:
              // Message.error({
              //   showClose: true,
              //   message: '服务器内部错误',
              //   type: 'error'
              // });
              break;
            case 300:
              // Message.error({
              //   showClose: true,
              //   message: result.msg,
              //   type: 'warning'
              // });
              break;
            case 10086:
              //token 过期跳转到登录
              this.$router.push("/login");
              break;
          }
        }else {
          // MessageBox.alert('请先登录!','提示', {
          //   confirmButtonText: '确定',
          //   callback: action => {
          //     console.log(action);
          //     if (action=='confirm') {
          //       //跳转到登录
          //       this.$router.push("/login");
          //     }
          //   }
          // })
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
              type: 'fraction',
              el: '.custom-pagination',
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
       * 计算价格区间
       *
       */
      goodsPriceRange(){
        let skus = this.detail.skus;
        if (!skus || !skus[0]){
          return;
        }
        let minPrice = skus[0].priceMoney;
        let maxPrice = skus[0].priceMoney;
        if (skus.length == 1) {
          return `￥ ${minPrice}`;
        }
        skus.forEach((sku)=>{
          if (sku.priceMoney<minPrice){
            minPrice = sku.priceMoney;
          }
          if (sku.priceMoney > minPrice) {
            maxPrice = sku.priceMoney;
          }
        });
        return `${minPrice}-${maxPrice}`;
      },
      /**
       * 计算所有的库存总和
       */
      goodsAllQuantity(){
        let skus = this.detail.skus;
        let qCount = 0;
        if (!skus){
          return;
        }
        skus.forEach((sku)=>{
          qCount+= parseInt(sku.quantity);
        });
        return qCount;
      },
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
      GoodsService,
      GoodsParam,
      TbToast
    }

  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .main-layout
    width 100%
    overflow hidden
    background-color: #f2f2f2;
    .dialog-container
      position: fixed;
      left: 0;
      bottom: 0;
      height 10.5rem;
      z-index: 1000;
      width: 100%;
      transform: translateY(-100%);
      .dialog
        display: flex;
        flex-direction: column;
        position: absolute;
        bottom: 0;
        width: 100%;
        height: 100%;
        transform: translateY(100%);
        background-color: #fff;
        color: #333;
        font-size: 0.35rem;
        border-radius: 0.3rem 0.3rem 0 0;
        .dialog-content
          padding: 0 0.2rem;
          height 100%;
          overflow: auto;
          .dialog-xsku
            width: 100%;
            .tb-sku-container
              display: flex;
              width: 100%;
              height: 100%;
              flex-direction: column;
              font-size: 0.33rem;
              padding: 0.2rem 0;
              color: #333;
              box-sizing: border-box;
              .sku-btns
                width: 100%;
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
                box-sizing: border-box;
                padding-top: 0.1rem;
                padding-bottom: constant(safe-area-inset-bottom);
                .gobuy
                  border-radius: 0 0.8rem 0.8rem 0;
                  background-image: linear-gradient(to right, #FF7A00, #FE560A);
                .addcart
                  border-radius: 0.8rem 0 0 0.8rem;
                  background-image: linear-gradient(to right, #FFC500, #FF9402);
                .sku-btn
                  width: 50%;
                  height: 1rem;
                  line-height: 1rem;
                  color: #fff;
                  text-align: center;
                  font-size: 0.35rem;
                  cursor: pointer
              .sku-info
                flex: 1;
                height 5.5rem
                overflow: auto;
                .quantity-info
                  margin-top: 0.2rem;
                  border-top: 0.005rem solid #f2f2f2;
                  .sku-quantity
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    .btn-plus
                      display: flex;
                      margin-right: 0.2rem;
                      justify-content: center;
                      align-items: center;
                      position: relative;
                      width: 0.7rem;
                      height: 0.7rem;
                      background-color: #f6f6f6;
                    .btn-input
                      width: 0.7rem;
                      height: 0.7rem;
                      margin-right: 0.1rem;
                      position: relative;
                      .input-tel
                        font-size: 0.34rem;
                        background-color: #f6f6f6;
                        border: 0;
                        width: 0.7rem;
                        height: 0.7rem;
                        text-align: center;
                    .off
                      background-color: #fbfbfb;
                      color: #ccc;
                    .btn-minus
                      display: flex;
                      justify-content: center;
                      align-items: center;
                      margin-right 0.1rem
                      position: relative;
                      width: 0.7rem;
                      height: 0.7rem;
                      background-color: #f6f6f6
                    .quantity-h2
                      flex: 2;
                      text-align left
                      font-size: 0.35rem;
                      font-weight: normal;
                      padding: 0.225rem 0;
                .delivery-bottom
                  margin-top: 0.3rem;
                  border-top: 0.005rem solid #f2f2f2;
                  .delivery-bottom-ul
                    display: flex;
                    flex-direction: row;
                    flex-wrap: wrap;
                    padding: 0;
                    margin: 0;
                    list-style: none;
                    & li
                      border-radius: 0.4rem;
                      padding: 0.2rem 0.245rem;
                      font-size: 0.32rem;
                      margin-right: 0.24rem;
                      margin-bottom: 0.2rem;
                    .sel
                      color: #fff;
                      background-image: linear-gradient(to right, #FF7A00 100%, #FE560A 100%);
                    .normal
                      background-color: #F8F8F8;
                      color #000000 !important
                      white-space: nowrap;
                  .delivery-bottom-h2
                    font-size: 0.35rem;
                    text-align left
                    font-weight: normal;
                    padding: 0.225rem 0;
                .sku-delivery
                  border-top: 0;
                  margin-top: 0;
                  .delivery-title
                    position: relative;
                    padding: 0.1rem 0.13rem;
                    font-weight: normal;
                    text-align left
                    font-size: 0.3rem;
                    &:after
                      content: '';
                      display: inline-block;
                      width: 0.2rem;
                      height: 0.2rem;
                      position: absolute;
                      right: 0.2rem;
                      top: 0.1rem;
                      border-left: 0.02rem solid #999;
                      border-bottom: 0.02rem solid #999;
                      -webkit-transform: rotate(-45deg);
                      transform: rotate(-45deg);
                  .sku-delivery-h2
                    font-size: 0.42rem;
                    text-align left
                    font-weight: normal;
                    padding: 0.225rem 0;
              .sku-pro
                padding-bottom: 0.16rem;
                height 3.1rem
                border-bottom: 0.005rem solid #f2f2f2;
                .sku-closed
                  position: absolute;
                  top: 0.3rem;
                  right: 0.3rem;
                  font-size: 0.54rem;
                  color: #999999;
                  cursor: pointer;
                .sku-pro-info
                  margin-left: 0.2rem;
                  .sku-txt
                    font-size: 0.33rem;
                  .quantity
                    font-size: 0.33rem;
                  .h
                    color: #ff5000;
                    font-size: 0.4rem;
                  .sku-title
                    display: none;
                .sku-img
                  font-size: 0;
                  .sku-img-sty
                    width 3rem
                    height 3rem
      .dialog-wrapper
        position: absolute;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        z-index: 120;
        background-color: rgba(0, 0, 0, 0.7);
    .pic-gallery-wrapper
      width 100%
      position absolute;
      overflow: hidden;
      top 0;
      .custom-pagination
        position: absolute;
        display: inline-block;
        right: 0.1rem;
        bottom: 0.36rem;
        left 8.5rem;
        width 0.8rem;
        font-size: 0.1rem;
        height: 0.5rem;
        line-height: 0.5rem;
        color: #fff;
        background-color: rgba(0, 0, 0, 0.3);
        padding: 0 0.1rem;
        border-radius: 0.5rem;
        z-index: 10;
      .list-mask
        position fixed
        top 0
        left 0
        width 100%
        height 100%
        z-index 40
        backdrop-filter blur(10px)
        opacity 1
        background rgba(7, 17, 27, 0.6)
      .move-enter-active, .move-leave-active
        transition: all 0.5s;
      .move-enter, .move-leave-to
        opacity: 0;
        transform translateY(100%)
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
            padding-left 0.2rem;
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
          padding-left 0.2rem
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
