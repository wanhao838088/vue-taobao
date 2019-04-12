package io.renren.modules.goods.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.goods.GoodsPackage;
import io.renren.common.utils.PageUtils;

import java.util.Map;

/**
 * 打包品表
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-12 11:18:05
 */
public interface GoodsPackageService extends IService<GoodsPackage> {

    PageUtils queryPage(Map<String, Object> params);
}

