package io.renren.service.goods;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.goods.GoodsImg;

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
