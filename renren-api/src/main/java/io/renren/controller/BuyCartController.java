package io.renren.controller;

import io.renren.annotation.Login;
import io.renren.annotation.LoginUser;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.entity.buycart.BuyCart;
import io.renren.entity.goods.GoodsSku;
import io.renren.entity.user.UserEntity;
import io.renren.form.BuyCartAddForm;
import io.renren.service.buycart.BuyCartService;
import io.renren.service.goods.GoodsService;
import io.renren.service.goods.GoodsSkuService;
import io.renren.utils.ComputeUtil;
import io.renren.vo.GoodsVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Created by LiuLiHao on 2019/3/31 0031 下午 05:43
 * @author : LiuLiHao
 * 描述：购物车操作
 */
@RestController
@RequestMapping("/api/buyCart")
@Api(tags="购物车接口")
public class BuyCartController {
    @Autowired
    private BuyCartService buyCartService;

    @Autowired
    private GoodsSkuService skuService;

    @Autowired
    private GoodsService goodsService;

    /**
     * 添加商品到购物车
     * @return
     */
    @PostMapping(value = "addSku2Cart")
    @Login
    public R addSku2Cart(@RequestBody BuyCartAddForm form,@LoginUser UserEntity user){
        //表单校验
        ValidatorUtils.validateEntity(form);


        BuyCart buyCart = new BuyCart();
        buyCart.setAddTime(new Date());
        buyCart.setAmount(form.getAmount());
        buyCart.setSkuId(form.getSkuId());
        buyCart.setUserId(user.getUserId());
        GoodsSku goodsSku = skuService.selectById(form.getSkuId());
        GoodsVo goodsVo = goodsService.getByGoodsId(goodsSku.getGoodsId());
        //设置卖家信息
        buyCart.setSellerId(goodsVo.getSellerId());
        buyCart.setSellerName(goodsVo.getSellerName());
        //计算价格
        buyCart.setPrice(ComputeUtil.mul(goodsSku.getPriceMoney(), Double.valueOf(form.getAmount())));
        buyCartService.insert(buyCart);
        return R.ok();
    }
}
