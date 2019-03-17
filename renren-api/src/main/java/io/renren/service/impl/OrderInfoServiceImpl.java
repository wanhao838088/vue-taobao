package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.OrderInfoDao;
import io.renren.entity.MiaoshaOrder;
import io.renren.entity.OrderInfo;
import io.renren.entity.UserEntity;
import io.renren.service.MiaoshaOrderService;
import io.renren.service.OrderInfoService;
import io.renren.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by LiuLiHao on 2019/3/7 0007 下午 03:57
 * @author : LiuLiHao
 * 描述：订单相关
 */
@Service
public class OrderInfoServiceImpl extends ServiceImpl<OrderInfoDao, OrderInfo> implements OrderInfoService {


    @Autowired
    private MiaoshaOrderService miaoshaOrderService;

    @Override
    @Transactional(readOnly = false)
    public OrderInfo createOrder(GoodsVo goods, UserEntity user) {
        //生成订单信息
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setCreateDate(new Date());
        orderInfo.setDeliveryAddrId(0L);
        orderInfo.setGoodsCount(1);
        orderInfo.setGoodsId(goods.getId());
        orderInfo.setGoodsName(goods.getGoodsTitle());
        orderInfo.setGoodsPrice(goods.getMiaoshaPrice());
        orderInfo.setOrderChannel(1);
        orderInfo.setStatus(0);
        orderInfo.setUserId(user.getUserId());

        //记录秒杀订单
        baseMapper.insert(orderInfo);
        MiaoshaOrder miaoshaOrder = new MiaoshaOrder();
        miaoshaOrder.setGoodsId(goods.getId());
        miaoshaOrder.setOrderId(orderInfo.getId());
        miaoshaOrder.setUserId(user.getUserId());
        miaoshaOrderService.insert(miaoshaOrder);
        return orderInfo;
    }
}
