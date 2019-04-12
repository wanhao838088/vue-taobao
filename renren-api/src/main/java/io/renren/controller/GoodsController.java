package io.renren.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.collect.Maps;
import io.renren.common.entity.goods.*;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.form.GoodsListSearchForm;
import io.renren.service.goods.*;
import io.renren.vo.GoodsPropsVo;
import io.renren.vo.GoodsVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    private GoodsPropsKeyService propsService;

    /**
     * sku
     */
    @Autowired
    private GoodsSkuService skuService;

    /**
     * 服务
     */
    @Autowired
    private GoodsServiceEntityService serviceEntityService;

    /**
     * 商品列表页面
     * @return
     */
    @PostMapping("list")
    public R list(@RequestBody GoodsListSearchForm form) {
        //表单校验
        ValidatorUtils.validateEntity(form);

        //查询商品列表
        Page<Goods> page = goodsService.listGoodsVo(form);
        return R.ok().put("page",page);
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

        //查找sku
        List<GoodsSku> skus = skuService.getByGoodsId(id);
        goodsVo.setSkus(skus);

        //商品详情图
        List<GoodsDetailImg> goodsDetailImgs = detailImgService.getByGoodsId(id);
        //商品属性
        List<GoodsPropsVo> goodsPropKeys = propsService.getByBrandId(goodsVo.getBrandId());

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
        map.put("goodsProps", goodsPropKeys);
        map.put("goodsDetailImgs",goodsDetailImgs);

        //商品详情
        map.put("goodsDetail",goodsVo);

        return R.ok(map);
    }
}
