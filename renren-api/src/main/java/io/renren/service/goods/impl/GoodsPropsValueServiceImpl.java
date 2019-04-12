package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.goods.GoodsPropsValue;
import io.renren.dao.goods.GoodsPropsValueDao;
import io.renren.service.goods.GoodsPropsValueService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author admin
 */
@Service
@Transactional
public class GoodsPropsValueServiceImpl extends ServiceImpl<GoodsPropsValueDao, GoodsPropsValue>
        implements GoodsPropsValueService {


}
