package io.renren.service.order;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.order.OrderMaster;
import io.renren.common.entity.user.UserEntity;
import io.renren.vo.GoodsVo;

/**
 * 商品
 * @author admin
 */
public interface OrderMasterService extends IService<OrderMaster> {


	/**
	 * 创建订单
	 * @param goods
	 * @param userEntity
	 */
	OrderMaster createOrder(GoodsVo goods, UserEntity userEntity);
}
