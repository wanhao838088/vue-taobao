package io.renren.modules.goods.controller;

import io.renren.common.entity.goods.GoodsSku;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.goods.service.GoodsSkuService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * sku表
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 11:18:05
 */
@RestController
@RequestMapping("goods/goodssku")
public class GoodsSkuController {
    @Autowired
    private GoodsSkuService goodsSkuService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("goods:goodssku:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = goodsSkuService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("goods:goodssku:info")
    public R info(@PathVariable("id") Long id){
        GoodsSku goodsSku = goodsSkuService.selectById(id);

        return R.ok().put("goodsSku", goodsSku);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("goods:goodssku:save")
    public R save(@RequestBody GoodsSku goodsSku){
        goodsSkuService.insert(goodsSku);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("goods:goodssku:update")
    public R update(@RequestBody GoodsSku goodsSku){
        ValidatorUtils.validateEntity(goodsSku);
        goodsSkuService.updateAllColumnById(goodsSku);//全部更新

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("goods:goodssku:delete")
    public R delete(@RequestBody Long[] ids){
        goodsSkuService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
