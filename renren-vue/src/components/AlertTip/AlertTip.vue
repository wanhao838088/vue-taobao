<template>
  <div class="alert_container">
    <section class="tip_text_container">
      <p class="tip_text">{{alertText}}</p>
      <div class="km-dialog-buttons">
        <div class="confrim" @click="closeTip">确认</div>
      </div>
    </section>
  </div>
</template>

<script>
  export default {
    props: {
      alertText: String
    },

    methods: {
      closeTip() {
        // 分发自定义事件(事件名: closeTip)
        this.$emit('closeTip')
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import '../../common/stylus/mixins.styl';

  @keyframes tipMove
    0%
      transform: scale(1)
    35%
      transform: scale(.8)
    70%
      transform: scale(1.1)
    100%
      transform: scale(1)

  .alert_container
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 200;
    background: rgba(0, 0, 0, .5)
    .tip_text_container
      position: absolute;
      top: 50%;
      left: 45.5%;
      margin-top: -90px
      margin-left: -110px
      width: 70%
      animation: tipMove .4s;
      background-color: rgba(255, 255, 255, 1);
      border: 1px;
      padding-top: 20px
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      border-radius: 5px
      .km-dialog-buttons
        margin-top: .3rem;
        display: table;
        width: 100%;
        color: #f40;
        border-top: 1px solid #ddd;
      .tip_text
        font-size 0.4rem
        color #333
        line-height 0.4rem
        text-align center
        margin-top 0.1rem
        padding 0 5px
      .confrim
        display: table;
        font-size 0.43rem
        width 100%
        padding: .25rem 0 .25rem 0;
        text-align center
        line-height 35px
        color #f40
</style>
