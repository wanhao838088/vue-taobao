package com.api.test;

import io.renren.constants.SystemConstants;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

/**
 * Created by LiuLiHao on 2019/2/25 0025 下午 02:07
 * @author : LiuLiHao
 * 描述：
 */
public class TestPwd {


    @Test
    public void test1(){
        System.out.println(DigestUtils.sha256Hex(SystemConstants.PASSWORD));
    }
}
