package io.renren.modules.goods.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.goods.GoodsSku;
import io.renren.common.utils.PageUtils;

import java.util.Map;

/**
 * sku表
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 11:18:05
 */
public interface GoodsSkuService extends IService<GoodsSku> {

    PageUtils queryPage(Map<String, Object> params);
}

