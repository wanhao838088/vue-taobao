package io.renren.modules.tbsys.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.tbsys.TbNav;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.tbsys.dao.NavDao;
import io.renren.modules.tbsys.service.NavService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("navService")
public class NavServiceImpl extends ServiceImpl<NavDao, TbNav> implements NavService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TbNav> page = this.selectPage(
                new Query<TbNav>(params).getPage(),
                new EntityWrapper<TbNav>()
        );

        return new PageUtils(page);
    }

}
