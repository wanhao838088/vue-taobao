package io.renren.dao.goods;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.goods.GoodsServiceEntity;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * GoodsService
 * @author admin
 * @date 2019年3月3日20:45:24
 */
public interface GoodsServiceEntityDao extends BaseMapper<GoodsServiceEntity> {

    /**
     * 查找商品服务
     * @param goodsId 商品id
     * @return
     */
    @Select("SELECT * FROM goods_service WHERE goods_id=#{goodsId} order by order_num asc")
    List<GoodsServiceEntity> getByGoodsId(@Param("goodsId") Long goodsId);
}
