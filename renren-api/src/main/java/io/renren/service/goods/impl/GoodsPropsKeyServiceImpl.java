package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.goods.GoodsPropsKeyDao;
import io.renren.entity.goods.GoodsPropsKey;
import io.renren.service.goods.GoodsPropsKeyService;
import io.renren.vo.GoodsPropsVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author admin
 */
@Service
@Transactional
public class GoodsPropsKeyServiceImpl extends ServiceImpl<GoodsPropsKeyDao, GoodsPropsKey> implements GoodsPropsKeyService {


    @Override
    @Transactional(readOnly = false)
    public List<GoodsPropsVo> getByBrandId(Integer branId) {
        return baseMapper.getByBrandId(branId);
    }
}
