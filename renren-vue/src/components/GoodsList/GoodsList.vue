<template>
  <div class="shop_container">
    <!--搜索栏-->
    <div ref="statusBar" class="status-suggest">
      <div class="mytaobao">
        <header class="top-bar on">
          <div class="top-bar-w">
            <div class="top-bar-c">
              <div class="s-input-select">
                <div class="s-input-tab">
                  <div @click="showCheck=!showCheck" class="s-input-tab-txt">宝贝</div>
                  <!--动态显示 & 隐藏-->
                  <div v-show="showCheck" class="s-input-tab-nav on">
                    <ul class="input-ul">
                      <li class="input-li all">
                        <i class="iconfont icon-baobei"></i>宝贝
                      </li>
                      <li class="input-li shop">
                        <i class="iconfont icon-dianpu"></i>店铺
                      </li>
                      <li class="input-li mall">
                        <i class="iconfont icon-tianmao"></i>天猫
                      </li>
                    </ul>
                  </div>
                </div>

                <!--输入框部分-->
                <div class="s-input-frame">
                  <form action="" class="c-form-suggest">
                    <div class="s-form-search">
                      <input @focus="doSearch" @keyup="changeContent" v-model="content" type="text" class="J_autocomplete">
                    </div>
                    <div class="c-form-btn">
                      <input type="submit" name="search" class="icons-search">
                    </div>
                  </form>
                </div>
              </div>
            </div>

            <div @click="isClickHome" class="top-bar-btn closed"
                 style="transform-origin: 0px 0px; opacity: 1; transform: scale(1, 1);">
              <div v-if="isGoHome" class="icons-home"></div>
              <div v-else>取消</div>
            </div>
          </div>
        </header>
        <div v-show="records.length>0" class="suggest-container">
          <ul class="suggest-sug">
            <li class="suggest-li" v-for="(rd,index) in records" :key="index">
              {{rd.nameCn}}
              <div class="add J_AddToQuery">
                <div class="icons-suggest-addto"></div>
              </div>
            </li>
          </ul>
        </div>
      </div>

      <!--过滤栏-->
      <div class="filterbar-container">
        <div class="filter-bar J_sortTab">
          <div class="viewtype-switch J_SwitchViewtype">
            <div class="icons-list" data-spm-anchor-id="0.0.0.i4.592748ccjgFJ6C"></div>
          </div>

          <!--排序部分-->
          <ul class="sort-tab">
            <li @click="isShowChoosePrice=!isShowChoosePrice"
                :class="{'selected' : sortWay<=4}"
                class="droplist-trigger">
              <span class="text">{{sortText}}</span>
              <span class="arrow"></span>
              <span class="bar"></span>
            </li>
            <li @click="changeSort(5)"
                :class="{'selected' : sortWay==5}"
                class="sort"
                data-value="_sale">销量优先<span class="bar"></span>
            </li>
            <li :class="{'selected' : sortWay==6}" style="flex: 1">
              <div class="top-bar-e">
              <span id="J_Sift">
                <i class="icons-sift"></i>筛选
              </span>
              </div>
            </li>
          </ul>
          <!--选择价格等部分-->
          <div v-show="isShowChoosePrice" class="droplist  droplist-expand">
            <ul class="sorts">
              <li class="sort" @click="changeSort(1,'综合排序')" :class="{'selected' : sortWay==1}" data-value="">
                综合排序
                <span class="icons-checked-icon"></span>
              </li>
              <li class="sort" @click="changeSort(2,'价格从高到低')" :class="{'selected' : sortWay==2}" data-value="_bid">价格从高到低<span class="icons-checked-icon"></span></li>
              <li class="sort" @click="changeSort(3,'价格从低到高')" :class="{'selected' : sortWay==3}"  data-value="bid">价格从低到高<span class="icons-checked-icon"></span></li>
              <li class="sort" @click="changeSort(4,'信用排序')" :class="{'selected' : sortWay==4}" style="border: none;" data-value="_ratesum">信用排序<span class="icons-checked-icon"></span></li>
            </ul>

          </div>

        </div>
      </div>
    </div>

    <!--商品列表-->
    <div class="wrapper" :height="domHeight">
      <scroller lock-x :height="domHeight"
                @on-scroll-bottom="onScrollBottom" ref="scrollerBottom"
                :scroll-bottom-offst="200">
        <ul class="content shop_list" v-if="goods">
          <li class="shop_li" v-for="(item, index) in goods" :key="index" @click="toGoodsDetail(item.id)">
            <div class="list-item">
              <div class="p">
                <img class="p-pic" :src="item.goodsImg" style="visibility: visible;">
                <span class="flag c-icon-p4p"></span>
              </div>

              <div class="d">
                <h3 class="d-title">{{item.goodsTitle}}</h3>
                <p class="d-price">
                  <em class="h">
                    <span class="price-icon">¥</span>
                    <span class="font-num">{{item.goodsMinPrice}}</span>
                  </em>
                  <del v-show="item.orgMinPrice">
                    <span class="price-icon">¥</span>
                    <span class="font-num">{{item.orgMinPrice}}</span>
                  </del>
                </p>
                <div class="d-main">
                  <p class="d-freight">{{item.deliveryFree==0?'免运费':`¥ ${item.deliveryFree}`}}</p>
                  <p class="d-num">
                    <span class="font-num">{{item.payCount}}人付款</span>
                  </p>
                  <p class="d-area">{{item.location}}</p>
                </div>
              </div>

            </div>
            <div class="icons-group">
              <div class="item-icons-jinbi">金币抵2%</div>
            </div>
          </li>

          <TbLoading :showLoading="hasMore" :tip="tipMsg"></TbLoading>
        </ul>
      </scroller>

    </div>

    <div v-show="isShowChoosePrice" @click="dismissMask" class="m-sift">
      <div class="sort-droplist-mask"></div>
    </div>
  </div>
