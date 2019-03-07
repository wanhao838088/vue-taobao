package io.renren.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.MiaoshaOrder;

/**
 * 商品
 * @author admin
 */
public interface MiaoshaOrderService extends IService<MiaoshaOrder> {

	/**
	 * 根据商品Id和用户id查询是否有秒杀订单
	 * @param goodsId 商品Id
	 * @param userId 用户id
	 * @return 秒杀订单
	 */
	public MiaoshaOrder getOrderByGoodsIdAndUserId(Long goodsId,Long userId);
}
