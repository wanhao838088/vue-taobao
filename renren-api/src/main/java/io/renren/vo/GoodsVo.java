package io.renren.vo;

import io.renren.entity.goods.Goods;
import io.renren.entity.goods.GoodsSku;
import lombok.Data;

import java.util.Date;
import java.util.List;

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

	/**
	 * 卖家名称
	 */
	private String sellerName;

	private List<GoodsSku> skus;

}
