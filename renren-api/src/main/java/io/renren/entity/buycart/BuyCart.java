package io.renren.entity.buycart;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 06:16
 * @author : LiuLiHao
 * 描述：购物车
 */
@Data
@TableName("order_buy_cart")
public class BuyCart implements Serializable {

    @TableId
    private Long id;

    /**
     * 用户id
     */
    private Long userId;
    /**
     * 卖家id
     */
    private Integer sellerId;
    /**
     * skuId
     */
    private Integer skuId;
    /**
     * 商品数量
     */
    private Integer amount;

    /**
     * 商品价格
     */
    private Double price;

    /**
     * 加入购物车时间
     */
    private Date addTime;
    /**
     * 最后修改时间
     */
    private Date modifiedTime;
    /**
     * 卖家名称
     */
    private String sellerName;

    /**
     * 删除标识
     */
    @JsonIgnore
    private Integer delFlag;
}
