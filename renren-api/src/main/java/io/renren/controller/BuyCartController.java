package io.renren.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
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
import io.renren.vo.BuyCartVo;
import io.renren.vo.GoodsVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

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

    /**
     * 查询购物车里面商品
     * @param user
     * @return
     */
    @Login
    @GetMapping(value = "getBuyCartData")
    public R getBuyCartData(@LoginUser UserEntity user){
        List<BuyCartVo> list = buyCartService.getCart(user.getUserId());
        List<Map<String,Object>> result = Lists.newArrayList();

        Map<String,List<BuyCartVo>> temp = Maps.newHashMap();

        if (list!=null && list.size()>0){
            for (BuyCartVo vo : list) {
                if (temp.containsKey(vo.getSellerName())){
                    temp.get(vo.getSellerName()).add(vo);
                }else {
                    List<BuyCartVo> voList = Lists.newArrayList();
                    voList.add(vo);
                    temp.put(vo.getSellerName(),voList);
                }
            }
            //拼接结果
            for (Map.Entry<String, List<BuyCartVo>> entry : temp.entrySet()) {
                String key = entry.getKey();
                List<BuyCartVo> value = entry.getValue();

                Map<String,Object> map = Maps.newHashMap();
                map.put("name",key);
                map.put("list",value);
                result.add(map);
            }
        }

        return R.ok().put("data",result);
    }

    /**
     * 删除购物项
     * @param skuId sku
     * @param user
     * @return 标记删除为1
     */
    @Login
    @GetMapping(value = "deleteCartItem")
    public R deleteCartItem(Integer skuId,@LoginUser UserEntity user){
        buyCartService.deleteCartItem(skuId,user.getUserId());
        return R.ok();
    }

}
