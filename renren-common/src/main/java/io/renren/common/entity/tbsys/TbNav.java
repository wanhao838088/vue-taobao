package io.renren.common.entity.tbsys;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/8 0008 下午 03:28
 * @author : LiuLiHao
 * 描述：nav 实体
 */
@TableName("tb_nav")
@Data
public class TbNav implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 用户ID
     */
    @TableId
    private Integer id;
    /**
     * 图片地址
     */
    private String imgUrl;
    /**
     * 链接地址
     */
    private String linkUrl;
    /**
     * 排序
     */
    @JsonIgnore
    private Integer orderNum;
    /**
     * 菜单导航名称
     */
    private String navName;
}
