package io.renren.modules.goods.controller;

import io.renren.common.entity.goods.GoodsPropsValue;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.goods.service.GoodsPropsValueService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 *
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 11:18:05
 */
@RestController
@RequestMapping("goods/goodspropsvalue")
public class GoodsPropsValueController {
    @Autowired
    private GoodsPropsValueService goodsPropsValueService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("goods:goodspropsvalue:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = goodsPropsValueService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("goods:goodspropsvalue:info")
    public R info(@PathVariable("id") Integer id){
        GoodsPropsValue goodsPropsValue = goodsPropsValueService.selectById(id);

        return R.ok().put("goodsPropsValue", goodsPropsValue);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("goods:goodspropsvalue:save")
    public R save(@RequestBody GoodsPropsValue goodsPropsValue){
        goodsPropsValueService.insert(goodsPropsValue);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("goods:goodspropsvalue:update")
    public R update(@RequestBody GoodsPropsValue goodsPropsValue){
        ValidatorUtils.validateEntity(goodsPropsValue);
        goodsPropsValueService.updateAllColumnById(goodsPropsValue);//全部更新

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("goods:goodspropsvalue:delete")
    public R delete(@RequestBody Integer[] ids){
        goodsPropsValueService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
