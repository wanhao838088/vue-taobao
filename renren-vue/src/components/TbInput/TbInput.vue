<template>
  <div class="am-list-item">
    <div class="am-list-control">
      <input @keyup="changeValue" @focus="changeValue"
             @input="$emit('input', $event.target.value)"
             @blur="blurInput"
             :type="type"
             :value="value"
             ref="tbinput"
             class="am-input-required"
             value=""
             :placeholder="placeholder"/>
    </div>
    <!--删除按钮-->
    <div class="am-list-action">
      <i v-show="isShowDel" @click="clearValue"
         class="am-icon-clear iconfont  icon-shanchuguanbicha"></i>
    </div>
  </div>
</template>

<script>
  /**
   * 淘宝风格输入框
   */
  export default {
    data(){
      return{
        isShowValue:false,
        tbvalue:'',
        isShowDel:false
      }
    },
    name: "TbInput",
    props:['value','placeholder','type'],
    methods:{

      /**
       * 失去焦点 隐藏删除按钮
       */
      blurInput(){
        //延迟执行
        setTimeout(()=>{
          this.isShowDel = false;
        },100);
      },
      /**
       * 清楚输入框内容
       */
      clearValue(){
        console.log('删除');
        //清空内容
        this.$emit('input', '');
        //隐藏删除按钮
        this.isShowDel = false;
      },
      /**
       * 改变内容
       */
      changeValue(){
        let tbvalue = this.$refs.tbinput.value;
        if (tbvalue) {
          this.isShowDel = true;
        }else {
          this.isShowDel = false;
        }
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .am-list-item
    position: relative;
    width: 100%;
    margin: 1.2rem 0 0;
    border-bottom: 1px solid #ff5000;
    .am-list-action
      position: absolute;
      width: .83333333rem;
      height: .86666667rem;
      right: .18666667rem;
      bottom: -0.1rem;
      .am-icon-clear
        position: absolute;
        top: .04rem;
        width: 0.7rem;
        z-index 999
        height: 0.7rem;
        background-color transparent
        right: 0;
    .am-list-action-password
      right: .85333333rem;
    .am-list-control
      margin: 0;
      padding: 0;
      border: 0;
      font-size: 100%;
      font: inherit;
      vertical-align: baseline;
      .am-input-required
        font-size: inherit;
        width: 100%;
        height: .48rem;
        margin: 0 0 .17333333rem .12rem;
        outline: none;
        border: 0;
        color: #333;
</style>