</template>

<script>
  import {mapState} from 'vuex'
  import { Loading,LoadMore,Scroller  } from 'vux'

  import TbLoading from '../TbLoading/TbLoading'
  import {reqGoods,reqSearchCategory} from '../../api/index'

  export default {
    data(){
      return{
        isGoHome:true, //是否显示返回首页按钮
        content:'', //搜索内容
        showCheck:false,//是否显示选择项
        records:[], //搜索结果
        domHeight:'',
        pullUpLoad:true, //是否需要下拉加载
        goods:[] ,//搜索结果
        pageNo:1 ,//分页参数 开始为1
        hasMore:true , //是否还有更多数据
        categoryName:'',//搜索名称
        onFetching: false, //是否正在加载
        tipMsg:'努力加载中...', //底部提示消息
        isShowChoosePrice:false , //是否正在显示筛选价格
        sortWay:1, //排序方式
        sortText:'综合排序', //排序说明

      }
    },
    mounted(){
      //获取高度
      let temp = document.documentElement.clientHeight || document.body.clientHeight;
      let statusBarHeight = this.$refs.statusBar.offsetHeight;
      this.domHeight = (temp - statusBarHeight)+'px';

      //请求商品数据
      this.getDataByPageNo();
    },
    methods:{

      /**
       * 隐藏遮罩层
       */
      dismissMask(){
        this.isShowChoosePrice = false;
      },
      /**
       * 切换排序方式
       */
      changeSort(type,text){
        this.sortWay = type;
        this.isShowChoosePrice = false;
        if (type == 5) {
          //销量排序

        }else {
          this.sortText = text;

        }
        //从新排序
      },
      /**
       * 根据分页查询商品
       */
      async getDataByPageNo(){
        //发送请求获取商品列表
        let cateId = this.$route.query.categoryId;
        this.content = this.$route.query.categoryName;
        let {pageNo} = this;

        let form = {
          cateId,
          pageNo
        };

        //查询商品列表
        let result =await reqGoods(form);

        if (result.code == 0) {
          //是否有没有更多数据
          if (result.page.records.length==0){
            //没有更多了
            this.tipMsg = '没有更多了';
            this.hasMore = false;
            this.pageNo--;

            this.$nextTick(() => {
              this.$refs.scrollerBottom.reset()
            });
            this.onFetching = false;
            return;
          }
          //更新页面数据
          if (pageNo == 1) {
            this.goods = result.page.records;
          }else {
            //拼接数据
            this.goods = this.goods.concat(result.page.records);
          }

          this.$nextTick(() => {
            this.$refs.scrollerBottom.reset()
          });
          this.onFetching = false

        }
      },

      onScrollBottom () {
        if (this.onFetching) {
          // do nothing
        } else {
          this.onFetching = true;
          //加载更多的数据
          this.pageNo ++;
          this.getDataByPageNo();
        }
      },
      /**
       * 获取焦点的时候进行搜索
       */
      async doSearch(){
        this.isGoHome = false;

        let {content} = this;
        if (content) {
          //发送请求
          let obj = {
            ccame:content,
            pageNo:1
          };
          let result =  await reqSearchCategory(obj);
          console.log(result);
          if (result.code == 0) {
            //返回成功
            this.records = result.data.records;
          }
        }else {
          //清空内容
          this.records = [];
          this.isGoHome = true;
        }
      },
      /**
       * 点击取消或者回首页
       */
      isClickHome(){
        let {isGoHome} = this;
        if (isGoHome) {
          //回首页
          this.$router.push({
            path: `/main`,
          })
        }else {
          //取消搜索

        }
      },
      /**
       * 改变内容 搜索商品类别
       */
      async changeContent(){
        let {content} = this;
        if (content) {
          //发送请求
          let obj = {
            ccame:content,
            pageNo:1
          };
          let result =  await reqSearchCategory(obj);
          console.log(result);
          if (result.code == 0) {
            //返回成功
            this.records = result.data.records;
          }
        }else {
          //清空内容
          this.records = [];
          this.isGoHome = true;
        }
      },
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
    components:{
      Loading,
      LoadMore,
      Scroller,
      TbLoading
    }

  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .shop_container
    margin-bottom 20px
    width 100%
    display: flex;
    flex-direction column
    height: 100%
    .m-sift
      color: #051b28;
      .sort-droplist-mask
        z-index: 1;
        top: 0.667rem  /* 50/75 */;
        position: absolute;
        left: 0;
        width: 100%;
        height: 100%;
        background: #000;
        opacity: 0.7;
    .filterbar-container
      transform-origin: 0px 0px;
      opacity: 1;
      .sort-tab
        display flex
        flex 1
        .sort
          list-style: none;
          flex 1
          .bar
            position: absolute;
            right: 0;
            top: 0.28rem
            width: 1px;
            height: 0.267rem
            background: #ccc;
            overflow: hidden;
        & li
          color: #3d4245;
          width: 30%;
          display: inline-block;
          height: 0.82rem
          font-size: 0.337rem
          text-align: center;
          line-height: 0.82rem
          position: relative;
        .selected
          color: #f50;
          .arrow
            background-image url("./images/arr_down.png") !important
        .droplist-trigger
          flex 1
          .arrow
            background-size 100%
            position: absolute;
            top: 0.28rem
            right: 0.25rem;
            display: inline-block;
            margin-left: 0.053rem
            width: 0.233rem
            height: 0.18rem
            background-repeat: no-repeat;
            background-image url("./images/down_arrow.png")
        .top-bar-e
          min-width: 0.533rem
          text-align: center;
          .icons-sift
            background-size 100%
            position: absolute
            top: 0.2rem;
            left: 0.59rem;
            background-image url("./images/loudou.png")
            width: 0.373rem
            height: 0.387rem
          .bar
            position: absolute;
            right: 0;
            top: 0.28rem
            width: 1px;
            height: 0.267rem
            background: #ccc;
            overflow: hidden;
      .filter-bar
        background: #fff;
        border-bottom: solid 1px #ccc;
        width: 100%;
        display: flex
        flex-direction row-reverse
        z-index: 100;
        position: relative;
        .droplist
          position: absolute;
          top: 0.93rem
          left: 0;
          right: 0;
          z-index: 2;
          white-space: nowrap;
          background: #fff;
          line-height: 0.52rem
          border-bottom: solid 1px #c8c7cc;
          .sorts
            margin-left: 0.701rem
            list-style: none;
            .selected
              color: #f50;
              .icons-checked-icon
                display: block;
                position: absolute;
                right: 0.267rem
                background-image url("./images/right.png")
                background-size 100%
                top: 0.2rem
                width: 0.373rem
                height: 0.307rem
            .sort
              position: relative;
              font-size: 0.3rem;
              text-align left
              line-height: 0.8rem;
              border-bottom: solid 1px #c8c7cc;
        .viewtype-switch
          float: right;
          width: 0.967rem
          height: 0.92rem
          text-align: left;
          border-left: 1px solid #dbdbdb;
          margin-left: -1px;
          position: relative;
          .icons-list
            position: absolute;
            left: 50%;
            background-size 100%
            background-image url("./images/grid.png")
            margin-left: -0.233rem
            top: 0.133rem
            width: 0.5rem
            height: 0.5rem
    .status-suggest
      padding-bottom: 0;
      position: fixed;
      z-index 1000
      height auto
      background-color white
      width 100%
      top: 0;
      .mytaobao
        color: #3d4245;
        .suggest-container
          background: white;
          overflow: hidden;
          .suggest-sug
            background: #f9f9f9;
            .suggest-li
              height: 0.8rem
              text-align left
              line-height: 0.8rem
              background: #f9f9f9;
              border-bottom: 1px solid #dedede;
              padding: 0 0.213rem
              color: #666;
              font-size: 0.3rem
              .add
                height: 100%;
                width: 0.8rem
                float: right;
                margin-right: -0.267rem
                margin-bottom: auto;
                .icons-suggest-addto
                  position: relative;
                  top: 0.3rem;
                  left: 0.147rem;
                  width: 0.2rem;
                  background-size: 100%;
                  height: 0.16rem;
                  background-image url("./images/i_arrow.png")
              .match-word
                color: #999;
                margin-right: 0.107rem
        .on
          background-color: transparent
        .top-bar
          width: 100%;
          background: #f6f6f6;
          z-index: 101;
        .top-bar-w
          width: 100%;
          color: #212121;
          height: 0.727rem
          line-height: 0.727rem
          padding: 0.08rem   0;
          display: -webkit-box;
          position: relative;
          border-bottom: 1px solid #dbdbdb;
          .top-bar-btn
            height: 30px;
            line-height: 0.4rem
            padding: 0 0.267rem
            display: inline-block;
            font-size: 0.16rem
            color: #333;
            .icons-home
              background-image url("./images/home.png")
              background-size 100%
              margin: 0.133rem  0 0 0.067rem
              width: 0.507rem
              height: 0.48rem
          .top-bar-c
            -webkit-box-flex: 1;
            margin: 0 0 0 0.16rem
            .s-input-select
              display: -webkit-box;
              height: 0.727rem
              background: #e3e3e5;
              -webkit-border-radius: 0.053rem
              .s-input-frame
                -webkit-box-flex: 1;
                width: 100%;
                padding-right: 0.133rem
                line-height: 0.373rem
                .c-form-suggest
                  position: relative;
                  display: -webkit-box;
                  .c-form-btn
                    width: 0.4rem
                    display: block;
                    height: 0.4rem
                    margin-right: 0.133rem
                    .icons-search
                      display: block;
                      border: none;
                      text-indent: -999px;
                      background-size 100%
                      position: relative;
                      top: 0.15rem
                      width: 0.44rem
                      background-image: url(images/search.png);
                      height: 0.44rem
                      background-color: transparent;
                  .s-form-search
                    -webkit-box-flex: 1;
                    .J_autocomplete
                      border: none;
                      background: none;
                      width: 100%;
                      height: 0.447rem
                      padding-left 0.4rem
                      padding-top: 0.12rem;
                      font-size: 0.35rem
              .s-input-tab
                display: inline-block;
                position: relative;
                .s-input-tab-nav
                  position: absolute;
                  left: 0;
                  top: 0.6rem
                  z-index: 101;
                  padding: 0.133rem
                  .input-ul
                    background: #484d50;
                    border-radius: 0.08rem
                    width: 1.867rem
                    overflow: hidden;
                    color: #c7c8c9;
                    z-index 888
                    .input-li
                      border-top: 1px solid #707476;
                      margin-top: -1px;
                      height: 0.667rem
                      line-height: 0.667rem
                      .iconfont
                        display: inline-block;
                        margin: auto 0.107rem  -0.107rem 0.107rem
                        position: relative;
                        top: -0.04rem
                .s-input-tab-txt
                  width: 0.947rem
                  height: 0.4rem
                  line-height: 0.4rem
                  text-indent: 0.133rem
                  color: #999;
                  font-size: 0.287rem
                  &:after
                    content: '';
                    position: absolute;
                    width: 0.213rem
                    height: 0.173rem
                    background-repeat: no-repeat;
                    background-image: url(./images/down_arrow.png);
                    background-size: 0.213rem  0.173rem
                    top: 0.09rem
                    right: -0.25rem
    .wrapper
      padding-top: 1.9rem;
      width 100%
      flex 1
      .pullup-wrapper
        width: 100%
        height 1rem
        position: initial;
        pointer-events: auto;
        font-size 0.34rem
        .after-trigger
          margin-top: 0.133rem
    .shop_list
      overflow hidden
      height auto
      pointer-events: auto;
      .shop_li
        height auto
        bottom-border-1px(#f1f1f1)
        width 100%
        padding: 12px 6px;
        border-bottom: 1px solid #dbdbdb;
        position: relative;
        .list-item
          display: -webkit-box;
          .p
            display: inline-block;
            text-align: center;
            margin-right: 0.3rem;
            margin-left: 8px;
            overflow: hidden;
            .c-icon-p4p
              background-size: contain;
            .flag
              position: absolute;
              width: 20px;
              height: 20px;
              left: 0;
              top: 0;
            .p-pic
              width 2.8rem
              height 2.8rem
          .d
            margin: 4px 15px 6px 0;
            -webkit-box-flex: 1;
            .d-price
              line-height: 0.7rem;
              display flex
              color: #999;
              font-size: 0.49rem;
              .h
                color: #eb5211;
                display: flex;
              del
                display flex
                font-size: 0.35rem;
                margin-left: 5px;
            .d-main
              display: -webkit-box;
              margin-top: 0.36rem;
              height: 20px;
              overflow: hidden;
              p
                color #999
                font-size: 0.33rem;
              .d-freight
                overflow: hidden;
              .d-num
                -webkit-box-flex: 1;
                font-size: 0.33rem;
                text-align: center;
              .d-area
                text-align: right;
                font-size: 0.33rem;
                .price-icon
                  font-family: arial;
                  padding-right: 4px;
            .d-title
              line-height: 0.5rem;
              margin-bottom: 3px;
              position: relative;
              overflow: hidden;
              text-align left
              font-weight bolder
              font-size: 0.39rem;
              height: 1.2rem;
              display: -webkit-box;
              word-break: break-all;
              color: #4b566a;
        .icons-group
          position: absolute;
          right: 0;
          top: 0;
          margin-right 10px;
          color: white;
          line-height: 16px;
          height: 16px;
          div
            float: right;
            font-size: 12px;
            padding: 0 3px;
          .item-icons-jinbi
            background-color: #ff9700;
</style>
