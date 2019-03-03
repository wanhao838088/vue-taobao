package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.GoodsDao;
import io.renren.entity.Goods;
import io.renren.entity.MiaoshaGoods;
import io.renren.service.GoodsService;
import io.renren.vo.GoodsVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 */
@Service("goodsService")
public class GoodsServiceImpl extends ServiceImpl<GoodsDao, Goods> implements GoodsService {


	@Override
	public List<GoodsVo> listGoodsVo(){
		return baseMapper.listGoodsVo();
	}

	@Override
	public GoodsVo getGoodsVoByGoodsId(long goodsId) {
		return baseMapper.getGoodsVoByGoodsId(goodsId);
	}

	@Override
	public void reduceStock(GoodsVo goods) {
		MiaoshaGoods g = new MiaoshaGoods();
		g.setGoodsId(goods.getId());
		baseMapper.reduceStock(g);
	}

}
