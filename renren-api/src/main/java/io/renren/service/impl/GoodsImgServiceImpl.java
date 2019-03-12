package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.GoodsImgDao;
import io.renren.entity.GoodsImg;
import io.renren.service.GoodsImgService;
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
