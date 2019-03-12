package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.GoodsServiceEntityDao;
import io.renren.entity.GoodsServiceEntity;
import io.renren.service.GoodsServiceEntityService;
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
