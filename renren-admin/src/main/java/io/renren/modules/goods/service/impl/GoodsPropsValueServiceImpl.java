package io.renren.modules.goods.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsPropsValue;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.goods.dao.GoodsPropsValueDao;
import io.renren.modules.goods.service.GoodsPropsValueService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("goodsPropsValueService")
public class GoodsPropsValueServiceImpl extends ServiceImpl<GoodsPropsValueDao, GoodsPropsValue> implements GoodsPropsValueService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GoodsPropsValue> page = this.selectPage(
                new Query<GoodsPropsValue>(params).getPage(),
                new EntityWrapper<GoodsPropsValue>()
        );

        return new PageUtils(page);
    }

}
