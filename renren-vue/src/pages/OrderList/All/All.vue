<template>
  <div class="main-container">
    <div class="atmosphere">
      <!--下拉刷新-->
      <div class="ptr--ptr">
        <div class="ptr--box">
          <div class="ptr--content">
            <div class="ptr--icon">⇣</div>
            <div class="ptr--text">下拉即可刷新...</div>
          </div>
        </div>
      </div>

      <div id="ptr">
        <div class="list-card">
          <li class="searchbar__wrap">
            <div class="searchbar__input">
              <div class="search-icon">
                <i class="iconfont  icon-iconfonticonfontsousuo1 "></i>
              </div>
              <input placeholder="搜索全部订单" type="text">
            </div>
            <div class="searchbar__button">
              <span>搜索</span>
            </div>
          </li>
          <!--订单列表-->
          <div class="item-card">
            <div>
              <div class="card-top">
                <div class="shop-name-wrapper">
                  <div class="tmall-img">
                    <div style="width: 100%; height: 100%; background-image: url(//gw.alicdn.com/tfs/TB1LmH7SXXXXXXYXFXXXXXXXXXX-63-63.png_200x200q85s150.jpg_.webp); background-repeat: no-repeat; background-position: center center; background-size: contain;"></div>
                  </div>
                  <div class="spname-div">
                    <span>强联畅水果专营店</span>
                  </div>
                </div>
                <!--订单状态-->
                <div class="order-status">
                  <div>
                    <span class="order-status-span">卖家已发货</span>
                  </div>
                </div>
              </div>
            </div>
            <!--商品信息-->
            <div>
              <div class="goods-wrapper">
                <div class="goods-div">
                  <div class="goods-img">
                    <div style="width: 100%; height: 100%; background-image: url(//img.alicdn.com/imgextra/i4/1717744392/O1CN01dZKv5r1iJa18M5Dop_!!0-item_pic.jpg_200x200.jpg); background-repeat: no-repeat; background-position: center center; background-size: cover;"></div>
                  </div>
                  <div class="goods-msg">
                    <div class="goods-title">
                      <span style="text-overflow: ellipsis; overflow: hidden; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">QQ品牌乳酸菌酸奶儿童牛奶早餐奶益生菌优酸乳100ml&amp;times;20瓶</span>
                    </div>
                    <!--七天退换-->
                    <div class="seven-day">
                      <div class="seven-day-layout">
                        <span>七天退换</span>
                      </div>
                    </div>
                  </div>
                  <!--价格和数量信息-->
                  <div class="amount-msg">
                    <div class="d-price-info">
                      <div class="d-price">
                        <span>￥16.60</span>
                      </div>
                    </div>
                    <div class="amount-info">
                      <span>x1</span>
                    </div>
                  </div>

                </div>
              </div>

            </div>

            <!--合计-->
            <div>
              <div class="sum-info">
                <div class="sum-wrapper">
                  <div class="amount-w">
                    <span>共1件商品</span>
                  </div>
                  <div class="sum-w">
                    <span>合计:￥16.60</span>
                  </div>
                </div>
              </div>
            </div>

            <!--物流和确认收货-->
            <div>
              <div class="delivery-out">
                <div view-name="DView" style="display:-webkit-box;display:-webkit-flex;display:flex;overflow:hidden;width:100%;background-color:#f8f8f8;height:1px;visibility:visible;-webkit-align-self:flex-start;align-self:flex-start;justify-self:flex-start;"></div>
                <div class="buttons-wrapper">
                  <div class="extend-receive">
                    <div class="view-extend">
                      <span>查看物流</span>
                    </div>
                  </div>
                  <div class="extend-receive">
                    <div class="view-extend">
                      <span>延长收货</span>
                    </div>
                  </div>
                  <div class="extend-receive confirm-goods">
                    <div class="view-extend">
                      <span>确认收货</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!--没有订单显示-->
          <EmptyBlock v-show="isHaveOrder"></EmptyBlock>

          <div id="bottomObject" style="position: relative; height: 23px;"></div>

        </div>

        <!--猜你喜欢-->
        <Recommend></Recommend>
      </div>
    </div>
  </div>
</template>

