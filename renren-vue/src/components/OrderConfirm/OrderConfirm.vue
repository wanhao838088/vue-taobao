<template>
  <div class="wrapper">
    <div class="page">
      <div class="order-confirmOrder">
        <!--订单收货信息-->
        <div class="order-address mui-flex">
          <div class="cell fixed align-center">
            <i class="icon iconfont icon-weizhi"></i>
          </div>

          <div class="cell content">
            <div class="info">
              <span style="float:left;">收货人：</span>
              <span style="float:left;">刘力豪</span>
              <span></span>
              <span class="tel">18865392565</span>
            </div>
            <div class="detail">
              <span>收货地址：河南省 郑州市 管城回族区 城东路街道 东明路南41号许继集团 城北路东明路 </span>
            </div>
          </div>

          <div class="cell fixed align-center">
            <i class="nav iconfont icon-arrow-right-copy-copy-copy"></i>
          </div>
        </div>

        <div class="order-order">
          <header class="order-orderInfo mui-flex align-center">
            <div class="cell fixed" style="width: auto !important;">
              <img src="https://gw.alicdn.com/tps/i1/TB1PsTiHVXXXXcXXXXXsYU.HpXX-55-64.png"
                   alt="" class="icon">
            </div>
            <div class="cell content">
              <div class="info" style="text-align: left;">华联液晶</div>
            </div>
          </header>

          <!--订单项-->
          <div class="order-item">
            <div class="order-itemInfo mui-flex">
              <div class="cell fixed item-pic">
                <div class="img-cell">
                  <div class="img" style="background-image:url(//gw.alicdn.com/imgextra/i2/906746002/O1CN01y8lOzB1uCxfn0uPiJ_!!906746002.png_270x270q90.jpg);"></div>
                </div>
              </div>
              <div class="content cell">
                <div class="title">超清55寸4K液晶电视32 42 60 65 75彩电曲面网络智能wifi防爆KTV</div>
                <div class="sku-info">
                  <span>颜色分类：55寸4k高清网络版[护眼+节能]</span>
                </div>
              </div>
              <!--价格信息-->
              <div class="ext cell fixed item-pay">
                <div class="price">
                  <span class="dollar">￥</span>
                  <span class="main-price">1499</span>
                  <span class="devider-price">
                    <span>.</span>
                    <span>00</span>
                  </span>
                </div>
                <div class="quantity">
                  <span>X 1</span>
                </div>
              </div>
            </div>

            <!--购买数量-->
            <div class="order-quantity">
              <div class="buy-single-row mui-flex align-center">
                <div class="title cell fixed">购买数量</div>
                <div class="content cell" style="text-align: right;color: #666;">
                  <a href="javascript:;" class="btn minus off"></a>
                  <input type="number" class="amount" value="1">
                  <a href="javascript:;" class="btn plus"></a>
                </div>
              </div>
              <!--分割线-->
              <Seperator></Seperator>
            </div>

            <!--运费险-->
            <MenuItem :itemName="'公益宝贝'" :itemValue="'成交后卖家将捐赠0.02元给公益宝贝计划'"></MenuItem>
            <!--运费险-->
            <MenuItem :itemName="'运费险'" :itemValue="'请选择'"></MenuItem>
            <!--运费险-->
            <MenuItem :itemName="'配送方式'" :itemValue="'快递 免邮'"></MenuItem>

          </div>
        </div>
      </div>

      <!--底部-->
      <div class="order-submitOrder">
        <div class="mui-flex align-center" style="align-items: center;">
          <div class="cell realPay">
            <div class="realPay-wrapper">
              <span>共</span>
              <span class="count">1</span>
              <span>件，总金额 </span>
              <span class="price">
                ￥1499.00
              </span>
            </div>
          </div>
          <div class="cell fixed action">
            <div class="submit-order-sp mui-flex align-center">
              <span>提交订单</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Seperator from './Seperator/Seperator'
  import MenuItem from './MenuItem/MenuItem'

  /**
   * 订单确认页面
   */
  export default {
    name: "OrderConfirm",

    components:{
      Seperator,
      MenuItem
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .wrapper
    color: #666;
    background-color: #eee;
    -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: rgba(255,255,255,0);
    margin: 0;
    padding: 0;
    height: 100%;
    .page
      width: 100%;
      min-height: 100%;
      position: relative;
      top: 0;
      left: 0;
      .mui-flex
        box-sizing: border-box;
        display: flex!important;
        flex-wrap: wrap;
        & .fixed
          flex: none!important;
          width: auto !important;
        & *
          box-sizing: border-box;
        & .cell
          flex: 1;
          width: 0;
          flex-basis: 0;
          max-width: 100%;
          display: block;
          padding: 0!important;
          position: relative;
      .align-center
        align-self: center;
      .order-submitOrder
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: #fff;
        margin-top: 0.12rem
        z-index: 999;
        box-shadow: 0 -1px 0 0 rgba(0,0,0,.1), 0 -0.5px 0.5px 0 rgba(0,0,0,.2);
        padding-bottom: env(--windvane-safe-area-inset-bottom,env(safe-area-inset-bottom));
        .submit-order-sp
          padding: 1.1em 1.4em;
          pointer-events: all;
          font-size: 0.313rem
        .action
          pointer-events: none;
          background-color: #f50;
          color: #fff;
        .realPay
          text-align: right;
          margin-right: 0.12rem
          .realPay-wrapper
            box-sizing: border-box;
            font-size: 0.3rem
            .price
              color: #f50;
              font-weight: bolder;
              font-size: 0.32rem
            .count
              color: #f50;
              font-weight: 400;
      .order-confirmOrder
        padding-bottom: 100px;
        .order-order
          margin-bottom: 0.12rem
          background-color: #fff;
          -ms-box-shadow: 0 1px 0 0 rgba(0,0,0,.1),0 .5px .5px 0 rgba(0,0,0,.2);
          box-shadow: 0 1px 0 0 rgba(0,0,0,.1), 0 0.5px 0.5px 0 rgba(0,0,0,.2)
          .order-item
            background-color: #f5f5f5;
            .title
              margin-right: 0.12rem
              font-size 0.35rem
              color: #666;
            .order-quantity
              display: block;
              .buy-single-row
                padding: 0.133rem   0.12rem
                background-color: #fff;
                color: #999;
                line-height: 2;
                .off
                  background-color: #f5f5f5 !important;
                .plus
                  margin-left: 0.133rem
                  &::after
                    position: absolute;
                    top: 0.25rem
                    left: 0.2rem
                    border-bottom: 2px solid #999;
                    width: 0.3rem
                    height: 1px;
                    content: ' ';
                  &::before
                    transform: rotate(90deg);
                    position: absolute;
                    top: 0.25rem
                    left: 0.2rem
                    border-bottom: 2px solid #999;
                    width: 0.3rem
                    height: 1px;
                    content: ' ';
                .amount
                  display: inline-block;
                  vertical-align: top;
                  width: 0.473rem
                  height: 0.627rem
                  border: none;
                  text-align: center;
                  line-height: 1;
                .minus
                  margin-right: 0.133rem
                  &::after
                    position: absolute;
                    top: 0.25rem
                    left: 0.233rem
                    border-bottom: 2px solid #999;
                    width: 0.16rem
                    height: 1px;
                    content: ' ';
                .btn
                  display: inline-block;
                  width: 0.627rem
                  height: 0.627rem
                  background-color: #ccc;
                  position: relative;
                  line-height: 1;
                .title
                  margin-right: 0.12rem
                  color: #666;
            .order-itemInfo
              padding: 0.22rem
              .ext
                font-size: 0.26rem
                text-align: right;
                .quantity
                  box-sizing: border-box;
                .price
                  min-height: 0.367rem
                  font-weight: bolder;
                  color: #f50;
                  .devider-price
                    box-sizing: border-box;
                  .main-price
                    font-size: 0.353rem
                  .dollar
                    padding: 0 2px;
              .sku-info
                color: #999;
                & span
                  float: left
                  text-align left
              .title
                line-height: 1.5;
                text-align left
              .item-pic
                box-sizing: border-box;
                .img-cell
                  width: 1.9rem!important;
                  height: 1.9rem
                  margin-right: 0.22rem
                  overflow: hidden;
                  .img
                    width: 100%;
                    height: 100%;
                    display: block;
                    background-position: 50% 50%;
                    -ms-background-size: contain;
                    background-size: contain;
                    background-repeat: no-repeat;
          .order-orderInfo
            padding: 0.12rem
            background-color: #fff;
            & .cell
              flex: 1;
              width: 0;
              flex-basis: 0;
              max-width: 100%;
              display: block;
              padding: 0!important;
              position: relative;
            .content
              margin-right: 0.2rem
            .info
              line-height: 1.5;
            .icon
              margin-right: 0.12rem
              height: 0.38rem
              width: 0.38rem
        .order-address
          align-items: center;
          padding: 0.3rem  0.22rem
          margin-bottom: 0.22rem
          box-sizing: border-box;
          flex-wrap: wrap;
          display: flex !important;
          background-color: #fff;
          -ms-box-shadow: 0 1px 0 0 rgba(0,0,0,.2),0 .5px 0 0 rgba(0,0,0,.3);
          box-shadow: 0 1px 0 0 rgba(0,0,0,.2), 0 0.5px 0 0 rgba(0,0,0,.3);
          .content
            margin-right: 0.2rem
            .detail
              line-height: 1.3;
              height: 0.9rem;
              margin-bottom: 2px;
              & span
                text-align: left;
                float: left;
            .info
              line-height: 1.5;
              height: 0.38rem
              .tel
                float: right;
          & .icon
            font-size 0.58rem
            margin-right: 0.12rem
            height: 0.28rem
            width: 0.28rem
          .cell
            max-width: 100%;
            display: block;
            padding: 0!important;
            position: relative;
            .nav
              width: 0.187rem
              height: 0.2rem
          .fixed
            flex: none !important;
            width: auto;
</style>
