package io.renren.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.GoodsProps;

import java.util.List;

/**
 * GoodsProps
 * @author admin
 */
public interface GoodsPropsService extends IService<GoodsProps> {


    /**
     * 查找商品属性
     * @param goodsId 商品id
     * @return
     */
    public List<GoodsProps> getByGoodsId(Long goodsId);

}
