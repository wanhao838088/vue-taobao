<template>
  <!--运费险-->
  <div class="order-service multiSelect">
    <label class="buy-single-row mui-flex align-center">
      <div class="title cell fixed">{{itemName}}</div>
      <div class="content cell">
        <span class="option">{{itemValue}}</span>
      </div>
      <div class="pointer cell fixed">
        <i class="nav iconfont icon-arrow-right-copy-copy-copy"></i>
      </div>
    </label>
    <div class="seperator-wrap">
      <hr class="seperator">
    </div>
  </div>
</template>

<script>
  import Seperator from '../Seperator/Seperator'
  /**
   * 菜单项
   */
  export default {
    name: "MenuItem",
    props:['itemName','itemValue'],
    components:{
      Seperator
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .order-service
    display: block;
    height: 0.97rem
    .seperator-wrap
      background-color: #fff;
      .seperator
        margin: 0 0.12rem
        border: none;
        border-bottom: 1px solid rgba(0,0,0,.1);
    .title
      margin-right: 0.12rem
      font-size 0.35rem
      color: #666;
    .mui-flex
      box-sizing: border-box;
      display: flex!important;
      flex-wrap: wrap;
      .content
        text-align: right;
        color: #666;
        line-height: 0.373rem
      .cell
        flex: 1;
        width: 0;
        flex-basis: 0;
        max-width: 100%;
        display: block;
        padding: 0!important;
        position: relative;
      .fixed
        flex: none!important;
        width: auto;
    .align-center
      align-self: center;
    .content
      text-align: right;
      color: #666;
      line-height: 0.373rem
    .pointer
      margin-left: 0.2rem
      width: 0.187rem
      height: 0.26rem
      background-size: 100%;
      & i
        line-height 0.75rem
    .option
      margin-right: 0;
      font-size 0.35rem
      float: right
      line-height: 0.7rem;
    .buy-single-row
      background-color: #fff;
      color: #999;
      padding: 0.12rem
      line-height: 2;
</style>
