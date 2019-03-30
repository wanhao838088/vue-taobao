package io.renren.entity.user;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 02:46
 * @author : LiuLiHao
 * 描述： 买家等级
 */
@TableName("tb_buyer_level")
@Data
public class BuyerLevel implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId
    private Long id;

    /**
     * 级别名称
     */
    private String levelName;
    /**
     * 等级图片
     */
    private String levelImg;

    /**
     * 该等级最少积分
     */
    private Integer minScore;

    /**
     * 该等级最多积分
     */
    private Integer maxScore;

}
