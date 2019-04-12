<template>
  <div class="recommend-list-wrapper">
    <div class="recommend-container">
      <div class="recommend-hd">
        <img src="https://img.alicdn.com/tfs/TB1V2eQrKSSBuNjy0FlXXbBpVXa-966-114.png" class="recommend-hd-bg">
      </div>

      <!--第1个-->
      <div class="recommend-item">
        <a class="recommend-img-wrapper triggerClick"
           data-index="0"
           href="javascript:;">
          <img class="recommend-img lazyload"
               src="//gw.alicdn.com/bao/uploaded/i1/3957240528/O1CN01vRxxAf1FlrdgfcNAX_!!0-item_pic.jpg_500x500q90.jpg_.webp">
        </a>
        <a class="recommend-info triggerClick"
           href="javascript:;">
          <div class="recommend-title">
            <span class="recommend-title-p">奥克斯空调大1.5p匹挂机定频冷暖家用卧室壁挂式35NFI1旗舰店官方</span>
          </div>
          <div class="recommend-price-box">
            <span class="recommend-sign recommend-h">￥</span>
            <span class="recommend-price">2,099</span>
            <span class="recommend-payed">3353人已购买</span>
          </div>
        </a>
      </div>

      <!--第2个-->
      <div class="recommend-item">
        <a class="recommend-img-wrapper triggerClick"
           data-index="0"
           href="javascript:;">
          <img class="recommend-img lazyload"
               src="https://gw.alicdn.com/bao/uploaded/i1/2616970884/O1CN01syd2UM1IOudToYJVH_!!2616970884.jpg_500x500q90.jpg_.webp">
        </a>
        <a class="recommend-info triggerClick"
           href="javascript:;">
          <div class="recommend-title">
            <span class="recommend-title-p">【稀缺新品 开售享5重好礼】Huawei/华为P30麒麟980芯片4000万徕卡三摄超感光录像全面屏时尚手机p30</span>
          </div>
          <div class="recommend-price-box">
            <span class="recommend-sign recommend-h">￥</span>
            <span class="recommend-price">3,988</span>
            <span class="recommend-payed">1157人已购买</span>
          </div>
        </a>
      </div>

      <!--第3个-->
      <div class="recommend-item">
        <a class="recommend-img-wrapper triggerClick"
           data-index="0"
           href="javascript:;">
          <img class="recommend-img lazyload"
               src="https://gw.alicdn.com/bao/uploaded/i4/3065097138/O1CN01JsvpQ622bFcsAHUaT_!!0-item_pic.jpg_500x500q90.jpg_.webp">
        </a>
        <a class="recommend-info triggerClick"
           href="javascript:;">
          <div class="recommend-title">
            <span class="recommend-title-p">新疆哈密瓜10斤当季时令新鲜水果西州网纹玫珑蜜瓜香瓜甜瓜一整箱</span>
          </div>
          <div class="recommend-price-box">
            <span class="recommend-sign recommend-h">￥</span>
            <span class="recommend-price">38.91</span>
            <span class="recommend-payed">6726人已购买</span>
          </div>
        </a>
      </div>


      <!--第四个-->
      <div class="recommend-item">
        <a class="recommend-img-wrapper triggerClick"
           data-index="0"
           href="javascript:;">
          <img class="recommend-img lazyload"
               src="https://gw.alicdn.com/bao/uploaded/i2/2616970884/O1CN01h1s45B1IOudaZeMRx_!!2616970884.jpg_500x500q90.jpg_.webp">
        </a>
        <a class="recommend-info triggerClick"
           href="javascript:;">
          <div class="recommend-title">
            <span class="recommend-title-p">【稀缺颜色 10:08立即开抢】HUAWEI/华为 P30 Pro麒麟980超感光徕卡四摄10倍变焦屏内指纹4G手机</span>
          </div>
          <div class="recommend-price-box">
            <span class="recommend-sign recommend-h">￥</span>
            <span class="recommend-price">5,488</span>
            <span class="recommend-payed">2388人已购买</span>
          </div>
        </a>
      </div>
    </div>
  </div>
</template>

<script>
  /**
   * 推荐 --- 你可能还喜欢
   */
  export default {
    name: "Recommend"
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .recommend-list-wrapper
    margin-top: .66667rem;
    padding-bottom: 1.6rem;
    .recommend-container
      display: flex;
      position: relative;
      box-sizing: border-box;
      flex-direction: row;
      place-content: flex-start space-between;
      flex-shrink: 0;
      overflow: hidden;
      flex-wrap: wrap;
      padding: 0 7.56px;
      background: #f2f2f2;
      padding-bottom: 12.096px
      .recommend-item
        height: 6.933rem  /* 520/75 */;
        position: relative;
        width: 4.56rem
        box-sizing: border-box;
        display: -webkit-flex;
        display: flex;
        flex-direction: column;
        align-content: flex-start;
        flex-shrink: 0;
        background: #fff;
        margin-top: 0.24rem
        border-radius: 0.16rem
        overflow: hidden;
        margin-left: 0.12rem
        margin-right: 0.12rem
        .recommend-info
          padding-left: 0.267rem
          padding-right: 0.24rem
          height: 2.507rem
          text-decoration: none;
          .recommend-price-box
            flex-direction: row;
            margin-top: 0.293rem
            height: 0.533rem
            line-height: 0.533rem
            .recommend-payed
              font-size: 0.293rem
              color: #999999;
              margin-top: 4px;
            .recommend-price
              font-size: 0.373rem
              line-height: 0.427rem
              color: #ff5500;
            .recommend-sign
              font-size: 0.293rem
              color: #ff5500;
          .recommend-title
            margin-top: 0.307rem
            height: 0.987rem
            position: relative;
            overflow: hidden;
            line-height: 0.493rem
            text-overflow: ellipsis;
            min-height: 0;
            .recommend-title-p
              font-size: 0.347rem
              color: #333333;
        .recommend-img-wrapper
          height: 4.56rem
          align-items: center;
          justify-content: center;
          .recommend-img
            width: 4.56rem
            height: 4.56rem
      .recommend-hd
        padding: 12.096px 0;
        width: 100%;
        text-align: center;
        .recommend-hd-bg
          width: 4.164rem
          height: 0.455rem
</style>
