import {

}
from '../api'

import {
  SAVE_USER_INFO,
}
from './mutation-types'

export default {

  /**
   * 保存用户信息
   * @param commit
   * @param state
   * @param user
   */
  saveUserInfo({commit, state},user){
    commit(SAVE_USER_INFO,{user});
  }


}

