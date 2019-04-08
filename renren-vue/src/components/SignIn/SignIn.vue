<template>
  <div class="sign-in-wrapper">
    <div ref="taoWrapper" :style="'height:'+animatedNumber+'px'" class="tao-calendar-wrapper">
      <!--收缩起来的日历-->
      <transition name="slide-left">
        <div ref="shWrapper" v-show="isShowShrink" class="shrink-wrapper">
          <div class="shrink-content">
            <img src="https://gw.alicdn.com/tfs/TB1eNxOXSzqK1RjSZFHXXb3CpXa-750-2.png_790x10000.jpg_.webp" alt=""
                 class="shrink-split">

            <div class="date-days">
              <span class="span-day">日</span>
              <span class="span-day">一</span>
              <span class="span-day">二</span>
              <span class="span-day">三</span>
              <span class="span-day">四</span>
              <span class="span-day">五</span>
              <span class="span-day">六</span>
            </div>

            <!--日期行-->
            <div v-if="selectDatas.length==7" class="date-row">
              <div class="date-div" v-for="j in 7" :key="j"
                   :class="{'selected':selectDatas[j-1].isChoose}">
                <span class="date-number">
                  {{selectDatas[j-1].date}}
                </span>
              </div>
            </div>

          </div>

          <div class="shrink-bottom"></div>
        </div>
      </transition>

      <!--展示时候的日历-->
      <transition enter-active-class="tada">
        <div ref="caWrapper" v-show="!isShowShrink"  class="calendar-content">
          <img src="https://gw.alicdn.com/tfs/TB1eNxOXSzqK1RjSZFHXXb3CpXa-750-2.png_790x10000.jpg_.webp" alt=""
               class="split-img">

          <div class="date-top">
            <!--左侧箭头-->
            <div @click="addMonth(-1)" class="arrow-left">
              <img src="https://gw.alicdn.com/tfs/TB1_Ml1XQvoK1RjSZFwXXciCFXa-15-17.png_110x10000.jpg_.webp" alt=""
                   class="arrow-left-img">
            </div>
            <!--显示日期-->
            <span class="date-content">{{year}}年{{month+1}}月</span>
            <!--右侧箭头-->
            <div @click="addMonth(1)" class="arrow-right">
              <img src="https://gw.alicdn.com/tfs/TB13nCfXNnaK1RjSZFtXXbC2VXa-15-17.png_110x10000.jpg_.webp" alt=""
                   class="arrow-left-img">
            </div>
          </div>


          <!--显示 7 1 2 3 4 5 6-->
          <div class="date-days">
            <span class="span-day">日</span>
            <span class="span-day">一</span>
            <span class="span-day">二</span>
            <span class="span-day">三</span>
            <span class="span-day">四</span>
            <span class="span-day">五</span>
            <span class="span-day">六</span>
          </div>
          <!--日期行-->
          <div v-if="currentDatas.length===35" class="date-row" v-for="i in 5" :key="i">
            <!--不是本月的日期 class 用gone-->
            <div @click="chooseThis(i-1,j-1,(i-1)*7 + j -1)"
                 v-if="currentDatas.length>0"
                 class="date-div" v-for="j in 7" :key="j"
                 :class="{'gone':currentDatas[(i-1)*7 + j -1].isGone,'selected':checkedIndex==(i-1)*7 + j -1}">
            <span class="date-number">
              {{currentDatas[(i-1)*7 + j -1].date}}
            </span>
            </div>
          </div>
          <div v-if="currentDatas.length ===42" class="date-row" v-for="i in 6" :key="i">
            <!--不是本月的日期 class 用gone-->
            <div @click="chooseThis(i-1,j-1,(i-1)*7 + j -1)"
                 v-if="currentDatas.length>0"
                 class="date-div" v-for="j in 7" :key="j"
                 :class="{'gone':currentDatas[(i-1)*7 + j -1].isGone,'selected':checkedIndex==(i-1)*7 + j -1}">
            <span class="date-number">
              {{currentDatas[(i-1)*7 + j -1].date}}
            </span>
            </div>
          </div>
        </div>
      </transition>

    </div>


    <!--签到部分-->
    <div ref="sign" class="sign-result-wrapper">
      <img src="https://gw.alicdn.com/tfs/TB14kZNkYvpK1RjSZPiXXbmwXXa-750-200.png_790x10000.jpg_.webp" alt=""
           class="sign-bg">
      <div class="result-content">
        <img src="https://gw.alicdn.com/tfs/TB1CbPEaHPpK1RjSZFFXXa5PpXa-100-100.png_110x10000.jpg_.webp" alt=""
             class="calendar-img">
        <div class="sign-today">
          <div class="sign-msg">
            <span class="already-text">你已累积签到 </span>
            <span class="already-day">3天</span>
          </div>
          <div class="today-sign">
            <span class="look-today">查看今日日签</span>
            <img src="https://gw.alicdn.com/tfs/TB1FTT2aNnaK1RjSZFtXXbC2VXa-27-27.png_110x10000.jpg_.webp" alt=""
                 class="look-arrow-right">
          </div>
        </div>

        <!--签到按钮-->
        <div class="sign-btn">
          <span v-if="isSigned" class="sign-sp">已签到</span>
          <span @click="signToday" v-else class="no-sign-up">今日签到</span>
        </div>
      </div>
      <!--下拉的图片-->
      <img src="https://gw.alicdn.com/tfs/TB1hHYUdNnaK1RjSZFtXXbC2VXa-1125-90.png_790x10000.jpg_.webp" alt=""
           class="slide-img">
      <!--箭头图片-->
      <img @click="toggleShowCalendar"
           src="https://gw.alicdn.com/tfs/TB1phPzaHvpK1RjSZPiXXbmwXXa-30-20.png_110x10000.jpg_.webp" alt=""
           class="arrow-down">
    </div>

    <div v-show="isShowMask" class="mask">
      <div class="mask-content">
        <div class="alert-content">
          <img class="alert-img" src="https://gw.alicdn.com/tfs/TB1qhbDOwHqK1RjSZFPXXcwapXa-580-580.png_580x10000.jpg_.webp" alt="">
          <div class="bottom-wrapper">
            <div class="date-wrapper">
              <span class="date-day">08</span>
              <span class="date-year">2019年04月</span>
            </div>
            <div class="nongli">
              <span class="nongli-day">初四</span>
              <span class="nongli-desc">时间扑面而来，我们终将释怀。</span>
            </div>
          </div>
          <img src="https://gw.alicdn.com/tfs/TB1pCVHcNnaK1RjSZFtXXbC2VXa-542-14.png_570x10000.jpg_.webp" alt=""
               class="mid-split">
        </div>
        <img @click="isShowMask=false" class="close-img" src="https://gw.alicdn.com/tfs/TB1HEsERVXXXXbIXFXXXXXXXXXX-88-88.png_110x10000.jpg_.webp" alt="">
      </div>
    </div>
  </div>
