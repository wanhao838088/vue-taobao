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

package io.renren.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 购物车添加表单
 *
 * @author wanhao
 * @since 3.1.0 2018-01-25
 */
@ApiModel(value = "购物车添加表单")
@Data
public class BuyCartAddForm implements Serializable {

    @ApiModelProperty(value = "skuid")
    @NotNull(message="skuid不能为空")
    private Integer skuId;

    @ApiModelProperty(value = "数量")
    @NotNull(message="数量不能为空")
    private Integer amount;

}
