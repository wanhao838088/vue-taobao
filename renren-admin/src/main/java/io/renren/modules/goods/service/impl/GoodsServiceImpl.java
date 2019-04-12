package io.renren.modules.goods.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.Goods;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.goods.dao.GoodsDao;
import io.renren.modules.goods.service.GoodsService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("goodsService")
public class GoodsServiceImpl extends ServiceImpl<GoodsDao, Goods> implements GoodsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<Goods> page = this.selectPage(
                new Query<Goods>(params).getPage(),
                new EntityWrapper<Goods>()
        );

        return new PageUtils(page);
    }

}
