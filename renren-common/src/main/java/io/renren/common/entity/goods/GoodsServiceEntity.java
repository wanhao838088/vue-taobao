package io.renren.common.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/12 0012 下午 05:00
 * @author : LiuLiHao
 * 描述：商品服务
 */
@Data
@TableName("goods_service")
public class GoodsServiceEntity implements Serializable {
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
     * 服务名称
     */
    private String serviceKey;

    /**
     * 服务内容
     */
    private String serviceContent;
}
