package io.renren.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @author admin
 */
@Data
@TableName("goods")
public class Goods implements Serializable {
	@TableId
	private Long id;
	private String goodsTitle;
	private String goodsImg;
	private String goodsDetail;
	private Double goodsMinPrice;
	private Double goodsMaxPrice;

	private Double orgMinPrice;
	private Double orgMaxPrice;

	/**
	 * 所在地
	 */
	private String location;
	/**
	 * 运费
	 */
	private Double deliveryFree;

	/**
	 * 库存
	 */
	private Integer goodsStock;

	/**
	 * 购买人数
	 */
	private Integer payCount;

	/**
	 * 1 级分类ID
	 */
	private Integer oneCategoryId;
	/**
	 * 2 级分类ID
	 */
	private Integer twoCategoryId;
	/**
	 * 3 级分类ID
	 */
	private Integer threeCategoryId;
	/**
	 * 品牌表的ID
	 */
	private Integer brandId;

	/**
	 * 上下架状态：0下架1上架
	 */
	private Integer publishStatus;
	/**
	 * 审核状态：0未审核，1已审核
	 */
	private Integer auditStatus;
	/**
	 * 所属卖家id
	 */
	private Integer sellerId;



}
