package io.renren.entity.user;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 02:50
 * @author : LiuLiHao
 * 描述：登录日志记录
 */
@TableName("tb_login_log")
@Data
public class LoginLog implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId
    private Long id;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 登录方式 1web 2安卓 3ios
     */
    private Integer loginType;

    /**
     * 用户登陆时间
     */
    private Date loginTime;

    /**
     * 登录ip
     */
    private String loginIp;
}
