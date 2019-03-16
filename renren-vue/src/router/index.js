import Vue from 'vue'
import Router from 'vue-router'
import VueRouter from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Login from '@/pages/Login/Login'
import Profile from '@/pages/Profile/Profile'
import Main from '@/pages/Main/Main'
import Goods from '@/components/Goods/Goods'
import MobileLogin from '@/pages/MobileLogin/MobileLogin'
import BuyCart from '@/pages/BuyCart/BuyCart'
import OrderList from '@/pages/OrderList/OrderList'
import MyTb from '@/pages/MyTb/MyTb'
import More from '@/pages/More/More'

VueRouter.prototype.goBack = function () {
  this.isBack = true;
  window.history.go(-1);
}

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/buyCart',
      name: 'BuyCart',
      component: BuyCart,
      meta: {
        showFooter: true
      }
    },
    {
      path: '/orderList',
      name: 'OrderList',
      component: OrderList,
      meta: {
        showFooter: true
      }
    },
    {
      path: '/myTb',
      name: 'MyTb',
      component: MyTb,
      meta: {
        showFooter: true
      }
    },
    {
      path: '/more',
      name: 'More',
      component: More,
      meta: {
        showFooter: true
      }
    },
    {
      path: '/mobileLogin',
      name: 'MobileLogin',
      component: MobileLogin
    },
    {
      path: '/profile',
      name: 'Profile',
      component: Profile
    },
    {
      path: '/main',
      name: 'Main',
      component: Main,
      meta: {
        showFooter: true
      }
    },
    {
      path: '/goods',
      name: 'Goods',
      component: Goods
    },
    {
      path: '/',
      redirect: '/main'
    }
  ]
})
