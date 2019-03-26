<template>
  <div id="app">
    <transition>
      <div class="page-container">
        <router-view class="child-view"/>
        <FooterGuide  v-show="$route.meta.showFooter"></FooterGuide>
      </div>
    </transition>
  </div>
</template>

<script>
  import FooterGuide from './components/FooterGuide/FooterGuide'

  export default {
    name: 'App',
    created() {
      document.body.removeChild(document.getElementById('Loading'))
    },
    data() {
      return {
        transitionName: 'slide-left'
      }
    },
    //监听路由的路径，可以通过不同的路径去选择不同的切换效果
    watch: {
      '$route'(to, from) {
        const toDepth = to.path.length;
        const fromDepth = from.path.length;
        this.transitionName = toDepth < fromDepth ? 'slide-right' : 'slide-left'
      }
    },
    components: {
      FooterGuide
    }

  }
</script>

<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
  }

  .child-view {
    margin: 0 auto;
    width: 100%;
    height: 100%;
    transition: all .5s cubic-bezier(.55, 0, .1, 1);
  }

  .page-container{
    /*position: relative;*/
    padding-bottom: 40px;
  }
  .slide-left-enter, .slide-right-leave-active {
    opacity: 0;
    transform: translate(100%, 0);
  }

  .slide-left-leave-active, .slide-right-enter {
    opacity: 0;
    transform: translate(-100%, 0);
  }
</style>
