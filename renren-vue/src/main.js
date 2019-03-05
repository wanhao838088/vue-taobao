// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import { Button, Select } from 'element-ui';

import store from './store/index'

// 加载过滤器
import './fiters'
import {generateUUID,setDeviceId,getDeviceId} from './utils/utils'

Vue.component(Button.name, Button);
Vue.component(Select.name, Select);

Vue.config.productionTip = false;

//跨域处理
axios.defaults.withCredentials = true;

//全局使用button

//生成一个随机数作为设备id
let deviceId = getDeviceId();
if (!deviceId) {
  let uuid = generateUUID();
  console.log(uuid);
  setDeviceId(uuid);
}

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  render: h=>h(App)
});
