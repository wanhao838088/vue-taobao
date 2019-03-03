package io.renren.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

/**
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
