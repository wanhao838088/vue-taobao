package io.renren.entity.system;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by LiuLiHao on 2019/3/30 0030 下午 02:54
 * @author : LiuLiHao
 * 描述：地区信息
 */
@TableName("tb_area")
@Data
public class TbArea implements Serializable {

    /**
     * id
     */
    private Integer codeid;

    /**
     * 父id
     */
    private Integer parentid;

    /**
     * 城市名称
     */
    private String  cityname;

}
