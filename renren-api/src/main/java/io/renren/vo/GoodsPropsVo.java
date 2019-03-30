package io.renren.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 09:59
 * @author : LiuLiHao
 * 描述：商品属性和值的拼接
 */
@Data
public class GoodsPropsVo implements Serializable {

    private String propKey;
    private String propContent;

}
