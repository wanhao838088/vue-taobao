package io.renren.controller;

import com.baomidou.mybatisplus.plugins.Page;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.entity.GoodsCategory;
import io.renren.form.CategorySearchForm;
import io.renren.service.GoodsCategoryService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by LiuLiHao on 2019/3/23 0023 上午 10:32
 * @author : LiuLiHao
 * 描述： 商品分类搜索
 */
@RestController
@RequestMapping("/api/goodsCategory")
@Api(tags="商品分类接口")
public class GoodsCategoryController {

    @Autowired
    private GoodsCategoryService categoryService;

    /**
     * 搜索商品分类
     * @return
     */
    @PostMapping(value = "search")
    public R search(@RequestBody CategorySearchForm form){
        //表单校验
        ValidatorUtils.validateEntity(form);

        Page<GoodsCategory> data = categoryService.queryData(form);
        return R.ok().put("data",data);
    }
}
