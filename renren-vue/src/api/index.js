/*
包含n个接口请求函数的模块
函数的返回值: promise对象
 */
import ajax from './ajax'

//自有项目api
const MY_URL = 'http://localhost:8081/renren-api/api';

// 1、手机号密码登陆
export const reqPwdLogin = ({name, password}) =>
  ajax(MY_URL + `/login`, {mobile: name, password}, "POST");

// 2、发送短信验证码
export const reqSendCode = ({mobile, deviceId}) =>
  ajax(MY_URL + '/getCode', {mobile, deviceId}, "POST");


// 3、手机号验证码登陆
export const reqSmsLogin = ({mobile, password}) =>
  ajax(MY_URL + '/loginByCode', {mobile, password}, "POST");


// 4、根据token获取用户信息
export const reqUserInfo = ({token}) => ajax(MY_URL + '/userInfo', {token});

// 5、用户登出
export const reqLogout = () => ajax(MY_URL + '/userController/logout');

// 6、获取商品列表
export const reqGoods = () => ajax(MY_URL + '/goods/list');

// 7、获取商品详情
export const reqGoodsDetail = ({id}) => ajax(MY_URL + `/goods/${id}`);

// 8、秒杀一件商品
export const reqSecKill = ({goodsId}) =>
  ajax(MY_URL + `/secKill/killGoods`,{goodsId:goodsId},"POST",true);
