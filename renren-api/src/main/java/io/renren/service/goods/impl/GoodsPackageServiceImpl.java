package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsPackage;
import io.renren.dao.goods.GoodsPackageDao;
import io.renren.service.goods.GoodsPackageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author admin
 */
@Service
@Transactional
public class GoodsPackageServiceImpl extends ServiceImpl<GoodsPackageDao, GoodsPackage>
        implements GoodsPackageService {


}
