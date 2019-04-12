package io.renren.modules.goods.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsSku;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.goods.dao.GoodsSkuDao;
import io.renren.modules.goods.service.GoodsSkuService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("goodsSkuService")
public class GoodsSkuServiceImpl extends ServiceImpl<GoodsSkuDao, GoodsSku> implements GoodsSkuService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GoodsSku> page = this.selectPage(
                new Query<GoodsSku>(params).getPage(),
                new EntityWrapper<GoodsSku>()
        );

        return new PageUtils(page);
    }

}
