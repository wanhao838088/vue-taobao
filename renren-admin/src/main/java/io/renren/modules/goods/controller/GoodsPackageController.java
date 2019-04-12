package io.renren.modules.goods.controller;

import io.renren.common.entity.goods.GoodsPackage;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.goods.service.GoodsPackageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * 打包品表
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 11:18:05
 */
@RestController
@RequestMapping("goods/goodspackage")
public class GoodsPackageController {
    @Autowired
    private GoodsPackageService goodsPackageService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("goods:goodspackage:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = goodsPackageService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("goods:goodspackage:info")
    public R info(@PathVariable("id") Integer id){
        GoodsPackage goodsPackage = goodsPackageService.selectById(id);

        return R.ok().put("goodsPackage", goodsPackage);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("goods:goodspackage:save")
    public R save(@RequestBody GoodsPackage goodsPackage){
        goodsPackageService.insert(goodsPackage);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("goods:goodspackage:update")
    public R update(@RequestBody GoodsPackage goodsPackage){
        ValidatorUtils.validateEntity(goodsPackage);
        goodsPackageService.updateAllColumnById(goodsPackage);//全部更新

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("goods:goodspackage:delete")
    public R delete(@RequestBody Integer[] ids){
        goodsPackageService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
