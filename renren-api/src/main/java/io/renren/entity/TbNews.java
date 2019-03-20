package io.renren.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/8 0008 下午 03:28
 * @author : LiuLiHao
 * 描述：新闻 实体
 */
@TableName("tb_news")
@Data
public class TbNews implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * ID
     */
    @TableId
    private Integer id;
    /**
     * 地址
     */
    private String newsUrl;
    /**
     * 排序
     */
    @JsonIgnore
    private Integer orderNum;
    /**
     * 新闻标题名称
     */
    private String newsName;
    /**
     * 新闻内容
     */
    private String newsContent;
}
