package io.renren.modules.tbsys.controller;

import io.renren.common.entity.tbsys.TbBanner;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.tbsys.service.BannerService;
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
 * @date 2019-04-12 10:58:44
 */
@RestController
@RequestMapping("tbsys/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("tbsys:banner:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = bannerService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tbsys:banner:info")
    public R info(@PathVariable("id") Integer id){
        TbBanner banner = bannerService.selectById(id);

        return R.ok().put("banner", banner);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("tbsys:banner:save")
    public R save(@RequestBody TbBanner banner){
        bannerService.insert(banner);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("tbsys:banner:update")
    public R update(@RequestBody TbBanner banner){
        ValidatorUtils.validateEntity(banner);
        bannerService.updateAllColumnById(banner);//全部更新

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("tbsys:banner:delete")
    public R delete(@RequestBody Integer[] ids){
        bannerService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
