package io.renren.service.buycart.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.buycart.BuyCart;
import io.renren.dao.buycart.BuyCartDao;
import io.renren.service.buycart.BuyCartService;
import io.renren.vo.BuyCartVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by LiuLiHao on 2019/3/7 0007 下午 03:57
 * @author : LiuLiHao
 * 描述：订单相关
 */
@Service
public class BuyCartServiceImpl extends ServiceImpl<BuyCartDao, BuyCart> implements BuyCartService {

    @Override
    public List<BuyCartVo> getCart(Long userId) {
        return baseMapper.getCartData(userId);
    }

    @Override
    @Transactional
    public void deleteCartItem(Integer skuId, Long userId) {
        BuyCart buyCart = new BuyCart();
        buyCart.setDelFlag(1);
        EntityWrapper<BuyCart> wrapper = new EntityWrapper<>();
        wrapper.eq("user_id",userId).and().eq("sku_id",skuId);
        baseMapper.update(buyCart,wrapper);
    }

    @Override
    @Transactional
    public int addCartItemCount(Integer skuId, Integer number) {
        return baseMapper.addCartItemCount(skuId,number);
    }
}
