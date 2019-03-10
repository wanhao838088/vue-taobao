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
  }
}
