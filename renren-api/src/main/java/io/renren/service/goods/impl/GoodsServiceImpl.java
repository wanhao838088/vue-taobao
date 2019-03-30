package io.renren.service.goods.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.goods.GoodsDao;
import io.renren.entity.goods.Goods;
import io.renren.form.GoodsListSearchForm;
import io.renren.service.goods.GoodsService;
import io.renren.vo.GoodsVo;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author admin
 */
@Service("goodsService")
public class GoodsServiceImpl extends ServiceImpl<GoodsDao, Goods> implements GoodsService {

	/**综合排序*/
	private static final int SORT_MULTI = 1;
	/**价格降序排序*/
	private static final int SORT_PRICE_DESC = 2;
	/**价格升序排序*/
	private static final int SORT_PRICE_ASC = 3;
	/**信用排序*/
	private static final int SORT_HONOR = 4;
	/**销量排序*/
	private static final int SORT_AMOUNT = 5;


	@Override
	public Page<Goods> listGoodsVo(GoodsListSearchForm form){
		Page<Goods> page = new Page<>(form.getPageNo(),10);

		EntityWrapper<Goods> wrapper = new EntityWrapper<>();

		wrapper.setEntity(new Goods());
		//分类标题
		wrapper.eq("one_category_id",form.getCateId()).or()
				.eq("two_category_id",form.getCateId()).or()
				.eq("three_category_id",form.getCateId());
		//是否需要排序
		if (form.getSortType()!=null){
			switch (form.getSortType()){
				case SORT_MULTI:
					break;
				case SORT_PRICE_DESC:
					wrapper.orderBy("goods_min_price",false);
					break;
				case SORT_PRICE_ASC:
					wrapper.orderBy("goods_min_price",true);
					break;
				case SORT_HONOR:
					//信用排序
					break;
				case SORT_AMOUNT:
					//销量排序
					wrapper.orderBy("pay_count",false);
					break;
				default:
					break;
			}
		}
		return selectPage(page, wrapper);
	}

	@Override
	public GoodsVo getGoodsVoByGoodsId(long goodsId) {
		return baseMapper.getGoodsVoByGoodsId(goodsId);
	}


	@Override
	public int decCount(Long id) {
		return baseMapper.decCount(id);
	}

	@Override
	public void isSecKillGoods(GoodsVo goodsVo, Map<String, Object> map) {
		Long startAt = goodsVo.getStartTime();
        Long endAt = goodsVo.getEndTime();
        Long now = System.currentTimeMillis();
        //默认不是秒杀商品
        int isSecKill = 0;
		//秒杀状态
		int miaoshaStatus = 0;

		//秒杀时间
		int remainSeconds = 0;

		if (startAt!=null && endAt!=null){
            isSecKill = 1;
            if(now < startAt ) {
                //秒杀还没开始，倒计时
                miaoshaStatus = 0;
                remainSeconds = (int)((startAt - now )/1000);
            }else  if(now > endAt){
                //秒杀已经结束
                miaoshaStatus = 2;
                remainSeconds = -1;
            }else {
                //秒杀进行中
                miaoshaStatus = 1;
                remainSeconds = 0;
            }
        }
        map.put("isSecKill",isSecKill);
        map.put("miaoshaStatus",miaoshaStatus);
		map.put("remainSeconds",remainSeconds);
	}

}
