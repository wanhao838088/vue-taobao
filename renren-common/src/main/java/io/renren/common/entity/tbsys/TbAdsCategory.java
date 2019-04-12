package io.renren.common.entity.tbsys;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/19 0019 下午 04:42
 * @author : LiuLiHao
 * 描述：广告类型
 */
@TableName("tb_ads_category")
@Data
public class TbAdsCategory implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    @TableId
    private Integer id;
    /**
     * 广告图片
     */
    private String adsImg;
    /**
     * 排序
     */
    @JsonIgnore
    private Integer orderNum;
    /**
     * 广告标题
     */
    private String adsTitle;
    /**
     * 点击广告连接
     */
    private String adsUrl;
    /**
     * 广告描述
     */
    private String adsDesc;
}
