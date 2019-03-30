package io.renren.vo;

import io.renren.entity.goods.Goods;
import lombok.Data;

import java.util.Date;

/**
 * 秒杀商品
 * @author admin
 */
@Data
public class GoodsVo extends Goods {
	private Double miaoshaPrice;
	private Long stockCount;
	private Date startDate;
	private Date endDate;
	private Long startTime;
	private Long endTime;

}
