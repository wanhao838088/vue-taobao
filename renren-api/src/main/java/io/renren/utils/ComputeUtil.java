package io.renren.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Created by LiuLiHao on 2018/7/25 22:05.
 * 描述： double计算工具类
 * 作者： LiuLiHao
 */
public class ComputeUtil {

    /**
     * 默认除法运算精度
     */
    private static final Integer DEF_DIV_SCALE = 2;

    /**
     * 加法
     * @param value1
     * @param value2
     * @return
     */
    public static Double add(Double value1, Double value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.add(b2).doubleValue();
    }


    /**
     * 减法
     * @param value1
     * @param value2
     * @return
     */
    public static double sub(Double value1, Double value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.subtract(b2).doubleValue();
    }


    /**
     * 乘法
     * @param value1
     * @param value2
     * @return
     */
    public static Double mul(Double value1, Double value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.multiply(b2).doubleValue();
    }

    /**
     * 除法
     * @param dividend
     * @param divisor
     * @return
     */
    public static Double divide(Double dividend, Double divisor) {
        return divide(dividend, divisor, DEF_DIV_SCALE);
    }

    public static Double divide(Double dividend, Double divisor, Integer scale) {
        if (scale < 0) {
            throw new IllegalArgumentException("The scale must be a positive integer or zero");
        }

        BigDecimal b1 = new BigDecimal(Double.toString(dividend));
        BigDecimal b2 = new BigDecimal(Double.toString(divisor));
        return b1.divide(b2, scale, RoundingMode.HALF_UP).doubleValue();
    }
}
