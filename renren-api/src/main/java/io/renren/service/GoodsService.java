package io.renren.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.Goods;
import io.renren.vo.GoodsVo;

import java.util.List;
import java.util.Map;

/**
 * 商品
 * @author admin
 */
public interface GoodsService extends IService<Goods> {

	/**
	 * 商品列表
	 * @return
	 */
	public List<GoodsVo> listGoodsVo();

	/**
	 * 商品详情
	 * @param goodsId 商品id
	 * @return
	 */
	public GoodsVo getGoodsVoByGoodsId(long goodsId);


	/**
	 * 减少秒杀商品的库存
	 * @param id 商品id
	 * @return
	 */
    public int decCount(Long id);

	/**
	 * 是否是秒杀商品
	 * @param goodsVo 商品
	 * @param map
	 */
	void isSecKillGoods(GoodsVo goodsVo, Map<String, Object> map);
}
