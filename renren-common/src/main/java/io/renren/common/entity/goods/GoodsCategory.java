package io.renren.common.entity.goods;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/22 0022 下午 09:19
 * @author : LiuLiHao
 * 描述：商品类目
 */
@Data
@TableName("goods_category")
public class GoodsCategory implements Serializable {
    @TableId
    private Integer id;

    /**
     * 父Id
     */
    private Integer pid;

    /**
     * 当前层级 默认从1开始
     */
    private Integer level;

    /**
     * 商品所属的根id
     */
    private Integer rootId;

    /**
     * 分类的中文名称
     */
    private String nameCn;

    /**
     * 商品所属根分类名称
     */
    private String rootName;

}
