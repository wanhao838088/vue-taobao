<template>
  <!--分割线-->
  <div class="seperator-wrap">
    <hr class="seperator">
  </div>
</template>

<script>
  /**
   * 分割线
   */
  export default {
    name: "Seperator"
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .seperator-wrap
    background-color: #fff;
    .seperator
      margin: 0 0.12rem
      border: none;
      border-bottom: 1px solid rgba(0, 0, 0, .1);
</style>
