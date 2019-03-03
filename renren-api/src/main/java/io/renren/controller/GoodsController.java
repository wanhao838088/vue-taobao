package io.renren.controller;

import io.renren.common.utils.R;
import io.renren.service.GoodsService;
import io.renren.vo.GoodsVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

}
