package io.renren.controller;

import com.google.common.collect.Maps;
import io.renren.common.utils.R;
import io.renren.entity.GoodsDetailImg;
import io.renren.entity.GoodsImg;
import io.renren.entity.GoodsProps;
import io.renren.entity.GoodsServiceEntity;
import io.renren.service.*;
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
    private GoodsService goodsService;

    @Autowired
    private GoodsImgService goodsImgService;

    @Autowired
    private GoodsDetailImgService detailImgService;

    /**
     * 评论
     */
    @Autowired
    private GoodsCommentService commentService;

    /**
     * 属性
     */
    @Autowired
    private GoodsPropsService propsService;

    /**
     * 服务
     */
    @Autowired
    private GoodsServiceEntityService serviceEntityService;

    /**
     * 商品列表页面
     * @return
     */
    @GetMapping("list")
    public R list() {
        //查询商品列表
        List<GoodsVo> goodsList = goodsService.listGoodsVo();
        return R.ok().put("goodsList",goodsList);
    }

    /**
     * 商品详情页面
     * @param id
     * @return
     */
    @GetMapping("{id}")
    public R goodsDetail(@PathVariable("id") Long id) {
        //查询商品详情
        GoodsVo goodsVo = goodsService.getGoodsVoByGoodsId(id);
        //商品图
        List<GoodsImg> goodsImgs = goodsImgService.getByGoodsId(id);

        //商品详情图
        List<GoodsDetailImg> goodsDetailImgs = detailImgService.getByGoodsId(id);
        //商品属性
        List<GoodsProps> goodsProps = propsService.getByGoodsId(id);

        //服务
        List<GoodsServiceEntity> serviceEntities = serviceEntityService.getByGoodsId(id);
        Map<String,Object> map = Maps.newHashMap();

        //是否是秒杀类商品
        goodsService.isSecKillGoods(goodsVo,map);

        //评论总数
        Integer count = commentService.getCount();

        map.put("commentsCount",count);
        map.put("goodsImgs",goodsImgs);
        map.put("serviceEntities",serviceEntities);
        map.put("goodsProps",goodsProps);
        map.put("goodsDetailImgs",goodsDetailImgs);

        //商品详情
        map.put("goodsDetail",goodsVo);

        return R.ok(map);
    }
}