<script>
  import Recommend from '../../../components/Recommend/Recommend'
  import EmptyBlock from '../../../components/OrderList/EmptyBlock/EmptyBlock'

  /**
   * 全部
   */
  export default {
    name: "All",
    data(){
      return{
        isHaveOrder:false, //没有订单
      }
    },
    components:{
      Recommend,
      EmptyBlock
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .main-container
    width: 100%;
    background-color: #f5f5f5;
    padding-bottom: env(safe-area-inset-bottom);
    .atmosphere
      background-repeat: no-repeat;
      background-size: 100%;
      background-position-x: center;
      background-position-y: -0.42rem;
      .list-card
        min-height: 2.8rem;
        padding: 12px 0 0;
        .item-card
          margin: 0 0.32rem 12px;
          border-radius: 12px;
          overflow: hidden;
          .delivery-out
            display: flex;
            overflow: hidden;
            flex-direction: column;
            height: auto;
            background-color: #ffffff;
            width: 100%;
            .buttons-wrapper
              display: flex;
              overflow: hidden;
              -webkit-flex: 0 0 auto;
              flex: 0 0 auto;
              background-color: #ffffff;
              height: auto;
              width: fit-content;
              align-self: flex-end;
              justify-self: center;
              .confirm-goods
                border-color: rgb(255, 80, 0) !important;
                & span
                  color: #FF5000 !important;
              & span
                text-overflow: ellipsis;
                overflow: hidden;
                line-height: 0.508rem
                white-space: nowrap;
              .extend-receive
                display: flex;
                overflow: hidden;
                flex: 0 0 auto;
                height: 0.65rem
                width: 2.133rem
                border-radius: 0.5rem
                margin-top: 0.12rem
                margin-bottom: 0.12rem
                margin-right: 0.148rem
                visibility: visible;
                border-color: rgb(153, 153, 153);
                border-style: solid;
                border-width: 1px;
                place-self: flex-start;
                position: relative;
                .view-extend
                  display: flex;
                  overflow: hidden;
                  position: absolute;
                  color: #666666;
                  height: 100%;
                  width: 2.1rem
                  font-size: 0.173rem
                  justify-content: center;
                  align-items: center;
                  max-width: auto;
          .sum-info
            display: flex;
            overflow: hidden;
            height: 0.827rem
            width: 100%;
            background-color: rgb(255, 255, 255);
            position: relative;
            .sum-wrapper
              display: flex;
              overflow: hidden;
              position: absolute;
              height: auto;
              width: fit-content;
              margin-right: 0.16rem
              right: 0px;
              top: 0px;
              margin-bottom: 0.16rem
              margin-top: 0.08rem
              .sum-w
                display: flex;
                overflow: hidden;
                -webkit-flex: 0 0 auto;
                flex: 0 0 auto;
                margin-left: 0.198rem
                font-size: 0.26rem
                color: #333333;
                visibility: visible;
                height: auto;
                width: fit-content;
                justify-content: flex-start;
                align-items: center;
                max-width: auto;
                & span
                  text-overflow: ellipsis;
                  overflow: hidden;
                  line-height: 0.292rem
                  white-space: nowrap;
              .amount-w
                display: flex;
                overflow: hidden;
                -webkit-flex: 0 0 auto;
                flex: 0 0 auto;
                margin-left: 0.198rem  /* 14.848/75 */;
                color: #999999;
                height: auto;
                width: -webkit-fit-content;
                width: -moz-fit-content;
                width: fit-content;
                font-size: 0.26rem
                visibility: visible;
                justify-content: flex-start;
                align-items: center;
                max-width: auto;
                & span
                  text-overflow: ellipsis;
                  overflow: hidden;
                  line-height: 0.292rem
                  white-space: nowrap;
          .goods-wrapper
            display: flex;
            overflow: hidden;
            height: auto;
            width: 100%;
            background-color: #ffffff;
            .goods-div
              display: flex;
              overflow: hidden
              height: 2.485rem
              width: 100%;
              margin-bottom: 0.16rem
              place-self: flex-start;
              position: relative;
              .amount-msg
                display: flex;
                overflow: hidden;
                position: absolute;
                right: 0;
                top: 0;
                margin-right: 0.198rem
                -webkit-flex-direction: column;
                flex-direction: column;
                height: auto;
                width: -moz-fit-content;
                width: fit-content;
                .amount-info
                  display: flex;
                  overflow: hidden;
                  color: #999999;
                  font-size: 0.26rem
                  visibility: visible;
                  margin-top: 0.047rem
                  margin-bottom: 0.047rem
                  justify-content: flex-end;
                  align-items: center;
                  height: auto;
                  width: 100%;
                  max-width: auto;
                  & span
                    text-overflow: ellipsis;
                    overflow: hidden;
                    line-height: 0.292rem
                    white-space: nowrap;
                .d-price-info
                  display: flex;
                  overflow: hidden;
                  -webkit-flex: 0 0 auto;
                  flex: 0 0 auto;
                  margin-top: 0.047rem
                  margin-bottom: 0.047rem
                  height: auto;
                  width: fit-content;
                  align-self: flex-start;
                  justify-self: flex-start;
                  .d-price
                    display: flex;
                    overflow: hidden;
                    -webkit-flex: 0 0 auto;
                    flex: 0 0 auto;
                    color: #333333;
                    margin-left: 0.198rem
                    font-size: 0.26rem
                    visibility: visible;
                    height: auto;
                    width: fit-content;
                    -webkit-justify-content: flex-start;
                    justify-content: flex-start;
                    -webkit-align-items: center;
                    align-items: center;
                    max-width: auto;
                    & span
                      text-overflow: ellipsis;
                      overflow: hidden;
                      line-height: 0.292rem
                      white-space: nowrap;
              .seven-day
                display: flex;
                overflow: hidden;
                flex-direction: row;
                width: 100%;
                height: auto;
                margin-bottom: 0.067rem
                visibility: visible;
                align-self: flex-start;
                justify-self: flex-start;
                .seven-day-layout
                  display: flex;
                  overflow: hidden;
                  flex: 0 0 auto;
                  font-size: 10px;
                  height: auto;
                  width: fit-content;
                  color: #ff5000;
                  margin-right: 2px;
                  margin-left: 2px;
                  margin-top: 2px;
                  margin-bottom: 2px;
                  justify-content: flex-start;
                  align-items: center;
                  max-width: auto;
                  & span
                    text-overflow: ellipsis;
                    overflow: hidden;
                    line-height: 0.26rem
                    white-space: nowrap;
              .goods-msg
                display: flex;
                overflow: hidden;
                position: absolute;
                background-color: #ffffff;
                height: auto;
                width: 6rem
                right: 0;
                top: 0;
                margin-right: 0.198rem
                flex-direction: column;
                .goods-title
                  display: flex;
                  overflow: hidden;
                  flex: 0 0 auto;
                  text-align left
                  color: #333333;
                  max-width: 5rem
                  margin-bottom: 0.067rem
                  height: auto;
                  width: -webkit-fit-content;
                  width: -moz-fit-content;
                  width: fit-content;
                  font-size: 0.26rem
                  justify-content: flex-start;
                  align-items: center;
              .goods-img
                display: flex;
                overflow: hidden;
                position: absolute;
                width: 2.3rem
                height: 2.3rem
                margin-left: 0.198rem
                border-radius: 0.18rem
                visibility: visible;
          .card-top
            display: flex;
            overflow: hidden;
            height: auto;
            width: 100%;
            background-color: #ffffff;
            .order-status
              display: flex;
              overflow: hidden;
              flex: 1;
              height: mathc_content;
              width: fit-content;
              align-self: flex-start;
              justify-self: flex-start;
              .order-status-span
                text-overflow: ellipsis;
                overflow: hidden;
                line-height: 0.392rem
                white-space: nowrap;
              & div
                display: flex;
                overflow: hidden;
                flex: 1;
                font-size: 12px;
                color: #FF5000;
                margin-top: 0.213rem
                margin-bottom: 0.213rem
                height: auto;
                width: fit-content;
                margin-right: 0.198rem
                margin-left: 0.198rem
                justify-content: flex-end;
                align-items: center;
                max-width: auto;
            .shop-name-wrapper
              display: flex;
              overflow: hidden;
              flex: 0 0 auto;
              height: auto;
              width: fit-content;
              align-self: flex-start;
              justify-self: flex-start;
              .spname-div
                display: flex;
                overflow: hidden;
                -webkit-flex: 0 0 auto;
                flex: 0 0 auto;
                max-width: 2.557rem
                font-size: 0.26rem
                margin-top: 0.213rem
                margin-bottom: 0.213rem
                margin-left: 0.082rem
                height: auto;
                width: fit-content;
                justify-content: flex-start;
                align-items: center;
                & span
                  text-overflow: ellipsis;
                  overflow: hidden;
                  line-height: 0.392rem
                  white-space: nowrap;
              .tmall-img
                display: flex;
                overflow: hidden;
                flex: 0 0 auto;
                width: 0.4rem
                height: 0.4rem
                margin-top: 0.213rem
                margin-bottom: 0.213rem
                margin-left: 0.298rem
        .searchbar__wrap
          margin: 0 0.22rem 12px;
          overflow: hidden;
          display: flex;
          .searchbar__button
            background: #FF5000;
            width: 2rem
            color: #FFFFFF;
            height: 0.7rem;
            font-size: 0.387rem
            font-weight: 600;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 0.35rem;
            margin-left: 12px;
          .searchbar__input
            overflow: hidden;
            flex: 1;
            border-radius: 0.35rem;
            position: relative;
            & input
              width: 90%;
              font-size: 0.34rem
              height: 0.6rem;
              padding: 0.05rem 0.1rem 0.05rem 0.6rem;
              border: none;
              -webkit-appearance: none;
              border-radius: 0;
            .search-icon
              position: absolute;
              left: 0;
              top: 0;
              color: #b2b2b2;
              padding: 0.05rem 0 0.05rem 0.1rem;
              & i
                font-size: 0.45rem;
                line-height 0.65rem;
      .ptr--ptr
        pointer-events: none;
        font-size: 0.85em;
        font-weight: bold;
        min-height: 0px;
        box-shadow: none !important;
        top: 0;
        height: 0;
        transition: height 0.3s, min-height 0.3s;
        text-align: center;
        width: 100%;
        overflow: hidden;
        display: flex;
        align-items: flex-end;
        align-content: stretch;
        .ptr--box
          padding: 10px;
          flex-basis: 100%;
          .ptr--text
            margin-top: .33em;
            color: rgba(0, 0, 0, 0.3);
          .ptr--icon
            color: rgba(0, 0, 0, 0.3);
            transition: transform .3s;
</style>
