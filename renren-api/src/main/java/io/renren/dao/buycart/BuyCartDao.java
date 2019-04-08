package io.renren.dao.buycart;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.buycart.BuyCart;
import io.renren.vo.BuyCartVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 07:39
 * @author : LiuLiHao
 * 描述： 购物车
 */
public interface BuyCartDao extends BaseMapper<BuyCart> {

    /**
     * 查询用户的购物车
     * @param userId
     * @return
     */
    @Select("SELECT oc.*,gs.sku_name,gs.sku_img,gs.price_money,gd.goods_title " +
            "FROM order_buy_cart oc JOIN goods_sku gs ON oc.sku_id=gs.id JOIN goods gd ON gs.goods_id=gd.id " +
            "WHERE oc.user_id=#{userId} and  oc.del_flag = 0")
    List<BuyCartVo> getCartData(@Param("userId") Long userId);


}
