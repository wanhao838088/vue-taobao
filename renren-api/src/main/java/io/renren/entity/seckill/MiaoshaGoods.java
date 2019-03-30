package io.renren.entity.seckill;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 秒杀的商品
 * @author admin
 */
@Data
@TableName("miaosha_goods")
public class MiaoshaGoods {
	private Long id;
	private Long goodsId;
	private Integer stockCount;
	private Date startDate;
	private Date endDate;
}
