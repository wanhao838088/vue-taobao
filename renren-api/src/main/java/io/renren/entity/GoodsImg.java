package io.renren.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/12 0012 上午 10:09
 * @author : LiuLiHao
 * 描述：商品顶部图片
 */
@Data
@TableName("goods_img")
public class GoodsImg implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 用户ID
     */
    @TableId
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
    private Integer orderNum;

}
