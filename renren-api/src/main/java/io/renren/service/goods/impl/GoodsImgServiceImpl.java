package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsImg;
import io.renren.dao.goods.GoodsImgDao;
import io.renren.service.goods.GoodsImgService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author admin
 */
@Service
@Transactional
public class GoodsImgServiceImpl extends ServiceImpl<GoodsImgDao, GoodsImg> implements GoodsImgService {


    @Override
    @Transactional(readOnly = false)
    public List<GoodsImg> getByGoodsId(Long goodsId) {
        return baseMapper.getByGoodsId(goodsId);
    }
}
