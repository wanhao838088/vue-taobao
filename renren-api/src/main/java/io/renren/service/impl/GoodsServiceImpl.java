package io.renren.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.GoodsDao;
import io.renren.entity.Goods;
import io.renren.service.GoodsService;
import io.renren.vo.GoodsVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
