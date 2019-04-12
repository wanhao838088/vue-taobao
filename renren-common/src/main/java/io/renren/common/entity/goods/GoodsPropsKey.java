package io.renren.common.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/12 0012 下午 04:42
 * @author : LiuLiHao
 * 描述：商品属性名
 */
@Data
@TableName("goods_props_key")
public class GoodsPropsKey implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    @TableId
    @JsonIgnore
    private Long id;

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
     * 所属品牌Id
     */
    private Integer brandId;
    /**
     * 是否允许别名
     */
    private Integer aliasFlag;
    /**
     * 是否颜色属性
     */
    private Integer colorFlag;
    /**
     * 是否销售属性
     */
    private Integer sellFlag;
    /**
     * 是否搜索字段
     */
    private Integer searchFlag;
    /**
     * 是否必须
     */
    private Integer needFlag;

}
