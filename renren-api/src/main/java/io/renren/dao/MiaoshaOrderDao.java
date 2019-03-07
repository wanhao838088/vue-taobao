package io.renren.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.MiaoshaOrder;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 订单
 * @author admin
 * @date 2019年3月3日20:45:24
 */
public interface MiaoshaOrderDao extends BaseMapper<MiaoshaOrder> {

    /**
     * 根据商品Id和用户id查询是否有秒杀订单
     * @param goodsId 商品Id
     * @param userId 用户id
     * @return 秒杀订单
     */
    @Select("select * from miaosha_order where user_id=#{userId} and goods_id=#{goodsId}")
    MiaoshaOrder getOrderByGoodsIdAndUserId(@Param("goodsId")Long goodsId,@Param("userId")Long userId);
}
