<template>
  <div id="J_cartBuy" class="cartbuy">
    <div>
      <!--头部-->
      <header class="o-c-header">
        <div class="back"><p class="bk-img"></p></div>
        <div class="title">
          <span >购物车</span>
          <span>
            <span>(</span>
            <span>2</span>
            <span>)</span>
          </span>
        </div>
        <div class="last"></div>
      </header>

      <!--商品-->
      <div>
        <div class="allItemv2">
          <div class="bundlev2">
            <!--店铺信息-->
            <div class="shop">
              <div class="o-t-title-shop">
                <div class="tcont">
                  <div class="shopcb">
                    <p style="line-height: 0;">
                      <input id="cb-155378244395023" type="text" class="o-t-cb">
                      <label class="o-t-cb-label" for="cb-155378244395023">
                        <i style="width: 100%;height: 100%;" class="iconfont icon-yuanquan"></i>
                      </label>
                    </p>
                  </div>

                  <!--企业图标-->
                  <div class="ico">
                    <img style="width: 100%" src="//gtms04.alicdn.com/tps/i4/TB1x4ExHVXXXXalXFXXSutbFXXX.jpg">
                  </div>

                  <!--店铺名称-->
                  <div class="contact">
                    <a href="//shop.m.taobao.com/shop/shop_index.htm?shop_id=72584016" >
                      <p class="title">华联液晶</p>
                      <p class="arrow iconfont icon-arrow-right-copy-copy-copy">
                        <span class="icon-right"></span>
                      </p>
                    </a>
                  </div>

                  <div class="state">
                    <div class="state-cont">
                      <p class="edit">领券</p>
                    </div>
                    <div class="state-cont">
                      <p class="edit undefined">编辑</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!--商品列表-->
            <div class="group"></div>
          </div>

        </div>
      </div>
    </div>
  </div>
</template>

<script>
  /**
   * 购物车
   */
  export default {
    name: "BuyCart"
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .cartbuy
    position: relative;
    .allItemv2
      list-style: none;
      .bundlev2
        margin-top: .32rem;
        background: #fff;
        border-bottom: .01333rem solid #e7e7e7;
        .group
          list-style: none;
        .shop
          list-style: none;
          .o-t-title-shop
            width: 100%;
            height: 1.067rem;
            padding-left: .32rem;
            box-sizing: border-box;
            background: #fff;
            position: relative;
            .tcont
              font-size: 0.253rem  /* 19/75 */;
              width: 100%;
              height: 1.067rem;
              display: flex;
              .state
                margin-left: .32rem;
                display: flex;
                .state-cont
                  flex: 1;
                  box-align: center;
                  display: box;
                  cursor: pointer;
                  .edit
                    border: none;
                    width: 1.48rem;
                    text-align: center;
                    cursor: pointer;
              .contact
                box-align: center;
                flex: 1;
                display: -webkit-box;
                .arrow
                  min-width: .52rem;
                  min-height: .547rem;
                  line-height: 0.5rem;
                  text-align left
                  width: .52rem;
                  background-size: .4rem .647rem;
                  flex: 1;
                  background-position: left center;
                .title
                  margin-right: .52rem;
                  line-height: .547rem;
                  word-break: break-all;
                  display: -webkit-box;
                  text-align: left;
                  overflow: hidden;
                  -webkit-line-clamp: 1;
                & a
                  width: 100%;
                  color: #051b28;
                  display: flex;
                  padding-right: .52rem;
                  box-sizing: border-box;
              .ico
                margin-right: .32rem;
                width: .427rem;
                margin-top 0
                display: flex;
                align-items: center;
              .shopcb
                -webkit-box-align: center;
                display: -webkit-box;
                margin-right: .32rem;
                .o-t-cb-label
                  display: inline-block;
                  width: .533rem;
                  height: .533rem;
                  cursor: pointer;
                .o-t-cb
                  display: none;
    .o-c-header
      width: 100%;
      height: 1.2rem;
      font-size: 0.38rem
      background: #fff;
      display: flex;
      border-bottom: 0.2333rem solid #e7e7e7;
      .last
        text-align: right;
        flex 1
        align-items center
        margin-right: .467rem;
      .title
        flex: 1;
        justify-content: center;
        align-items: center;
        display: flex;
      .back
        cursor: pointer;
        text-align: left;
        flex 1
        align-items center
        .bk-img
          padding-top 0.7rem
          padding-left 0.5rem
          width 0.5rem
          height 0.5rem
          background: url("./images/back.png") center no-repeat;
          background-size: 0.5rem;

</style>
