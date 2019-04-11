<template>
  <div id="J_cartBuy" class="cartbuy">
    <div class="btm-one-five">
      <!--头部-->
      <header class="o-c-header">
        <div @click="$router.back()" class="back"><p class="bk-img"></p></div>
        <div class="title">
          <span >购物车</span>
          <span>
            <span>({{cartCount}})</span>
          </span>
        </div>
        <div class="last"></div>
      </header>

      <!--商品-->
      <div>
        <div class="allItemv2">
          <div class="bundlev2">
            <!--店铺信息-->
            <div class="shop" v-for="(cda,key) in buyCart" :key="key">
              <div class="o-t-title-shop">
                <div class="tcont">
                  <div class="shopcb">
                    <p  style="line-height: 0;">
                      <input type="text" class="o-t-cb">
                      <label @click="checkShopItems(key,$event)"
                             class="o-t-cb-label"
                             :class="{'o-t-cb-label-checked':cda.isSelect}">
                      </label>
                    </p>
                  </div>

                  <!--企业图标-->
                  <div class="ico">
                    <img style="width: 100%" src="//gtms04.alicdn.com/tps/i4/TB1x4ExHVXXXXalXFXXSutbFXXX.jpg">
                  </div>

                  <!--店铺名称-->
                  <div class="contact">
                    <a href="//shop.m.taobao.com/shop/shop_index.htm?shop_id=72584016" >
                      <p class="title">{{cda.name}}</p>
                      <p class="arrow iconfont icon-arrow-right-copy-copy-copy">
                        <span class="icon-right"></span>
                      </p>
                    </a>
                  </div>

                  <div class="state">
                    <div class="state-cont">
                      <p class="edit">领券</p>
                    </div>
                    <div class="state-cont">
                      <p class="edit undefined">编辑</p>
                    </div>
                  </div>
                </div>
              </div>


              <!--商品列表-->
              <div class="group">
                <div class="itemv2" v-for="(lta,index) in cda.list" :key="index">
                  <div class="item-box">
                    <div class="item-list o-t-item">
                      <div class="item-cb">
                        <p style="line-height: 0;">
                          <input :id="lta.id" type="text" class="o-t-cb">
                          <label @click="checkThisGoods(key,index,$event)"
                                 class="o-t-cb-label"
                                 :class="{'o-t-cb-label-checked':lta.isSelect}"
                                 :for="lta.id">
                          </label>
                        </p>
                      </div>

                      <!--详情部分-->
                      <div class="item-detail">
                        <div style="display: flex;width: 100%">
                          <div class="item-img">
                            <a href="javascript:;">
                              <img style="width: 100%;transform: translateZ(0);"
                                   :src="lta.skuImg"
                                   alt="">
                            </a>
                          </div>
                          <div class="item-info">
                            <a href="javascript:;">
                              <h3 class="title">{{lta.goodsTitle}}</h3>
                              <div class="edit-sku">
                                <div>
                                  <p>{{lta.skuName}}</p>
                                </div>
                              </div>
                            </a>
                            <div class="pay">
                              <div class="pay-price">
                                <div class="price">
                                  <p class="o-t-price">
                                    <span class="major">{{lta.priceMoney}}</span>
                                  </p>
                                </div>
                              </div>
                              <div class="edit-quantity">
                                <p @click="addSkuBuyCount(key,index,lta.amount,-1)" class="btn-minus">
                                  <a  href="javascript:;" class="btn"></a>
                                </p>
                                <p class="btn-input">
                                  <input :value="lta.amount" style="width: 100%;text-align: center;border: none;"
                                         type="number" max="2558" min="1"/>
                                </p>
                                <p @click="addSkuBuyCount(key,index,lta.amount,1)" class="btn-plus">
                                  <a href="javascript:;" class="btn plus"></a>
                                </p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>

    </div>

    <!--底部结算-->
    <div class="cart-footer">
      <div class="ft-cb">
        <p>
          <input style="display: none;" id="cb-footer" type="checkbox" class="cb o-t-cb"/>
          <label @click="selectAllSku($event)"
                 :class="{'o-t-cb-label-checked':cartIsSelectAll}"
                 class="cb-footer o-t-cb-label" for="cb-footer"></label>
        </p>
      </div>
      <div class="qx">全选</div>
      <div class="pay">
        <div>
          <div>
            <span class="hj">合计：</span>
            <p class="o-t-price" data-symbol="￥">
                <span>
                  <span class="major">{{cartSelectedPrice}}</span>
                </span>
            </p>
          </div>
        </div>
      </div>

      <div class="btn">
        <p>
          <span>结算</span>
          <span>( {{cartSelectedCount}} )</span>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions,mapState,mapGetters}  from 'vuex'
  /**
   * 购物车
   */
  export default {
    name: "BuyCart",
    data(){
      return{
        pageNo:1, //分页 页数
        cartData:null, //购物车数据
        selectedIds:[] , //选中的数组下标
      }
    },
    methods:{
      ...mapActions(['getBuyCart','selectSkuItem']),
      /**
       * 全选和取消全选 所有sku
       */
      selectAllSku(event){
        let isSelect = this._eventIsSelected(event);
        //改变vuex状态
        this.$store.dispatch('selectAllSku',{
          isSelect
        });
      },
      /**
       * 全选和取消全选 店铺下的sku
       */
      checkShopItems(oneId,event){
        let isSelect = this._eventIsSelected(event);

        //改变vuex状态
        this.$store.dispatch('selectShopSkuItems',{
          oneId,
          isSelect
        });

      },
      /**
       * 增加或者减少sku购买数量
       */
      addSkuBuyCount(oneId,twoId,amount,number){
        console.log(oneId,twoId,amount,number)
        if (amount <= 1 && number===-1) {
          //不能再减少
          return;
        }
        //改变vuex状态
        this.$store.dispatch('addSkuItemCount',{
          oneId,
          twoId,
          number
        });
      },
      /**
       * 根据元素class判断 是否选中了
       */
      _eventIsSelected(event){
        //获取元素class名
        let clazzName = event.currentTarget.className;
        let isSelect = false;
        if (clazzName.indexOf('o-t-cb-label-checked') !== -1) {
          event.currentTarget.className=' o-t-cb-label';
        }else {
          event.currentTarget.className+=' o-t-cb-label-checked';
          isSelect = true;
        }
        return isSelect;
      },
      /**
       * 点击label选择sku商品
       * @param goodsId
       */
      checkThisGoods(oneId,twoId,event){
        let isSelect = this._eventIsSelected(event);

        //改变vuex状态
        this.$store.dispatch('selectSkuItem',{
          oneId,
          twoId,
          isSelect
        });

      }
    },
    computed:{
      ...mapState(['buyCart']),
      ...mapGetters(['cartCount','cartSelectedCount','cartSelectedPrice','cartIsSelectAll']),
    },
    mounted(){
      //获取购物车
      this.getBuyCart();
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  .cartbuy
    position: relative;
    .btm-one-five
      padding-bottom 1.5rem
    .cart-footer
      width: 100%;
      position: fixed;
      z-index: 2;
      left 0
      bottom 1rem
      height: 1.30667rem;
      background: #fff;
      border-top: .02667rem solid #e7e7e7;
      display: flex;
      .btn
        width: 2.77333rem;
        color: #fff;
        background: #f50;
        justify-content: center;
        align-items: center;
        display: flex;
        margin-left: .32rem;
        & p
          font-size 0.35rem
      .pay
        flex: 1;
        align-items: center;
        display: flex;
        .o-t-price
          color: #f50;
          display: inline;
          .major
            font-size 0.39rem
          &::before
            content: attr(data-symbol);
            display: inline-block;
            text-decoration: inherit;
            vertical-align: inherit;
        .hj
          font-size: 0.35rem
        & div
          flex: 1;
          text-align: right;
      .qx
        justify-content: center;
        align-items: center;
        display: flex;
        font-size: 0.35rem
      .ft-cb
        position: relative;
        width: 1.17333rem;
        justify-content: center;
        align-items: center;
        display: flex;
        .o-t-cb-label-checked
          background-image url("./images/checked.png") !important
        .o-t-cb-label
          display: inline-block;
          width: .533rem;
          background-size 100%
          background-repeat no-repeat
          background-image url("./images/cycle.png")
          height: .533rem;
          cursor: pointer;
        .cb-footer
          width: .53333rem;
          height: .53333rem;
          background-size: .52rem;
          &::after
            position: absolute;
            width: 1.6rem;
            height: 100%;
            top: 0;
    .allItemv2
      list-style: none;
      .bundlev2
        margin-top: .32rem;
        background: #fff;
        border-bottom: .01333rem solid #e7e7e7;
        .group
          list-style: none;
          .itemv2
            margin-top: .08rem;
            position: relative;
            z-index: 0;
            .item-box
              transition: -webkit-transform 0.2s ease-in;
              transform: translateX(0);
              .item-detail
                flex: 1;
                .item-info
                  flex: 1;
                  padding: .16rem .32rem;
                  box-sizing: border-box;
                  display: flex;
                  flex-direction: column;
                  justify-content: space-between;
                  .pay
                    display: flex;
                    width: 100%;
                    height: 1.17333rem;
                    line-height: 1.17333rem;
                    align-items: center;
                    .edit-quantity
                      height: 100%;
                      width: 2.33333rem;
                      display: flex;
                      .btn-plus
                        width: .88rem;
                        height: 100%;
                        .plus
                          height: 100%;
                          position: relative;
                          width: .36667rem;
                          top: 0.4rem;
                          left: 0.2rem;
                          background-repeat no-repeat
                          background-size: 100%;
                          background-image url("./images/plus.png")
                        .btn
                          display: block;
                          height: 100%;
                          color: #051b28;
                          position: relative;
                      .btn-input
                        width: .58667rem;
                      .btn-minus
                        width: .88rem;
                        height: 100%;
                        .btn
                          display: block;
                          color: #051b28;
                          text-decoration: none;
                          height: 100%;
                          position: relative;
                          &::after
                            position: absolute;
                            left: 50%;
                            top: 50%;
                            -webkit-transform: translate(-50%,-50%);
                            transform: translate(-50%,-50%);
                            border-bottom: .02667rem solid #878787;
                            width: .26667rem;
                            content: ' ';
                    .pay-price
                      flex: 1;
                      .price
                        float: left;
                        .o-t-price
                          color: #f60;
                          display: inline;
                          .major
                            display: inline-block;
                            font-size: 0.213rem
                          &::before
                            content: '￥';
                            display: inline-block;
                  & a
                    color: #051b28;
                    text-align: left;
                  .edit-sku
                    margin-top: .16rem;
                    max-height: 1.06667rem;
                    line-height: .48rem;
                    overflow: hidden;
                    color: #999;
                    cursor: pointer;
                    box-sizing: boder-box;
                    position: relative;
                    background-color: #f5f5f5;
                    border-radius: .08rem;
                    padding: .05333rem .58667rem .05333rem .10667rem;
                    &::after
                      background: url("./images/arrow_down.png") center center no-repeat;
                      background-size: contain;
                      content: '';
                      display: inline-block;
                      width: .28667rem;
                      height: 100%;
                      position: absolute;
                      right: .16rem;
                      top: 0;
                    & p
                      overflow: hidden;
                      line-clamp: 2;
                      box-orient: vertical;
                      display: box;
                      word-break: break-all;
                      word-wrap: break-word;
                  .title
                    overflow: hidden;
                    line-clamp: 2;
                    box-orient: vertical;
                    display: box;
                    word-break: break-all;
                    height: .88rem;
                    line-height: .453rem;
                .item-img
                  width: 2.6rem;
                  margin: .16rem 0 .16rem .32rem;
                  background: #fff;
                  overflow: hidden;
                  display: -webkit-box;
                  display: -webkit-flex;
                  display: flex;
                  flex-direction: column;
                  & a
                    display: block;
                    height: 2.6rem;
                    background: #fff;
                    line-height: 2.6rem;
                    text-align: center;
                    overflow: hidden;
              .o-t-item
                width: 100%;
                padding-left: 0;
                box-sizing: border-box;
                background: #fff;
                display: flex;
                .item-cb
                  box-pack: center;
                  display: box;
                  width: 1.173rem;
                  margin-right: -.32rem;
                  position: relative;
                  .o-t-cb-label-checked
                    background-image url("./images/checked.png") !important
                  .o-t-cb-label
                    display: inline-block;
                    width: .533rem;
                    background-size 100%
                    background-repeat no-repeat
                    background-image url("./images/cycle.png")
                    height: .533rem;
                    cursor: pointer;
                  .o-t-cb
                    display: none;
                  & p
                    height: 2.92rem;
                    -webkit-box-pack: center;
                    display: -webkit-box;
                    -webkit-box-align: center;
        .shop
          list-style: none;
          .o-t-title-shop
            width: 100%;
            height: 1.067rem;
            padding-left: .32rem;
            box-sizing: border-box;
            background: #fff;
            position: relative;
            .tcont
              font-size: 0.253rem  /* 19/75 */;
              width: 100%;
              height: 1.067rem;
              display: flex;
              .state
                margin-left: .32rem;
                display: flex;
                .state-cont
                  flex: 1;
                  box-align: center;
                  display: box;
                  cursor: pointer;
                  .edit
                    border: none;
                    width: 1.48rem;
                    text-align: center;
                    cursor: pointer;
              .contact
                box-align: center;
                flex: 1;
                display: -webkit-box;
                .arrow
                  min-width: .52rem;
                  min-height: .547rem;
                  line-height: 0.5rem;
                  text-align left
                  width: .52rem;
                  background-size: .4rem .647rem;
                  flex: 1;
                  background-position: left center;
                .title
                  margin-right: .52rem;
                  line-height: .547rem;
                  word-break: break-all;
                  display: -webkit-box;
                  text-align: left;
                  overflow: hidden;
                  -webkit-line-clamp: 1;
                & a
                  width: 100%;
                  color: #051b28;
                  display: flex;
                  padding-right: .52rem;
                  box-sizing: border-box;
              .ico
                margin-right: .32rem;
                width: .427rem;
                height 0.4rem
                margin-top 0
                display: flex;
                align-items: center;
              .shopcb
                -webkit-box-align: center;
                display: -webkit-box;
                margin-right: .32rem;
                .o-t-cb-label-checked
                  background-image url("./images/checked.png") !important
                .o-t-cb-label
                  display: inline-block;
                  width: .5rem;
                  background-size 100%
                  background-repeat no-repeat
                  background-image url("./images/cycle.png")
                  height: .5rem;
                  cursor: pointer;
                .o-t-cb
                  display: none;
    .o-c-header
      width: 100%;
      height: 1.2rem;
      font-size: 0.38rem
      background: #fff;
      display: flex;
      border-bottom: 0.2333rem solid #e7e7e7;
      .last
        text-align: right;
        flex 1
        align-items center
        margin-right: .467rem;
      .title
        flex: 1;
        justify-content: center;
        align-items: center;
        display: flex;
      .back
        cursor: pointer;
        text-align: left;
        flex 1
        align-items center
        .bk-img
          padding-top 0.7rem
          padding-left 0.5rem
          width 0.5rem
          height 0.5rem
          background: url("./images/back.png") center no-repeat;
          background-size: 0.5rem;

</style>
