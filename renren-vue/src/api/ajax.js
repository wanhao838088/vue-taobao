/**
 * 处理http请求
 */
import axios  from 'axios'

/**
 * 不带请求头请求
 * @param url
 * @param data
 * @param type
 * @param headers 请求头
 * @returns {Promise<any>}
 */
export default function ajax(url='',data={},type='GET',headers={}){

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
      promise = axios.get(url,headers)
    } else {
      // 发送 post 请求
      promise = axios.post(url, data,headers)
    }

    promise.then(response => {
      resolve(response.data)
    }).catch(error => {
        reject(error)
      })
  })

}
