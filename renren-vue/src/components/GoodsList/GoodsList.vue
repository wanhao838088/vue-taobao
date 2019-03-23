<template>
  <div class="shop_container">
    <!--搜索栏-->
    <div class="status-suggest">
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
                      <input @keyup="changeContent" v-model="content" type="text" class="J_autocomplete">
                    </div>
                    <div class="c-form-btn">
                      <input type="submit" name="search" class="icons-search">
                    </div>
                  </form>
                </div>
              </div>
            </div>

            <div @click="$router.back()" class="top-bar-btn closed"
                 style="transform-origin: 0px 0px; opacity: 1; transform: scale(1, 1);">
              <div v-if="isGoHome" class="icons-home"></div>
              <div v-else>取消</div>
            </div>
          </div>
        </header>
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
          <li class="droplist-trigger selected">
            <span class="text">综合排序</span>
            <span class="arrow"></span>
            <span class="bar"></span>
          </li>
          <li class="sort" data-value="_sale">销量优先<span class="bar"></span></li>
          <li style="flex: 1">
            <div class="top-bar-e">
              <span id="J_Sift">
                <i class="icons-sift"></i>筛选
              </span>
            </div>
          </li>
        </ul>

      </div>
    </div>

    <!--商品列表-->
    <ul class="shop_list" v-if="goods">
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
                <span class="font-num">1614人付款</span>
              </p>
              <p class="d-area">{{item.location}}</p>
            </div>
          </div>

        </div>
        <div class="icons-group">
          <div class="item-icons-jinbi">金币抵2%</div>
        </div>

      </li>
    </ul>
    <ul v-else>
      <li v-for="item in 6">
        <img class="shop_img" src="./images/shop_back.svg">
      </li>
    </ul>
  </div>
</template>

<script>
  import {mapState} from 'vuex'

  import {reqGoods,reqSearchCategory} from '../../api/index'

  export default {
    data(){
      return{
        isGoHome:true, //是否显示返回首页按钮
        content:'', //搜索内容
        showCheck:false,//是否显示选择项
        records:[], //搜索结果
        goods:[] ,//搜索结果
        pageNo:1 ,//分页参数 开始为1
      }
    },
    async created(){
      //发送请求获取商品列表
      let cateId = this.$route.query.categoryId;
      console.log(cateId);
      let {pageNo} = this;

      let form = {
        cateId,
        pageNo
      };

      let result =await reqGoods(form);
      console.log(result);
      if (result.code == 0) {
        this.goods = result.page.records;
      }
    },
    methods:{
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
    computed:{
      //...mapState(['goods'])
    },
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .shop_container
    margin-bottom 20px
    width 100%
    height: 100%
    .filterbar-container
      transform-origin: 0px 0px;
      opacity: 1;
      margin-top 1rem
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
          font-size: 0.387rem
          text-align: center;
          line-height: 0.82rem
          position: relative;
        .selected
          color: #f50;
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
            background-image url("./images/arr_down.png")
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
                      padding-left 0.2rem
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
    .shop_list
      overflow hidden
      margin-top: 0.1rem;
      .shop_li
        height 3rem
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
