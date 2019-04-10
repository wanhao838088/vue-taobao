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
      if (!mobile || mobile.length < 10){
        return;
      }
      //显示隐藏的手机号
      return username.substr(0,3) + "****" +username.substr(7,11);
    }
    return username;
  },
  /**
   * 计算得到页面显示的新闻
   */
  pageNews(state){
    let orgNews = state.news;
    let destNews = [];
    if (orgNews.length % 2 !== 0) {
      orgNews.splice(0,1);
    }
    //正好是偶数个
    for(let i=0;i<orgNews.length/2;i++){
      let news1 = orgNews[i*2].newsName;
      let news2 = orgNews[i*2+1].newsName;
      destNews.push({
        news1,
        news2
      });
    }
    return destNews;
  },
  /**
   * 购物车里面的购物项数量
   * @param state
   */
  cartCount(state){
    let buyCart = state.buyCart;
    let count = 0;
    for(let i=0;i<buyCart.length;i++){
      let  list = buyCart[i].list;
      count+=list.length;
    }
    return count;
  },
  /**
   * 购物车里面选中的sku数量
   * @param state
   */
  cartSelectedCount(state){
    let buyCart = state.buyCart;
    let count = 0;
    for(let i=0;i<buyCart.length;i++){
      let  list = buyCart[i].list;
      list.forEach((obj)=>{
        if (obj.isSelect) {
          count += obj.amount;
        }
      })
    }
    return count;
  },
  /**
   * 购物车里面选中的sku价格
   * @param state
   */
  cartSelectedPrice(state){
    let buyCart = state.buyCart;
    let price = 0.0;

    for(let i=0;i<buyCart.length;i++){
      let  list = buyCart[i].list;
      list.forEach((obj)=>{
        if (obj.isSelect) {
          price += obj.amount * obj.priceMoney;
        }
      })
    }
    return price;
  }
}
