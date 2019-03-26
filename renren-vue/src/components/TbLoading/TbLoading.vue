<template>
  <div class="vux-loadmore weui-loadmore">
    <i class="my-loading" v-if="showLoading"></i>
    <span class="weui-loadmore__tips" v-show="tip || !showLoading">{{tip}}</span>
  </div>
</template>

<script>
  export default {
    name: "TbLoading",
    props: {
      showLoading: {
        type: Boolean,
        default: true
      },
      tip: String
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .vux-loadmore
    width: 65%;
    margin: 0.2rem auto;
    line-height: 0.367em;
    font-size: 0.287rem
    text-align: center;
    .weui-loadmore__tips
      display: inline-block;
      vertical-align: middle;
      line-height 0.267rem
    .my-loading
      width: 0.667rem
      height: 0.167rem
      padding-top: 0.2rem
      display: inline-block;
      vertical-align: middle;
      background url("./images/loading.gif") no-repeat
      background-size: 100%;
</style>
