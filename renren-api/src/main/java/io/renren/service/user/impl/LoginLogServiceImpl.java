package io.renren.service.user.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.user.LoginLog;
import io.renren.dao.user.LoginLogDao;
import io.renren.service.user.LoginLogService;
import org.springframework.stereotype.Service;

/**
 * @author wanhao
 */
@Service
public class LoginLogServiceImpl extends ServiceImpl<LoginLogDao, LoginLog>
		implements LoginLogService {

}
