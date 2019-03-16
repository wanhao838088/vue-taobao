<template>
  <div v-show="isShowToast" class="am-toast">
    <div class="am-toast-text">{{msg}}</div>
  </div>
</template>

<script>
  export default {
    data(){
      return{
        isShowToast:false
      }
    },
    name: "TbToast",
    props:['msg'],
    methods:{
      /**
       * 显示吐司并自动隐藏
       */
      showToast(){
        this.isShowToast = true;
        setTimeout(()=>{
          this.isShowToast = false;
        },2000);
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .am-toast
    position: fixed;
    z-index 999
    top: 45%;
    width 100%
    text-align center
    font-size 0.34rem;
    font-family sans-serif
    .am-toast-text
      box-sizing border-box
      display inline-block
      margin -0.3rem auto auto;
      padding 0 16px
      border-radius 5px;
      line-height 1.5rem;
      color #fff
      background-color rgba(0,0,0,0.8)
</style>
