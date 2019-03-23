package io.renren.controller;

import io.renren.annotation.Login;
import io.renren.annotation.LoginUser;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.entity.MiaoshaOrder;
import io.renren.entity.UserEntity;
import io.renren.form.SecKillForm;
import io.renren.rabbitmq.MQSender;
import io.renren.rabbitmq.MiaoshaMessage;
import io.renren.service.GoodsService;
import io.renren.service.MiaoshaOrderService;
import io.renren.utils.RedisTemplatesUtil;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

/**
 * Created by LiuLiHao on 2019/3/7 0007 下午 02:28
 * @author : LiuLiHao
 * 描述：商品秒杀
 */
@RestController
@RequestMapping(value = "/api/secKill")
public class SecKillController implements InitializingBean {

    @Autowired
    private GoodsService goodsService;

    /**
     * 秒杀订单service
     */
    @Autowired
    private MiaoshaOrderService miaoshaOrderService;

    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    @Autowired
    private RedisTemplatesUtil redisTemplatesUtil;

    @Autowired
    MQSender sender;

    /**
     * 本地内存存储
     */
    private HashMap<Long, Boolean> localOverMap =  new HashMap<Long, Boolean>();

    /**
     * 秒杀一件商品
     * @return
     */
    @Login
    @PostMapping(value = "killGoods")
    public R secKill(@RequestBody SecKillForm form, @LoginUser UserEntity user){
        //检查表单
        ValidatorUtils.validateEntity(form);

        Long goodsId = form.getGoodsId();
        //先检查内存中的库存
        boolean over = localOverMap.get(goodsId);
        if(over) {
            return R.error("库存不足!");
        }

        //预减库存
        long stock =  redisTemplatesUtil.decrement(""+goodsId);
        if(stock < 0) {
            localOverMap.put(goodsId, true);
            return R.error("库存不足!");
        }

        //2 这个用户是否已经秒杀了这个商品
        MiaoshaOrder miaoshaOrder = miaoshaOrderService.getOrderByGoodsIdAndUserId(form.getGoodsId(), user.getUserId());
        if (miaoshaOrder!=null){
            //已经秒杀过了 再把库存加上
            redisTemplatesUtil.increment(""+goodsId);
            return R.error(300,"限购一件，请下次再来!");
        }
        //入队
        MiaoshaMessage mm = new MiaoshaMessage();
        mm.setUser(user);
        mm.setGoodsId(goodsId);
        sender.sendMiaoshaMessage(mm);

        return R.ok();
    }

    /**
     * orderId：成功
     * -1：秒杀失败
     * 0： 排队中
     * */
    @GetMapping(value="/result")
    @ResponseBody
    @Login
    public R miaoshaResult(@LoginUser UserEntity user,
                                      @RequestParam("goodsId")long goodsId) {
        long result = miaoshaOrderService.getMiaoshaResult(user.getUserId(), goodsId);
        return R.ok(result+"");
    }

    /**
     * 初始化的时候 把商品库存加载到redis和内存
     * @throws Exception
     */
    @Override
    public void afterPropertiesSet() throws Exception {
//        List<GoodsVo> goodsList = goodsService.listGoodsVo();
//        if(goodsList == null) {
//            return;
//        }
//        for(GoodsVo goods : goodsList) {
//            redisTemplate.opsForValue().set(""+goods.getId(), goods.getStockCount());
//            localOverMap.put(goods.getId(), false);
//        }
    }

}
