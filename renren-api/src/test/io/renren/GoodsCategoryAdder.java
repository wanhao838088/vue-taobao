package io.renren;

import io.renren.entity.goods.GoodsCategory;
import io.renren.service.goods.GoodsCategoryService;
import org.apache.commons.lang.StringUtils;
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
import java.io.IOException;

/**
 * Created by LiuLiHao on 2019/3/22 0022 下午 09:34
 * @author : LiuLiHao
 * 描述： 商品分类数据添加
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class GoodsCategoryAdder {
    private static String path = "C:/taobaoHtml/goods.html";

    @Autowired
    private GoodsCategoryService categoryService;

    @Test
    public void addRootCategory() throws Exception {
        File input = new File(path);

        Document doc = Jsoup.parse(input, "UTF-8", "http://example.com/");
        Elements lis = doc.getElementsByClass("a-all");
        for (Element li : lis) {
            //a标签的元素
            Elements aElements = li.getElementsByTag("a");
            for (Element temp : aElements) {
                String text = temp.text();
                System.out.println(text);
                //去除不合格数据
                if (StringUtils.isBlank(text) || text.length()<2){
                    continue;
                }
                GoodsCategory category = new GoodsCategory();
                category.setNameCn(text);
                category.setPid(0);
                category.setLevel(1);
                category.setRootId(1);
                categoryService.insert(category);
            }
        }
    }

    /**
     * 添加二级分类
     */
    @Test
    public void addSecondCategory() throws IOException {
        File input = new File("C:/taobaoHtml/category.html");

        Document doc = Jsoup.parse(input, "UTF-8", "http://example.com/");

        Elements as = doc.getElementsByClass("xuexi").get(0).getElementsByTag("a");
        for (Element a : as) {
            int i = 46;
            System.out.println(a.text());
            GoodsCategory category = new GoodsCategory();
            category.setNameCn(a.text());
            category.setLevel(2);

            category.setPid(i);
            category.setRootId(i);
            category.setRootName("学习");
            categoryService.insert(category);
        }

        Elements as1 = doc.getElementsByClass("kaquan").get(0).getElementsByTag("a");
        for (Element a : as1) {
            int i = 47;

            System.out.println(a.text());
            GoodsCategory category = new GoodsCategory();
            category.setNameCn(a.text());
            category.setLevel(2);

            category.setPid(i);
            category.setRootId(i);
            category.setRootName("卡券");
            categoryService.insert(category);
        }

        Elements as2 = doc.getElementsByClass("bendi").get(0).getElementsByTag("a");
        for (Element a : as2) {
            int i = 48;
            System.out.println(a.text());
            GoodsCategory category = new GoodsCategory();
            category.setNameCn(a.text());
            category.setLevel(2);
            category.setPid(i);
            category.setRootId(i);
            category.setRootName("本地服务");
            categoryService.insert(category);
        }
    }
}
