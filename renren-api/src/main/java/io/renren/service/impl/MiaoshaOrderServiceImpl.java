package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.MiaoshaOrderDao;
import io.renren.entity.MiaoshaOrder;
import io.renren.service.MiaoshaOrderService;
import org.springframework.stereotype.Service;

/**
 * Created by LiuLiHao on 2019/3/7 0007 下午 03:57
 *
 * @author : LiuLiHao
 * 描述：
 */
@Service
public class MiaoshaOrderServiceImpl extends ServiceImpl<MiaoshaOrderDao, MiaoshaOrder> implements MiaoshaOrderService {

    @Override
    public MiaoshaOrder getOrderByGoodsIdAndUserId(Long goodsId, Long userId) {
        return baseMapper.getOrderByGoodsIdAndUserId(goodsId,userId);
    }

}
