package io.renren.modules.tbsys.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.tbsys.TbNav;
import io.renren.common.utils.PageUtils;

import java.util.Map;

/**
 *
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 10:58:44
 */
public interface NavService extends IService<TbNav> {

    PageUtils queryPage(Map<String, Object> params);
}

