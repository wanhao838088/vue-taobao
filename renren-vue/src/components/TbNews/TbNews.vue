<template>
  <!--滚动新闻-->
  <div class="tp-wrapper">
    <div class="news-wrapper">
      <div class="image-wrapper">
        <div style="width: 100%; height: 100%; background-image: url(https://gw.alicdn.com//tfs//TB1TBEMXU6FK1Jjy1XdXXblkXXa-105-107.png_.webp); background-repeat: no-repeat; background-position: center center; background-size: contain;"></div>
      </div>
      <!--新闻内容-->
      <div class="toutiao-container">
        <marquee  :item-height="mqHeight" :itemHeight="mqHeight" class="toutiao-marquee">
          <marquee-item v-for="(obj,index) in pageNews" :key="index"
                        class="toutiao-item" >
            <div class="news-item-wrapper" ref="mqItem">
              <a class="news-a" href="javascript:;">
                <div class="news-row-div">
                  <span class="news-span-hot">热门</span>
                  <span class="news-span-content">{{obj.news1}}</span>
                </div>
                <div class="news-row-div">
                  <span class="news-span-hot">热门</span>
                  <span class="news-span-content">{{obj.news2}}</span>
                </div>
              </a>
              <!--右侧图片区域-->
              <div class="news-right">
                <div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url(https://img.alicdn.com/tfs/TB1bLfqgvBNTKJjy0FdXXcPpVXa-513-339.png);"></div>
                <div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url(https://gw.alicdn.com/mt/TB1tzxrrTtYBeNjy1XdXXXXyVXa-390-255.png);"></div>
              </div>
            </div>
          </marquee-item>
        </marquee>
      </div>
    </div>
  </div>
</template>

<script>
  import { Marquee, MarqueeItem  } from 'vux'
  import {mapGetters}  from 'vuex'

  /**
   * 新闻显示组件
   */
  export default {
    name: "TbNews",
    data() {
      return {
        mqHeight:0
      };
    },
    beforeCreate(){
      //获取窗口宽度 750下的高度为120
      let width = document.body.clientWidth;
      this.mqHeight = width / 750.0 * 120.0;
    },
    components:{
      Marquee,
      MarqueeItem,
    },
    computed:{
      ...mapGetters(['pageNews']),
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .tp-wrapper
    overflow: hidden;
    .news-wrapper
      display: flex;
      overflow: hidden;
      background-color: rgb(255, 255, 255);
      height: 1.619rem ;
      width: 100%;
      place-self: flex-start;
      position: relative;
      .toutiao-container
        display: block;
        overflow: hidden;
        height: 100%;
        width: 100%;
        padding-left: 1.565rem;
        top: 0px;
        left: 0px;
        position: absolute;
        .toutiao-marquee
          height: 0.667rem
          margin-top: 0.233rem
          /*height: 100% !important;*/
          .toutiao-item
            height: 100% !important;
            .news-item-wrapper
              display: flex;
              height: 100%;
              box-sizing: border-box;
              margin-top: 2px;
              margin-bottom: 2px;
              -webkit-box-orient: horizontal;
              flex-direction: row;
              .news-right
                position: absolute;
                right 0.533rem
                width: 2.267rem
                height: 100%;
              .news-a
                -webkit-box-flex: 1;
                flex: 1 1 0%;
                text-decoration none
                display: flex;
                -webkit-box-orient: vertical;
                flex-direction: column;
                -webkit-box-pack: center;
                justify-content: center;
                min-width: 0px;
                .news-row-div
                  display: flex;
                  overflow: hidden;
                  line-height: 0.507rem
                  -webkit-box-align: center;
                  align-items: center;
                  -webkit-box-orient: horizontal;
                  flex-direction: row;
                  .news-span-content
                    color: rgb(51, 51, 51);
                    text-align left
                    -webkit-box-flex: 1;
                    flex: 1 1 0%;
                    font-size: 0.32rem
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                  .news-span-hot
                    display: flex;
                    width: 0.747rem
                    height: 0.347rem
                    font-size: 0.28rem
                    -webkit-box-align: center;
                    align-items: center;
                    -webkit-box-pack: center;
                    justify-content: center;
                    color: rgb(230, 10, 31);
                    border: 2px solid rgb(230, 10, 31);
                    border-radius: 6px;
                    margin-right: 8px;
      .image-wrapper
        display: flex;
        overflow: hidden;
        height: 0.945rem
        width: 0.945rem
        margin-left: 0.324rem
        margin-top: 0.337rem
        position: absolute;
</style>
