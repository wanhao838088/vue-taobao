package io.renren.common.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

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
     * 价格
     */
    private Double priceMoney;


    /**
     * 库存
     */
    private Integer quantity;

    /**
     * sku名称
     */
    private String skuName;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 商品图
     */
    private String skuImg;
}
