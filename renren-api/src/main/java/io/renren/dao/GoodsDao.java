package io.renren.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.Goods;
import io.renren.entity.MiaoshaGoods;
import io.renren.vo.GoodsVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 商品
 * @author admin
 * @date 2019年3月3日20:45:24
 */
public interface GoodsDao extends BaseMapper<Goods> {

    /**
     * 查询商品列表
     * @return
     */
    @Select("select g.*,mg.stock_count, mg.start_date, mg.end_date,mg.miaosha_price from miaosha_goods mg left join goods g on mg.goods_id = g.id")
    public List<GoodsVo> listGoodsVo();

    /**
     * 根据id 查询商品详情
     * @param goodsId
     * @return
     */
    @Select("select g.*,mg.stock_count, UNIX_TIMESTAMP(mg.start_date)*1000 startTime , UNIX_TIMESTAMP(mg.end_time)*1000 endTime" +
            ",mg.miaosha_price from miaosha_goods mg left join goods g on mg.goods_id = g.id where g.id = #{goodsId}")
    public GoodsVo getGoodsVoByGoodsId(@Param("goodsId")long goodsId);

    @Update("update miaosha_goods set stock_count = stock_count - 1 where goods_id = #{goodsId}")
    public int reduceStock(MiaoshaGoods g);


}
