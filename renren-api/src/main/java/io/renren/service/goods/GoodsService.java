package io.renren.service.goods;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.goods.Goods;
import io.renren.form.GoodsListSearchForm;
import io.renren.vo.GoodsVo;

import java.util.Map;

/**
 * 商品
 * @author admin
 */
public interface GoodsService extends IService<Goods> {

	/**
	 * 条件查询商品列表
	 * @return
	 */
	public Page<Goods> listGoodsVo(GoodsListSearchForm form);

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
