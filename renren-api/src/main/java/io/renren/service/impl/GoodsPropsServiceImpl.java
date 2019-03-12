package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.GoodsPropsDao;
import io.renren.entity.GoodsProps;
import io.renren.service.GoodsPropsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author admin
 */
@Service
@Transactional
public class GoodsPropsServiceImpl extends ServiceImpl<GoodsPropsDao, GoodsProps> implements GoodsPropsService {


    @Override
    @Transactional(readOnly = false)
    public List<GoodsProps> getByGoodsId(Long goodsId) {
        return baseMapper.getByGoodsId(goodsId);
    }
}
