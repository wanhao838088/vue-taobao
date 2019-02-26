<template>
  <div class="loginContainer">
    <div class="loginInner">
      <div class="login_header">
        <h2 class="login_logo">Security-Vue</h2>
        <div class="login_header_title">
          <a href="javascript:;" :class="{on:isSmsLogin}" @click="isSmsLogin=true">短信登录</a>
          <a href="javascript:;" :class="{on:!isSmsLogin}" @click="isSmsLogin=false">密码登录</a>
        </div>
      </div>
      <div class="login_content">
        <form @submit.prevent="login">
          <div :class="{on:isSmsLogin}">
            <section class="login_message">
              <input type="tel" maxlength="11" placeholder="手机号" v-model="phone">
              <button :disabled="!rightPhone" @click.prevent="sendSms" class="get_verification" :class="{right_phone:rightPhone}">
                {{computeTime===0?'获取验证码':'已发送'+computeTime+' s'}}
              </button>
            </section>
            <section class="login_verification">
              <input type="tel" maxlength="8" placeholder="验证码" v-model="code">
            </section>
            <section class="login_hint">
              温馨提示：未注册的手机号，登录时将自动注册，且代表已同意
              <a href="javascript:;">《用户服务协议》</a>
            </section>
          </div>
          <div :class="{on:!isSmsLogin}">
            <section>
              <section class="login_message">
                <input type="tel" maxlength="11" placeholder="手机/邮箱/用户名" value="admin" v-model="name">
              </section>
              <section class="login_verification">
                <input type="text" maxlength="8" value="admin" placeholder="密码" v-if="isShowPwd" v-model="password">
                <input type="password" maxlength="8" value="admin" placeholder="密码" v-else v-model="password">

                <div class="switch_button" :class="!isShowPwd?'off':'on'" @click="isShowPwd=!isShowPwd">
                  <div class="switch_circle" :class="{right:isShowPwd}"></div>
                  <span class="switch_text">{{isShowPwd?'abc':'...'}}</span>
                </div>
              </section>
            </section>
          </div>
          <button class="login_submit">登录</button>
        </form>
        <a href="javascript:;" class="about_us">关于我们</a>
      </div>
      <a href="javascript:" class="go_back" @click="$router.back()">
        <i class="iconfont icon-jiantou2"></i>
      </a>
    </div>

    <!--提示组件-->
    <AlertTip v-show="isShowAlert" :alertText="alertText" @closeTip="closeTip"></AlertTip>

  </div>

</template>

<script>
  import AlertTip from '@/components/AlertTip/AlertTip'
  import {reqSendCode,reqSmsLogin,reqPwdLogin,reqUserInfo} from '../../api'
  import {mapActions} from 'vuex'

  import {getDeviceId,setToken,getToken}  from '../../utils/utils'

  export default {
    data(){
      return{
        isSmsLogin:true,
        phone: '18865392565', // 手机号
        isShowPwd: false, // 是否显示密码
        computeTime: 0, // 计时的时间
        password:'123456',//密码
        code:'',//短信验证码
        name:'13562959695',//用户名
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
       * 发送短信验证码
       */
      async sendSms(){
        if (!this.computeTime) {
          this.computeTime = 60;
          //倒计时
          this.intId = setInterval(()=>{
            this.computeTime--;
            if (this.computeTime <= 0) {
              this.computeTime = 0;
              clearInterval(this.intId);
            }
          },1000);
          // 发送验证码
          let deviceId =  getDeviceId();
          let result = await reqSendCode({mobile:this.phone,deviceId});

          if(result.code!==0){
            //发送失败
            this.alertMsg(result.msg);
            //重置定时
            if (this.computeTime) {
              clearInterval(this.intId);
              this.computeTime = 0;
            }
          }

        }
      },
      /**
       * 点击登录 做表单验证
       */
      async login(){
        //判断登录方式
        if (this.isSmsLogin) {
          //短信登录
          let {rightPhone,phone,code} = this;
          if(!rightPhone){
            //手机号不正确
            this.alertMsg("手机号不正确");
            return;
          }else if(!code){
            //验证码不能为空
            this.alertMsg("验证码不能为空");
            return;
          }
          let object = await reqSmsLogin({mobile:phone,password:code});

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
          //页面调转
          this.$router.replace('/profile');

        }else {
          //密码登录
          let {name,password} = this;
          if(!name){
            //用户名不能为空
            this.alertMsg("用户名不能为空");
            return;
          }else if(!password){
            //密码不能为空
            this.alertMsg("密码不能为空");
            return;
          }
          let object = await reqPwdLogin({name,password});
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
          this.$router.replace('/profile');

        }
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
      AlertTip
    },
  }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .loginContainer
    width 100%
    height 100%
    background #fff
    .loginInner
      padding-top 60px
      width 80%
      margin 0 auto
      .login_header
        .login_logo
          font-size 40px
          font-weight bold
          color #02a774
          text-align center
        .login_header_title
          padding-top 40px
          text-align center
          display flex
          >a
            color #333
            font-size 14px
            padding-bottom 4px
            flex 1
            &.on
              color #02a774
              font-weight 700
              border-bottom 2px solid #02a774
      .login_content
        >form
          >div
            display none
            &.on
              display block
            input
              width 100%
              height 100%
              padding-left 10px
              box-sizing border-box
              border 1px solid #ddd
              border-radius 4px
              outline 0
              font 400 14px Arial
              &:focus
                border 1px solid #02a774
            .login_message
              position relative
              margin-top 16px
              height 48px
              font-size 14px
              background #fff
              .get_verification
                position absolute
                top 50%
                right 10px
                transform translateY(-50%)
                border 0
                color #ccc
                font-size 14px
                background transparent
                &.right_phone
                  color black
            .login_verification
              position relative
              margin-top 16px
              height 48px
              font-size 14px
              background #fff
              .switch_button
                font-size 12px
                border 1px solid #ddd
                border-radius 8px
                transition background-color .3s,border-color .3s
                padding 0 6px
                width 30px
                height 16px
                line-height 16px
                color #fff
                position absolute
                top 50%
                right 10px
                transform translateY(-50%)
                &.off
                  background #fff
                  .switch_text
                    float right
                    color #ddd
                &.on
                  background #02a774
                >.switch_circle
                  position absolute
                  top -1px
                  left -1px
                  width 16px
                  height 16px
                  border 1px solid #ddd
                  border-radius 50%
                  background #fff
                  box-shadow 0 2px 4px 0 rgba(0,0,0,.1)
                  transition transform .3s
                  &.right
                    transform translateX(27px)
            .login_hint
              margin-top 12px
              color #999
              font-size 14px
              line-height 20px
              >a
                color #02a774
          .login_submit
            display block
            width 100%
            height 42px
            margin-top 30px
            border-radius 4px
            background #4cd96f
            color #fff
            text-align center
            font-size 16px
            line-height 42px
            border 0
        .about_us
          display block
          font-size 12px
          margin-top 20px
          text-align center
          color #999
      .go_back
        position absolute
        top 5px
        left 5px
        width 30px
        height 30px
        >.iconfont
          font-size 20px
          color #999
</style>
