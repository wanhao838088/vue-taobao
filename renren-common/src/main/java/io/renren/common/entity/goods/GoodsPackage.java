package io.renren.common.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 06:24
 * @author : LiuLiHao
 * 描述：打包品  一个订单可能包含多个商品，所以使用打包品来包装
 */
@Data
@TableName("goods_package")
public class GoodsPackage implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    @TableId
    @JsonIgnore
    private Integer id;

    /**
     * 打包品名称
     */
    private String pkgName;

    /**
     * 打包品key
     */
    private String pkgKey;

    /**
     * 打包品类型 1是组合sku 0是单个sku
     */
    private String pkgType;

    /**
     * 创建时间
     */
    private String createTime;


}
