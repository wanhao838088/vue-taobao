package io.renren.modules.tbsys.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.tbsys.TbNews;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.tbsys.dao.NewsDao;
import io.renren.modules.tbsys.service.NewsService;
import org.springframework.stereotype.Service;

import java.util.Map;



@Service("newsService")
public class NewsServiceImpl extends ServiceImpl<NewsDao, TbNews> implements NewsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TbNews> page = this.selectPage(
                new Query<TbNews>(params).getPage(),
                new EntityWrapper<TbNews>()
        );

        return new PageUtils(page);
    }

}
