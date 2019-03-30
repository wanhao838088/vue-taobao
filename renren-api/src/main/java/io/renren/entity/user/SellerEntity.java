package io.renren.entity.user;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 02:42
 * @author : LiuLiHao
 * 描述：卖家
 */
@TableName("tb_seller")
@Data
public class SellerEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId
    private Long id;

    /**
     * 卖家名称
     */
    private String sellerName;

    /**
     * 卖家等级
     */
    private Integer sellerLevel;

    /**
     * 卖家保证金资质
     */
    private Integer aptitudeYuan;

}
