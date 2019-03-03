package io.renren.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.Goods;
import io.renren.vo.GoodsVo;

import java.util.List;

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
	 * @param goodsId
	 * @return
	 */
	public GoodsVo getGoodsVoByGoodsId(long goodsId);

	/**
	 * 商品库存
	 * @param goods
	 */
	public void reduceStock(GoodsVo goods);

}
