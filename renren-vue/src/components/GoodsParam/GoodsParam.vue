<template>
  <div class="dialog-container">
    <div class="dialog-wrapper" @click="closeProps"></div>
    <div class="dialog dialog-popup">
      <div class="dialog-title">产品参数</div>
      <div class="dialog-content">
        <div class="dialog-base-info">
          <ul class="base-info-list">
            <li v-for="(se,index) in goodsProps" :key="index">
              <div class="param-name">{{se.propKey}}</div>
              <div class="param-value">{{se.propContent}}</div>
            </li>
          </ul>
        </div>
      </div>
      <div class="dialog-button-group">
        <button class="btn-close" @click="closeProps">完成</button>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "GoodsService",
    methods:{
      closeProps() {
        //通知父组件 关闭窗口
        this.$emit('closeProps');
      }
    },
    props:{
      goodsProps:Array
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .dialog-container
    position: fixed;
    left: 0;
    bottom: 0;
    height 10.5rem;
    z-index: 1000;
    width: 100%;
    transform: translateY(-100%);
    .dialog-wrapper
      position: absolute;
      width: 100%;
      height: 100%;
      left: 0;
      top: 0;
      z-index: -1;
      background-color: rgba(0, 0, 0, 0.7);
    .dialog
      display: flex;
      flex-direction: column;
      position: absolute;
      bottom: 0;
      width: 100%;
      height: 100%;
      transform: translateY(100%);
      background-color: #fff;
      color: #333;
      font-size: 0.35rem;
      border-radius: 0.3rem 0.3rem 0 0;
      .dialog-button-group
        display: flex;
        width: 100%;
        justify-content: center;
        padding: 0.2rem 0;
        .btn-close
          width: 8.5rem;
          height: 1.1rem;
          font-size: 0.35rem;
          border-radius: 2.3rem;
          color: #fff;
          border: 0;
          background-image: -webkit-linear-gradient(left, #FF9000 0%, #FF5000 100%);
          background-image: linear-gradient(to right, #FF9000 0%, #FF5000 100%);
      .dialog-content
        padding: 0 0.1rem;
        height 7.5rem;
        overflow: auto;
        .dialog-base-info
          width: 100%;
          padding-left: 0.08rem;
          .param-name
            width: 20%;
            color: #999;
          .param-value
            width: 80%;
            padding-left: 0.15rem;
            word-break: break-word;
          .base-info-list li
            display: flex;
            text-align left
            align-items: center;
            padding: 0.3rem 0;
            .info-icon
              width: 0.45rem;
              height: 0.45rem;
            .info-title
              width: 90%;
              text-align left
              font-size: 0.41rem;
              color: #999;
              padding-left: 0.25rem;
            .info-desc
              color: #999;
              text-align: left;
              font-size: 0.3rem;
              line-height 0.45rem;
              margin-top: 0.08rem;
              padding-left: 0.67rem;
      .dialog-title
        display: flex;
        font-size 0.4rem;
        justify-content: center;
        height: 1.1rem;
        line-height: 1.1rem;
</style>
