package io.renren.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/12 0012 下午 04:42
 * @author : LiuLiHao
 * 描述：商品属性列表
 */
@Data
@TableName("goods_props")
public class GoodsProps implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    @TableId
    @JsonIgnore
    private Long id;

    /**
     * 商品id
     */
    @JsonIgnore
    private Long goodsId;

    /**
     * 排序
     */
    @JsonIgnore
    private Integer orderNum;

    /**
     * 属性名称
     */
    private String propKey;

    /**
     * 属性内容
     */
    private String propContent;

}
