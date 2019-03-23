package io.renren.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.GoodsCategoryDao;
import io.renren.entity.GoodsCategory;
import io.renren.form.CategorySearchForm;
import io.renren.service.GoodsCategoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 商品分类
 * @author wanhao
 */
@Service
@Transactional
public class GoodsCategoryServiceImpl extends ServiceImpl<GoodsCategoryDao,
        GoodsCategory> implements GoodsCategoryService {


    @Override
    @Transactional(readOnly = true)
    public Page<GoodsCategory> queryData(CategorySearchForm form) {
        Page<GoodsCategory> page = new Page<>();
        page.setSize(10);
        page.setCurrent(form.getPageNo());

        EntityWrapper<GoodsCategory> wrapper = new EntityWrapper<>();
        wrapper.setEntity(new GoodsCategory());
        //分类标题
        wrapper.like("name_cn",form.getCcame());
        Page<GoodsCategory> data = selectPage(page, wrapper);
        return data;
    }
}
