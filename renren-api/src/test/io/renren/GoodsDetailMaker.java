package io.renren;


import io.renren.common.entity.goods.*;
import io.renren.service.goods.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.util.Date;

/**
 * Created by LiuLiHao on 2019/3/17 0017 上午 10:10
 * @author : LiuLiHao
 * 描述： 数据生成
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class GoodsDetailMaker {
    @Autowired
    private GoodsImgService imgService;
    @Autowired
    private GoodsPropsKeyService propsService;

    @Autowired
    private GoodsPropsValueService valueService;

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodsDetailImgService detailImgService;
    @Autowired
    private GoodsServiceEntityService entityService;
    @Autowired
    private GoodsSkuService skuService;

    private static String path = "C:/taobaoHtml/1.html";

    @Test
    public void test1() throws Exception {
        File input = new File(path);
        Goods goods = goodsService.selectById(99);

        Document doc = Jsoup.parse(input, "UTF-8", "http://example.com/");

//        //1 轮播图
//        getTopImgs(doc,goods);
//        //2 商品价格
//        getPrice(doc,goods);

        //3 产品参数
        getParam(doc,goods);

//        //4 商品详情图
//        getDetailImgs(doc,goods);
//
//        //5 产品服务
//        getServices(doc,goods);
//        //6 改变库存
//        getQuantity(doc,goods);
//        //7 sku添加
//        getSku(doc,goods);
    }

    /**
     * sku
     * @param doc
     */
    private void getSku(Document doc,Goods goods){
        Elements skuDiv = doc.getElementsByClass("sku-info");
        Elements skuLis = skuDiv.get(0).child(1).child(1).children();
        for(int i=0;i<skuLis.size();i++){
            String text = skuLis.get(i).text();
            GoodsSku goodsSku = new GoodsSku();
            goodsSku.setGoodsId(goods.getId());
            goodsSku.setSkuName(text);
            skuService.insertOrUpdate(goodsSku);
            System.out.println(text);
        }
    }


    /**
     * 库存数量
     * @param doc
     */
    private void getQuantity(Document doc,Goods goods){
        //库存数量
        Elements quantity = doc.getElementsByClass("quantity");
        String quantityText = quantity.get(0).text();
        String num = quantityText.substring(3, quantityText.length());
        System.out.println(num);
        goods.setGoodsStock(Integer.valueOf(num));
        goodsService.updateById(goods);
    }
    /**
     * 产品服务
     * @param doc
     */
    private void getServices(Document doc,Goods goods){
        Elements serviceUl = doc.getElementsByClass("base-info-list");
        Elements serviceLis = serviceUl.get(0).children();
        int k=1;

        for(int i=0;i<serviceLis.size();i++){
            GoodsServiceEntity serviceEntity = new GoodsServiceEntity();

            String key = serviceLis.get(i).child(1).text();
            String content = serviceLis.get(i).child(2).text();
            System.out.println(key+content);
            serviceEntity.setGoodsId(goods.getId());
            serviceEntity.setServiceKey(key);
            serviceEntity.setServiceContent(content);
            serviceEntity.setOrderNum(k++);
            //加入数据库
            entityService.insertOrUpdate(serviceEntity);
        }
    }

    /**
     * 商品详情图
     * @param doc
     */
    private void getDetailImgs(Document doc,Goods goods){
        //商品详情图
        Elements detailImgs = doc.getElementsByClass("desc-img");
        int k=1;
        for(int i=0;i<detailImgs.size();i++){
            GoodsDetailImg detailImg = new GoodsDetailImg();

            Element element = detailImgs.get(i);
            String url = element.attr("src");
            detailImg.setGoodsId(goods.getId());
            detailImg.setImgUrl(url);
            detailImg.setOrderNum(k++);
            System.out.println(url);
            detailImgService.insertOrUpdate(detailImg);

        }
    }


    /**
     * 获取产品参数
     * @param doc
     */
    private void getParam(Document doc,Goods goods){
        //获取产品参数
        Elements paramUl = doc.getElementsByClass("product-param-list");
        Elements paramLis = paramUl.get(0).children();
        int k =1;
        for(int i=0;i<paramLis.size();i++){
            GoodsPropsKey goodsPropsKey = new GoodsPropsKey();
            //键值对
            String key = paramLis.get(i).child(0).text();
            String content = paramLis.get(i).child(1).text();
            goodsPropsKey.setOrderNum(k++);
            goodsPropsKey.setBrandId(2);
            goodsPropsKey.setPropKey(key);
            System.out.println(key + " " + content);
            //插入数据库
            propsService.insertOrUpdate(goodsPropsKey);

            //属性值
            GoodsPropsValue propsValue = new GoodsPropsValue();
            propsValue.setBrandId(2);
            propsValue.setCreateTime(new Date());
            long id = goodsPropsKey.getId();
            propsValue.setPropsId((int)id);
            propsValue.setValueName(content);
            valueService.insert(propsValue);

        }
    }

    /**
     * 获取价格
     * @param doc
     */
    private void getPrice(Document doc,Goods goods){
        //获取现价
        Elements otPrice = doc.getElementsByClass("o-t-price");
        String priceText = otPrice.get(0).children().get(0).text();
        String[] priceArr = priceText.split("-");
        if (priceArr.length>1){
            //有两个价格
            String minPrice = priceArr[0];
            goods.setGoodsMinPrice(Double.valueOf(minPrice));
            String maxPrice = priceArr[1];
            goods.setGoodsMaxPrice(Double.valueOf(maxPrice));
        }else {
            String minPrice = priceArr[0];
            goods.setGoodsMinPrice(Double.valueOf(minPrice));
        }

        //获取原价
        Elements orgPriceEle = doc.getElementsByClass("original-price");
        String orgPriceText = orgPriceEle.get(0).children().get(0).children().get(0).text();
        System.out.println(orgPriceText);
        String[] orgPriceArr = orgPriceText.split("-");
        if (orgPriceArr.length>1){
            //有两个价格
            String orgMinPrice = orgPriceArr[0];
            goods.setOrgMinPrice(Double.valueOf(orgMinPrice));
            String orgMaxPrice = orgPriceArr[1];
            goods.setOrgMaxPrice(Double.valueOf(orgMaxPrice));
        }else {
            String orgMinPrice = orgPriceArr[0];
            goods.setOrgMinPrice(Double.valueOf(orgMinPrice));
        }
        goodsService.updateById(goods);
    }


    /**
     * 获取顶部轮播图
     * @param doc
     */
    private void getTopImgs(Document doc,Goods goods){
        Elements imgWrapper = doc.getElementsByClass("img-wrapper");

        int i=1;
        for (Element element : imgWrapper) {
            //获取轮播图
            GoodsImg goodsImg = new GoodsImg();
            goodsImg.setGoodsId(goods.getId());
            goodsImg.setOrderNum(i++);
            String src = element.children().get(0).attr("src");
            goodsImg.setImgUrl(src);
            imgService.insert(goodsImg);
            System.out.println(src);
        }
    }
}
