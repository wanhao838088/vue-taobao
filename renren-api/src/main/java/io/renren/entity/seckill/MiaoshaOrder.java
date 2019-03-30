package io.renren.entity.seckill;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

/**
 * 秒杀模块的订单
 * @author wanhao
 */
@Data
@TableName("miaosha_order")
public class MiaoshaOrder {
	private Long id;
	private Long userId;
	private Long  orderId;
	private Long goodsId;

}
