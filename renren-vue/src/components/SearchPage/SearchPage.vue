<template>
  <div class="status-suggest">
    <div class="mytaobao">
      <header class="top-bar on">
        <div class="top-bar-w">
          <div class="top-bar-c">
            <div class="s-input-select">
              <div class="s-input-tab">
                <div class="s-input-tab-txt">宝贝</div>
                <!--动态显示 & 隐藏-->
                <div class="s-input-tab-nav on">
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

          <div class="top-bar-btn closed" style="transform-origin: 0px 0px; opacity: 1; transform: scale(1, 1);">
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
    name: "SearchPage"
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
        height: 0.427rem  /* 32/75 */;
        line-height: 0.427rem  /* 32/75 */;
        padding: 0.08rem  /* 6/75 */ 0;
        display: -webkit-box;
        position: relative;
        border-bottom: 1px solid #dbdbdb;
        .top-bar-btn
          height: 30px;
          line-height: 0.4rem  /* 30/75 */;
          padding: 0 0.267rem  /* 20/75 */;
          display: inline-block;
          font-size: 0.16rem  /* 12/75 */;
          color: #333;
        .top-bar-c
          -webkit-box-flex: 1;
          margin: 0 0 0 0.16rem  /* 12/75 */;
          .s-input-select
            display: -webkit-box;
            height: 0.427rem  /* 32/75 */;
            background: #e3e3e5;
            -webkit-border-radius: 0.053rem  /* 4/75 */
            .s-input-frame
              -webkit-box-flex: 1;
              width: 100%;
              padding-right: 0.133rem  /* 10/75 */;
              line-height: 0.373rem  /* 28/75 */;
              .c-form-suggest
                position: relative;
                display: -webkit-box;
                .c-form-btn
                  width: 0.4rem  /* 30/75 */;
                  display: block;
                  height: 0.4rem  /* 30/75 */;
                  margin-right: -0.133rem  /* -10/75 */;
                  .icons-search
                    display: block;
                    border: none;
                    text-indent: -999px;
                    background-size 100%
                    position: relative;
                    top: 0.093rem  /* 7/75 */;
                    width: 0.24rem  /* 18/75 */;
                    background-image: url(images/search.png);
                    height: 0.24rem  /* 18/75 */;
                    background-color: transparent;
                .s-form-search
                  -webkit-box-flex: 1;
                  .J_autocomplete
                    border: none;
                    background: none;
                    width: 100%;
                    height: 0.347rem  /* 26/75 */;
                    font-size: 0.187rem  /* 14/75 */;
            .s-input-tab
              display: inline-block;
              position: relative;
              .s-input-tab-nav
                position: absolute;
                left: 0;
                top: 0.4rem  /* 30/75 */;
                z-index: 101;
                padding: 0.133rem  /* 10/75 */;
                .input-ul
                  background: #484d50;
                  border-radius: 0.08rem  /* 6/75 */;
                  width: 1.867rem  /* 140/75 */;
                  overflow: hidden;
                  color: #c7c8c9;
                  .input-li
                    border-top: 1px solid #707476;
                    margin-top: -1px;
                    height: 0.467rem  /* 35/75 */;
                    line-height: 0.467rem  /* 35/75 */;
                    .iconfont
                      display: inline-block;
                      margin: auto 0.107rem  /* 8/75 */ -0.107rem  /* -8/75 */ 0.107rem  /* 8/75 */;
                      position: relative;
                      top: -0.04rem  /* -3/75 */;
              .s-input-tab-txt
                width: 0.747rem  /* 56/75 */;
                height: 0.4rem  /* 30/75 */;
                line-height: 0.4rem  /* 30/75 */;
                text-indent: 0.133rem  /* 10/75 */;
                color: #999;
                font-size: 0.187rem  /* 14/75 */;

</style>
