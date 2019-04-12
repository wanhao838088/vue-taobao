package io.renren.modules.tbsys.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.tbsys.TbNews;
import io.renren.common.utils.PageUtils;

import java.util.Map;

/**
 * 淘宝新闻
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 09:30:36
 */
public interface NewsService extends IService<TbNews> {

    PageUtils queryPage(Map<String, Object> params);
}

