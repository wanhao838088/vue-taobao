package io.renren.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LiuLiHao on 2019/3/12 0012 上午 10:14
 * @author : LiuLiHao
 * 描述： 商品评论
 */
@Data
@TableName("goods_comment")
public class GoodsComment implements Serializable {
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
     * 评论用户名
     */
    private String userName;

    /**
     * 用户会员等级
     */
    private Integer userRating;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 评论时间
     */
    private Date commentTime;

    /**
     * 浏览次数
     */
    private Integer lookCount;
}
