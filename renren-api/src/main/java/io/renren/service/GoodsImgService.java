package io.renren.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.GoodsImg;

import java.util.List;

/**
 * banner
 * @author admin
 */
public interface GoodsImgService extends IService<GoodsImg> {


    /**
     * 查找商品图
     * @param goodsId 商品id
     * @return
     */
    public List<GoodsImg> getByGoodsId(Long goodsId);

}
