package io.renren.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/21 0021 下午 08:57
 * @author : LiuLiHao
 * 描述：广告商品
 */
@TableName("tb_ads_goods")
@Data
public class TbAdsGoods implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    @TableId
    private Integer id;
    /**
     * 商品图片
     */
    private String goodsImg;

    private Long goodsId;
    /**
     * 广告类型id
     */
    private Integer categoryId;

}
