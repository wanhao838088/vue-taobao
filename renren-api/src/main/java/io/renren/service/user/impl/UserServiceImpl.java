/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package io.renren.service.user.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.entity.tbsys.TokenEntity;
import io.renren.common.entity.user.LoginLog;
import io.renren.common.entity.user.UserEntity;
import io.renren.common.exception.RRException;
import io.renren.common.utils.IPUtils;
import io.renren.common.validator.Assert;
import io.renren.constants.SystemConstants;
import io.renren.dao.user.UserDao;
import io.renren.form.CodeForm;
import io.renren.form.LoginForm;
import io.renren.service.system.TokenService;
import io.renren.service.user.LoginLogService;
import io.renren.service.user.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author wanhao
 *
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements UserService {
	@Autowired
	private TokenService tokenService;

	/**
	 * 登录日志记录
	 */
	@Autowired
	private LoginLogService loginLogService;

	@Autowired
	private RedisTemplate<String,Object> redisTemplate;

	@Override
	public UserEntity queryByMobile(String mobile) {
		UserEntity userEntity = new UserEntity();
		userEntity.setMobile(mobile);
		return baseMapper.selectOne(userEntity);
	}

	@Override
	@Transactional
	public Map<String, Object> login(LoginForm form,HttpServletRequest request) {
		UserEntity user = queryByMobile(form.getMobile());
		Assert.isNull(user, "手机号或密码错误");

		//密码错误
		if(!user.getPassword().equals(DigestUtils.sha256Hex(form.getPassword()))){
			throw new RRException("手机号或密码错误");
		}

		//获取登录token
		TokenEntity tokenEntity = tokenService.createToken(user.getUserId());

		//记录登录日志
		recordLog(request,form,user);

		Map<String, Object> map = new HashMap<>(2);
		map.put("token", tokenEntity.getToken());
		map.put("expire", tokenEntity.getExpireTime().getTime() - System.currentTimeMillis());

		return map;
	}

	/**
	 * 登录日志记录
	 * @param request 请求
	 * @param form 表单
	 * @param user 用户
	 */
	private void recordLog(HttpServletRequest request,LoginForm form,UserEntity user){
		//记录登录日志
		LoginLog loginLog = new LoginLog();
		String ipAddr = IPUtils.getIpAddr(request);
		loginLog.setLoginTime(new Date());
		loginLog.setLoginType(form.getLoginType());
		loginLog.setUserId(user.getUserId());
		loginLog.setLoginIp(ipAddr);
		loginLogService.insert(loginLog);
	}

	@Override
	public Map<String, Object> sendCode(CodeForm form,HttpServletRequest request) {
		//获取时间设置60秒过期  ip+手机号 同个ip的手机号 60秒获取一次
		String ipAddr = IPUtils.getIpAddr(request);
		String ipAndMob = ipAddr+ipAddr;
		CodeForm org = (CodeForm) redisTemplate.opsForValue().get(ipAndMob);

		Map<String, Object> map = new HashMap<>(2);

		if (org==null){
			//看之前是否获取过了手机号
			CodeForm temp = (CodeForm) redisTemplate.opsForValue().get(form.getMobile());

			String code = null;
			if (temp==null){
				//生成新的验证码返回
				code =  RandomStringUtils.randomNumeric(6);
				temp = new CodeForm();
				temp.setCode(code);
				temp.setDeviceId(form.getDeviceId());
				temp.setMobile(form.getMobile());
				redisTemplate.opsForValue().set(form.getMobile(),temp);
				redisTemplate.expire(form.getMobile(),60*5, TimeUnit.SECONDS);
				//todo 调用发送方法
			}else {
				code = temp.getCode();
				temp = new CodeForm();
				temp.setCode(code);
				temp.setDeviceId(form.getDeviceId());
				temp.setMobile(form.getMobile());
				//todo 调用发送方法
			}
			org = temp;
			System.out.println("验证码是: "+code);
			redisTemplate.opsForValue().set(ipAndMob,org);
			redisTemplate.expire(ipAndMob,60, TimeUnit.SECONDS);
		}else{
			//不能重复获取
			throw new RRException("不能重复获取验证码!");
		}
		return map;
	}

	@Override
	public Map<String, Object> loginByCode(LoginForm form, HttpServletRequest request) {
		CodeForm temp = (CodeForm) redisTemplate.opsForValue().get(form.getMobile());
		if (temp==null){
			throw new RRException("短信验证码已过期!");
		}
		//检查验证码是否正确
		if(!StringUtils.contains(form.getPassword(),temp.getCode())){
			throw new RRException("短信验证码错误!");
		}
		Map<String, Object> map = new HashMap<>(2);
		//如果这个用户没有  在数据库保存用户
		UserEntity user = queryByMobile(form.getMobile());
		if (user==null){
			//保存用户
			user = new UserEntity();
			user.setMobile(form.getMobile());
			user.setUsername(form.getMobile());
			//存放123456 不让使用密码登录
			user.setPassword(SystemConstants.PASSWORD);
			user.setCreateTime(new Date());
			this.insert(user);
		}
		//保存登录信息
		user.setLoginTime(new Date());
		user.setIp(IPUtils.getIpAddr(request));
		this.updateById(user);

		//记录登录日志
		recordLog(request,form,user);

		//获取登录token
		TokenEntity tokenEntity = tokenService.createToken(user.getUserId());

		map.put("token", tokenEntity.getToken());
		map.put("expire", tokenEntity.getExpireTime().getTime() - System.currentTimeMillis());

		return map;
	}

}
