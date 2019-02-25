package io.renren.controller;


import io.renren.annotation.Login;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.form.CodeForm;
import io.renren.form.LoginForm;
import io.renren.service.TokenService;
import io.renren.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 登录接口
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-23 15:31
 */
@RestController
@RequestMapping("/api")
@Api(tags="登录接口")
public class ApiLoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;


    @PostMapping("login")
    @ApiOperation("手机号密码登录")
    public R login(@RequestBody LoginForm form){
        //表单校验
        ValidatorUtils.validateEntity(form);

        //用户登录
        Map<String, Object> map = userService.login(form);

        return R.ok(map);
    }

    /**
     * 使用短信验证码登录
     * @param form
     * @return
     */
    @PostMapping("loginByCode")
    @ApiOperation("手机号验证码登录")
    public R loginByCode(@RequestBody LoginForm form, HttpServletRequest request){
        //表单校验
        ValidatorUtils.validateEntity(form);

        //用户登录
        Map<String, Object> map = userService.loginByCode(form,request);

        return R.ok(map);
    }

    /**
     * 获取手机验证码
     * @param
     * @return
     */
    @PostMapping("getCode")
    @ApiOperation("获取手机验证码")
    public R getCode(@RequestBody CodeForm form){
        //表单校验
        ValidatorUtils.validateEntity(form);
        //发送验证码
        Map<String, Object> map = userService.sendCode(form);

        return R.ok(map);
    }

    @Login
    @PostMapping("logout")
    @ApiOperation("退出")
    public R logout(@ApiIgnore @RequestAttribute("userId") long userId){
        tokenService.expireToken(userId);
        return R.ok();
    }

}
