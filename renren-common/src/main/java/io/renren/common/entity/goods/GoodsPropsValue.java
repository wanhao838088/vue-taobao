package io.renren.common.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LiuLiHao on 2019/3/12 0012 下午 04:42
 * @author : LiuLiHao
 * 描述：商品属性值
 */
@Data
@TableName("goods_props_value")
public class GoodsPropsValue implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    @TableId
    @JsonIgnore
    private Long id;

    /**
     * 所属品牌Id
     */
    private Integer brandId;

    /**
     * 属性名id
     */
    private Integer propsId;

    /**
     * 属性值
     */
    private String valueName;

    /**
     * 创建时间
     */
    private Date createTime;
}
