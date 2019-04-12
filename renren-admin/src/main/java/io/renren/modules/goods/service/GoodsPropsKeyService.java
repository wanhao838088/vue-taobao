package io.renren.modules.goods.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.goods.GoodsPropsKey;
import io.renren.common.utils.PageUtils;

import java.util.Map;

/**
 * 属性名
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 11:18:05
 */
public interface GoodsPropsKeyService extends IService<GoodsPropsKey> {

    PageUtils queryPage(Map<String, Object> params);
}

