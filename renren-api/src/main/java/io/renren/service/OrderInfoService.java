package io.renren.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.OrderInfo;
import io.renren.entity.UserEntity;
import io.renren.vo.GoodsVo;

/**
 * 商品
 * @author admin
 */
public interface OrderInfoService extends IService<OrderInfo> {


	/**
	 * 创建订单
	 * @param goods
	 * @param userEntity
	 */
	OrderInfo createOrder(GoodsVo goods, UserEntity userEntity);
}
