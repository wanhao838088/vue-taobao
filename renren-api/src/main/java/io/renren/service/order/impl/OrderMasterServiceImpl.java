package io.renren.service.order.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.order.OrderMasterDao;
import io.renren.entity.seckill.MiaoshaOrder;
import io.renren.entity.order.OrderMaster;
import io.renren.entity.user.UserEntity;
import io.renren.service.seckill.MiaoshaOrderService;
import io.renren.service.order.OrderMasterService;
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
public class OrderMasterServiceImpl extends ServiceImpl<OrderMasterDao, OrderMaster> implements OrderMasterService {


    @Autowired
    private MiaoshaOrderService miaoshaOrderService;

    @Override
    @Transactional(readOnly = false)
    public OrderMaster createOrder(GoodsVo goods, UserEntity user) {
        //生成订单信息
        OrderMaster orderMaster = new OrderMaster();
        orderMaster.setCreateDate(new Date());
        orderMaster.setDeliveryAddrId(0L);
        orderMaster.setOrderChannel(1);
        orderMaster.setStatus(0);
        orderMaster.setUserId(user.getUserId());

        //记录秒杀订单
        baseMapper.insert(orderMaster);
        MiaoshaOrder miaoshaOrder = new MiaoshaOrder();
        miaoshaOrder.setGoodsId(goods.getId());
        miaoshaOrder.setOrderId(orderMaster.getId());
        miaoshaOrder.setUserId(user.getUserId());
        miaoshaOrderService.insert(miaoshaOrder);
        return orderMaster;
    }
}
