package io.renren.rabbitmq;

import io.renren.entity.MiaoshaOrder;
import io.renren.entity.UserEntity;
import io.renren.service.GoodsService;
import io.renren.service.MiaoshaOrderService;
import io.renren.utils.RedisTemplatesUtil;
import io.renren.vo.GoodsVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 消息发送
 * @author admin
 */
@Service
public class MQReceiver {

    private static Logger log = LoggerFactory.getLogger(MQReceiver.class);


    @Autowired
    GoodsService goodsService;

    /**
     * 秒杀订单service
     */
    @Autowired
    private MiaoshaOrderService miaoshaOrderService;


    @RabbitListener(queues = MQConfig.MIAOSHA_QUEUE)
    public void receive(String message) {
        log.info("receive message:" + message);
        MiaoshaMessage mm = RedisTemplatesUtil.gson.fromJson(message,MiaoshaMessage.class);
        UserEntity user = mm.getUser();
        long goodsId = mm.getGoodsId();

        GoodsVo goods = goodsService.getGoodsVoByGoodsId(goodsId);
        int stock = goods.getStockCount();
        if (stock <= 0) {
            return;
        }
        //判断是否已经秒杀到了
        MiaoshaOrder miaoshaOrder = miaoshaOrderService.getOrderByGoodsIdAndUserId(goods.getId(), user.getUserId());
        if (miaoshaOrder!=null){
            //已经秒杀过了
            return;
        }

        //减库存 下订单 写入秒杀订单
        miaoshaOrderService.secKill(goods, user);
    }

//		@RabbitListener(queues=MQConfig.QUEUE)
//		public void receive(String message) {
//			log.info("receive message:"+message);
//		}
//
//		@RabbitListener(queues=MQConfig.TOPIC_QUEUE1)
//		public void receiveTopic1(String message) {
//			log.info(" topic  queue1 message:"+message);
//		}
//
//		@RabbitListener(queues=MQConfig.TOPIC_QUEUE2)
//		public void receiveTopic2(String message) {
//			log.info(" topic  queue2 message:"+message);
//		}
//
//		@RabbitListener(queues=MQConfig.HEADER_QUEUE)
//		public void receiveHeaderQueue(byte[] message) {
//			log.info(" header  queue message:"+new String(message));
//		}
//

}
