package io.renren.common.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 06:24
 * @author : LiuLiHao
 * 描述：打包品  一个订单可能包含多个商品，所以使用打包品来包装
 */
@Data
@TableName("goods_package_item")
public class GoodsPackageItem implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    @TableId
    @JsonIgnore
    private Integer id;

    /**
     * 打包品id
     */
    private Integer pkgId;

    /**
     * sku id
     */
    private Integer skuId;

    /**
     * 商品数量
     */
    private Integer amount;

    /**
     * 价格
     */
    private Double price;

    /**
     * 创建时间
     */
    private Date createTime;
}
