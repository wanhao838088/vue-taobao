package io.renren.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.GoodsServiceEntity;

import java.util.List;

/**
 * GoodsServiceEntity
 * @author admin
 */
public interface GoodsServiceEntityService extends IService<GoodsServiceEntity> {


    /**
     * 查找商品服务
     * @param goodsId 商品id
     * @return
     */
    public List<GoodsServiceEntity> getByGoodsId(Long goodsId);

}
