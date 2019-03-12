package io.renren.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.GoodsImg;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * GoodsImg
 * @author admin
 * @date 2019年3月3日20:45:24
 */
public interface GoodsImgDao extends BaseMapper<GoodsImg> {

    /**
     * 查找商品图
     * @param goodsId 商品id
     * @return
     */
    @Select("SELECT * FROM goods_img WHERE goods_id=#{goodsId} order by order_num asc")
    List<GoodsImg> getByGoodsId(@Param("goodsId") Long goodsId);
}
