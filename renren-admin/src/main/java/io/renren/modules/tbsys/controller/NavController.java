package io.renren.modules.tbsys.controller;

import io.renren.common.entity.tbsys.TbNav;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.tbsys.service.NavService;
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
@RequestMapping("tbsys/nav")
public class NavController {
    @Autowired
    private NavService navService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("tbsys:nav:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = navService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tbsys:nav:info")
    public R info(@PathVariable("id") Integer id){
        TbNav nav = navService.selectById(id);

        return R.ok().put("nav", nav);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("tbsys:nav:save")
    public R save(@RequestBody TbNav nav){
        navService.insert(nav);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("tbsys:nav:update")
    public R update(@RequestBody TbNav nav){
        ValidatorUtils.validateEntity(nav);
        navService.updateAllColumnById(nav);//全部更新

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("tbsys:nav:delete")
    public R delete(@RequestBody Integer[] ids){
        navService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
