package io.renren.rabbitmq;

import io.renren.utils.RedisTemplatesUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 消息发送
 * @author admin
 */
@Service
public class MQSender {

	private static Logger log = LoggerFactory.getLogger(MQSender.class);

	@Autowired
	AmqpTemplate amqpTemplate ;

	public void sendMiaoshaMessage(MiaoshaMessage mm) {
		String msg = RedisTemplatesUtil.toJson(mm);
		amqpTemplate.convertAndSend(MQConfig.MIAOSHA_QUEUE, msg);
	}

}
