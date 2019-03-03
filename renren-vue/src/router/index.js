import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Login from '@/pages/Login/Login'
import Profile from '@/pages/Profile/Profile'
import Main from '@/pages/Main/Main'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/helloworld',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/profile',
      name: 'Profile',
      component: Profile
    },
    {
      path: '/main',
      name: 'Main',
      component: Main
    },
    {
      path: '/',
      redirect: '/login'
    }
  ]
})
