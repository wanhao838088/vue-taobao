<template>
  <div class="profile">
    <HeaderTop :title="'我的'"></HeaderTop>
    <div class="profile-container">

    </div>

    <el-button v-if="user.userId" type="danger" style="width: 100%;" @click.native="logout">退出登录</el-button>
  </div>
</template>

<script>
  import {mapState,mapActions} from 'vuex'
  import {MessageBox} from 'element-ui'
  import HeaderTop from '../../components/HeaderTop/HeaderTop'

  export default {
    components: {
      HeaderTop
    },
    computed:{
      ...mapState(['user'])
    },
    methods:{
      ...mapActions(['reqLogout']),
      /**
       * 退出登录
       */
      logout(){
        //弹出确认框
        MessageBox.confirm('确定退出吗？').then(
          action => {
          this.reqLogout();
          },
          action => {
            console.log('取消了...')
          }
        );
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  @import "../../common/stylus/mixins.styl"
  .profile //我的
    width 100%
    .profile-container
      height 150px;
      display: -webkit-flex;
      display: flex;
      background-image: linear-gradient(90deg,#0af,#0085ff);
      color: #fff;
      -webkit-align-items: center;
      align-items: center;
</style>
