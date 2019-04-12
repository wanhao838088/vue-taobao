package io.renren.dao.goods;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.common.entity.goods.GoodsDetailImg;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * GoodsDetailImg
 * @author admin
 * @date 2019年3月3日20:45:24
 */
public interface GoodsDetailImgDao extends BaseMapper<GoodsDetailImg> {

    /**
     * 查找商品详情图
     * @param goodsId 商品id
     * @return
     */
    @Select("SELECT * FROM goods_detail_img WHERE goods_id=#{goodsId} order by order_num asc")
    List<GoodsDetailImg> getByGoodsId(@Param("goodsId") Long goodsId);
}
