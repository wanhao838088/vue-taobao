package io.renren.service.user.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.user.ReceiveAddrDao;
import io.renren.entity.user.ReceiveAddr;
import io.renren.service.user.ReceiveAddrService;
import org.springframework.stereotype.Service;

/**
 * @author wanhao
 */
@Service
public class ReceiveAddrServiceImpl extends ServiceImpl<ReceiveAddrDao, ReceiveAddr>
		implements ReceiveAddrService {

}
