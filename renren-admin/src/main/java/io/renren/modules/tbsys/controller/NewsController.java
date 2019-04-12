package io.renren.modules.tbsys.controller;

import io.renren.common.entity.tbsys.TbNews;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.tbsys.service.NewsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * 淘宝新闻
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 09:30:36
 */
@RestController
@RequestMapping("sys/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:news:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = newsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("sys:news:info")
    public R info(@PathVariable("id") Integer id){
        TbNews news = newsService.selectById(id);

        return R.ok().put("news", news);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:news:save")
    public R save(@RequestBody TbNews news){
        newsService.insert(news);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:news:update")
    public R update(@RequestBody TbNews news){
        ValidatorUtils.validateEntity(news);
        newsService.updateAllColumnById(news);//全部更新

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:news:delete")
    public R delete(@RequestBody Integer[] ids){
        newsService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
