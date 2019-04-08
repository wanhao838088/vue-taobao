package io.renren.vo;

import io.renren.entity.buycart.BuyCart;
import lombok.Data;

/**
 * Created by LiuLiHao on 2019/4/8 0008 下午 02:49
 * @author : LiuLiHao
 * 描述：购物项vo
 */
@Data
public class BuyCartVo extends BuyCart {
    /**
     * sku名称
     */
    private String skuName;

    /**
     * 单价
     */
    private Double priceMoney;

    /**
     * sku图片
     */
    private String skuImg;

    /**
     * 商品名称
     */
    private String goodsTitle;
}
