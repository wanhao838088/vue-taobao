package io.renren.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/7 0007 下午 02:32
 * @author : LiuLiHao
 * 描述：秒杀表单
 */
@ApiModel(value = "秒杀表单")
@Data
public class SecKillForm implements Serializable {

    @ApiModelProperty(value = "商品id")
    @NotNull(message="商品id不能为空")
    private Long goodsId;


}
