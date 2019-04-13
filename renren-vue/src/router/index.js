import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/pages/Login/Login'
import Profile from '@/pages/Profile/Profile'
import Main from '@/pages/Main/Main'
import Goods from '@/components/Goods/Goods'
import SearchPage from '@/components/SearchPage/SearchPage'
import GoodsList from '@/components/GoodsList/GoodsList'
import SignIn from '@/components/SignIn/SignIn'
import OrderConfirm from '@/components/OrderConfirm/OrderConfirm'

import MobileLogin from '@/pages/MobileLogin/MobileLogin'
import BuyCart from '@/pages/BuyCart/BuyCart'
import OrderList from '@/pages/OrderList/OrderList'
import All from '@/pages/OrderList/All/All'
import WaitComment from '@/pages/OrderList/WaitComment/WaitComment'
import WaitDelivery from '@/pages/OrderList/WaitDelivery/WaitDelivery'
import WaitPayment from '@/pages/OrderList/WaitPayment/WaitPayment'
import WaitReceive from '@/pages/OrderList/WaitReceive/WaitReceive'

import MyTb from '@/pages/MyTb/MyTb'
import More from '@/pages/More/More'
import {getToken} from '../utils/utils'

import {reqUserInfo} from '../api/index'

Vue.use(Router);

const router = new Router({
  routes: [
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/searchPage',
      name: 'SearchPage',
      component: SearchPage
    },
    {
      path: '/goodsList',
      name: 'GoodsList',
      component: GoodsList
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
      },
      children:[
        {
          path: '/orderList/all',
          component: All,
          meta: {
            showFooter: true
          },
        },
        {
          path: '/orderList/waitComment',
          component: WaitComment,
          meta: {
            showFooter: true
          },
        },
        {
          path: '/orderList/waitDelivery',
          component: WaitDelivery,
          meta: {
            showFooter: true
          },
        },
        {
          path: '/orderList/waitPayment',
          component: WaitPayment,
          meta: {
            showFooter: true
          },
        },
        {
          path: '/orderList/waitReceive',
          component: WaitReceive,
          meta: {
            showFooter: true
          },
        },
        {
          path: '/',
          redirect: '/orderList/all'
        }
      ],

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
      path: '/signIn',
      name: 'SignIn',
      component: SignIn
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
      path: '/orderConfirm',
      name: 'OrderConfirm',
      component: OrderConfirm
    },
    {
      path: '/',
      redirect: '/main'
    }
  ]
});

// 全局路由守卫
router.beforeEach(async (to, from, next) => {
  //需要登录访问的地址
  const nextRoute = ['/myTb','/buyCart'];

  let token = getToken();
  let res = await reqUserInfo({token});

  let isLogin = false;
  if (res.code === 0) {
    isLogin =  true;
  }else if(res.code ===10086){
    isLogin =  false;
  }

  //根据路径判断
  if (nextRoute.indexOf(to.path) >= 0) {
    if (!isLogin) {
      next();
      router.push('/login')
    }
  }

  next();
});


export default router;
