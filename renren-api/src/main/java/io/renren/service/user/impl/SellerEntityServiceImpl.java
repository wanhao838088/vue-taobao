package io.renren.service.user.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.user.SellerEntity;
import io.renren.dao.user.SellerEntityDao;
import io.renren.service.user.SellerEntityService;
import org.springframework.stereotype.Service;

/**
 * @author wanhao
 */
@Service
public class SellerEntityServiceImpl extends ServiceImpl<SellerEntityDao, SellerEntity>
		implements SellerEntityService {

}
