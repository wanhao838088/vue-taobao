package io.renren.modules.goods.controller;

import io.renren.common.entity.goods.GoodsPropsKey;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.goods.service.GoodsPropsKeyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * 属性名
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 11:18:05
 */
@RestController
@RequestMapping("goods/goodspropskey")
public class GoodsPropsKeyController {
    @Autowired
    private GoodsPropsKeyService goodsPropsKeyService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("goods:goodspropskey:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = goodsPropsKeyService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("goods:goodspropskey:info")
    public R info(@PathVariable("id") Long id){
        GoodsPropsKey goodsPropsKey = goodsPropsKeyService.selectById(id);

        return R.ok().put("goodsPropsKey", goodsPropsKey);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("goods:goodspropskey:save")
    public R save(@RequestBody GoodsPropsKey goodsPropsKey){
        goodsPropsKeyService.insert(goodsPropsKey);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("goods:goodspropskey:update")
    public R update(@RequestBody GoodsPropsKey goodsPropsKey){
        ValidatorUtils.validateEntity(goodsPropsKey);
        goodsPropsKeyService.updateAllColumnById(goodsPropsKey);//全部更新

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("goods:goodspropskey:delete")
    public R delete(@RequestBody Long[] ids){
        goodsPropsKeyService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
