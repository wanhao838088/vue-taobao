package io.renren.common.entity.order;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单主表
 * @author admin
 */
@Data
@TableName("order_master")
public class OrderMaster implements Serializable {
	@TableId
	private Long id;

	/**
	 * 用户
	 */
	private Long userId;
	/**
	 * 打包品id
	 */
	private Long pkgId;

	/**
	 * 收货地址id
	 */
	private Long  deliveryAddrId;
	/**
	 * 1pc 2android 3ios
	 */
	private Integer orderChannel;
	/**
	 * 订单状态 0新建 1已支付 2 已发货 3已收货 4已退款 5已完成
	 */
	private Integer status;
	/**
	 * 订单创建时间
	 */
	private Date createDate;
	/**
	 * 支付时间
	 */
	private Date payDate;

	/**
	 * 订单号 使用snowFlake生成
	 */
	private String orderSn;

	/**
	 * 省
	 */
	private Integer province;
	/**
	 * 市
	 */
	private Integer city;
	/**
	 * 区
	 */
	private Integer area;

	/**
	 * 详细地址
	 */
	private String address;
	/**
	 * 支付方式：1现金，2余额，3网银，4支付宝，5微信
	 */
	private Integer paymentMethod;
	/**
	 * 订单金额
	 */
	private Double orderMoney;

	/**
	 * 优惠金额
	 */
	private Double districtMoney;

	/**
	 * 支付金额
	 */
	private Double paymentMoney;
	/**
	 * 快递公司名称
	 */
	private String shippingCompName;
	/**
	 * 快递单号
	 */
	private String shippingSn;
	/**
	 * 发货时间
	 */
	private Date shippingTime;
	/**
	 * 收货时间
	 */
	private Date receiveTime;

	/**
	 * 订单积分
	 */
	private Integer orderPoint;

	/**
	 * 是否被用户删除
	 */
	private Integer delFlag;
}
