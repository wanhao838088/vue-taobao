package io.renren.service.user;


import com.baomidou.mybatisplus.service.IService;
import io.renren.common.entity.user.UserEntity;
import io.renren.form.CodeForm;
import io.renren.form.LoginForm;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 用户
 *
 * @author chenshun
 * @date 2017-03-23 15:22:06
 */
public interface UserService extends IService<UserEntity> {

	/**
	 * 查询
	 * @param mobile
	 * @return
	 */
	UserEntity queryByMobile(String mobile);

	/**
	 * 用户登录
	 * @param form    登录表单
	 * @return        返回登录信息
	 */
	Map<String, Object> login(LoginForm form,HttpServletRequest request);

	/**
	 * 获取短信验证码
	 * @param form
	 * @param request
	 * @return
	 */
    Map<String, Object> sendCode(CodeForm form,HttpServletRequest request);

	/**
	 * 手机号验证码登录
	 * @param form
	 * @param request
	 * @return token
	 */
	Map<String, Object> loginByCode(LoginForm form, HttpServletRequest request);
}
