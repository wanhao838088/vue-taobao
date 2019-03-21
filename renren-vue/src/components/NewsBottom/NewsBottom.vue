<template>
  <!--新闻底部-->
  <div class="new-bottom">
    <div class="hot-wrapper">
      <div class="hot-row-wrapper">
        <!--左侧-->
        <div class="hot-item-left">
          <div class="left-img">
            <div style="width: 100%; height: 100%; background-image: url(//gw.alicdn.com/imgextra/O1CN01UM2sSP1CP11SpHTgq_!!72-0-lubanu.jpg_100x100q85s150.jpg_.webp); background-repeat: no-repeat; background-position: center center; background-size: contain;"></div>
          </div>
          <div class="right-img">
            <div style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(//gw.alicdn.com/imgextra/O1CN01KKvfPO1C2ZcFXG18K_!!23-0-lubanu.jpg_200x200q85s150.jpg_.webp);"></div>
          </div>
          <div class="top-img">
            <div style="width: 100%; height: 100%; background-image: url(https://gw.alicdn.com/tfs/TB1317ISFXXXXbxXVXXXXXXXXXX-563-78.png_.webp); background-repeat: no-repeat; background-position: center center; background-size: cover;"></div>
          </div>
          <div class="text-1"></div>
          <div class="text-2"></div>
        </div>
        <!--中间分隔线-->
        <div view-name="DView" style="display: flex; overflow: hidden; width: 0.5px; height: 100%; background-color: rgb(238, 238, 238); place-self: flex-start;"></div>
        <!--右侧-->
        <div class="hot-item-right">
          <div class="right-text">高颜值美物</div>
          <div class="hot-right-img">
            <div style="width: 100%; height: 100%; background-image: url(//gw.alicdn.com/imgextra/i4/148/O1CN01aVuPFm1Cxp6TaotHn_!!148-0-lubanu.jpg_100x100q85s150.jpg_.webp); background-repeat: no-repeat; background-position: center center; background-size: contain;"></div>
          </div>
          <div class="hot-r-img">
            <div style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(//gw.alicdn.com/imgextra/i3/18/O1CN01GysiEo1C0HbrwWHe5_!!18-0-lubanu.jpg_200x200q85s150.jpg_.webp);"></div>
          </div>
          <div class="hot-top-img">
            <div style="width: 100%; height: 100%; background-image: url(https://gw.alicdn.com/tfs/TB1ANZGSFXXXXXdXVXXXXXXXXXX-563-78.png_.webp); background-repeat: no-repeat; background-position: center center; background-size: cover;"></div>
          </div>
          <div class="text-2"></div>
          <div class="text-3"></div>
        </div>
      </div>

      <div view-name="DView" style="display: flex; overflow: hidden; width: 100%; height: 0.5px; background-color: rgb(238, 238, 238); place-self: flex-start;"></div>

      <div class="hot-row-wrapper">
        <!--左侧-->
        <div class="hot-item-left">
          <div class="hot-left-text">有料短视频</div>
          <div class="left-img">
            <div style="width: 100%; height: 100%; background-image: url(//gw.alicdn.com/imgextra/i4/50/TB28ndLnSBYBeNjy0FeXXbnmFXa_!!50-0-luban.jpg_100x100q85s150.jpg_.webp); background-repeat: no-repeat; background-position: center center; background-size: contain;"></div>
          </div>
          <div class="right-img">
            <div style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(//gw.alicdn.com/imgextra/i1/150/TB2Z0swnuuSBuNjy1XcXXcYjFXa_!!150-0-luban.jpg_200x200q85s150.jpg_.webp);"></div>
          </div>
          <div class="top-img">
            <div style="width: 100%; height: 100%; background-image: url(https://img.alicdn.com/tfs/TB1NnpaxljTBKNjSZFuXXb0HFXa-563-78.png_.webp); background-repeat: no-repeat; background-position: center center; background-size: cover;"></div>
          </div>
          <div class="text-1"></div>
          <div class="text-2"></div>
        </div>
        <!--中间分隔线-->
        <div view-name="DView" style="display: flex; overflow: hidden; width: 0.5px; height: 100%; background-color: rgb(238, 238, 238); place-self: flex-start;"></div>
        <!--右侧-->
        <div class="hot-item-right">
          <div class="right-text">帮您整理好</div>
          <div class="hot-right-img">
            <div style="width: 100%; height: 100%; background-image: url(//gw.alicdn.com/imgextra/i3/74/TB2Zk8FflyWBuNkSmFPXXXguVXa_!!74-0-luban.jpg_100x100q85s150.jpg_.webp); background-repeat: no-repeat; background-position: center center; background-size: contain;"></div>
          </div>
          <div class="hot-r-img">
            <div style="width: 100%; height: 100%; background-repeat: no-repeat; background-position: center center; background-size: contain; background-image: url(//gw.alicdn.com/imgextra/i1/156/TB2bpSad5AnBKNjSZFvXXaTKXXa_!!156-0-luban.jpg_200x200q85s150.jpg_.webp);"></div>
          </div>
          <div class="hot-top-img">
            <div style="width: 100%; height: 100%; background-image: url(https://gw.alicdn.com/tfs/TB1FqhfSVXXXXaqXXXXXXXXXXXX-563-78.png_.webp); background-repeat: no-repeat; background-position: center center; background-size: cover;"></div>
          </div>
          <div class="text-2"></div>
          <div class="text-3"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "NewsBottom"
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .new-bottom
    margin-top: 0.133rem  /* 10/75 */;
    overflow: hidden;
    .hot-wrapper
      display: flex;
      overflow: hidden;
      -webkit-box-orient: vertical;
      flex-direction: column;
      width: 100%;
      height: 5.973rem  /* 448/75 */;
      place-self: flex-start;
      .hot-row-wrapper
        display: flex;
        overflow: hidden;
        -webkit-box-orient: horizontal;
        flex-direction: row;
        width: 100%;
        height: 2.987rem  /* 224/75 */;
        place-self: flex-start;
        .hot-item-right
          display: flex;
          overflow: hidden;
          width: 4.987rem  /* 374/75 */;
          height: 100%;
          background-color: rgb(255, 255, 255);
          place-self: flex-start;
          position: relative;
          .text-3
            display: flex;
            overflow: hidden;
            margin-left: 2.5rem  /* 187.5/75 */;
            width: 2.5rem  /* 187.5/75 */;
            height: 100%;
            top: 0px;
            left: 0px;
            position: absolute;
          .text-2
            display: flex;
            overflow: hidden;
            width: 2.5rem  /* 187.5/75 */;
            height: 100%;
            top: 0px;
            left: 0px;
            position: absolute;
          .hot-top-img
            display: flex;
            overflow: hidden;
            width: 100%;
            height: 0.693rem  /* 52/75 */;
            position: absolute;
          .hot-r-img
            display: flex;
            overflow: hidden;
            margin-top: 0.347rem  /* 26/75 */;
            margin-left: 2.627rem  /* 197/75 */;
            width: 2.107rem  /* 158/75 */;
            height: 2.467rem  /* 185/75 */;
            position: absolute;
          .hot-right-img
            display: flex;
            overflow: hidden;
            margin-top: 1.253rem  /* 94/75 */;
            margin-left: 0.267rem  /* 20/75 */;
            width: 1.92rem  /* 144/75 */;
            height: 1.547rem  /* 116/75 */;
            position: absolute;
          .right-text
            display: inline-block;
            overflow: hidden;
            font-size: 0.32rem  /* 24/75 */;
            height: auto;
            margin-top: 0.773rem  /* 58/75 */;
            margin-left: 0.267rem  /* 20/75 */;
            text-align: left;
            color: rgb(153, 153, 153);
            width: 2.233rem  /* 167.5/75 */;
            text-overflow: ellipsis;
            white-space: nowrap;
            line-height: 0.36rem  /* 27/75 */;
            position: absolute;
        .hot-item-left
          display: flex;
          overflow: hidden;
          width: 5rem  /* 375/75 */;
          height: 100%;
          background-color: rgb(255, 255, 255);
          place-self: flex-start;
          position: relative;
          .hot-left-text
            display: inline-block;
            overflow: hidden;
            font-size: 0.32rem  /* 24/75 */;
            height: auto;
            margin-top: 0.773rem  /* 58/75 */;
            margin-left: 0.267rem  /* 20/75 */;
            text-align: left;
            color: rgb(153, 153, 153);
            width: 2.233rem  /* 167.5/75 */;
            text-overflow: ellipsis;
            white-space: nowrap;
            line-height: 0.36rem  /* 27/75 */;
            position: absolute;
          .text-2
            display: flex;
            overflow: hidden;
            margin-left: 2.5rem  /* 187.5/75 */;
            width: 2.5rem  /* 187.5/75 */;
            height: 100%;
            top: 0px;
            left: 0px;
            position: absolute;
          .text-1
            display: flex;
            overflow: hidden;
            width: 2.5rem  /* 187.5/75 */;
            height: 100%;
            top: 0px;
            left: 0px;
            position: absolute;
          .top-img
            display: flex;
            overflow: hidden;
            width: 100%;
            height: 0.693rem  /* 52/75 */;
            position: absolute;
          .right-img
            display: flex;
            overflow: hidden;
            margin-top: 0.347rem  /* 26/75 */;
            margin-left: 2.627rem  /* 197/75 */;
            width: 2.107rem  /* 158/75 */;
            height: 2.467rem  /* 185/75 */;
            position: absolute;
          .left-img
            display: flex;
            overflow: hidden;
            margin-top: 1.253rem  /* 94/75 */;
            margin-left: 0.267rem  /* 20/75 */;
            width: 1.92rem  /* 144/75 */;
            height: 1.547rem  /* 116/75 */;
            position: absolute;
</style>
