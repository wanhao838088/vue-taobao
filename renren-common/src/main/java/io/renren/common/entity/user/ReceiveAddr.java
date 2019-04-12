package io.renren.common.entity.user;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 02:57
 * @author : LiuLiHao
 * 描述：收货地址
 */
@TableName("tb_receive_addr")
@Data
public class ReceiveAddr implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @TableId
    private Long id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 省
     */
    private Integer receiveProvince;
    /**
     * 市
     */
    private Integer receiveCity;
    /**
     * 区
     */
    private Integer receiveArea;

    /**
     * 收货人姓名
     */
    private String receivePeopleName;

    /**
     * 收货人手机号
     */
    private String receiveMobile;
    /**
     * 街道地址
     */
    private String receiveStreet;
    /**
     * 详细地址
     */
    private String receiveAddr;

    /**
     * 邮编
     */
    private String receiveCode;
    /**
     * 地址标签 家 公司 学校
     */
    private String addrLabel;

    /**
     * 是否是默认地址 1是
     */
    private Integer defaultFlag;

    /**
     * 是否删除
     */
    private Integer delFlag;

}
