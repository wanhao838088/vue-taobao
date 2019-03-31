package io.renren.dao.goods;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.entity.goods.Goods;
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
    @Select("select g.*,mg.stock_count, mg.start_date, mg.end_date,mg.miaosha_price from miaosha_goods mg right join goods g on mg.goods_id = g.id")
    public List<GoodsVo> listGoodsVo();

    /**
     * 根据id 查询商品详情
     * @param goodsId
     * @return
     */
    @Select("select g.*,mg.stock_count, UNIX_TIMESTAMP(mg.start_date)*1000 startTime , UNIX_TIMESTAMP(mg.end_date)*1000 endTime" +
            ",mg.miaosha_price from miaosha_goods mg right join goods g on mg.goods_id = g.id where g.id = #{goodsId}")
    public GoodsVo getGoodsVoByGoodsId(@Param("goodsId")long goodsId);


    /**
     * 减少秒杀商品的库存
     * @param id 商品id
     * @return
     */
    @Update("update miaosha_goods set stock_count = stock_count - 1 where goods_id = #{goodsId} and stock_count>0")
    int decCount(Long id);

    /**
     * 根据商品Id查找
     * @param goodsId
     * @return
     */
    @Select("SELECT gd.*,ts.seller_name FROM goods gd JOIN tb_seller ts ON gd.seller_id=ts.id where gd.id=#{goodsId}")
    GoodsVo getByGoodsId(@Param("goodsId") Long goodsId);
}