</template>

<script>
  import moment from 'moment'
  import {TweenLite} from "gsap/TweenMax"

  /**
   * 签到页面
   */
  export default {
    name: "SignIn",
    data() {
      return {
        year: 0, //当前年
        month: 0, //当前月
        currentDatas: [], //当前月份的数据
        selectDatas:[], //顶部显示的日期数据
        checkedIndex: 0, //选中的日期
        isShowShrink: true,
        isSigned:false , //今日是否签到过了
        isShowMask:false ,// 是否正在显示遮罩内容
        myMoment: {}, //当前日期对象
        animHeight:0 ,//计算得到的高度
        tweenedNumber: 0
      }
    },
    computed: {
      animatedNumber (){
        return this.tweenedNumber;
      }
    },
    watch: {
      /**
       * 使用状态过度的动画
       */
      animHeight: function(newValue) {
        TweenLite.to(this.$data, 0.3, { tweenedNumber: newValue });
      }
    },
    methods: {
      /**
       * 今日签到
       */
      signToday(){
        this.isSigned = true;
        this.isShowMask = true;
      },
      /**
       * 开关显示日历
       */
      toggleShowCalendar(){
        this.isShowShrink=!this.isShowShrink;
        if (this.isShowShrink) {
          let height = window.getComputedStyle(this.$refs.shWrapper).height;
          height = height.substr(0,height.length-2);
          this.animHeight = height;
        }else {
          let height = window.getComputedStyle(this.$refs.caWrapper).height;
          height = height.substr(0,height.length-2);
          this.animHeight = height;
        }
      },
      /**
       * 日期选择事件
       */
      chooseThis(i,j,index) {
        let selectDatas = [];
        let {currentDatas} = this;
        let k = 0;
        for(let temp=(i*7);temp<(i*7)+7;temp++){
          if (k == j) {
            currentDatas[temp].isChoose = true;
          }else {
            currentDatas[temp].isChoose = false;
          }
          selectDatas.push( currentDatas[temp]);
          k++;
        }
        this.selectDatas = selectDatas;
        this.checkedIndex = index;
        this.toggleShowCalendar();
      },
      /**
       * 翻页查看 上月 下月
       */
      addMonth(number) {
        this.myMoment = this.myMoment.add(parseInt(number), 'months');
        this.year = this.myMoment.year();
        this.month = this.myMoment.month();

        this.renderCalendar();
      },
      /**
       * 根据日期绘制日历
       */
      renderCalendar() {
        let {year, month} = this;

        //计算本月的 1号是星期几
        let week = moment().set('year', year).set('month', month)
          .set('date', 1).format('d');

        let datas = [];

        //第一部分数据  上个月的  如果是星期几 就往前推几天
        for (let i = 0; i < week; i++) {
          //上月数据
          let org = moment().set('year', year).set('month', month)
            .set('date', 1).subtract(i + 1, 'days').format('DD');
          datas.unshift({
            isGone: true,
            date: org
          });
        }
        let moreWeek = false;
        //如果上个月有6天了 要多往后推1周
        if (datas.length >= 6) {
          moreWeek = true;
        }

        //本月有多少天
        let max = moment().set('year', year).set('month', month).daysInMonth();

        //第二部分数据  这个月的   本月数据
        for (let i = 0; i < max; i++) {
          let now = moment().set('year', year).set('month', month)
            .set('date', 1).add(i, 'days').format('DD');
          datas.push({
            isGone: false,
            date: now
          });
        }
        //已经有多少天加入到了日历
        let tempLen = datas.length;
        let sum = 35;
        if (moreWeek) {
          sum = 42;
        }

        for (let i = 0; i < sum - tempLen; i++) {
          let next = moment().set('year', year)
            .set('month', (month + 1)).set('date', 1).add(i, 'days').format('DD');
          datas.push({
            isGone: true,
            date: next
          });
        }

        this.currentDatas = datas;
      }
    },
    /**
     * 绘制时间表
     */
    mounted() {
      let year = moment().year();
      let month = moment().month();
      this.year = year;
      this.month = month;
      this.myMoment = moment();
      this.renderCalendar();
      //顶部现在今天的日期
      let selectDatas = [];
      //计算今天星期几
      let week = moment().format('d');

      for (let i = 0; i < week; i++) {
        //上月数据
        let org = moment().subtract(i+1, 'days').format('DD');
        selectDatas.unshift({
          date: org,
          isChoose:false
        });
      }
      for (let i = 0; i < 7-week ; i++) {
        //上月数据
        let org = moment().add(i, 'days').format('DD');
        let isChoose = false;
        if (i == 0) {
          isChoose = true;
        }
        selectDatas.push({
          date: org,
          isChoose
        });
      }
      this.selectDatas = selectDatas;
      setTimeout(()=>{
        let height = window.getComputedStyle(this.$refs.shWrapper).height;
        height = height.substr(0,height.length-2);
        this.animHeight = height;
      },50);
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .sign-in-wrapper
    border: 0px solid black;
    position: relative;
    box-sizing: border-box;
    display: block;
    -webkit-box-orient: vertical;
    flex-direction: column;
    align-content: flex-start;
    flex-shrink: 0;
    .mask
      position: fixed;
      top: 0px;
      left: 0px;
      bottom: 0px;
      right: 0px;
      background-color: rgba(0, 0, 0, 0.6);
      opacity: 1;
      z-index: 100;
      .close-img
        display: flex;
        width: 0.688rem
        height: 0.688rem
        margin-top: 0.391rem
        opacity: 1;
      .mask-content
        border: 0px solid black;
        position: relative;
        box-sizing: border-box;
        display: flex;
        -webkit-box-orient: vertical;
        flex-direction: column;
        align-content: flex-start;
        flex-shrink: 0;
        width: 10rem
        height:  12.267rem
        -webkit-box-align: center;
        align-items: center;
        margin-top: 1.133rem
        padding-left: 1.133rem
        padding-right: 1.133rem
        .alert-content
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: flex;
          flex-direction: column;
          align-content: flex-start;
          flex-shrink: 0;
          align-items: center;
          width: 7.733rem
          height: 10.4rem
          border-radius: 0.267rem
          background-color: transparent;
          .mid-split
            display: flex;
            width: 7.227rem
            height: 0.187rem
            position: absolute;
            left: 0.24rem
            bottom: 2.56rem
          .bottom-wrapper
            border: 0px solid black;
            position: relative;
            box-sizing: border-box;
            display: flex;
            -webkit-box-orient: horizontal;
            flex-direction: row;
            place-content: flex-start space-between;
            flex-shrink: 0;
            width: 7.733rem  /* 580/75 */;
            height: 2.667rem  /* 200/75 */;
            background-color: rgb(255, 255, 255);
            border-radius: 0.32rem  /* 24/75 */;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            padding: 0rem  /* 0/75 */ 0.56rem  /* 42/75 */;
            .nongli
              border: 0px solid black;
              position: relative;
              box-sizing: border-box;
              display: flex;
              -webkit-box-orient: vertical;
              flex-direction: column;
              place-content: flex-start space-between;
              flex: 1 1 0%;
              margin-left: 78px;
              -webkit-box-flex: 1;
              -webkit-box-pack: justify;
              min-height: 1.333rem
              .nongli-desc
                white-space: pre-wrap;
                border: 0px solid black;
                position: relative;
                text-align left
                box-sizing: border-box;
                display: block;
                -webkit-box-orient: vertical;
                flex-direction: column;
                align-content: flex-start;
                flex-shrink: 0;
                font-size: 0.32rem
                color: rgb(51, 51, 51);
              .nongli-day
                white-space: pre-wrap;
                border: 0px solid black;
                position: relative;
                box-sizing: border-box;
                text-align left
                display: block;
                -webkit-box-orient: vertical;
                flex-direction: column;
                align-content: flex-start;
                flex-shrink: 0;
                font-size: 0.48rem
                color: rgb(51, 51, 51);
                font-weight: bold;
            .date-wrapper
              border: 0px solid black;
              position: relative;
              box-sizing: border-box;
              display: flex;
              -webkit-box-orient: vertical;
              flex-direction: column;
              align-content: flex-start;
              flex-shrink: 0;
              .date-year
                white-space: pre-wrap;
                border: 0px solid black;
                position: relative;
                box-sizing: border-box;
                display: block;
                -webkit-box-orient: vertical;
                flex-direction: column;
                align-content: flex-start;
                flex-shrink: 0;
                font-size: 0.32rem
                color: rgb(153, 153, 153);
              .date-day
                white-space: pre-wrap;
                border: 0px solid black;
                position: relative;
                box-sizing: border-box;
                display: block;
                -webkit-box-orient: vertical;
                flex-direction: column;
                align-content: flex-start;
                flex-shrink: 0;
                font-size: 1.067rem  /* 80/75 */;
                color: rgb(51, 51, 51);
                font-weight: bold;
          .alert-img
            display: flex;
            width: 7.733rem
            height: 7.733rem
            border-radius: 0.32rem
    .tada
      opacity: 1.0;
    .slide-left-enter-active
      transition: all .5s
    .slide-left-enter
      transform: translateX(100px)
    .sign-result-wrapper
      border: 0 solid black;
      position: relative;
      box-sizing: border-box;
      display: flex;
      -webkit-box-orient: vertical;
      flex-direction: column;
      align-content: flex-start;
      flex-shrink: 0;
      width: 10rem
      height: 3rem
      overflow: hidden;
      background-color: rgb(255, 193, 109);
      .arrow-down
        display: flex;
        width: 0.267rem
        height: 0.173rem
        position: absolute;
        top: 2px;
        left: 4.867rem
        transform: rotate(180deg);
      .slide-img
        display: flex;
        width: 10rem
        height: 0.8rem
        position: absolute;
        left: 0px;
        top: 0px;
      .result-content
        border: 0px solid black;
        position: relative;
        box-sizing: border-box;
        display: flex;
        -webkit-box-orient: horizontal;
        flex-direction: row;
        align-content: flex-start;
        flex-shrink: 0;
        padding: 0rem 0.64rem
        -webkit-box-align: center;
        align-items: center;
        margin-top: 0.56rem
        .sign-btn
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: flex;
          -webkit-box-orient: vertical;
          flex-direction: column;
          place-content: flex-start center;
          flex-shrink: 0;
          width: 2.453rem
          height: 0.853rem
          border-radius: 0.853rem
          -webkit-box-align: center;
          align-items: center;
          -webkit-box-pack: center;
          background-image: linear-gradient(to right, rgb(255, 195, 62), rgb(255, 105, 83));
          .no-sign-up
            white-space: pre-wrap;
            border: 0 solid black;
            position: relative;
            box-sizing: border-box;
            display: block;
            flex-direction: column;
            align-content: flex-start;
            flex-shrink: 0;
            font-size: 15.76px;
            color: rgb(255, 255, 255);
          .sign-sp
            white-space: pre-wrap;
            border: 0px solid black;
            position: relative;
            box-sizing: border-box;
            display: block;
            -webkit-box-orient: vertical;
            flex-direction: column;
            align-content: flex-start;
            flex-shrink: 0;
            font-size: 0.4rem
            color: rgb(255, 255, 255);
            opacity: 0.5;
        .sign-today
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: flex;
          -webkit-box-orient: vertical;
          flex-direction: column;
          place-content: flex-start center;
          flex: 1 1 0%;
          -webkit-box-pack: center;
          -webkit-box-flex: 1;
          .today-sign
            border: 0px solid black;
            position: relative;
            box-sizing: border-box;
            display: flex;
            -webkit-box-orient: horizontal;
            flex-direction: row;
            align-content: flex-start;
            flex-shrink: 0;
            -webkit-box-align: center;
            align-items: center;
            margin-top: 2px;
            .look-arrow-right
              display: flex;
              width: 0.24rem
              height: 0.24rem
              margin-left: 0.067rem
            .look-today
              white-space: pre-wrap;
              border: 0px solid black;
              position: relative;
              box-sizing: border-box;
              display: block;
              -webkit-box-orient: vertical;
              flex-direction: column;
              align-content: flex-start;
              flex-shrink: 0;
              font-size: 0.32rem
              color: rgb(153, 153, 153);
          .sign-msg
            border: 0px solid black;
            position: relative;
            box-sizing: border-box;
            display: flex;
            -webkit-box-orient: horizontal;
            flex-direction: row;
            align-content: flex-start;
            flex-shrink: 0;
            -webkit-box-align: center;
            align-items: center;
            .already-day
              white-space: pre-wrap;
              border: 0px solid black;
              position: relative;
              box-sizing: border-box;
              display: block;
              -webkit-box-orient: vertical;
              flex-direction: column;
              align-content: flex-start;
              flex-shrink: 0;
              font-size: 0.4rem
              color: rgb(255, 80, 0);
              font-weight: bold;
            .already-text
              white-space: pre-wrap;
              border: 0px solid black;
              position: relative;
              box-sizing: border-box;
              display: block;
              -webkit-box-orient: vertical;
              flex-direction: column;
              align-content: flex-start;
              flex-shrink: 0;
              font-size: 0.4rem
              color: rgb(51, 51, 51);
              font-weight: bold;
        .calendar-img
          display: flex;
          width: 1.333rem
          height: 1.333rem
          margin-right: 0.213rem
      .sign-bg
        display: flex;
        width: 10rem
        height: 2.667rem
        position: absolute;
        bottom: 0.333rem
        left: 0px;
    .shrink-wrapper
      border: 0px solid black;
      position: absolute;
      top 0
      left 0
      z-index: 100
      box-sizing: border-box;
      display: flex;
      -webkit-box-orient: vertical;
      flex-direction: column;
      place-content: flex-start center;
      flex-shrink: 0;
      width: 10rem
      -webkit-box-pack: center;
      background-image: linear-gradient(rgb(255, 147, 68), rgb(255, 86, 54));
      overflow: hidden;
      height: 2.667rem
      padding-top: 0px;
      .shrink-bottom
        border: 0px solid black;
        position: absolute;
        box-sizing: border-box;
        display: flex;
        -webkit-box-orient: vertical;
        flex-direction: column;
        align-content: flex-start;
        flex-shrink: 0;
        bottom: 0px;
        width: 2rem
        height: 0.267rem
        left: 4rem
      .shrink-content
        border: 0px solid black;
        position: relative;
        box-sizing: border-box;
        display: flex;
        -webkit-box-orient: horizontal;
        flex-direction: column;
        place-content: flex-start space-between;
        flex-shrink: 0;
        width: 10rem
        height: 1.893rem
        margin-top: 0.12rem
        -webkit-box-pack: justify;
        padding: 0rem 0.733rem
        opacity: 1;
        left: 0px;
        .shrink-item
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: flex;
          -webkit-box-orient: vertical;
          flex-direction: column;
          place-content: flex-start space-between;
          flex-shrink: 0;
          width: 0.533rem
          height: 1.453rem
          align-items: center;
          .sh-number
            white-space: pre-wrap;
            border: 0px solid black;
            position: relative;
            box-sizing: border-box;
            display: block;
            -webkit-box-orient: vertical;
            flex-direction: column;
            align-content: flex-start;
            flex-shrink: 0;
            font-size: 0.347rem
            color: rgb(255, 255, 255);
          .sh-text
            white-space: pre-wrap;
            border: 0px solid black;
            position: relative;
            box-sizing: border-box;
            display: block;
            -webkit-box-orient: vertical;
            flex-direction: column;
            align-content: flex-start;
            flex-shrink: 0;
            font-size: 0.32rem
            color: rgb(255, 255, 255);
        .shrink-split
          display: flex;
          width: 10rem
          height: 2px;
          position: absolute;
          left: 0px;
          top: 1rem
    .tao-calendar-wrapper
      border: 0 solid black;
      position: relative;
      box-sizing: border-box;
      display: flex;
      -webkit-box-orient: vertical;
      flex-direction: column;
      place-content: flex-start center;
      flex-shrink: 0;
      width: 10rem;
      -webkit-box-pack: center;
      background-image: linear-gradient(rgb(255, 147, 68), rgb(255, 86, 54));
      overflow: hidden;
      height: auto
      padding-top: 0px;
      .calendar-content
        border: 0px solid black;
        position: absolute;
        opacity 1
        top 0
        left 0
        box-sizing: border-box;
        display: flex;
        -webkit-box-orient: vertical;
        flex-direction: column;
        align-content: flex-start;
        flex-shrink: 0;
        width: 10rem;
        height: 8.727rem
        -webkit-box-align: center;
        align-items: center;
        top: 0.253rem
        .split-img
          display: flex;
          width: 10rem
          height: 2px;
          position: absolute;
          left: 0px;
          top: 1.813rem
      .gone
        opacity: 0.5;
      .date-row
        border: 0px solid black;
        position: relative;
        box-sizing: border-box;
        display: flex;
        -webkit-box-orient: horizontal;
        flex-direction: row;
        place-content: flex-start space-between;
        flex-shrink: 0;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        height: 1.067rem
        width: 8.533rem
        padding: 0px 2px;
        .selected
          background-color white
          border-radius 50%
          & span
            color orangered !important
        .date-div
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: flex;
          -webkit-box-orient: vertical;
          flex-direction: column;
          place-content: flex-start center;
          flex-shrink: 0;
          width: 0.747rem
          height: 0.747rem
          -webkit-box-align: center;
          align-items: center;
          -webkit-box-pack: center;
          .date-number
            white-space: pre-wrap;
            border: 0px solid black;
            position: relative;
            line-height 0
            box-sizing: border-box;
            display: block;
            -webkit-box-orient: vertical;
            flex-direction: column;
            align-content: flex-start;
            flex-shrink: 0;
            font-size: 0.347rem /* 26/75 */;
            text-align: center;
            color: rgb(255, 255, 255);
      .date-days
        border: 0px solid black;
        position: relative;
        box-sizing: border-box;
        display: flex;
        -webkit-box-orient: horizontal;
        flex-direction: row;
        place-content: flex-start space-between;
        flex-shrink: 0;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        height: 1.067rem
        width: 8.533rem
        padding: 0px 2px;
        .span-day
          white-space: pre-wrap;
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: block;
          -webkit-box-orient: vertical;
          flex-direction: column;
          align-content: flex-start;
          flex-shrink: 0;
          font-size: 0.32rem
          width: 0.533rem
          text-align: center;
          color: rgb(255, 255, 255);
      .date-top
        border: 0px solid black;
        position: relative;
        box-sizing: border-box;
        display: flex;
        -webkit-box-orient: horizontal;
        flex-direction: row;
        place-content: flex-start space-between;
        flex-shrink: 0;
        width: 8.76rem
        height: 0.747rem
        border-radius: 0.747rem
        background-color: rgba(255, 96, 49, 0.5);
        align-items: center;
        .arrow-right
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: flex;
          -webkit-box-orient: vertical;
          flex-direction: column;
          place-content: flex-start center;
          flex-shrink: 0;
          width: 0.747rem
          height: 0.747rem
          -webkit-box-align: center;
          align-items: center;
          -webkit-box-pack: center;
          .arrow-left-img
            display: flex;
            width: 0.2rem
            height: 0.227rem
        .date-content
          white-space: pre-wrap;
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: block;
          -webkit-box-orient: vertical;
          flex-direction: column;
          align-content: flex-start;
          flex-shrink: 0;
          font-size: 0.4rem /* 30/75 */;
          color: rgb(255, 255, 255);
        .arrow-left
          border: 0px solid black;
          position: relative;
          box-sizing: border-box;
          display: flex;
          -webkit-box-orient: vertical;
          flex-direction: column;
          place-content: flex-start center;
          flex-shrink: 0;
          width: 0.747rem
          height: 0.747rem
          -webkit-box-align: center;
          align-items: center;
          -webkit-box-pack: center;
          .arrow-left-img
            display: flex;
            width: 0.2rem
            height: 0.227rem
</style>
