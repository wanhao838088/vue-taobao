package io.renren.rabbitmq;


import io.renren.common.entity.user.UserEntity;
import lombok.Data;

/**
 * 秒杀实体消息
 */
@Data
public class MiaoshaMessage {
	private UserEntity user;
	private long goodsId;

}
