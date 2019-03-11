<template>
  <div class="tpl-wrapper">
    <div class="guarantee_row">
      <div class="guarantee_txt_left">
        {{serviceData.name}}
      </div>
      <div class="guarantee_txt_mid ellipsis">
        {{serviceData.content}}
      </div>
      <div class="guarantee_txt_right">
        <i class="iconfont icon-arrow-right-copy-copy-copy"></i>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "MenuRow",
    props: {
      serviceData:Object
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .guarantee_row
    display: flex;
    overflow: hidden;
    height: 0.8rem;
    font-size 0.4rem;
    background-color: rgb(255, 255, 255);
    position: relative;
    .guarantee_txt_left
      flex: 1;
      overflow: hidden;
      line-height 0.7rem;
      text-align left;
      margin-left: 0.2rem;
      color: rgb(153, 153, 153);
    .guarantee_txt_right
      flex: 1;
      text-align right;
      margin-right 0.1rem;
      line-height 0.7rem;
      color: rgb(204, 204, 204);
    .guarantee_txt_mid
      text-align left;
      width 100%;
      line-height 0.7rem;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      flex: 3;
</style>
