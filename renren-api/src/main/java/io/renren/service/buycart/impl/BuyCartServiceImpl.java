package io.renren.service.buycart.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.buycart.BuyCartDao;
import io.renren.entity.buycart.BuyCart;
import io.renren.service.buycart.BuyCartService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by LiuLiHao on 2019/3/7 0007 下午 03:57
 * @author : LiuLiHao
 * 描述：订单相关
 */
@Service
public class BuyCartServiceImpl extends ServiceImpl<BuyCartDao, BuyCart> implements BuyCartService {

    @Override
    public Page<BuyCart> getCartByPageNo(Long userId, Integer pageNo) {
        if (pageNo==null || pageNo<=0){
            pageNo  = 1;
        }
        Page<BuyCart> page = new Page<>(pageNo,10);

        EntityWrapper<BuyCart> wrapper = new EntityWrapper<>();
        //没有删除的
        wrapper.eq("del_flag",0);
        wrapper.setEntity(new BuyCart());
        return selectPage(page,wrapper);
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
}
