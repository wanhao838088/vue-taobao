package io.renren.service.goods;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.goods.GoodsCategory;
import io.renren.form.CategorySearchForm;

/**
 * 商品分类
 * @author wanhao
 */
public interface GoodsCategoryService extends IService<GoodsCategory> {


    /**
     * 条件查询分类数据
     */
    Page<GoodsCategory> queryData(CategorySearchForm form);
}
