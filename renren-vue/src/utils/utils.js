import CryptoJS from 'crypto-js';

/**
 * 生成uuid
 * @returns {string}
 */
export function generateUUID() {
  let d = new Date().getTime();
  if (window.performance && typeof window.performance.now === "function") {
    d += performance.now(); //use high-precision timer if available
  }
  let uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
    let r = (d + Math.random() * 16) % 16 | 0;
    d = Math.floor(d / 16);
    return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
  });
  return uuid;
}


/**
 * 在本地存储一个键值对
 * @param key
 * @param value
 */
export function setAttr(key, value) {
  if (key) {
    window.localStorage.setItem(key, value);
  }
}

/**
 * 查询键值对
 * @param key
 * @param value
 */
export function getAttr(key) {
  if (key) {
    return window.localStorage.getItem(key);
  }
}

/**
 * 设置设备id
 * @param value
 */
export function setDeviceId(value) {
  window.localStorage.setItem("deviceId", value);
}

/**
 * 设置token
 * @param value
 */
export function setToken(value) {
  window.localStorage.setItem("token", value);
}

/**
 * 获取设备id
 * @returns {string}
 */
export function getDeviceId() {
  return window.localStorage.getItem("deviceId");
}

/**
 * 获取token
 * @returns {string}
 */
export function getToken() {
  return window.localStorage.getItem("token");
}

//des工具方法
//DES加密
export const encryptBy = (message) => {
  let key = 'wanhao';

  function encryptByDES(message, key) {
    let keyHex = CryptoJS.enc.Utf8.parse(key);
    let option = {mode: CryptoJS.mode.ECB, padding: CryptoJS.pad.Pkcs7};
    let encrypted = CryptoJS.DES.encrypt(message, keyHex, option);
    return encrypted.ciphertext.toString()
  }

  return encryptByDES(message, key);
};

//DES解密
export const decryptBy = (message) => {
  let key = 'wanhao';

  //DES  ECB模式解密
  function decryptByDES(message, key) {
    let keyHex = CryptoJS.enc.Utf8.parse(key);
    let decrypted = CryptoJS.DES.decrypt({
      ciphertext: CryptoJS.enc.Hex.parse(message)
    }, keyHex, {
      mode: CryptoJS.mode.ECB,
      padding: CryptoJS.pad.Pkcs7
    });
    let result_value = decrypted.toString(CryptoJS.enc.Utf8);
    return result_value;
  }

  return decryptByDES(message, key);
};
