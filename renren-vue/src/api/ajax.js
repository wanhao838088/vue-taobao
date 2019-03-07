/**
 * 处理http请求
 */
import axios  from 'axios'

import {getToken} from '../utils/utils'

/**
 * 不带请求头请求
 * @param url
 * @param data
 * @param type
 * @param isToken 是否带请求头
 * @returns {Promise<any>}
 */
export default function ajax(url='',data={},type='GET',isToken){

  return new Promise(function (resolve, reject) {

    let promise;

    if (type === 'GET') {
      // 准备 url query 参数数据
      let dataStr = ''; //数据拼接字符串
      Object.keys(data).forEach(key => {
        dataStr += key + '=' + data[key] + '&'
      });

      if (dataStr !== '') {
        dataStr = dataStr.substring(0, dataStr.lastIndexOf('&'))
        url = url + '?' + dataStr
      }
      // 发送 get 请求
      if (isToken) {
        let token = getToken();
        promise = axios.get(url,{
          headers : {
            "token":token
          }
        })
      }else {
        promise = axios.get(url)
      }
    } else {
      // 发送 post 请求
      if (isToken) {
        let token = getToken();

        promise = axios.post(url, data,{
          headers : {
            "token":token
          }
        })
      }else {
        promise = axios.post(url, data)
      }
    }

    promise.then(response => {
      resolve(response.data)
    }).catch(error => {
        reject(error)
      })
  })

}
