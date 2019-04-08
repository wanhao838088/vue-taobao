/*
包含n个接口请求函数的模块
函数的返回值: promise对象
 */
import ajax from './ajax'

//自有项目api
const MY_URL = 'http://localhost:8081/renren-api/api';

// 1、手机号密码登陆
export const reqPwdLogin = ({name, password,loginType}) =>
  ajax(MY_URL + `/login`, {mobile: name, password,loginType}, "POST");

// 2、发送短信验证码
export const reqSendCode = ({mobile, deviceId}) =>
  ajax(MY_URL + '/getCode', {mobile, deviceId}, "POST");


// 3、手机号验证码登陆
export const reqSmsLogin = ({mobile, password,loginType}) =>
  ajax(MY_URL + '/loginByCode', {mobile, password,loginType}, "POST");


// 4、根据token获取用户信息
export const reqUserInfo = ({token}) => ajax(MY_URL + '/userInfo', {token});

// 5、用户登出
export const reqLogout = () => ajax(MY_URL + '/userController/logout');

// 6、获取商品列表
export const reqGoods = (form) =>
  ajax(MY_URL + '/goods/list', form,'POST',false);

// 7、获取商品详情
export const reqGoodsDetail = ({id}) => ajax(MY_URL + `/goods/${id}`);

// 8、秒杀一件商品
export const reqSecKill = ({goodsId}) =>
  ajax(MY_URL + `/secKill/killGoods`,{goodsId:goodsId},"POST",true);

// 9、请求banner和nav
export const reqBannerAndNav = () =>
  ajax(MY_URL + `/msite/bannerAndNav`);

// 10、获取秒杀结果
export const reqSecKillResult = ({goodsId}) =>
  ajax(MY_URL + `/secKill/result`,{goodsId},"GET",true);

// 11、获取秒杀结果
export const reqSearchCategory = (form) =>
  ajax(MY_URL + `/goodsCategory/search`,form,"POST",false);

// 12、添加商品到购物车
export const reqAddSku2Cart = (form) =>
  ajax(MY_URL + `/buyCart/addSku2Cart`,form,"POST",true);

// 13、查询购物车列表
export const reqgetBuyCartData = () =>
  ajax(MY_URL + `/buyCart/getBuyCartData`,{},"GET",true);

// 13、删除购物项
export const reqgetDeleteCartItem = (form) =>
  ajax(MY_URL + `/buyCart/deleteCartItem`,form,"GET",true);
