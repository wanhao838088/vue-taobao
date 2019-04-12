package io.renren.modules.goods.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsPropsKey;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.goods.dao.GoodsPropsKeyDao;
import io.renren.modules.goods.service.GoodsPropsKeyService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("goodsPropsKeyService")
public class GoodsPropsKeyServiceImpl extends ServiceImpl<GoodsPropsKeyDao, GoodsPropsKey> implements GoodsPropsKeyService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GoodsPropsKey> page = this.selectPage(
                new Query<GoodsPropsKey>(params).getPage(),
                new EntityWrapper<GoodsPropsKey>()
        );

        return new PageUtils(page);
    }

}
