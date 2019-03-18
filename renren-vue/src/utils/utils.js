
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
  let temp = window.localStorage.getItem("deviceId");
  if (temp){
    return temp;
  }
  temp = generateUUID();
  setDeviceId(temp);
  console.log('设备Id  '+temp);
  return temp;

}

/**
 * 获取token
 * @returns {string}
 */
export function getToken() {
  return window.localStorage.getItem("token");
}

