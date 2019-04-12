package io.renren.modules.tbsys.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.tbsys.TbBanner;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.tbsys.dao.BannerDao;
import io.renren.modules.tbsys.service.BannerService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("bannerService")
public class BannerServiceImpl extends ServiceImpl<BannerDao, TbBanner> implements BannerService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TbBanner> page = this.selectPage(
                new Query<TbBanner>(params).getPage(),
                new EntityWrapper<TbBanner>()
        );

        return new PageUtils(page);
    }

}
