package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsComment;
import io.renren.dao.goods.GoodsCommentDao;
import io.renren.service.goods.GoodsCommentService;
import org.springframework.stereotype.Service;

/**
 * @author admin
 */
@Service
public class GoodsCommentServiceImpl extends ServiceImpl<GoodsCommentDao, GoodsComment> implements GoodsCommentService {


    @Override
    public Integer getCount() {
        return baseMapper.selectCount(null);
    }
}
