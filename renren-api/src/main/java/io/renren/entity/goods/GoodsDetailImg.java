package io.renren.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/12 0012 上午 10:14
 * @author : LiuLiHao
 * 描述： 商品详情图片
 */
@Data
@TableName("goods_detail_img")
public class GoodsDetailImg implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 用户ID
     */
    @TableId
    @JsonIgnore
    private Long id;

    /**
     * 商品id
     */
    private Long goodsId;

    /**
     * 图片地址
     */
    private String imgUrl;
    /**
     * 排序
     */
    @JsonIgnore
    private Integer orderNum;
}
