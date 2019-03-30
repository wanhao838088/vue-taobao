package io.renren;

import io.renren.entity.goods.Goods;
import io.renren.service.goods.GoodsService;
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

/**
 * Created by LiuLiHao on 2019/3/17 0017 下午 12:01
 * @author : LiuLiHao
 * 描述： 商品列表数据生成
 *
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class GoodsListMaker {
    private static String path = "C:/taobaoHtml/listLanKou.html";

    @Autowired
    private GoodsService goodsService;

    @Test
    public void test1() throws Exception {
        File input = new File(path);

        Document doc = Jsoup.parse(input, "UTF-8", "http://example.com/");

        Elements lis = doc.getElementsByClass("J_PageContainer_1").get(0).children();
        for(int i=0;i<lis.size();i++){
            Goods goods = new Goods();
            //默认免运费
            goods.setDeliveryFree(0.0);

            Element temp = lis.get(i);
            String tempClass = temp.attr("class");
            System.out.println(tempClass);
            if (tempClass.contains("install-app")){
                continue;
            }
            //商品标题
            String pic = temp.getElementsByClass("p-pic").get(0).attr("src");
            goods.setGoodsImg(pic);

            String title = temp.getElementsByClass("d-title").get(0).text();
            goods.setGoodsTitle(title);

            String minPrice = temp.getElementsByClass("font-num").get(0).text();
            goods.setGoodsMinPrice(Double.valueOf(minPrice));

            String orgMinPrice = "0";
            String payCount = "0";

            try {
                orgMinPrice = temp.getElementsByClass("font-num").get(1).text();
                payCount = temp.getElementsByClass("font-num").get(2).text();
            } catch (Exception e) {
                orgMinPrice = "0";
                payCount = temp.getElementsByClass("font-num").get(1).text();
            }

            goods.setOrgMinPrice(Double.valueOf(orgMinPrice));
            goods.setPayCount(Integer.valueOf(payCount));

            //d-area
            String area = temp.getElementsByClass("d-area").get(0).text();
            goods.setLocation(area);
            goodsService.insert(goods);
        }

    }

}
