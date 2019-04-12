package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsServiceEntity;
import io.renren.dao.goods.GoodsServiceEntityDao;
import io.renren.service.goods.GoodsServiceEntityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author admin
 */
@Service
@Transactional
public class GoodsSerivceEntityServiceImpl extends ServiceImpl<GoodsServiceEntityDao, GoodsServiceEntity> implements GoodsServiceEntityService {


    @Override
    @Transactional(readOnly = false)
    public List<GoodsServiceEntity> getByGoodsId(Long goodsId) {
        return baseMapper.getByGoodsId(goodsId);
    }
}
