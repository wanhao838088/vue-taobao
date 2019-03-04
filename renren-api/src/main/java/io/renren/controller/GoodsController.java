package io.renren.controller;

import com.google.common.collect.Maps;
import io.renren.common.utils.R;
import io.renren.service.GoodsService;
import io.renren.vo.GoodsVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * Created by LiuLiHao on 2019/3/3 0003 下午 08:43
 * @author : LiuLiHao
 * 描述：商品操作
 */
@RestController
@RequestMapping("/api/goods")
@Api(tags="商品接口")
public class GoodsController {

    @Autowired
    GoodsService goodsService;

    @GetMapping("list")
    public R list() {
        //查询商品列表
        List<GoodsVo> goodsList = goodsService.listGoodsVo();
        return R.ok().put("goodsList",goodsList);
    }

    @GetMapping("{id}")
    public R goodsDetail(@PathVariable("id") Long id) {
        //查询商品详情
        GoodsVo goodsVo = goodsService.getGoodsVoByGoodsId(id);
        long startAt = goodsVo.getStartTime();
        long endAt = goodsVo.getEndTime();
        long now = System.currentTimeMillis();

        Map<String,Object> map = Maps.newHashMap();

        //商品详情
        map.put("goodsDetail",goodsVo);
        //秒杀状态
        int miaoshaStatus = 0;

        //秒杀时间
        int remainSeconds = 0;

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
        map.put("miaoshaStatus",miaoshaStatus);
        map.put("remainSeconds",remainSeconds);

        return R.ok(map);
    }
}
