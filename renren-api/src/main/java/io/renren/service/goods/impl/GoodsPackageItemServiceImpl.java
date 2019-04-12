package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsPackageItem;
import io.renren.dao.goods.GoodsPackageItemDao;
import io.renren.service.goods.GoodsPackageItemService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author admin
 */
@Service
@Transactional
public class GoodsPackageItemServiceImpl extends ServiceImpl<GoodsPackageItemDao, GoodsPackageItem>
        implements GoodsPackageItemService {


}
