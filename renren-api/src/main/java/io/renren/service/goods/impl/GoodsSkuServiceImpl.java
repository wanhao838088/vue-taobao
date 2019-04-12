package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsSku;
import io.renren.dao.goods.GoodsSkuDao;
import io.renren.service.goods.GoodsSkuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author admin
 */
@Service
@Transactional
public class GoodsSkuServiceImpl extends ServiceImpl<GoodsSkuDao, GoodsSku> implements GoodsSkuService {


    @Override
    @Transactional(readOnly = false)
    public List<GoodsSku> getByGoodsId(Long goodsId) {
        return baseMapper.getByGoodsId(goodsId);
    }
}
