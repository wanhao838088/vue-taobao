package io.renren.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/17 0017 下午 03:35
 * @author : LiuLiHao
 * 描述： sku
 */
@Data
@TableName("goods_sku")
public class GoodsSku implements Serializable {
    @TableId
    private Long id;
    /**
     * 商品id
     */
    private Long goodsId;

    /**
     * 真实价格  分为单位
     */
    private Integer priceMoney;

    /**
     * 价格文本
     */
    private String priceText;

    /**
     * 库存
     */
    private Integer quantity;

    /**
     * sku名称
     */
    private String skuName;
}
