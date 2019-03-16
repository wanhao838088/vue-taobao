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

        <TbInput maxlength="11" v-model="mobile" type="text" placeholder="请输入手机号码" ></TbInput>

        <div class="am-list-item">
          <div class="am-list-control">
            <input @keyup="changeValue" @focus="changeValue" @blur="blurInput"
                    v-model="code" type="text"
                   placeholder="校验码"
                   maxlength="6"
                   class="am-input-required am-input-required-checkCode"
                   value=""/>
          </div>
          <!--删除按钮-->
          <div class="am-list-action am-list-action-msg">
            <i v-show="isShowDel" class="am-icon-clear iconfont  icon-shanchuguanbicha"></i>
          </div>
          <div class="am-list-button">
            <span @click="sendCode" class="get-checkcode">
              {{computeTime>0 ? `在${computeTime}秒后重发` : '获取短信验证码'}}
            </span>
          </div>
        </div>
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

    <div class="am-field">
      <a href="javascript:;" @click="$router.replace('/login')" class="am-button btn-change" id="btn-change">账户密码登录</a>
    </div>

    <!--提示组件-->
    <AlertTip v-show="isShowAlert" :alertText="alertText" @closeTip="closeTip"></AlertTip>
    <TbToast :msg="msg" ref="TbToast"></TbToast>
  </div>
</template>

<script>
  import AlertTip from '@/components/AlertTip/AlertTip'
  import {reqSendCode,reqSmsLogin,reqPwdLogin,reqUserInfo} from '../../api'
  import {mapActions} from 'vuex'

  import TbInput from '../../components/TbInput/TbInput'
  import TbToast from '../../components/TbToast/TbToast'

  import {getDeviceId,setToken,getToken}  from '../../utils/utils'

  export default {
    name: "MobileLogin",

    data(){
      return{
        isShowDel:false,
        mobile: '18865392565', // 手机号
        msg:'',
        computeTime: 0, // 计时的时间
        password:'123456',//密码
        code:'',//短信验证码
        alertText:'',
        isShowAlert:false //是否显示提示框
      }
    },
    computed:{
      rightPhone(){
        return /^1\d{10}$/.test(this.mobile)
      }
    },
    methods:{
      ...mapActions(['saveUserInfo']),
      /**
       * 发送短信验证码
       */
      async sendCode(){
        // 如果当前没有计时
        if(!this.computeTime) {
          //检查输入格式
          let flag = this.rightPhone;
          if (!flag) {
            this.msg='手机号码格式不正确，请检查';
            this.$refs.TbToast.showToast();
            return;
          }
          //发送验证码 && 启动倒计时
          this.computeTime = 60;
          this.intervalId = setInterval(() => {
            this.computeTime--
            if(this.computeTime<=0) {
              // 停止计时
              clearInterval(this.intervalId)
            }
          }, 1000);
          let mobile = this.mobile;

          let deviceId = getDeviceId();

          // 发送ajax请求(向指定手机号发送验证码短信)
          const result = await reqSendCode({mobile,deviceId});

          console.log(result);

          if(result.code!==0) {
            // 显示提示
            this.alertMsg(result.msg);
            // 停止计时
            if(this.computeTime) {
              this.computeTime = 0;
              clearInterval(this.intervalId)
              this.intervalId = undefined
            }
          }
        }

      },
      /**
       * 改变内容
       */
      changeValue(){
        let tbvalue = this.code;
        if (tbvalue) {
          this.isShowDel = true;
        }else {
          this.isShowDel = false;
        }
      },
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
       * 提交表单
       */
      doSubmit(){
        this.login();
      },
      /**
       * 点击登录 做表单验证
       */
      async login(){
        //手机号、验证码登录
        let {code} = this;
        let mobileStr = this.mobile;

        if(!mobileStr){
          this.alertMsg("请输入手机号");
          return;
        }else if(!code){
          this.alertMsg("验证码不能为空");
          return;
        }
        let object = await reqSmsLogin({mobile:mobileStr,password:code});
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
        this.saveUserInfo(userObj.user);

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
      TbInput,
      TbToast
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
      .btn-change
        border: 1px solid #ff5000 !important;
        color: #ff5000;
        background: #fff;
        text-decoration: none;
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
        .am-list-button
          border-left: .02666667rem solid #b5b5b5;
          position: absolute;
          left: 5.25rem;
          bottom: .16rem;
          .get-checkcode
            width: 3.4rem;
            display: block;
            text-align: center;
            color: #ff5000;
            font-size: .42666667rem;
        .am-list-action-msg
          left: 4.66666667rem;
          right: auto;
          .am-icon-clear
            position: absolute;
            top: .04rem;
            right: 0.13rem;
        .am-list-action
          position: absolute;
          width: .53333333rem;
          height: .26666667rem;
          bottom: .4rem;
        .am-list-control
          margin: 0;
          padding: 0;
          border: 0;
          font-size: 100%;
          font: inherit;
          vertical-align: baseline;
          .am-input-required-checkCode
            width: 4.53333333rem;
            float: left;
          .am-input-required
            font-size: inherit;
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
