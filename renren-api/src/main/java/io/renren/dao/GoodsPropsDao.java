package io.renren.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.GoodsProps;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * GoodsProps
 * @author admin
 * @date 2019年3月3日20:45:24
 */
public interface GoodsPropsDao extends BaseMapper<GoodsProps> {

    /**
     * 查找商品属性
     * @param goodsId 商品id
     * @return
     */
    @Select("SELECT * FROM goods_props WHERE goods_id=#{goodsId} order by order_num asc")
    List<GoodsProps> getByGoodsId(@Param("goodsId") Long goodsId);
}
