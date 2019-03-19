export default {
  /**
   * 购物车里面食物数量
   * @param state
   */
  navTop(state){
    return state.navs.filter((currentValue,index,arr)=>{
      return index<5;
    });
  },

  navBottom(state){
    return state.navs.filter((currentValue,index,arr)=>{
      return index>=5&& index<=10;
    });
  },
  /**
   * 页面显示的用户名
   * @param state
   */
  tbUserName(state){
    let {username,mobile} = state.user;
    if (username == mobile) {
      //显示隐藏的手机号
      return username.substr(0,3) + "****" +username.substr(7,11);
    }
    return username;
  }
}
