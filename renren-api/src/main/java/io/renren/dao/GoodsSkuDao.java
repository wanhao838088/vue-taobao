package io.renren.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.GoodsSku;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * sku
 * @author admin
 * @date 2019年3月17日15:45:59
 */
public interface GoodsSkuDao extends BaseMapper<GoodsSku> {

    /**
     * 查找sku
     * @param goodsId 商品id
     * @return
     */
    @Select("SELECT * FROM goods_sku WHERE goods_id=#{goodsId}")
    List<GoodsSku> getByGoodsId(@Param("goodsId") Long goodsId);
}
