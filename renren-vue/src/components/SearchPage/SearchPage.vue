<template>
  <div class="status-suggest">
    <div class="mytaobao">
      <header class="top-bar on">
        <div class="top-bar-w">
          <div class="top-bar-c">
            <div class="s-input-select">
              <div class="s-input-tab">
                <div @click="showCheck=!showCheck" class="s-input-tab-txt">宝贝</div>
                <!--动态显示 & 隐藏-->
                <div v-show="showCheck" class="s-input-tab-nav on">
                  <ul class="input-ul">
                    <li class="input-li all">
                      <i class="iconfont icon-baobei"></i>宝贝
                    </li>
                    <li class="input-li shop">
                      <i class="iconfont icon-dianpu"></i>店铺
                    </li>
                    <li class="input-li mall">
                      <i class="iconfont icon-tianmao"></i>天猫
                    </li>
                  </ul>
                </div>
              </div>

              <!--输入框部分-->
              <div class="s-input-frame">
                <form action="" class="c-form-suggest">
                  <div class="s-form-search">
                    <input type="text" class="J_autocomplete">
                  </div>
                  <div class="c-form-btn">
                    <input type="submit" name="search" class="icons-search">
                  </div>
                </form>
              </div>
            </div>
          </div>

          <div @click="$router.back()" class="top-bar-btn closed" style="transform-origin: 0px 0px; opacity: 1; transform: scale(1, 1);">
            取消
          </div>
        </div>
      </header>
    </div>
  </div>
</template>

<script>
  /**
   * 搜索页面
   */
  export default {
    name: "SearchPage",
    data(){
      return{
        showCheck:false,//是否显示选择项
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .status-suggest
    padding-bottom: 0;
    position: fixed;
    top: 0;
    .mytaobao
      color: #3d4245;
      .on
        background-color: #fff
      .top-bar
        width: 100%;
        background: #f6f6f6;
        z-index: 101;
      .top-bar-w
        width: 100%;
        color: #212121;
        height: 0.727rem
        line-height: 0.727rem
        padding: 0.08rem   0;
        display: -webkit-box;
        position: relative;
        border-bottom: 1px solid #dbdbdb;
        .top-bar-btn
          height: 30px;
          line-height: 0.4rem
          padding: 0 0.267rem
          display: inline-block;
          font-size: 0.16rem
          color: #333;
        .top-bar-c
          -webkit-box-flex: 1;
          margin: 0 0 0 0.16rem
          .s-input-select
            display: -webkit-box;
            height: 0.727rem
            background: #e3e3e5;
            -webkit-border-radius: 0.053rem
            .s-input-frame
              -webkit-box-flex: 1;
              width: 100%;
              padding-right: 0.133rem
              line-height: 0.373rem
              .c-form-suggest
                position: relative;
                display: -webkit-box;
                .c-form-btn
                  width: 0.4rem
                  display: block;
                  height: 0.4rem
                  margin-right: 0.133rem
                  .icons-search
                    display: block;
                    border: none;
                    text-indent: -999px;
                    background-size 100%
                    position: relative;
                    top: 0.15rem
                    width: 0.44rem
                    background-image: url(images/search.png);
                    height: 0.44rem
                    background-color: transparent;
                .s-form-search
                  -webkit-box-flex: 1;
                  .J_autocomplete
                    border: none;
                    background: none;
                    width: 100%;
                    height: 0.447rem
                    padding-left 0.2rem
                    padding-top: 0.12rem;
                    font-size: 0.35rem
            .s-input-tab
              display: inline-block;
              position: relative;
              .s-input-tab-nav
                position: absolute;
                left: 0;
                top: 0.6rem
                z-index: 101;
                padding: 0.133rem
                .input-ul
                  background: #484d50;
                  border-radius: 0.08rem
                  width: 1.867rem
                  overflow: hidden;
                  color: #c7c8c9;
                  .input-li
                    border-top: 1px solid #707476;
                    margin-top: -1px;
                    height: 0.667rem
                    line-height: 0.667rem
                    .iconfont
                      display: inline-block;
                      margin: auto 0.107rem  -0.107rem 0.107rem
                      position: relative;
                      top: -0.04rem
              .s-input-tab-txt
                width: 0.747rem
                height: 0.4rem
                line-height: 0.4rem
                text-indent: 0.133rem
                color: #999;
                font-size: 0.187rem
                &:after
                  content: '';
                  position: absolute;
                  width: 0.213rem  /* 16/75 */;
                  height: 0.173rem  /* 13/75 */;
                  background-repeat: no-repeat;
                  background-image: url(./images/down_arrow.png);
                  background-size: 0.213rem  /* 16/75 */ 0.173rem  /* 13/75 */;
                  top: 0.09rem  /* 4/75 */;
                  right: -0.2rem  /* -10/75 */;
</style>
