package io.renren.controller;

import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import io.renren.common.utils.R;
import io.renren.entity.TbBanner;
import io.renren.entity.TbNav;
import io.renren.service.TbBannerService;
import io.renren.service.TbNavService;
import io.renren.utils.RedisTemplatesUtil;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Created by LiuLiHao on 2019/3/3 0003 下午 08:43
 * @author : LiuLiHao
 * 描述：首页信息处理
 */
@RestController
@RequestMapping("/api/msite")
@Api(tags="首页接口")
public class MSiteController {

    /**
     * nav导航
     */
    @Autowired
    private TbNavService navService;
    private Gson gson = new Gson();

    /**
     * banner展示
     */
    @Autowired
    private TbBannerService bannerService;

    @Autowired
    private RedisTemplatesUtil templatesUtil;

    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    private static final String BANNER = "banner";

    private static final String NAV = "nav";

    /**
     * 获取banner和nav
     * @return
     */
    @GetMapping("bannerAndNav")
    public R bannerList() {
        //查询banner
        Map<String,Object> map = Maps.newHashMap();
        String bannerString = templatesUtil.getListString(BANNER);

        List<TbBanner> tbBanners = gson.fromJson(bannerString, new TypeToken<List<TbBanner>>(){}.getType());
        if (tbBanners==null){
            tbBanners = bannerService.selectList(null);
            //存入
            templatesUtil.setList(BANNER,tbBanners);
            redisTemplate.expire(BANNER,3600, TimeUnit.SECONDS);
        }

        List<TbNav> tbNavs = gson.fromJson(templatesUtil.getListString(NAV),new TypeToken<List<TbNav>>(){}.getType());
        if (tbNavs==null){
            tbNavs = navService.selectList(null);
            //存入
            templatesUtil.setList(NAV,tbNavs);
            redisTemplate.expire(NAV,3600, TimeUnit.HOURS);
        }
        map.put("banners",tbBanners);
        map.put("navs",tbNavs);

        return R.ok(map);
    }


}
