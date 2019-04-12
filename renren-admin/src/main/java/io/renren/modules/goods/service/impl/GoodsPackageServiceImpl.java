package io.renren.modules.goods.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsPackage;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.goods.dao.GoodsPackageDao;
import io.renren.modules.goods.service.GoodsPackageService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("goodsPackageService")
public class GoodsPackageServiceImpl extends ServiceImpl<GoodsPackageDao, GoodsPackage> implements GoodsPackageService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GoodsPackage> page = this.selectPage(
                new Query<GoodsPackage>(params).getPage(),
                new EntityWrapper<GoodsPackage>()
        );

        return new PageUtils(page);
    }

}
