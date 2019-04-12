package io.renren.service.goods;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.goods.GoodsPropsKey;
import io.renren.vo.GoodsPropsVo;

import java.util.List;

/**
 * GoodsProps
 * @author admin
 */
public interface GoodsPropsKeyService extends IService<GoodsPropsKey> {


    /**
     * 查找商品属性
     * @param branId 品牌id
     * @return
     */
    public List<GoodsPropsVo> getByBrandId(Integer branId);

}
