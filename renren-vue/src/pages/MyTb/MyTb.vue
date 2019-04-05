<template>
  <div class="main-layout">
    <div class="tpl-wrapper">
      <div class="main-top-container">
        <div class="top-line"></div>
        <!--头像和名字啥的div-->
        <div class="head-name-container">
          <div class="userhead-out">
            <div class="head-wrapper">
              <div class="userhead"></div>
            </div>
          </div>
          <!--用户名部分-->
          <div class="username-out">
            <span class="username">
              {{tbUserName}}
            </span>
          </div>
          <!--亲情账号-->
          <div class="family-out">
            <div class="family"></div>
          </div>
          <!--日期和设置-->
          <div class="date-setting">
            <div @click="$router.push('/signIn')" class="date-wrapper">
              <div
                style="width: 100%; height: 100%; background-image: url(https://gw.alicdn.com/tfs/TB1RP44oQvoK1RjSZFDXXXY3pXa-54-54.png_.webp); background-repeat: no-repeat; background-position: center center; background-size: 100% 100%;"></div>
            </div>
            <div class="setting-wrapper">
              <div
                style="width: 100%; height: 100%; background-image: url(https://gw.alicdn.com/tfs/TB1dbweXwHqK1RjSZFgXXa7JXXa-57-54.png_.webp); background-repeat: no-repeat; background-position: center center; background-size: 100% 100%;"></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--收藏夹 关注等-->
    <div class="tpl-wrapper">
      <div view-name="DLinearLayout" style="display: flex; overflow: hidden; height: auto;
          width: 100%; -webkit-box-orient: vertical; flex-direction: column;">
        <div class="collect-wrapper">
          <div class="collect">
            <div class="col-num-wrapper">
              <span class="col-num">
                9
              </span>
            </div>
            <div class="col-name-wrapper">
              <span class="col-name">
                收藏夹
              </span>
            </div>
          </div>

          <div class="collect follow">
            <div class="col-num-wrapper">
              <span class="col-num">
                9
              </span>
            </div>
            <div class="col-name-wrapper">
              <span class="col-name">
                关注店铺
              </span>
            </div>
          </div>

          <div class="collect foot-mark">
            <div class="col-num-wrapper">
              <span class="col-num">
                9
              </span>
            </div>
            <div class="col-name-wrapper">
              <span class="col-name">
                足迹
              </span>
            </div>
          </div>
        </div>
      </div>
      <div class="collect-line"></div>
    </div>

    <!--淘气值-->
    <div class="naughty-out">
      <div class="naughty-container">
        <div class="naughty-top-line"></div>
        <div class="naughty-round"></div>
        <div class="temp-1">
          <div class="temp-gif">
            <div style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: cover;"></div>
          </div>
        </div>
        <div class="real-wrapper">
          <div class="naughty-left">
            <div class="naughty-top">
              <div style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(https://gw.alicdn.com/tfs/TB1uUPQff9TBuNjy0FcXXbeiFXa-212-42.png?getAvatar=avatar_.webp);"></div>
            </div>
            <div class="naughty-bottom">
              <div class="bottom-text">
                <span class="naughty-span">
                  淘气值 646
                </span>
              </div>
            </div>
          </div>
          <!--右侧-->
          <div class="naughty-right">
            <div class="desc-wrapper">
              <div class="naughty-desc-div">
                <span class="desc-span">花小积分 兑大权益</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--订单部分-->
    <div class="order-area">
      <div class="order-div">
        <div class="order-fill">
          <div class="fill-1"></div>
          <div class="fill-2"></div>
        </div>
        <div class="order-wrapper">
          <div class="order-top">
            <div class="my-order-div">
              <span class="my-order">
                我的订单
              </span>
            </div>
            <!--查看全部订单-->
            <div class="view-all-div">
              <span class="view-all">查看全部订单</span>
            </div>
            <!--箭头-->
            <div class="arrow-top-div">
              <i class="iconfont icon-arrow-right-copy-copy-copy"></i>
            </div>
          </div>
          <!--分割线-->
          <div class="order-devider"></div>

          <!--订单div-->
          <div class="real-order">
            <div class="order-div-item">
              <div class="order-item-icon" style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(https://gw.alicdn.com/tfs/TB16GolmKuSBuNjy1XcXXcYjFXa-87-87.png_.webp);"></div>
              <span class="order-div-item-span">待付款</span>
            </div>
            <div class="order-div-item">
              <div class="order-item-icon" style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(https://gw.alicdn.com/tfs/TB1cwzgmMmTBuNjy1XbXXaMrVXa-87-87.png_.webp);"></div>
              <span class="order-div-item-span">待发货</span>
            </div>
            <div class="order-div-item">
              <div class="order-item-icon" style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(https://gw.alicdn.com/tfs/TB1b3zgmMmTBuNjy1XbXXaMrVXa-87-87.png_.webp);"></div>
              <span class="order-div-item-span">待收货</span>
            </div>
            <div class="order-div-item">
              <div class="order-item-icon" style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(https://gw.alicdn.com/tfs/TB1fOKqm_tYBeNjy1XdXXXXyVXa-87-87.png_.webp);"></div>
              <span class="order-div-item-span">评价</span>
            </div>
            <div class="order-div-item">
              <div class="order-item-icon" style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(https://gw.alicdn.com/tfs/TB1fMzgmMmTBuNjy1XbXXaMrVXa-87-87.png_.webp);"></div>
              <span class="order-div-item-span">退款/售后</span>
            </div>
          </div>
        </div>

      </div>
    </div>

    <!--游戏区域-->
    <div class="game-area">
      <div class="game-ground">
        <div class="game-wrapper">
          <div style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(https://img.alicdn.com/tfs/TB1YomXAkyWBuNjy0FpXXassXXa-1125-270.png?getAvatar=avatar_200x200q85s150.jpg_.webp);"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapState,mapGetters} from 'vuex'
  /**
   * 我的淘宝页面
   */
  export default {
    name: "MyTb",
    computed:{
      ...mapState(['user']),
      ...mapGetters(['tbUserName']),

    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .main-layout
    margin-top: -0.11rem;
    height: 12rem;
    background-color: #FF5000;
    top: 0;
    background-image: -webkit-linear-gradient(left, #FD9126, #FF5000);
    background-image: linear-gradient(to right, #FD9126, #FF5000);
    .game-area
      display: flex;
      overflow: hidden;
      width: 100%;
      height: 2.72rem  /* 204/75 */;
      position: relative;
      .game-ground
        display: flex;
        overflow: hidden;
        width: 100%;
        height: 2.72rem  /* 204/75 */;
        background-color: rgb(242, 242, 242);
        left: 0px;
        top: 0px;
        position: absolute;
        .game-wrapper
          display: flex;
          overflow: hidden;
          background-color: rgb(255, 255, 255);
          margin-left: 0.32rem  /* 24/75 */;
          margin-right: 0.32rem  /* 24/75 */;
          border-radius: 0.32rem  /* 24/75 */;
          width: 9.36rem  /* 702/75 */;
          height: 2.4rem  /* 180/75 */;
          left: 0px;
          top: 0px;
          position: absolute;
    .order-area
      display block
      .order-div
        display: flex;
        overflow: hidden;
        width: 100%;
        height: 3.373rem  /* 253/75 */;
        position: relative;
        .real-order
          display: flex;
          overflow: hidden;
          width: 9.36rem  /* 702/75 */;
          height: 2.027rem  /* 152/75 */;
          place-self: flex-start;
          flex: 0 0 auto;
          position: relative;
          .order-div-item
            flex: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            width: 1.92rem  /* 144/75 */;
            height: 100%;
            margin-left: 0.16rem  /* 12/75 */;
            .order-item-icon
              display: flex;
              overflow: hidden;
              width: 0.773rem !important /* 58/75 */;
              height: 0.773rem !important  /* 58/75 */;
              margin 0.3rem auto 0.22rem auto;
            .order-div-item-span
              text-overflow: clip;
              overflow: hidden;
              text-align: center;
              font-size: 0.34rem;
              line-height: 0.384rem  /* 28.8/75 */;
              white-space: nowrap;
        .order-wrapper
          display: flex;
          overflow: hidden;
          width: 9.36rem  /* 702/75 */;
          height: auto;
          margin-left: 0.32rem  /* 24/75 */;
          margin-right: 0.32rem  /* 24/75 */;
          border-radius: 0.32rem  /* 24/75 */;
          background-color: rgb(255, 255, 255);
          -webkit-box-orienst: vertical;
          flex-direction: column;
          left: 0px;
          top: 0px;
          position: absolute;
          .order-devider
            display: flex;
            overflow: hidden;
            width: 100%;
            height: 1px;
            place-self: center flex-end;
            background-color: rgb(238, 238, 231);
            flex: 0 0 auto;
          .order-top
            display: flex;
            overflow: hidden;
            width: 9.36rem  /* 702/75 */;
            height: 1.013rem  /* 76/75 */;
            place-self: flex-start;
            flex: 0 0 auto;
            position: relative;
            .arrow-top-div
              display: flex;
              overflow: hidden;
              width: auto;
              height: 0.32rem  /* 24/75 */;
              font-size: 0.32rem  /* 24/75 */;
              color: rgb(153, 153, 153);
              right: 0px;
              top: 0.347rem  /* 26/75 */;
              margin-right: 0.32rem  /* 24/75 */;
              position: absolute;
              line-height: 0.32rem  /* 24/75 */;
            .view-all-div
              display: flex;
              overflow: hidden;
              width: auto;
              height: auto;
              font-size: 0.32rem  /* 24/75 */;
              right: 0px;
              top: 0.32rem  /* 24/75 */;
              color: rgb(153, 153, 153);
              margin-right: 0.667rem  /* 50/75 */;
              -webkit-box-pack: start;
              justify-content: flex-start;
              -webkit-box-align: center;
              align-items: center;
              position: absolute;
              .view-all
                text-overflow: ellipsis;
                overflow: hidden;
                line-height: 0.384rem  /* 28.8/75 */;
                white-space: nowrap;
            .my-order-div
              display: flex;
              overflow: hidden;
              width: auto;
              height: 0.533rem  /* 40/75 */;
              font-size: 0.373rem  /* 28/75 */;
              margin-left: 0.307rem  /* 23/75 */;
              -webkit-box-pack: center;
              justify-content: center;
              -webkit-box-align: center;
              align-items: center;
              color: rgb(51, 51, 51);
              font-weight: bold;
              left: 0px;
              top: 0.24rem  /* 18/75 */;
              position: absolute;
              .my-order
                text-overflow: ellipsis;
                overflow: hidden;
                line-height: 0.448rem  /* 33.6/75 */;
                white-space: nowrap;
        .order-fill
          display: flex;
          overflow: hidden;
          width: 100%;
          height: 3.373rem  /* 253/75 */;
          left: 0px;
          top: 0px;
          position: absolute;
          .fill-2
            display: none;
            overflow: hidden;
            width: 100%;
            height: 5.64rem  /* 423/75 */;
            background-color: rgb(242, 242, 242);
            left: 0px;
            top: 0px;
            position: absolute;
          .fill-1
            display: flex;
            overflow: hidden;
            width: 100%;
            height: 3.373rem  /* 253/75 */;
            background-color: rgb(242, 242, 242);
            left: 0px;
            top: 0px;
            position: absolute;
    .naughty-out
      display block
      .naughty-container
        display: flex;
        overflow: hidden;
        width: 100%;
        height: 1.893rem  /* 142/75 */;
        position: relative;
        .real-wrapper
          display: flex;
          overflow: hidden;
          width: 9.36rem  /* 702/75 */;
          height: auto;
          margin-left: 0.32rem  /* 24/75 */;
          margin-right: 0.32rem  /* 24/75 */;
          border-radius: 0.32rem  /* 24/75 */;
          -webkit-box-orient: horizontal;
          flex-direction: row;
          left: 0px;
          top: 0px;
          position: absolute;
          .naughty-right
            display: flex;
            overflow: hidden;
            width: 8.4rem  /* 630/75 */;
            height: 1.573rem  /* 118/75 */;
            margin-right: 0.32rem  /* 24/75 */;
            place-self: flex-start;
            flex: 0 0 auto;
            position: relative;
            .desc-wrapper
              display: flex;
              overflow: hidden;
              height: 1.573rem  /* 118/75 */;
              width: 6.88rem  /* 516/75 */;
              position: relative;
              .naughty-desc-div
                display: flex;
                overflow: hidden;
                width: 4.52rem  /* 339/75 */;
                height: auto;
                color: rgb(102, 102, 102);
                font-size: 0.347rem  /* 26/75 */;
                margin-left: 0.267rem  /* 20/75 */;
                margin-top: 0.32rem  /* 24/75 */;
                -webkit-box-pack: start;
                justify-content: flex-start;
                -webkit-box-align: center;
                align-items: center;
                position: absolute;
                .desc-span
                  text-overflow: ellipsis;
                  overflow: hidden;
                  line-height: 0.416rem  /* 31.2/75 */;
                  white-space: nowrap;
          .naughty-left
            display: flex;
            overflow: hidden;
            width: 2.48rem  /* 186/75 */;
            height: 1.573rem  /* 118/75 */;
            place-self: flex-start;
            flex: 0 0 auto;
            position: relative;
            .naughty-bottom
              display: flex;
              overflow: hidden;
              width: 2.48rem  /* 186/75 */;
              height: 0.427rem  /* 32/75 */;
              margin-left: 0.32rem  /* 24/75 */;
              margin-top: 0.88rem  /* 66/75 */;
              -webkit-box-orient: horizontal;
              flex-direction: row;
              left: 0px;
              top: 0px;
              position: absolute;
              .bottom-text
                display: flex;
                overflow: hidden;
                width: 1.733rem  /* 130/75 */;
                height: 0.373rem  /* 28/75 */;
                font-size: 0.283rem  /* 21.2/75 */;
                color: rgb(102, 102, 102);
                -webkit-box-pack: start;
                justify-content: flex-start;
                -webkit-box-align: center;
                align-items: center;
                flex: 0 0 auto;
                .naughty-span
                  text-overflow: ellipsis;
                  overflow: hidden;
                  line-height: 0.339rem  /* 25.44/75 */;
                  white-space: nowrap;
            .naughty-top
              display: flex;
              overflow: hidden;
              width: 1.88rem  /* 141/75 */;
              height: 0.373rem  /* 28/75 */;
              margin-left: 0.32rem  /* 24/75 */;
              margin-top: 0.36rem  /* 27/75 */;
              position: absolute;
        .temp-1
          display: flex;
          overflow: hidden;
          border-radius: 0.32rem  /* 24/75 */;
          margin-left: 0.32rem  /* 24/75 */;
          margin-right: 0.32rem  /* 24/75 */;
          width: 9.36rem  /* 702/75 */;
          height: 1.573rem  /* 118/75 */;
          left: 0px;
          top: 0px;
          position: absolute;
          .temp-gif
            display: flex;
            overflow: hidden;
            width: 9.36rem  /* 702/75 */;
            height: 1.573rem  /* 118/75 */;
            position: absolute;
        .naughty-round
          display: flex;
          overflow: hidden;
          background-color: rgb(255, 255, 255);
          margin-left: 0.32rem  /* 24/75 */;
          margin-right: 0.32rem  /* 24/75 */;
          border-radius: 0.32rem  /* 24/75 */;
          width: 9.36rem  /* 702/75 */;
          height: 1.573rem  /* 118/75 */;
          left: 0px;
          top: 0px;
          position: absolute;
        .naughty-top-line
          display: flex;
          overflow: hidden;
          width: 100%;
          height: 1.333rem  /* 100/75 */;
          background-color: rgb(242, 242, 242);
          margin-top: 0.56rem  /* 42/75 */;
          left: 0px;
          top: 0px;
          position: absolute;
    .collect-line
      display: flex;
      overflow: hidden;
      width: 100%;
      height: 0.32rem /* 24/75 */;
      place-self: flex-start;
      flex: 0 0 auto;
      position: relative;
    .collect-wrapper
      display: flex;
      overflow: hidden;
      height: 1.786rem;
      width: 100%;
      place-self: flex-start;
      flex: 0 0 auto;
      position: relative;
      .foot-mark
        margin-left: 4.987rem !important /* 374/75 */;
      .follow
        margin-left: 2.56rem !important /* 192/75 */;
      .collect
        display: flex;
        overflow: hidden;
        width: 2.426rem;
        height: 2.426rem;
        margin-left: .13rem;
        margin-top: 0px;
        -webkit-box-orient: vertical;
        flex-direction: column;
        left: 0px;
        top: 0px;
        position: absolute;
        .col-name-wrapper
          display: flex;
          overflow: hidden;
          margin-top: 0.267rem /* 20/75 */;
          -webkit-box-pack: center;
          justify-content: center;
          -webkit-box-align: center;
          align-items: center;
          color: rgb(255, 255, 255);
          width: 2.427rem /* 182/75 */;
          height: auto;
          font-size: 0.32rem /* 24/75 */;
          flex: 0 0 auto;
          .col-name
            text-overflow: ellipsis;
            overflow: hidden;
            line-height: 0.384rem /* 28.8/75 */;
            white-space: nowrap;
        .col-num-wrapper
          display: flex;
          overflow: hidden;
          margin-top: .28rem;
          -webkit-box-pack: center;
          justify-content: center;
          -webkit-box-align: center;
          align-items: center;
          color: rgb(255, 255, 255);
          width: 2.427rem /* 182/75 */;
          height: auto;
          font-size: 0.373rem /* 28/75 */;
          flex: 0 0 auto;
          .col-num
            text-overflow: ellipsis;
            overflow: hidden;
            line-height: 0.448rem /* 33.6/75 */;
            white-space: nowrap;
    .tpl-wrapper
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      outline: 0;
      -webkit-tap-highlight-color: transparent;
      .main-top-container
        display: flex;
        overflow: hidden;
        width: 100%;
        height: auto;
        -webkit-box-orient: vertical;
        flex-direction: column;
        .top-line
          display: flex;
          overflow: hidden;
          width: 100%;
          height: 0.3rem;
          place-self: flex-start;
          flex: 0 0 auto;
          position: relative;
        .head-name-container
          display: flex;
          overflow: hidden;
          width: 100%;
          height: 2.16rem;
          place-self: flex-start;
          flex: 0 0 auto;
          position: relative;
          .date-setting
            display: flex;
            overflow: hidden;
            width: 100%;
            height: auto;
            margin-top: .66rem;
            margin-left: 8rem;
            -webkit-box-orient: horizontal;
            flex-direction: row;
            left: 0px;
            top: 0px;
            position: absolute;
            .setting-wrapper
              display: flex;
              overflow: hidden;
              width: .53rem;
              height: .53rem;
              margin-left: .586rem;
              flex: 0 0 auto;
            .date-wrapper
              display: flex;
              overflow: hidden;
              width: .53rem;
              height: .53rem;
              flex: 0 0 auto;
          .family-out
            display: flex;
            overflow: hidden;
            width: 3.86rem;
            height: .56rem;
            margin-left: 2.10rem;
            margin-top: 1.46rem;
            position: absolute;
            .family
              width: 100%;
              height: 100%;
              background-repeat: no-repeat;
              background-position: center center;
              background-size: 100% 100%;
              background-image: url(https://gw.alicdn.com/tfs/TB1Us_ja7voK1RjSZFNXXcxMVXa-436-63.png_.webp);
          .username-out
            display: flex;
            overflow: hidden;
            font-size: .53rem;
            color: rgb(255, 255, 255);
            width: 5.3rem;
            height: auto;
            margin-top: .66rem;
            margin-left: 2.10rem;
            font-weight: bold;
            -webkit-box-pack: start;
            justify-content: flex-start;
            -webkit-box-align: center;
            align-items: center;
            position: absolute;
            .username
              text-overflow: ellipsis;
              overflow: hidden;
              line-height: .64rem;
              white-space: nowrap;
          .userhead-out
            display: flex;
            overflow: hidden;
            border-radius: .66rem;
            margin-left: .48rem;
            margin-top: .74rem;
            width: 1.3rem;
            height: 1.3rem;
            left: 0px;
            top: 0px;
            position: absolute;
            .head-wrapper
              display: flex;
              overflow: hidden;
              width: 1.3rem;
              height: 1.3rem;
              position: absolute;
              .userhead
                width: 100%;
                height: 100%;
                background-repeat: no-repeat;
                background-position: center center;
                background-size: contain;
                background-image: url(http://gw.alicdn.com/sns_logo/i1/108270289044525897/TB29NadbNvzQeBjSZFAXXaF9VXa_!!0-mytaobao.jpg_.webp);

</style>
