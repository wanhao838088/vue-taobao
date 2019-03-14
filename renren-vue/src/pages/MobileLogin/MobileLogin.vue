<template>
  <div class="loginContainer">
    <div class="need-login">
      您需要登录才能继续访问
      <a class="login-close" href="">关闭</a>
    </div>
    <div class="logo tb-logo"></div>

    <!--登录部分-->
    <div class="am-list">
      <form @submit.prevent="login" ref="tbForm">

        <TbInput v-model="phone" type="text" placeholder="请输入手机号码" ></TbInput>
        <TbInput v-model="password" type="password" placeholder="请输入密码" ></TbInput>

      </form>
    </div>

    <!--其它方式登录-->
    <div class="other-link">
      <div class="am-field am-footer">
        <a href="javascript:;" class="f-left" style="text-align: left;">免费注册</a>
      </div>
    </div>

    <div class="am-field am-fieldBottom">
      <button @click="doSubmit" type="submit" class="am-button am-button-submit" id="btn-submit">登 录</button>
    </div>

    <!--提示组件-->
    <AlertTip v-show="isShowAlert" :alertText="alertText" @closeTip="closeTip"></AlertTip>

  </div>
</template>

<script>
  import AlertTip from '@/components/AlertTip/AlertTip'
  import {reqSendCode,reqSmsLogin,reqPwdLogin,reqUserInfo} from '../../api'
  import {mapActions} from 'vuex'

  import TbInput from '../../components/TbInput/TbInput'
  import {getDeviceId,setToken,getToken}  from '../../utils/utils'

  export default {
    name: "MobileLogin",

    data(){
      return{
        phone: '', // 手机号
        computeTime: 0, // 计时的时间
        password:'123456',//密码
        code:'',//短信验证码
        alertText:'',
        isShowAlert:false //是否显示提示框
      }
    },
    computed:{
      rightPhone(){
        return /^1\d{10}$/.test(this.phone)
      }
    },
    methods:{
      ...mapActions(['saveUserInfo']),

      /**
       * 提交表单
       */
      doSubmit(){
        this.login();
      },
      /**
       * 点击登录 做表单验证
       */
      async login(){
        //手机号、邮箱、会员名密码登录
        let {password} = this;
        let phoneStr = this.phone;
        console.log(phoneStr);
        console.log(password);

        if(!phoneStr){
          //用户名不能为空
          this.alertMsg("请输入会员名");
          return;
        }else if(!password){
          //密码不能为空
          this.alertMsg("密码不能为空");
          return;
        }
        let object = await reqPwdLogin({phoneStr,password});
        console.log(object);

        //错误信息显示
        if (object.code !== 0) {
          this.alertMsg(object.msg);
          return;
        }else{
          //保存token
          setToken(object.token);
        }
        //获取用户信息
        let token = object.token;
        let userObj = await reqUserInfo({token});
        console.log(userObj);

        //保存用户信息到vuex
        this.saveUserInfo(userObj);

        //获取用户信息
        this.$router.replace('/main');
      },
      /**
       * 关闭提示框
       */
      closeTip(){
        this.isShowAlert = false;
      },
      /**
       * 显示提示框
       * @param msg
       */
      alertMsg(msg){
        this.isShowAlert = true;
        this.alertText = msg;
      }
    },
    components:{
      AlertTip,
      TbInput
    },
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .loginContainer
    width 100%
    height 100%
    background #fff
    .am-field
      font-size: .37333333rem;
      width: 8.6rem;
      margin: .69333333rem auto 0;
      display: flex;
      flex-flow: row nowrap;
      justify-content: space-between;
      .am-button
        font-size: .42666667rem;
        width: 100%;
        height: 1.2rem;
        line-height: 1.2rem;
        border-radius: .6rem;
        text-align: center;
        border: 0;
      .am-button-submit
        background: -webkit-linear-gradient(left,#ff9000,#ff5000) no-repeat;
        color: #fff;
        box-shadow: 0 0.08rem 0.16rem #f7c7b1;
    .am-fieldBottom
      margin-top: .94666667rem;
    .other-link
      font: inherit;
      .am-field
        font-size: .37333333rem;
        width: 8.5rem;
        margin: .69333333rem auto 0;
        display: flex;
        flex-flow: row nowrap;
        .f-left, .f-right
          color: #555;
          flex 1
          text-decoration: none;
      .am-footer
        margin-top: .58666667rem;
    .am-list
      width: 8.5rem;
      position: relative;
      margin: 0 auto;
      font-size: .42666667rem;
      color: #333;
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
    .logo
      width: 2.6rem;
      height: 2.6rem;
      background: url(https://gw.alicdn.com/tfs/TB1p.BGQXXXXXbFXFXXXXXXXXXX-160-160.png) no-repeat;
      background-size: contain;
      margin: -0.2rem auto 0;
    .need-login
      width: 100%;
      height: 1.5rem;
      background: rgb(238, 238, 238);
      line-height: 1.36rem;
      text-align: left;
      box-sizing: border-box;
      padding-left: 20px;
      position: absolute;
      left: 0;
      top: 0;
      font-size: 0.41rem;
      font-weight: bold;
      color: rgb(51, 51, 51);
      .login-close
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 52px;
        line-height: 52px;
        padding: 0px 20px;
        color: rgb(153, 153, 153);
</style>
