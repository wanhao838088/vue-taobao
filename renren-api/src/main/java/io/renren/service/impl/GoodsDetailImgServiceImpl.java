package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.GoodsDetailImgDao;
import io.renren.entity.GoodsDetailImg;
import io.renren.service.GoodsDetailImgService;
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
