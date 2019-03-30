package io.renren.dao.goods;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.goods.GoodsPropsKey;
import io.renren.vo.GoodsPropsVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * GoodsProps
 * @author admin
 * @date 2019年3月3日20:45:24
 */
public interface GoodsPropsKeyDao extends BaseMapper<GoodsPropsKey> {

    /**
     * 查找商品属性
     * @param branId 品牌id
     * @return
     */
    @Select("SELECT pk.prop_key,pk.brand_id,pv.value_name as prop_content " +
            " FROM goods_props_key pk JOIN goods_props_value pv" +
            " ON pk.id=pv.props_id WHERE pk.brand_id=#{branId}" +
            " ")
    List<GoodsPropsVo> getByBrandId(@Param("branId") Integer branId);

}
