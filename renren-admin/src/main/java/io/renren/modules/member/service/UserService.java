package io.renren.modules.member.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.user.UserEntity;
import io.renren.common.utils.PageUtils;

import java.util.Map;

/**
 * 用户
 *
 * @author liulihao
 * @email 838088516@qq.com
 * @date 2019-04-18 15:55:16
 */
public interface UserService extends IService<UserEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

