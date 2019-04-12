package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsDetailImg;
import io.renren.dao.goods.GoodsDetailImgDao;
import io.renren.service.goods.GoodsDetailImgService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 */
@Service
public class GoodsDetailImgServiceImpl extends ServiceImpl<GoodsDetailImgDao, GoodsDetailImg> implements GoodsDetailImgService {


    @Override
    public List<GoodsDetailImg> getByGoodsId(Long goodsId) {
        return baseMapper.getByGoodsId(goodsId);
    }
}
