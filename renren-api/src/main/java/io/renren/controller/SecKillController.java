package io.renren.controller;

import io.renren.annotation.Login;
import io.renren.annotation.LoginUser;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.entity.MiaoshaOrder;
import io.renren.entity.OrderInfo;
import io.renren.entity.UserEntity;
import io.renren.form.SecKillForm;
import io.renren.service.GoodsService;
import io.renren.service.MiaoshaOrderService;
import io.renren.service.OrderInfoService;
import io.renren.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by LiuLiHao on 2019/3/7 0007 下午 02:28
 * @author : LiuLiHao
 * 描述：商品秒杀
 */
@RestController
@RequestMapping(value = "/api/secKill")
public class SecKillController {

    @Autowired
    private GoodsService goodsService;

    /**
     * 秒杀订单service
     */
    @Autowired
    private MiaoshaOrderService miaoshaOrderService;

    /**
     * 订单service
     */
    @Autowired
    private OrderInfoService orderInfoService;

    /**
     * 秒杀一件商品
     * @return
     */
    @Login
    @PostMapping(value = "killGoods")
    public R secKill(@RequestBody SecKillForm form, @LoginUser UserEntity user){
        //检查表单
        ValidatorUtils.validateEntity(form);

        //1 检查库存
        GoodsVo goodsVo = goodsService.getGoodsVoByGoodsId(form.getGoodsId());
        Integer stockCount = goodsVo.getStockCount();
        if (stockCount<=0){
            //库存不足
            return R.error("库存不足!");
        }
        //2 这个用户是否已经秒杀了这个商品
        MiaoshaOrder miaoshaOrder = miaoshaOrderService.getOrderByGoodsIdAndUserId(form.getGoodsId(), user.getUserId());
        if (miaoshaOrder!=null){
            //已经秒杀过了
            return R.error("限购一件，请下次再来!");
        }
        //3 下订单
        OrderInfo orderInfo = orderInfoService.createOrder(goodsVo, user);
        return R.ok().put("orderInfo",orderInfo);
    }
}
