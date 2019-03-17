package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.GoodsSkuDao;
import io.renren.entity.GoodsImg;
import io.renren.entity.GoodsSku;
import io.renren.service.GoodsSkuService;
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
