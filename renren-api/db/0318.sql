/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.17-log : Database - renren_security
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`renren_security` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `renren_security`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品Id',
  `goods_title` varchar(64) DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `goods_detail` longtext COMMENT '商品详情介绍',
  `goods_stock` int(11) DEFAULT '0' COMMENT '商品库存,-1表示没有限制',
  `goods_min_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品现最小价格',
  `goods_max_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品现最大价格',
  `org_min_price` decimal(10,2) DEFAULT '0.00' COMMENT '原最小价格',
  `org_max_price` decimal(10,2) DEFAULT '0.00' COMMENT '原最大价格',
  `location` varchar(50) DEFAULT NULL COMMENT '所在地',
  `delivery_free` decimal(5,2) DEFAULT '0.00' COMMENT '运费 0 为免运费',
  `pay_count` int(11) DEFAULT '0' COMMENT '付款人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_title`,`goods_img`,`goods_detail`,`goods_stock`,`goods_min_price`,`goods_max_price`,`org_min_price`,`org_max_price`,`location`,`delivery_free`,`pay_count`) values (4,'32寸网络智能wifi液晶电视机40家用特价彩电','https://img.alicdn.com/img/i2/17618906/O1CN01GU9dOb2FezqlhK6Fh_!!0-saturn_solar.jpg_210x210.jpg',NULL,7606,'478.00','0.00','878.00','0.00','广东广州','0.00',0),(5,'王牌知音特价32寸42寸智能wifi网络电视机','//img.alicdn.com/img/i4/127784991/O1CN01hpNalr1mjvGJHK6Fg_!!0-saturn_solar.jpg_210x210.jpg',NULL,7355,'388.00','1998.00','398.00','2008.00','广州','0.00',677),(6,'特价创维视云LED32 26智能Wifi网络19 28寸小型高清22液晶电视机','//gw3.alicdn.com/bao/uploaded/i3/3998358685/O1CN01geZTLK2E1mKRrNz8J_!!3998358685.jpg_210x210.jpg',NULL,11729,'138.00','798.00','238.00','898.00','上海','0.00',32),(7,'coocaa/酷开 50K5S创维50英寸4K超高清智能网络平板液晶电视机55','//gw3.alicdn.com/bao/uploaded/i3/2555391676/O1CN01OjN3T21OFeIyRbsvU_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1899.00','0.00','2699.00','0.00','深圳','0.00',2),(8,'TCL 65V2 65英寸4K全金属超薄高清人工智能网络平板液晶大电视机','//gw3.alicdn.com/bao/uploaded/i4/2050532947/O1CN01aGSifj1XdliC7QPgn_!!0-item_pic.jpg_210x210.jpg',NULL,0,'3999.00','0.00','5999.00','0.00','惠州','0.00',51),(9,'触摸教学一体机55/65/75/85寸电视幼儿园多媒体培训会议电子白板','//gw3.alicdn.com/bao/uploaded/i2/2989209262/O1CN012II2omct1lCKQV8_!!2989209262.jpg_210x210.jpg',NULL,0,'3800.00','0.00','0.00','0.00','广州','0.00',135),(10,'coocaa/酷开 43K5C创维43英寸网络WIFI智能LED液晶平板电视机42','//gw2.alicdn.com/bao/uploaded/i2/250840343/O1CN01YwKgoA1EP8Lah9ZLw_!!250840343.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1899.00','0.00','深圳','0.00',6),(11,'TCL 43L2F 43英寸高清智能WIFI网络安卓20核平板LED液晶电视机','//gw1.alicdn.com/bao/uploaded/i4/2050532947/O1CN01CCamPU1XdliADdrBo_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1499.00','0.00','2999.00','0.00','惠州','0.00',97),(12,'创维coocaa/酷开43 K6S网络43英寸智能wifi平板液晶彩电视机40 50','//gw2.alicdn.com/bao/uploaded/i3/708557835/O1CN01VFjkEB27kTgJzzgKs_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1499.00','0.00','2199.00','0.00','北京','0.00',4),(13,'Changhong/长虹 39D3F 39英寸64位24核智能网络LED平板液晶电视机','//gw1.alicdn.com/bao/uploaded/i3/2430118810/O1CN01R1Uksi2Ex1qOMvis8_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1599.00','0.00','成都','0.00',5),(14,'Changhong/长虹 55A3U 55英寸液晶电视4K超清人工智能网络安卓led','//gw3.alicdn.com/bao/uploaded/i1/2430118810/O1CN015HEOZd2Ex1qUDYXUX_!!0-item_pic.jpg_210x210.jpg',NULL,0,'2599.00','0.00','3999.00','0.00','成都','0.00',3),(15,'kktv K5 43英寸康佳电视机43英寸1+16G电视机网络液晶康佳K43K5','//gw2.alicdn.com/bao/uploaded/i2/3869442185/O1CN01IYWBnq1S0luO6egNr_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','2299.00','0.00','深圳','0.00',7),(16,'Changhong/长虹 39D3F 39寸LED液晶电视机平板智能网络wifi彩电40','//gw2.alicdn.com/bao/uploaded/i2/2831322485/O1CN01Ua1jsg1UEAjC2E7M2_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1999.00','0.00','绵阳','0.00',3),(17,'coocaa/酷开 43K5C创维43英寸网络WIFI智能LED液晶平板电视机42','//gw3.alicdn.com/bao/uploaded/i3/2555391676/O1CN01WCypRt1OFeJR5vDaD_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1899.00','0.00','北京','0.00',15),(18,'kktv U40 康佳40英寸电视机4K高清31核智能网络LED液晶42 43电视','//gw3.alicdn.com/bao/uploaded/i1/3515402915/O1CN01aN2TQE1XP72Lebobj_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','2599.00','0.00','深圳','0.00',7),(19,'Hisense/海信 HZ43E35A 43英寸高清智能WIFI网络平板LED液晶电视','//gw3.alicdn.com/bao/uploaded/i1/1728252713/O1CN01ynDl271Vub1Sm1eXK_!!1728252713.jpg_210x210.jpg',NULL,0,'1499.00','0.00','0.00','0.00','青岛','0.00',34),(20,'小米电视4A 40英寸智能网络wifi超高清4k液晶平板电视机43 32彩电','//gw1.alicdn.com/bao/uploaded/i2/2217765233/O1CN01sO2mkO1oWl70FzF3t_!!2217765233.jpg_210x210.jpg',NULL,0,'786.00','0.00','986.00','0.00','深圳','0.00',48),(21,'创维coocaa/酷开43K5C网络43英寸WIFI智能液晶平板彩电视机42 32','//gw3.alicdn.com/bao/uploaded/i3/708557835/O1CN01NKYpVe27kTgHFebPG_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1899.00','0.00','北京','0.00',3),(22,'小米电视4S 43英寸超高清4K智能网络WIFi液晶平板电视机40 50彩电','//gw2.alicdn.com/bao/uploaded/i2/2217765233/O1CN01oyqzpd1oWl73n2MP5_!!2217765233.jpg_210x210.jpg',NULL,0,'1159.00','0.00','1359.00','0.00','深圳','0.00',18),(23,'Skyworth/创维 49H5 49吋4K超清智能网络全面屏平板液晶电视机50','//gw2.alicdn.com/bao/uploaded/i4/2168706440/O1CN012AbAXg1xRZAcVHXeE_!!0-item_pic.jpg_210x210.jpg',NULL,0,'2699.00','0.00','3599.00','0.00','深圳','0.00',3),(24,'Panasonic/松下 TH-50FX520C 50英寸4K超高清智能HDR液晶电视机','//gw3.alicdn.com/bao/uploaded/i3/3970536945/O1CN01T5v14O21ArBOOfhKB_!!0-item_pic.jpg_210x210.jpg',NULL,0,'2999.00','0.00','4999.00','0.00','苏州','0.00',3),(25,'全新特价32寸平板电视30/42/46/55/65/70寸usb高清4K智能wifi液晶','//gw3.alicdn.com/bao/uploaded/i2/4117220918/O1CN01or5FA41IeU5NjED6N_!!4117220918.jpg_210x210.jpg',NULL,0,'368.00','0.00','408.00','0.00','广州','0.00',17),(26,'电视机55寸60 70 65 32英寸电视曲面平板4k','//img.alicdn.com/img/i4/132655463/O1CN01WhQ5kf1qE6CsMeh6R_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'399.00','0.00','0.00','0.00','广州','0.00',399),(27,'wifi智能网络55寸液晶电视电视机42 65 75','//img.alicdn.com/img/i1/33081960/O1CN01miNzSQ1QLimlUyPSM_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'688.00','0.00','888.00','0.00','广州','0.00',879),(28,'买一送一秘鲁蓝莓鲜果新鲜水果进口包邮当季','//img.alicdn.com/img/i4/116694812/O1CN01a6EiJs1lPwNDVi4cj_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'89.00','0.00','185.10','0.00','嘉兴','0.00',2776),(29,'野生蓝莓果干 新老顾客都来买吧 浆果之王','//gw2.alicdn.com/bao/uploaded/i1/19165025794055546/T19_1UXCthXXXXXXXX_!!0-item_pic.jpg_210x210.jpg',NULL,0,'106.00','0.00','0.00','0.00','哈尔滨','0.00',99),(30,'许氏醇品山果集 野生蓝莓干 蔓越莓干无添加大兴安岭特级非长白山','//gw1.alicdn.com/bao/uploaded/i3/921722821/TB1IgW0aHGYBuNjy0FoXXciBFXa_!!0-item_pic.jpg_210x210.jpg',NULL,0,'65.00','0.00','130.00','0.00','漳州','6.00',43),(31,'长白山野生无添加蓝莓干网红小吃果干500g休闲食品小包装 护眼','//gw3.alicdn.com/bao/uploaded/i2/52943580/O1CN01yOtEbn1cJgQAC7p74_!!2-item_pic.png_210x210.jpg',NULL,0,'49.50','0.00','0.00','0.00','白山','0.00',37),(32,'香港代购 楼上【美国特选天然蓝莓干】227g 不含防腐剂','//gw1.alicdn.com/bao/uploaded/i2/1592283956/TB2zgzvEhSYBuNjSspjXXX73VXa_!!1592283956.jpg_210x210.jpg',NULL,0,'38.00','0.00','0.00','0.00','深圳','0.00',71),(33,'香港代购 楼上 【美国天然蓝莓干】227g','//gw3.alicdn.com/bao/uploaded/i4/1592283956/TB2iUTsw9tYBeNjSspaXXaOOFXa_!!1592283956.jpg_210x210.jpg',NULL,0,'42.00','0.00','0.00','0.00','深圳','0.00',36),(34,'【壮壮豆豆】蓝莓果美国进口格林斯丹蓝莓果干蜜饯零食250g包邮','//gw3.alicdn.com/bao/uploaded/i1/700195909/TB2obwvjAfb_uJjSsrbXXb6bVXa_!!700195909.jpg_210x210.jpg',NULL,0,'42.60','0.00','80.00','0.00','枣庄','0.00',41),(35,'小林制药日本原装进口保护视力缓解眼干预防眼疾蓝莓精华颗粒60粒','//gw2.alicdn.com/bao/uploaded/i4/2883870050/O1CN01hOkAuV1CEwJ8lWlhl_!!0-item_pic.jpg_210x210.jpg',NULL,0,'158.00','0.00','328.00','0.00','日本','0.00',216),(36,'现货澳洲 bio island越桔精华蓝莓素叶黄素护眼胶囊 180粒','//gw2.alicdn.com/bao/uploaded/i2/2329313549/TB2OBv7i3fH8KJjy1zcXXcTzpXa_!!2329313549.jpg_210x210.jpg',NULL,0,'169.00','0.00','0.00','0.00','宁波','0.00',24),(37,'8408 熊宝宝儿童蓝莓咀嚼糖果 90克 保护眼睛 正品 包邮','//gw1.alicdn.com/bao/uploaded/i4/929788782/TB2aPvCaRyWBuNkSmFPXXXguVXa_!!929788782.jpg_210x210.jpg',NULL,0,'130.00','0.00','0.00','0.00','沈阳','0.00',45),(38,'克拉农场原味蓝莓干 美国原产蓝莓果干蛋糕装饰 烘焙原料原装50g','//gw1.alicdn.com/bao/uploaded/i3/27567810/O1CN01BlUDVJ27Z1mLaRWaH_!!0-item_pic.jpg_210x210.jpg',NULL,0,'13.80','0.00','0.00','0.00','上海','0.00',39),(39,'8408美乐家儿童蓝莓咀嚼糖果60粒美乐家儿童观适健熊宝宝蓝莓包邮','//gw2.alicdn.com/bao/uploaded/i2/3173186906/TB1jIoczxGYBuNjy0FnXXX5lpXa_!!0-item_pic.jpg_210x210.jpg',NULL,0,'128.00','0.00','0.00','0.00','鞍山','0.00',47),(40,'20.5月新包装240粒眼睛 越橘蓝莓叶黄素精华软胶囊 美国普丽普莱','//gw3.alicdn.com/bao/uploaded/i1/43476983/O1CN01FNTzPX21SGDyJAaL8_!!0-item_pic.jpg_210x210.jpg',NULL,0,'54.00','0.00','0.00','0.00','新界','0.00',151),(41,'【老爸推荐】-粒大味美的蓝莓干 150g','//gw3.alicdn.com/bao/uploaded/i3/3012015722/TB2NHvmDKOSBuNjy0FdXXbDnVXa_!!3012015722.jpg_210x210.jpg',NULL,0,'39.00','0.00','0.00','0.00','杭州','0.00',572),(42,'澳洲澳佳宝Blackmores 叶黄素片护眼宁蓝莓 缓解视力疲劳30粒','//gw3.alicdn.com/bao/uploaded/i2/2329313549/TB2XjI6awLD8KJjSszeXXaGRpXa_!!2329313549.jpg_210x210.jpg',NULL,0,'58.00','0.00','0.00','0.00','宁波','0.00',14),(43,'雪海梅乡 蓝钻石蓝莓干110g 蓝莓果干蜜饯果脯 零食小吃休闲食品','//gw3.alicdn.com/bao/uploaded/i3/1837119081/O1CN011FrE1f2Gx9B0yiHFo_!!0-item_pic.jpg_210x210.jpg',NULL,0,'29.90','0.00','59.00','0.00','杭州','0.00',28),(44,'【沃隆蓝莓干180g】 蜜饯水果干休闲零食 蓝莓果干烘焙原料特产','//gw2.alicdn.com/bao/uploaded/i2/2745562235/O1CN01QP8OQV1SNfiGGcGZE_!!0-item_pic.jpg_210x210.jpg',NULL,0,'36.90','0.00','109.80','0.00','青岛','0.00',610),(45,'美国特产大粒蓝莓果干500g非东北野生蓝莓 自配混合坚果烘焙材料','//gw1.alicdn.com/bao/uploaded/i4/302101255/TB2eF1Zq3mTBuNjy1XbXXaMrVXa_!!302101255.jpg_210x210.jpg',NULL,0,'59.90','0.00','70.00','0.00','上海','0.00',116),(46,'野生蓝莓果干500g产自伊春小兴安岭','//gw3.alicdn.com/bao/uploaded/i1/2068919544/O1CN01yKlFyj2KNCX5qQJ7u_!!2068919544.jpg_210x210.jpg',NULL,0,'42.80','0.00','80.00','0.00','伊春','0.00',1408),(47,'楼上 蓝莓干 美国进口蓝莓干原粒即食 227克（中通)','//gw2.alicdn.com/bao/uploaded/i3/2194740761/O1CN011HUZrrF5N7a857O_!!0-item_pic.jpg_210x210.jpg',NULL,0,'34.00','0.00','0.00','0.00','新界','0.00',1158),(48,'ORBIS/奥蜜思护眼蓝莓丸40粒 护眼保健品呵护视力护眼丸 官方正品','//gw3.alicdn.com/bao/uploaded/i4/2831342753/O1CN01unPhQO1WCus0qyvKD_!!0-item_pic.jpg_210x210.jpg',NULL,0,'129.00','0.00','149.00','0.00','日本','0.00',29),(49,'小林仙蓝莓干500g野生无添加蓝莓干蓝莓果干','//img.alicdn.com/img/i2/1232906027266910285/TB2yuelp.hnpuFjSZFEXXX0PFXa_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'49.90','0.00','69.00','0.00','延边朝鲜族','0.00',1764),(50,'4盒智利进口蓝莓鲜果空运当季精选500g','//img.alicdn.com/img/i4/304290151/O1CN01RqyNtQ1CzCJLwqEw1_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'69.90','0.00','216.00','0.00','上海','0.00',18),(51,'花花公子男士外套2019春商务夹克中年人褂子','//img.alicdn.com/img/i2/98332397/O1CN01XvTX6O1TZrrnMLeEA_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'269.00','0.00','698.00','0.00','嘉兴','0.00',2679),(52,'Hollister2019年春季新品连帽图案T恤 男 240809-1','//gw3.alicdn.com/bao/uploaded/i2/2091178755/O1CN017cuEhU2EXq32uBqdR_!!0-item_pic.jpg_210x210.jpg',NULL,0,'269.00','0.00','0.00','0.00','上海','0.00',106),(53,'GUESS2019新款春男士纯色倒三角LOGO套头卫衣-X84P07R2080','//gw1.alicdn.com/bao/uploaded/i4/1656456252/O1CN01r9vV591w3SgzpniYL_!!0-item_pic.jpg_210x210.jpg',NULL,0,'279.00','0.00','399.00','0.00','上海','0.00',70),(54,'Hollister2019年春季新品Logo图案短袖T恤 男 240807-1','//gw3.alicdn.com/bao/uploaded/i2/2091178755/O1CN01YVzTZ22EXq3kdGLUv_!!2091178755.jpg_210x210.jpg',NULL,0,'179.00','0.00','199.00','0.00','上海','0.00',97),(55,'马克华菲短袖T恤男士2019春季新款简约字母刺绣异色拼接休闲上衣','//gw3.alicdn.com/bao/uploaded/i1/94399436/O1CN01bRxykM2JZjmRZ3SFb_!!0-item_pic.jpg_210x210.jpg',NULL,0,'188.00','0.00','325.00','0.00','上海','0.00',182),(56,'A21春季2019新款男装卫衣 青春活力色块撞色宽松立领长袖卫衣外套','//gw1.alicdn.com/bao/uploaded/i4/1601145275/O1CN01vWdZtq1opzklIhuii-1601145275.jpg_210x210.jpg',NULL,0,'179.00','0.00','369.00','0.00','东莞','0.00',105),(57,'it UNDER GARDEN男装短袖T恤2019春季新品个性图案印花1163XAC','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'229.00','0.00','269.00','0.00','上海','0.00',699),(58,'花花公子2019春季新款外套男学生韩版潮流运动休闲透气修身夹克男','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'189.00','0.00','368.00','0.00','泉州','0.00',305),(59,'Gap男装印花连帽卫衣春装436778 E 2019春季新款男士潮流logo上衣','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'259.00','0.00','399.00','0.00','苏州','0.00',34),(60,'花花公子2019春季新款夹克男青年韩版休闲透气迷彩针织男士潮外套','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'189.00','0.00','368.00','0.00','泉州','0.00',82),(61,'美特斯邦威T恤男2019春季新款男士韩版潮流印花学生T恤男-拼下','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'89.90','0.00','119.00','0.00','上海','0.00',409),(62,'A21春季2019新款男装 潮流男生长袖T恤衫圆领男套衫时尚打底衣','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'79.00','0.00','159.00','0.00','东莞','0.00',353),(63,'UR2019春季新品男装成熟风字母纽扣饰帽领短外套MV08S1BN2006','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'559.00','0.00','0.00','0.00','广州','0.00',8),(64,'外套男春秋韩版潮流2019新款帅气衣服休闲时尚工装夹克青少年男装','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'128.00','0.00','338.00','0.00','厦门','0.00',15),(65,'H＆M DIVIDED男装2019年春季新款上衣男拼色卫衣HM0710400','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'129.00','0.00','0.00','0.00','苏州','0.00',101),(66,'男士春季外套2019新款春秋衣服韩版学生帅气工装牛仔夹克春装潮流','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'118.00','0.00','236.00','0.00','泉州','0.00',11),(67,'骆驼牌男装 2019春季新款防风透气时尚纯色夹克男士日常休闲外套','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'348.00','0.00','698.00','0.00','广州','0.00',119),(68,'H＆M 男装DIVIDED2019年春季新款 连帽外套 HM0733461','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'199.00','0.00','0.00','0.00','苏州','0.00',38),(69,'Gap男装抓绒打底套头卫衣852079-2 2019新款春装男士圆领内搭上衣','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'195.00','0.00','299.00','0.00','苏州','0.00',56),(70,'森马卫衣男2019春季新款撞色圆领套头上衣男士简约字母印花外套','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'139.90','0.00','199.00','0.00','杭州','0.00',258),(71,'DJPY男装2019新款春季夹克男宽松大码日系复古连帽工装外套男潮牌','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'168.00','0.00','0.00','0.00','杭州','0.00',10),(72,'情侣运动服装女套装男长袖春秋休闲卫衣','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'178.00','0.00','298.00','0.00','武汉','0.00',2279),(73,'春季男士薄款夹克衫春秋中年男装休闲西装男','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'238.00','0.00','888.00','0.00','济南','0.00',908),(74,'2019新款女装时尚女士春季显瘦休闲套装春秋','//img.alicdn.com/img/i2/123490205507571099/TB2wcADnFXXXXccXXXXXXXXXXXX_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'178.00','0.00','296.00','0.00','佛山','0.00',3005),(75,'MsShe大码女装2019新款春装胖mm印花抽绳橡筋腰弹力棉裤M1903113','//gw3.alicdn.com/bao/uploaded/i4/445529553/O1CN01eTHRu52KRK74i3KzZ_!!0-item_pic.jpg_210x210.jpg',NULL,0,'179.00','0.00','249.00','0.00','广州','0.00',584),(76,'MsShe大码女装2019新款春装胖mm字母印花圆领七分袖卫衣M1903021','//gw1.alicdn.com/bao/uploaded/i4/445529553/O1CN01BNEQ2G2KRK7I5cVfl_!!0-item_pic.jpg_210x210.jpg',NULL,0,'159.00','0.00','199.00','0.00','广州','0.00',176),(77,'范奎恩大码女装胖MM裤子2019新款春装胖妹妹200斤显瘦破洞牛仔裤','//gw3.alicdn.com/bao/uploaded/i3/2088979982/O1CN01VeD4KL2Nbo1jNlZbB_!!0-item_pic.jpg_210x210.jpg',NULL,0,'159.00','0.00','308.00','0.00','济南','0.00',174),(78,'胖mm阔腿裤2019新款春装胖妹妹牛仔九分裤大码女装弹力显痩裤子女','//gw3.alicdn.com/bao/uploaded/i4/692558542/O1CN016GjWTh2CyHhQRZ4uK_!!0-item_pic.jpg_210x210.jpg',NULL,60,'139.00','0.00','278.00','0.00','东莞','0.00',240),(79,'春哥大码女装2019春季新款200斤胖妹妹藏肉针织衫宽松显瘦上衣','//gw3.alicdn.com/bao/uploaded/i2/657171867/O1CN01sb97y31Pf7xA02cgb_!!657171867.jpg_210x210.jpg',NULL,0,'129.00','0.00','258.00','0.00','东莞','0.00',179),(80,'肉卷家大码衬衫复古格子撞色领百搭打底雪纺衫2019春季新款女装','//gw3.alicdn.com/bao/uploaded/i2/271971668/O1CN01tDUcnC1OBz8b2W5Zc_!!271971668.jpg_210x210.jpg',NULL,0,'119.00','0.00','0.00','0.00','北京','0.00',122),(81,'夏大大大码女装高腰显瘦休闲裤春装新款2019胖mm洋气个性气质阔腿','//gw1.alicdn.com/bao/uploaded/i2/2836003954/O1CN01bHsLTD1f4yXw6MF0Z_!!2836003954.jpg_210x210.jpg',NULL,0,'108.00','0.00','216.00','0.00','杭州','0.00',75),(82,'2019春夏新款大码女装两件套装胖mm长袖V领衬衣+显瘦阔腿裤长裤','//gw1.alicdn.com/bao/uploaded/i4/3086586285/O1CN01GvdWAO1wIZmCg4nzD_!!0-item_pic.jpg_210x210.jpg',NULL,0,'179.00','0.00','358.00','0.00','广州','0.00',63),(83,'大姗姗家2019春季新款韩版牛仔裤胖妹妹宽松大码女装复古时尚潮裤','//gw3.alicdn.com/bao/uploaded/i3/1889175486/O1CN01mZF3no1qOdJX3Bc9l_!!1889175486.jpg_210x210.jpg',NULL,0,'99.88','0.00','113.50','0.00','鞍山','0.00',49),(84,'大姗姗家胖mm加肥加大码女装2019春季网红款弹力短袖T恤上衣200斤','//gw1.alicdn.com/bao/uploaded/i3/1889175486/O1CN01J9UZe21qOdJTDYRPm_!!1889175486.jpg_210x210.jpg',NULL,2594,'90.64','0.00','103.00','0.00','鞍山','0.00',74),(85,'胖mm春装2019新款大码女装韩版显瘦大方领条纹针织衫百搭打底衫','//gw3.alicdn.com/bao/uploaded/i3/73903600/O1CN01QbBT0C1cSqL2lawBb_!!73903600.jpg_210x210.jpg',NULL,0,'99.00','0.00','0.00','0.00','重庆','0.00',293),(86,'范奎恩大码女装胖MM2019春装新款显瘦上衣200斤胖妹妹打底宽松T恤','//gw2.alicdn.com/bao/uploaded/i1/2088979982/O1CN01LbTnXY2Nbo1jSFBeE_!!0-item_pic.jpg_210x210.jpg',NULL,0,'89.00','0.00','168.00','0.00','济南','0.00',202),(87,'南岛风大码女装遮肚子连衣裙洋气显瘦新款2019春装胖mm格子裙子潮','//gw3.alicdn.com/bao/uploaded/i3/879341624/O1CN01KkxHw01Nrphqv7J2U_!!879341624.jpg_210x210.jpg',NULL,0,'139.90','0.00','186.00','0.00','杭州','0.00',79),(88,'◆ASM◆2019春季新款复古挂肩套头上衣气质修身休闲T恤打底衫女装','//gw2.alicdn.com/bao/uploaded/i3/266969832/O1CN01N4IS0T2MV6cORiGXi_!!266969832.jpg_210x210.jpg',NULL,0,'99.99','0.00','0.00','0.00','杭州','0.00',9251),(89,'2019春季新款大码女装200斤胖MM甜美减龄网红针织两件套装裙67318','//gw3.alicdn.com/bao/uploaded/i3/118548351/O1CN01ygK9W52BYo1ho7OiR_!!118548351.jpg_210x210.jpg',NULL,0,'89.00','0.00','148.00','0.00','东莞','0.00',84),(90,'夏大大大码女装春装新款2019洋气长袖V领T恤小心机胖mm上衣加大','//gw3.alicdn.com/bao/uploaded/i3/2836003954/O1CN011f4yUqYDZxWgFt6_!!2836003954.jpg_210x210.jpg',NULL,0,'98.00','0.00','196.00','0.00','杭州','0.00',18),(91,'蓝语定制大码女装2019新款洋气裙子胖妹妹mm宽松显瘦遮肚连衣裙春','//gw2.alicdn.com/bao/uploaded/i4/743792891/O1CN01wd2JA21XE7Wsw9vOm_!!743792891.jpg_210x210.jpg',NULL,0,'159.80','0.00','318.00','0.00','杭州','0.00',62),(92,'大码女装胖mm2019早春新款棉质上衣韩版宽松休闲百搭印花短袖T恤','//gw3.alicdn.com/bao/uploaded/i3/73903600/O1CN01ZTIzKB1cSqKYPVd6S_!!73903600.jpg_210x210.jpg',NULL,0,'75.00','0.00','0.00','0.00','重庆','0.00',9),(93,'vogana戛纳家大码女装紧身小脚牛仔裤2019春季新款高腰显瘦微胖mm','//gw1.alicdn.com/bao/uploaded/i2/111105495/O1CN01qjNPGd1qSksX3l64O_!!111105495.jpg_210x210.jpg',NULL,0,'128.00','0.00','0.00','0.00','宁波','0.00',320),(94,'新款大码女装韩版纯色弹力修身脚口开叉牛仔裤2019春季百搭铅笔裤','//gw3.alicdn.com/bao/uploaded/i4/303431599/O1CN01TfvnfD1NgNniDlZyu_!!0-item_pic.jpg_210x210.jpg',NULL,0,'79.00','0.00','0.00','0.00','苏州','0.00',118),(95,'新款春秋很仙的雪纺连衣裙复古a字性感长裙','//img.alicdn.com/img/i2/15171914/O1CN01bPBbRF1Q0eZXMGF7h_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'239.00','0.00','9999.00','0.00','厦门','0.00',466),(96,'初春欧货两件套御姐洋气小西装套装裙气质法','//img.alicdn.com/img/i3/28601063/O1CN017zVllh1JitWDa1lnV_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'298.00','0.00','688.00','0.00','杭州','0.00',595),(97,'[官方正品] 兰蔻小黑瓶精华肌底液 补水保湿','//img.alicdn.com/img/i2/107515971/O1CN01a4I5Ap1tylPdhXzQ4_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'760.00','0.00','0.00','0.00','苏州','0.00',10426),(98,'稀缺的中样兰蔻新菁纯臻颜丝润晚霜15ml 2020年抗皱国内专柜中样','//gw3.alicdn.com/bao/uploaded/i1/739171675/O1CN011OFBsfcHzk7iB9x_!!739171675.jpg_210x210.jpg',NULL,0,'129.00','0.00','0.00','0.00','长沙','0.00',33),(99,'2瓶包邮 贵妇霜！兰蔻新菁纯臻颜润养日霜15ml紧致抗皱 价值804元','//gw3.alicdn.com/bao/uploaded/i2/53707532/O1CN01ceDVAg25VhfaTqRYP_!!0-item_pic.jpg_210x210.jpg',NULL,0,'115.00','0.00','120.00','0.00','唐山','0.00',56),(100,'国内柜台兰蔻 菁纯 臻颜 滋润 眼霜 5ml 中文标2021 3个打包价370','//gw1.alicdn.com/bao/uploaded/i4/22751123/O1CN01XkzSa21KANGQ3RyUM_!!22751123.jpg_210x210.jpg',NULL,0,'135.00','0.00','0.00','0.00','南京','0.00',82),(101,'西安专柜正品小样 兰蔻黑金臻宠美容液10ml 柜台价1520 高端限量','//gw2.alicdn.com/bao/uploaded/i3/478983551/O1CN0170vQME1c6OvN30UoR_!!0-item_pic.jpg_210x210.jpg',NULL,0,'78.00','0.00','0.00','0.00','西安','0.00',16),(102,'专柜中小样 兰蔻塑颜紧致焕白霜15ml 新品雪花霜 滋润提拉','//gw3.alicdn.com/bao/uploaded/i1/735720621/O1CN011GSSQ2kivXs74O4_!!735720621.jpg_210x210.jpg',NULL,0,'70.00','0.00','0.00','0.00','北京','0.00',27),(103,'兰蔻菁纯臻颜滋润眼霜3ml/5ml 国内专柜小样 改善眼袋细纹干燥','//gw3.alicdn.com/bao/uploaded/i1/36247128/TB2q56dyuSSBuNjy0FlXXbBpVXa_!!36247128.jpg_210x210.jpg',NULL,0,'118.00','0.00','0.00','0.00','常州','0.00',122),(104,'淡化黑眼圈+保湿 | 兰蔻 小黑瓶眼霜 发光眼霜 5ml 价值173元','//gw3.alicdn.com/bao/uploaded/i3/86109864/O1CN012MjlGLW0OtylgUI_!!86109864.jpg_210x210.jpg',NULL,0,'60.00','0.00','0.00','0.00','广州','0.00',287),(105,'国内专柜小样 兰蔻小黑瓶7ml新精华肌底液 3瓶145元包邮 21年03月','//gw1.alicdn.com/bao/uploaded/i3/21792573/O1CN01fSjNJV1UsTZqf4uQy_!!21792573.jpg_210x210.jpg',NULL,0,'50.00','0.00','0.00','0.00','长沙','0.00',136),(106,'30片包邮兰蔻/Lancome精华肌底液小样1ml 小黑瓶 补水保湿发老款','//gw1.alicdn.com/bao/uploaded/i2/750428440/O1CN01Vbatw12CDZIbuZmYk_!!0-item_pic.jpg_210x210.jpg',NULL,0,'4.99','0.00','0.00','0.00','杭州','0.00',494),(107,'新版 兰蔻新精华肌底液1ml 小黑瓶基底精华片装 20年 专柜中小样','//gw2.alicdn.com/bao/uploaded/i2/1469871/O1CN012Mmy22EKoCsidIK_!!1469871.jpg_210x210.jpg',NULL,0,'5.48','0.00','0.00','0.00','北京','0.00',167),(108,'兰蔻新肌底修护舒缓精华液1ml 小黑瓶安瓶精华 片装小样20年到期','//gw3.alicdn.com/bao/uploaded/i1/1469871/TB2V2uInxHI8KJjy1zbXXaxdpXa_!!1469871.jpg_210x210.jpg',NULL,0,'7.48','0.00','0.00','0.00','北京','0.00',61),(109,'兰蔻粉水 新清滢柔肤水50ml专柜中样试用装玫瑰水舒缓滋润补水','//gw2.alicdn.com/bao/uploaded/i4/64898582/O1CN018tbaFd2DGbWRb2s8G_!!64898582.jpg_210x210.jpg',NULL,0,'55.00','0.00','0.00','0.00','长沙','0.00',160),(110,'【国内专柜】Lancome专柜兰蔻粉水 清莹柔肤水保湿水400ml包邮','//gw2.alicdn.com/bao/uploaded/i2/816290202/O1CN011DMYSV2KSygCzHU_!!816290202.jpg_210x210.jpg',NULL,0,'315.00','0.00','0.00','0.00','深圳','0.00',16),(111,'新品兰蔻塑颜紧致焕白霜 15ML雪花霜中文标2021','//gw3.alicdn.com/bao/uploaded/i2/22751123/O1CN011KANF3aLWUnFK1G_!!22751123.jpg_210x210.jpg',NULL,0,'62.00','0.00','0.00','0.00','南京','0.00',48),(112,'【10片包邮】兰蔻新肌底修护舒缓精华液 1ML小样 安瓶精华 20年','//gw3.alicdn.com/bao/uploaded/i2/1878511629/TB2N6GlgQyWBuNjy0FpXXassXXa_!!1878511629.jpg_210x210.jpg',NULL,0,'7.99','0.00','0.00','0.00','南京','0.00',44),(113,'兰蔻小黑瓶小嫩膜肌底精华浸润修护补水面膜28g 保湿滋润滋养','//gw2.alicdn.com/bao/uploaded/i2/2360209412/O1CN01N6gI8T2JOkHCS16pZ_!!0-item_pic.jpg_210x210.jpg',NULL,0,'95.00','0.00','0.00','0.00','苏州','0.00',19),(114,'美白+抗老 对标菁纯美白线！兰蔻 紧致焕白霜 雪花霜15ml 值268元','//gw2.alicdn.com/bao/uploaded/i3/86109864/O1CN01bZno7G2MjlHAXcmim_!!86109864.jpg_210x210.jpg',NULL,0,'66.00','0.00','0.00','0.00','广州','0.00',175),(115,'5个包邮 Lancome/兰蔻玫瑰露清滢柔肤化妆水/粉水50ml 舒缓补水','//gw3.alicdn.com/bao/uploaded/i4/53707532/O1CN01qBr04I25VhfhDd48R_!!0-item_pic.jpg_210x210.jpg',NULL,0,'45.00','0.00','0.00','0.00','唐山','0.00',107),(116,'兰蔻粉水清滢柔肤水50ml 补水保湿舒缓敏感肌可用正品中小样','//gw1.alicdn.com/bao/uploaded/i1/2965033674/TB2gPqLHMmTBuNjy1XbXXaMrVXa_!!2965033674.jpg_210x210.jpg',NULL,0,'48.90','0.00','0.00','0.00','唐山','0.00',38),(117,'三个包邮 国柜兰蔻菁纯臻颜润养美容液50ml 保湿抗老 专柜820！','//gw2.alicdn.com/bao/uploaded/i2/861157734/O1CN01arB4vp270DfnAkx60_!!861157734.jpg_210x210.jpg',NULL,0,'64.00','0.00','0.00','0.00','厦门','0.00',140),(118,'[官方正品]兰蔻新持妆粉底液 自然不假面','//img.alicdn.com/img/i2/107515971/O1CN01m0GENd1tylPbarAKw_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'420.00','0.00','0.00','0.00','苏州','0.00',18513),(119,'法国珍爱女香水璀璨+催眠+爱恋+美丽Q版礼盒','//img.alicdn.com/img/i2/14431692/O1CN01I5EizQ1OMydxoLDl8_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'300.00','0.00','0.00','0.00','上海','0.00',6);

/*Table structure for table `goods_comment` */

DROP TABLE IF EXISTS `goods_comment`;

CREATE TABLE `goods_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '评论的用户名',
  `user_rating` int(5) DEFAULT NULL COMMENT '用户会员等级',
  `content` text COMMENT '评论内容',
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `look_count` int(11) DEFAULT '0' COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `goods_comment` */

insert  into `goods_comment`(`id`,`goods_id`,`user_name`,`user_rating`,`content`,`comment_time`,`look_count`) values (1,4,'傻**8',4,'买回来连wifi试机了反应慢的要死！跟客户反应说我的网络有问题！这么多天还一直都是这个样子！我的电信宽带在我们这网速是最快的，他们有时间都会来蹭网！这也说明我家网络一直都有问题吗？大家还是别买这个牌子的了！很后悔买他！之前买的海信的都比这个好很多！很不爽的一次网购！','2019-03-12 10:44:32',56),(2,4,'w**1',8,'这款电视机性价比好，图象清晰，真是价廉物美，收到货物后自已安装，碰到难处咨询客服，在客服耐心细致的指导下顺利的完成了调试，在此再次向客服表示感谢！','2019-03-11 10:45:07',77),(3,4,'王**贝',8,'电视特别好，非常感谢店主的耐心指导，晚上九点还在指导我，愿上海电视，成功！以后还会买！我的手机像素不太好，电视像素特别好！加油上海电视！向客服致敬！五星好评！','2019-03-07 10:45:44',165),(4,4,'m**7',2,'这款电视机性价比不错！屏幕分辨率高比较清晰！上海这个牌子也好，勾起了小时侯的回忆！','2019-01-10 10:46:19',221),(5,4,'上**司',7,'我临时租的房子，这款电视机便宜，适合我，目前还满意，搬家也方便。','2019-03-09 10:46:59',243),(6,4,'海**云',4,'电视收到了，开箱验货，一切正常，顺丰发货很快，第一次在网上购电视，当时还有点担心，货到后，打开一看，确实真不错，有些调试的问题，客服一一给解答，服务也是一流的，表示感谢','2019-02-15 10:47:32',217),(7,4,'t**0',6,'第一次在网上购买电视，真的很不错，客服态度又好，店家发货速度也挺快，包装的也很好收到，完好无损，没想到收到之后真的很清楚，质量太好了，用了一段时间也没有什么毛病，有需要还会再来买的','2019-03-06 10:48:21',141);

/*Table structure for table `goods_detail_img` */

DROP TABLE IF EXISTS `goods_detail_img`;

CREATE TABLE `goods_detail_img` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品Id',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `order_num` int(11) DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

/*Data for the table `goods_detail_img` */

insert  into `goods_detail_img`(`id`,`goods_id`,`img_url`,`order_num`) values (1,4,'https://img.alicdn.com/imgextra/i1/82805426/O1CN010yylg31px9YeYs6Kr_!!82805426.jpg_640x0q85s150_.webp',1),(2,4,'https://img.alicdn.com/imgextra/i3/82805426/O1CN01TL3wW01px9XO81lUA_!!82805426.jpg_640x0q85s150_.webp',2),(3,4,'https://img.alicdn.com/imgextra/i3/82805426/O1CN011px9Woz4iKFiLYf_!!82805426.jpg_640x0q85s150_.webp',3),(4,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN012hdyzn1px9XRPzNtc_!!82805426.jpg_640x0q85s150_.webp',4),(5,4,'https://img.alicdn.com/imgextra/i1/82805426/O1CN0103sEey1px9YD2ew1j_!!82805426.jpg_640x0q85s150_.webp',5),(6,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN016qrTZm1px9XVXAG7C_!!82805426.jpg_640x0q85s150_.webp',6),(7,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN01t5T3Zy1px9XBLVqDC_!!82805426.jpg_640x0q85s150_.webp',7),(8,4,'https://img.alicdn.com/imgextra/i3/82805426/O1CN01iUzgPV1px9XF4NoOm_!!82805426.jpg_640x0q85s150_.webp',8),(9,4,'https://img.alicdn.com/imgextra/i1/82805426/O1CN01IN0Aoj1px9Y7hEulf_!!82805426.jpg_640x0q85s150_.webp',9),(10,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN01LKezil1px9XEJ3chZ_!!82805426.jpg_640x0q85s150_.webp',10),(11,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN01cqJccO1px9XUNRBqM_!!82805426.jpg_640x0q85s150_.webp',11),(12,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN014eTVx61px9XmobZSE_!!82805426.jpg_640x0q85s150_.webp',12),(13,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN011px9WnyvCmo4SYd_!!82805426.jpg_640x0q85s150_.webp',13),(14,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN01RCnGNL1px9WmAXQca_!!82805426.jpg_640x0q85s150_.webp',14),(15,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN01w7MYq11px9WmpbiMC_!!82805426.jpg_640x0q85s150_.webp',15),(16,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN01I3ss0L1px9WmMPH7C_!!82805426.jpg_640x0q85s150_.webp',16),(17,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN017MvDTU1px9Wn8p9px_!!82805426.jpg_640x0q85s150_.webp',17),(18,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN011px9Wl43IRKo2vM_!!82805426.jpg_640x0q85s150_.webp',18),(19,4,'https://img.alicdn.com/imgextra/i3/82805426/O1CN01qo5vc41px9XS4KLUW_!!82805426.jpg_640x0q85s150_.webp',19),(20,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN01iJe9fX1px9Wl43A90_!!82805426.jpg_640x0q85s150_.webp',20),(21,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN011px9WflyVhQnqg8_!!82805426.jpg_640x0q85s150_.webp',21),(22,4,'https://img.alicdn.com/imgextra/i3/82805426/O1CN011px9WmYG1Y0GjiP_!!82805426.jpg_640x0q85s150_.webp',22),(23,4,'https://img.alicdn.com/imgextra/i1/82805426/O1CN01e1ASmr1px9WmAYVDG_!!82805426.jpg_640x0q85s150_.webp',23),(24,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN01oNLhfe1px9WmQDO95_!!82805426.jpg_640x0q85s150_.webp',24),(25,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN0155ehGZ1px9WkcUrBm_!!82805426.jpg_640x0q85s150_.webp',25),(26,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN011px9WflwIWxEa0a_!!82805426.jpg_640x0q85s150_.webp',26),(27,4,'https://img.alicdn.com/imgextra/i3/82805426/O1CN01Nzr4uf1px9WmAXlWi_!!82805426.jpg_640x0q85s150_.webp',27),(28,4,'https://img.alicdn.com/imgextra/i1/82805426/O1CN01JHAW0T1px9Wmpe3yu_!!82805426.jpg_640x0q85s150_.webp',28),(29,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN011px9WmQDafqIWsH_!!82805426.jpg_640x0q85s150_.webp',29),(30,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN014xGvcw1px9WnZXhR8_!!82805426.jpg_640x0q85s150_.webp',30),(31,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN01zHOLqI1px9Wl43pna_!!82805426.jpg_640x0q85s150_.webp',31),(32,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN011px9WflzBOVG3Lb_!!82805426.jpg_640x0q85s150_.webp',32),(33,4,'https://gw.alicdn.com/tfs/TB1d0h2qVYqK1RjSZLeXXbXppXa-1125-960.png?getAvatar=avatar_640x0q85s150_.webp',37),(34,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN01v0wIt21px9WltkVSc_!!82805426.jpg_640x0q85s150_.webp',36),(35,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN01Dvia4Y1px9WkZOr5f_!!82805426.jpg_640x0q85s150_.webp',35),(36,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN01bqksD51px9Wm7VWC2_!!82805426.jpg_640x0q85s150_.webp',34),(37,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN01f0QFxH1px9XVSlcNQ_!!82805426.jpg_640x0q85s150_.webp',33),(38,5,'//img.alicdn.com/imgextra/i2/3486615114/O1CN014sgJin1neFxWH6k3p_!!3486615114.jpg_640x0q85s150_.webp',1),(39,5,'//img.alicdn.com/imgextra/i3/3486615114/O1CN01rRok4F1neFxW23iTI_!!3486615114.jpg_640x0q85s150_.webp',2),(40,5,'//img.alicdn.com/imgextra/i4/3486615114/O1CN01zasNPc1neFxWdKxD0_!!3486615114.jpg_640x0q85s150_.webp',3),(41,5,'//img.alicdn.com/imgextra/i1/3486615114/TB2.kWChlDH8KJjSspnXXbNAVXa_!!3486615114.jpg_640x0q85s150_.webp',4),(42,5,'//img.alicdn.com/imgextra/i2/3486615114/O1CN01RR6vZk1neFxWHOKcg_!!3486615114.jpg_640x0q85s150_.webp',5),(43,5,'//img.alicdn.com/imgextra/i3/3486615114/TB20fMxdLfM8KJjSZPfXXbklXXa_!!3486615114.jpg_640x0q85s150_.webp',6),(44,5,'//img.alicdn.com/imgextra/i1/3486615114/TB2CrxLdVLM8KJjSZFBXXXJHVXa_!!3486615114.jpg_640x0q85s150_.webp',7),(45,5,'//img.alicdn.com/imgextra/i1/3486615114/TB2GRjDdvQs8KJjSZFEXXc9RpXa_!!3486615114.jpg_640x0q85s150_.webp',8),(46,5,'//img.alicdn.com/imgextra/i3/3486615114/O1CN01Cw2qua1neFxTPqGvU_!!3486615114.jpg_640x0q85s150_.webp',9),(47,5,'//img.alicdn.com/imgextra/i4/3486615114/O1CN01b23ahl1neFxWH5nde_!!3486615114.jpg_640x0q85s150_.webp',10),(48,5,'//img.alicdn.com/imgextra/i3/3486615114/O1CN01lDaP711neFxVdjOUy_!!3486615114.jpg_640x0q85s150_.webp',11),(49,5,'//img.alicdn.com/imgextra/i4/3486615114/O1CN01KVtDfr1neFxVZdYOZ_!!3486615114.jpg_640x0q85s150_.webp',12),(50,5,'//img.alicdn.com/imgextra/i3/3486615114/TB2OBUEkMvD8KJjy0FlXXagBFXa_!!3486615114.jpg_640x0q85s150_.webp',13),(51,5,'//img.alicdn.com/imgextra/i1/3486615114/TB2JggKc6gy_uJjSZR0XXaK5pXa_!!3486615114.jpg_640x0q85s150_.webp',14),(52,5,'//img.alicdn.com/imgextra/i4/3486615114/O1CN011RGWUa1neFxWdUt6b_!!3486615114.jpg_640x0q85s150_.webp',15),(53,5,'//img.alicdn.com/imgextra/i1/3486615114/TB2QeAXkTnI8KJjSszbXXb4KFXa_!!3486615114.jpg_640x0q85s150_.webp',16),(54,5,'//img.alicdn.com/imgextra/i4/3486615114/TB2jPdLd8bM8KJjSZFFXXaynpXa_!!3486615114.jpg_640x0q85s150_.webp',17),(55,5,'//img.alicdn.com/imgextra/i3/3486615114/TB2wSoPkNPI8KJjSspoXXX6MFXa_!!3486615114.jpg_640x0q85s150_.webp',18),(56,5,'//img.alicdn.com/imgextra/i3/3486615114/O1CN016wM7hg1neFxUEQfMG_!!3486615114.jpg_640x0q85s150_.webp',19),(57,5,'//img.alicdn.com/imgextra/i4/3486615114/O1CN01cxqVBJ1neFxVACIVX_!!3486615114.jpg_640x0q85s150_.webp',20),(58,5,'//img.alicdn.com/imgextra/i1/3486615114/O1CN01n42cQ11neFxTP8AQl_!!3486615114.jpg_640x0q85s150_.webp',21),(59,5,'//img.alicdn.com/imgextra/i2/3486615114/O1CN0199Ol7L1neFxWZSwmR_!!3486615114.jpg_640x0q85s150_.webp',22),(60,5,'//img.alicdn.com/imgextra/i4/3486615114/TB2N9D2kTTI8KJjSsphXXcFppXa_!!3486615114.jpg_640x0q85s150_.webp',23),(61,5,'//img.alicdn.com/imgextra/i3/3486615114/O1CN018vEGDT1neFxURQ4n5_!!3486615114.jpg_640x0q85s150_.webp',24),(62,5,'//img.alicdn.com/imgextra/i3/3486615114/O1CN01ESYOYl1neFxW39Nra_!!3486615114.jpg_640x0q85s150_.webp',25),(63,5,'//img.alicdn.com/imgextra/i1/3486615114/TB2Pweyb3LD8KJjSszeXXaGRpXa_!!3486615114.jpg_640x0q85s150_.webp',26),(64,5,'//gw.alicdn.com/tfs/TB1d0h2qVYqK1RjSZLeXXbXppXa-1125-960.png?getAvatar=avatar_640x0q85s150_.webp',27),(65,6,'//img.alicdn.com/imgextra/i3/3998358685/O1CN016PBGnn2E1mKRI1dgU_!!3998358685.jpg_640x0q85s150_.webp',1),(66,6,'//img.alicdn.com/imgextra/i2/3998358685/O1CN01PJ5jUq2E1mKQrGcgF_!!3998358685.jpg_640x0q85s150_.webp',2),(67,6,'//img.alicdn.com/imgextra/i1/3998358685/O1CN01TnW5mu2E1mKRG7yGA_!!3998358685.jpg_640x0q85s150_.webp',3),(68,6,'//img.alicdn.com/imgextra/i4/3998358685/O1CN01WBcBsw2E1mKRulTCv_!!3998358685.jpg_640x0q85s150_.webp',4),(69,6,'//img.alicdn.com/imgextra/i4/3998358685/O1CN01MefF1l2E1mKS3mYll_!!3998358685.png_640x0q85s150_.webp',5),(70,6,'//img.alicdn.com/imgextra/i2/3998358685/O1CN01pTg8Bo2E1mKTV8Ztj_!!3998358685.png_640x0q85s150_.webp',6),(71,6,'//img.alicdn.com/imgextra/i1/3998358685/O1CN01yTN5I52E1mKRG86gs_!!3998358685.jpg_640x0q85s150_.webp',7),(72,6,'//img.alicdn.com/imgextra/i2/3998358685/O1CN01dNnF9r2E1mKTDc0F5_!!3998358685.jpg_640x0q85s150_.webp',8),(73,6,'//img.alicdn.com/imgextra/i4/3998358685/O1CN013KsW702E1mKOnGFGb_!!3998358685.jpg_640x0q85s150_.webp',9),(74,6,'//img.alicdn.com/imgextra/i1/3998358685/O1CN01nAvq4v2E1mKPtspL7_!!3998358685.jpg_640x0q85s150_.webp',10),(75,6,'//img.alicdn.com/imgextra/i4/3998358685/O1CN01xrveqP2E1mKKPBBqA_!!3998358685.jpg_640x0q85s150_.webp',11),(76,6,'//img.alicdn.com/imgextra/i4/3998358685/O1CN014GUuzn2E1mKKPD09g_!!3998358685.jpg_640x0q85s150_.webp',12),(77,6,'//img.alicdn.com/imgextra/i2/3998358685/O1CN01oCe5hn2E1mKQrK34z_!!3998358685.jpg_640x0q85s150_.webp',13),(78,6,'//img.alicdn.com/imgextra/i3/3998358685/O1CN0154lADc2E1mKQdXUVe_!!3998358685.jpg_640x0q85s150_.webp',14),(79,6,'//img.alicdn.com/imgextra/i3/3998358685/O1CN017YVqB62E1mKRuqRFw_!!3998358685.jpg_640x0q85s150_.webp',15),(80,6,'//img.alicdn.com/imgextra/i1/3998358685/O1CN01SZsxSU2E1mKPttpv2_!!3998358685.jpg_640x0q85s150_.webp',16),(81,6,'//img.alicdn.com/imgextra/i2/3998358685/O1CN01vEN8HV2E1mKKPF5GF_!!3998358685.jpg_640x0q85s150_.webp',17),(82,6,'//img.alicdn.com/imgextra/i3/3998358685/O1CN01iKawGl2E1mKQdeL4k_!!3998358685.jpg_640x0q85s150_.webp',18),(83,6,'//gw.alicdn.com/tfs/TB1d0h2qVYqK1RjSZLeXXbXppXa-1125-960.png?getAvatar=avatar_640x0q85s150_.webp',19),(84,30,'//img.alicdn.com/imgextra/i2/921722821/TB2hn2XaL5TBuNjSspmXXaDRVXa_!!921722821.jpg_640x0q85s150_.webp',1),(85,30,'//img.alicdn.com/imgextra/i2/921722821/TB2cnG2aQ9WBuNjSspeXXaz5VXa_!!921722821.jpg_640x0q85s150_.webp',2),(86,30,'//img.alicdn.com/imgextra/i3/921722821/TB2MfmYaHSYBuNjSspiXXXNzpXa_!!921722821.jpg_640x0q85s150_.webp',3),(87,30,'//img.alicdn.com/imgextra/i3/921722821/TB2GTmZaMmTBuNjy1XbXXaMrVXa_!!921722821.jpg_640x0q85s150_.webp',4),(88,30,'//img.alicdn.com/imgextra/i4/921722821/TB2HfAjbb9YBuNjy0FgXXcxcXXa_!!921722821.jpg_640x0q85s150_.webp',5),(89,30,'//img.alicdn.com/imgextra/i3/921722821/TB2A_m3aFuWBuNjSszbXXcS7FXa_!!921722821.jpg_640x0q85s150_.webp',6),(90,30,'//img.alicdn.com/imgextra/i2/921722821/TB2RfcJaSBYBeNjy0FeXXbnmFXa_!!921722821.jpg_640x0q85s150_.webp',7),(91,30,'//img.alicdn.com/imgextra/i4/921722821/TB2X41YaQKWBuNjy1zjXXcOypXa_!!921722821.jpg_640x0q85s150_.webp',8),(92,30,'//img.alicdn.com/imgextra/i4/921722821/TB21Ke3aHuWBuNjSszgXXb8jVXa_!!921722821.jpg_640x0q85s150_.webp',9),(93,30,'//img.alicdn.com/imgextra/i2/921722821/TB2CQ56aKSSBuNjy0FlXXbBpVXa_!!921722821.jpg_640x0q85s150_.webp',10),(94,30,'//img.alicdn.com/imgextra/i3/921722821/TB2qA8BXFooBKNjSZPhXXc2CXXa_!!921722821.jpg_640x0q85s150_.webp',11),(95,30,'//img.alicdn.com/imgextra/i2/921722821/TB2cwS0aHGYBuNjy0FoXXciBFXa_!!921722821.jpg_640x0q85s150_.webp',12),(96,30,'//img.alicdn.com/imgextra/i4/921722821/TB20TS2aSCWBuNjy0FhXXb6EVXa_!!921722821.jpg_640x0q85s150_.webp',13),(97,30,'//img.alicdn.com/imgextra/i4/921722821/TB2wFDbaH9YBuNjy0FgXXcxcXXa_!!921722821.jpg_640x0q85s150_.webp',14),(98,30,'//img.alicdn.com/imgextra/i4/921722821/TB2g_W2aSCWBuNjy0FhXXb6EVXa_!!921722821.jpg_640x0q85s150_.webp',15),(99,30,'//img.alicdn.com/imgextra/i4/921722821/TB2T__XaL5TBuNjSspmXXaDRVXa_!!921722821.jpg_640x0q85s150_.webp',16),(100,30,'//gw.alicdn.com/tfs/TB1d0h2qVYqK1RjSZLeXXbXppXa-1125-960.png?getAvatar=avatar_640x0q85s150_.webp',17),(101,34,'//img.alicdn.com/imgextra/i4/700195909/O1CN01A9QTaa1tWMqhyAL4g_!!700195909.jpg_640x0q85s150_.webp',1),(102,34,'//img.alicdn.com/imgextra/i4/700195909/O1CN01i2R3yk1tWMqbEEOHS_!!700195909.jpg_640x0q85s150_.webp',2),(103,34,'//img.alicdn.com/imgextra/i2/700195909/O1CN01ljMr0n1tWMqi44pTj_!!700195909.jpg_640x0q85s150_.webp',3),(104,34,'//img.alicdn.com/imgextra/i2/700195909/O1CN01dA3jZU1tWMqjnzWpM_!!700195909.jpg_640x0q85s150_.webp',4),(105,34,'//img.alicdn.com/imgextra/i4/700195909/O1CN014LLC8t1tWMqii57U7_!!700195909.jpg_640x0q85s150_.webp',5),(106,34,'//img.alicdn.com/imgextra/i2/700195909/O1CN012GyDQm1tWMqgJxRE2_!!700195909.jpg_640x0q85s150_.webp',6),(107,34,'//img.alicdn.com/imgextra/i2/700195909/O1CN01Hp0wLX1tWMqjJdwwx_!!700195909.jpg_640x0q85s150_.webp',7),(108,34,'//img.alicdn.com/imgextra/i2/700195909/O1CN01r0h9oA1tWMqi6SdvR_!!700195909.jpg_640x0q85s150_.webp',8),(109,34,'//img.alicdn.com/imgextra/i4/700195909/O1CN01wC9OX71tWMqi6QxyM_!!700195909.jpg_640x0q85s150_.webp',9),(110,34,'//img.alicdn.com/imgextra/i3/700195909/O1CN012mwhTr1tWMqjJdPiT_!!700195909.jpg_640x0q85s150_.webp',10),(111,34,'//img.alicdn.com/imgextra/i3/700195909/O1CN01Y8owfY1tWMqi44Yrz_!!700195909.jpg_640x0q85s150_.webp',11),(112,34,'//gw.alicdn.com/tfs/TB1d0h2qVYqK1RjSZLeXXbXppXa-1125-960.png?getAvatar=avatar_640x0q85s150_.webp',12),(113,78,'//img.alicdn.com/imgextra/i4/692558542/TB2K3f3bseJ.eBjy0FiXXXqapXa_!!692558542.jpg_640x0q85s150_.webp',1),(114,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01LuAmYZ2CyHh47USZi_!!692558542.jpg_640x0q85s150_.webp',2),(115,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01WPE2Vp2CyHh6X8jPA_!!692558542.jpg_640x0q85s150_.webp',3),(116,78,'//img.alicdn.com/imgextra/i3/692558542/O1CN01ghRVob2CyHh5YDCae_!!692558542.jpg_640x0q85s150_.webp',4),(117,78,'//img.alicdn.com/imgextra/i1/692558542/O1CN01bXrDeo2CyHh6k0I8j_!!692558542.jpg_640x0q85s150_.webp',5),(118,78,'//img.alicdn.com/imgextra/i2/692558542/O1CN01SRMtLk2CyHh4KnkNu_!!692558542.jpg_640x0q85s150_.webp',6),(119,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01A4fqLW2CyHh2xfQGw_!!692558542.jpg_640x0q85s150_.webp',7),(120,78,'//img.alicdn.com/imgextra/i3/692558542/O1CN01qokvgS2CyHh6k1IR9_!!692558542.jpg_640x0q85s150_.webp',8),(121,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01O7ul3v2CyHh2xd8ts_!!692558542.jpg_640x0q85s150_.webp',9),(122,78,'//img.alicdn.com/imgextra/i3/692558542/O1CN01EUwSgN2CyHh73zOWE_!!692558542.jpg_640x0q85s150_.webp',10),(123,78,'//img.alicdn.com/imgextra/i3/692558542/O1CN017gO4Cn2CyHh4jfkRj_!!692558542.jpg_640x0q85s150_.webp',11),(124,78,'//img.alicdn.com/imgextra/i2/692558542/O1CN01BDTnxQ2CyHh5PlUKZ_!!692558542.jpg_640x0q85s150_.webp',12),(125,78,'//img.alicdn.com/imgextra/i1/692558542/O1CN01VVJsPu2CyHh2xeU2d_!!692558542.jpg_640x0q85s150_.webp',13),(126,78,'//img.alicdn.com/imgextra/i2/692558542/O1CN01tefZUi2CyHh5PjH91_!!692558542.jpg_640x0q85s150_.webp',14),(127,78,'//img.alicdn.com/imgextra/i1/692558542/O1CN01jomct02CyHh5YCnfM_!!692558542.jpg_640x0q85s150_.webp',15),(128,78,'//img.alicdn.com/imgextra/i1/692558542/O1CN01aJoeIy2CyHh4jfXxM_!!692558542.jpg_640x0q85s150_.webp',16),(129,78,'//img.alicdn.com/imgextra/i2/692558542/O1CN0152ytHg2CyHh4jgLrH_!!692558542.jpg_640x0q85s150_.webp',17),(130,78,'//img.alicdn.com/imgextra/i2/692558542/O1CN01WCCrNT2CyHh5SLna8_!!692558542.jpg_640x0q85s150_.webp',18),(131,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01g4xHDG2CyHh2FBCac_!!692558542.jpg_640x0q85s150_.webp',19),(132,78,'//img.alicdn.com/imgextra/i3/692558542/O1CN012rzq242CyHgxqgMeL_!!692558542.jpg_640x0q85s150_.webp',20),(133,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01XsKwAz2CyHh2xgILl_!!692558542.jpg_640x0q85s150_.webp',21),(134,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01dZSlDp2CyHh4d25de_!!692558542.jpg_640x0q85s150_.webp',22),(135,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01PWSgaf2CyHh4jhYf2_!!692558542.jpg_640x0q85s150_.webp',23),(136,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01Yc77T52CyHh2FA84L_!!692558542.jpg_640x0q85s150_.webp',24),(137,78,'//img.alicdn.com/imgextra/i1/692558542/TB2ovYwa4XkpuFjy0FiXXbUfFXa_!!692558542.jpg_640x0q85s150_.webp',25),(138,78,'//gw.alicdn.com/tfs/TB1d0h2qVYqK1RjSZLeXXbXppXa-1125-960.png?getAvatar=avatar_640x0q85s150_.webp',26),(139,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01TlNp171qOdJV457nH_!!1889175486.jpg_640x0q85s150_.webp',1),(140,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01uy9ZfQ1qOdJWNPwJw_!!1889175486.jpg_640x0q85s150_.webp',2),(141,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01NHxVET1qOdJVfd5cg_!!1889175486.jpg_640x0q85s150_.webp',3),(142,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01d2XfVJ1qOdJTud7L5_!!1889175486.jpg_640x0q85s150_.webp',4),(143,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01vbHlCF1qOdJXPqzRv_!!1889175486.jpg_640x0q85s150_.webp',5),(144,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01C4PFQF1qOdJWTYztr_!!1889175486.jpg_640x0q85s150_.webp',6),(145,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01cFSNJ51qOdJXPt0D7_!!1889175486.jpg_640x0q85s150_.webp',7),(146,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01fY6kLm1qOdJVfcxLo_!!1889175486.jpg_640x0q85s150_.webp',8),(147,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01iknSHP1qOdJXccVdJ_!!1889175486.jpg_640x0q85s150_.webp',9),(148,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN012TKWAR1qOdJXudxpA_!!1889175486.jpg_640x0q85s150_.webp',10),(149,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01YHp4oi1qOdJXPravP_!!1889175486.jpg_640x0q85s150_.webp',11),(150,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01yhe0Em1qOdJXPs8D0_!!1889175486.jpg_640x0q85s150_.webp',12),(151,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01btBos01qOdJXPsX9Z_!!1889175486.jpg_640x0q85s150_.webp',13),(152,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01bZrsLd1qOdJXPto8n_!!1889175486.jpg_640x0q85s150_.webp',14),(153,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01dGtCvl1qOdJWJfjMr_!!1889175486.jpg_640x0q85s150_.webp',15),(154,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01t2gV8Z1qOdJVhXA6j_!!1889175486.jpg_640x0q85s150_.webp',16),(155,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01JVfv101qOdJVfehUJ_!!1889175486.jpg_640x0q85s150_.webp',17),(156,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01UpraA21qOdJWvA3n0_!!1889175486.jpg_640x0q85s150_.webp',18),(157,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01ZqqiuH1qOdJXufNCS_!!1889175486.jpg_640x0q85s150_.webp',19),(158,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01F3HbqR1qOdJXueIiQ_!!1889175486.jpg_640x0q85s150_.webp',20),(159,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01L2LcSj1qOdJXPuHJJ_!!1889175486.jpg_640x0q85s150_.webp',21),(160,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01NdDCoA1qOdJXPt0MQ_!!1889175486.jpg_640x0q85s150_.webp',22),(161,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01E0KMh61qOdJWNTA2A_!!1889175486.jpg_640x0q85s150_.webp',23),(162,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN015qTe2s1qOdJVhZe23_!!1889175486.jpg_640x0q85s150_.webp',24),(163,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01HZiZSM1qOdJVffAej_!!1889175486.jpg_640x0q85s150_.webp',25),(164,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01MQz35T1qOdJXuhmvn_!!1889175486.jpg_640x0q85s150_.webp',26),(165,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01tADwK51qOdJWvAOfv_!!1889175486.jpg_640x0q85s150_.webp',27),(166,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01HKIgo51qOdJWNSUUJ_!!1889175486.jpg_640x0q85s150_.webp',28),(167,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01PDAuVA1qOdJXcgOvs_!!1889175486.jpg_640x0q85s150_.webp',29),(168,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01aiRAgY1qOdJTuenS3_!!1889175486.jpg_640x0q85s150_.webp',30),(169,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01YR8ozi1qOdJUK15UW_!!1889175486.jpg_640x0q85s150_.webp',31),(170,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01Kv6kfk1qOdJXcgT6u_!!1889175486.jpg_640x0q85s150_.webp',32),(171,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01AnaOuY1qOdJXcfb3R_!!1889175486.jpg_640x0q85s150_.webp',33),(172,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01x1F7Xw1qOdJWTZP6X_!!1889175486.jpg_640x0q85s150_.webp',34),(173,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01i2TxhK1qOdJTufwBu_!!1889175486.jpg_640x0q85s150_.webp',35),(174,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN016BZRVA1qOdJXcgjmo_!!1889175486.jpg_640x0q85s150_.webp',36),(175,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN019Rhkzv1qOdJTDW1cH_!!1889175486.jpg_640x0q85s150_.webp',37),(176,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01NRk1Uo1qOdJVhaJjU_!!1889175486.jpg_640x0q85s150_.webp',38),(177,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01OMFM7T1qOdJWvBKyC_!!1889175486.jpg_640x0q85s150_.webp',39),(178,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01NqNVXU1qOdJWNSI7S_!!1889175486.jpg_640x0q85s150_.webp',40),(179,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01zJNpGM1qOdJWNUdeP_!!1889175486.jpg_640x0q85s150_.webp',41),(180,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01GZQk161qOdJTuiQ6O_!!1889175486.jpg_640x0q85s150_.webp',42),(181,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01Wpfctr1qOdJV48DIL_!!1889175486.jpg_640x0q85s150_.webp',43),(182,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01n89jZK1qOdJUK52sT_!!1889175486.jpg_640x0q85s150_.webp',44),(183,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01j0zOxx1qOdJXPwE6Q_!!1889175486.jpg_640x0q85s150_.webp',45),(184,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01xLARAa1qOdJVfj87g_!!1889175486.jpg_640x0q85s150_.webp',46),(185,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01i98uu01qOdJTDYi09_!!1889175486.jpg_640x0q85s150_.webp',47),(186,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01Auw7Qq1qOdJWvEHyu_!!1889175486.jpg_640x0q85s150_.webp',48),(187,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01kDWN7Z1qOdJWTbcPb_!!1889175486.jpg_640x0q85s150_.webp',49),(188,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01baG6wP1qOdJWJkMVY_!!1889175486.jpg_640x0q85s150_.webp',50),(189,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01BMTEIm1qOdJWNWRzC_!!1889175486.jpg_640x0q85s150_.webp',51),(190,84,'//gw.alicdn.com/tfs/TB1d0h2qVYqK1RjSZLeXXbXppXa-1125-960.png?getAvatar=avatar_640x0q85s150_.webp',52),(191,99,'//img.alicdn.com/imgextra/i4/53707532/O1CN01y1UCZu25Vhf7n8GJJ_!!53707532.png_640x0q85s150_.webp',1),(192,99,'//img.alicdn.com/imgextra/i2/53707532/O1CN014SWunZ25Vhf7Pm6IZ_!!53707532.png_640x0q85s150_.webp',2),(193,99,'//img.alicdn.com/imgextra/i4/53707532/O1CN0170lChL25Vhf9wOzL6_!!53707532.png_640x0q85s150_.webp',3),(194,99,'//img.alicdn.com/imgextra/i2/53707532/O1CN01Z0Ng8z25VhfALyuhm_!!53707532.png_640x0q85s150_.webp',4),(195,99,'//img.alicdn.com/imgextra/i2/53707532/O1CN01cZJVaw25Vhf8YF15h_!!53707532.png_640x0q85s150_.webp',5),(196,99,'//img.alicdn.com/imgextra/i4/53707532/O1CN01rLjBep25Vhf9wQOe3_!!53707532.png_640x0q85s150_.webp',6),(197,99,'//img.alicdn.com/imgextra/i4/53707532/O1CN01Th9LRj25VhfAqtCOD_!!53707532.png_640x0q85s150_.webp',7),(198,99,'//gw.alicdn.com/tfs/TB1d0h2qVYqK1RjSZLeXXbXppXa-1125-960.png?getAvatar=avatar_640x0q85s150_.webp',8);

/*Table structure for table `goods_img` */

DROP TABLE IF EXISTS `goods_img`;

CREATE TABLE `goods_img` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品Id',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `order_num` int(11) DEFAULT NULL COMMENT '排序数字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

/*Data for the table `goods_img` */

insert  into `goods_img`(`id`,`goods_id`,`img_url`,`order_num`) values (1,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN015frdVV1px9XdJ2qmt_!!82805426.jpg_640x640q85s150_.webp',1),(2,4,'https://img.alicdn.com/imgextra/i4/82805426/O1CN01inHCtm1px9XgsIfEV_!!82805426.jpg_640x640q85s150_.webp',2),(3,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN01RSZ7LK1px9XgcYEYO_!!82805426.jpg_640x640q85s150_.webp',3),(4,4,'https://img.alicdn.com/imgextra/i1/82805426/O1CN01m9XroT1px9XwoFXJL_!!82805426.jpg_640x640q85s150_.webp',4),(5,4,'https://img.alicdn.com/imgextra/i2/82805426/O1CN013eMoby1px9XedRsl9_!!82805426.jpg_640x640q85s150_.webp',5),(25,5,'//img.alicdn.com/imgextra/i1/3486615114/O1CN01ipLy3g1neFxW5v2qd_!!3486615114.jpg_640x640q85s150_.webp',1),(26,5,'//img.alicdn.com/imgextra/i4/3486615114/O1CN01rSl0JG1neFylMuC8W_!!3486615114.jpg_640x640q85s150_.webp',2),(27,5,'//img.alicdn.com/imgextra/i3/3486615114/TB2z2ilb0bJ8KJjy1zjXXaqapXa_!!3486615114.jpg_640x640q85s150_.webp',3),(28,5,'//img.alicdn.com/imgextra/i2/3486615114/O1CN011neFw707Bawjhvf_!!3486615114.jpg_640x640q85s150_.webp',4),(29,5,'//img.alicdn.com/imgextra/i2/3486615114/O1CN011neFvuYs2Rp3l6X_!!3486615114.jpg_640x640q85s150_.webp',5),(30,5,'//img.alicdn.com/imgextra/i1/3486615114/O1CN01ipLy3g1neFxW5v2qd_!!3486615114.jpg_640x640q85s150_.webp',6),(31,5,'//img.alicdn.com/imgextra/i4/3486615114/O1CN01rSl0JG1neFylMuC8W_!!3486615114.jpg_640x640q85s150_.webp',7),(32,6,'//img.alicdn.com/imgextra/i3/3998358685/O1CN01w2VEUg2E1mKSzrzlJ_!!3998358685.jpg_640x640q85s150_.webp',1),(33,6,'//img.alicdn.com/imgextra/i3/3998358685/O1CN01geZTLK2E1mKRrNz8J_!!3998358685.jpg_640x640q85s150_.webp',2),(34,6,'//img.alicdn.com/imgextra/i4/3998358685/O1CN01U9Gljh2E1mKRA9Nqp_!!3998358685.jpg_640x640q85s150_.webp',3),(35,6,'//img.alicdn.com/imgextra/i4/3998358685/O1CN01fgS2XX2E1mKTV4son_!!3998358685.jpg_640x640q85s150_.webp',4),(36,6,'//img.alicdn.com/imgextra/i2/3998358685/O1CN017GYeFW2E1mKKP4LDF_!!3998358685.jpg_640x640q85s150_.webp',5),(37,6,'//img.alicdn.com/imgextra/i3/3998358685/O1CN01w2VEUg2E1mKSzrzlJ_!!3998358685.jpg_640x640q85s150_.webp',6),(38,6,'//img.alicdn.com/imgextra/i3/3998358685/O1CN01geZTLK2E1mKRrNz8J_!!3998358685.jpg_640x640q85s150_.webp',7),(39,30,'//img.alicdn.com/imgextra/i1/921722821/TB2oau.aQCWBuNjy0FaXXXUlXXa_!!921722821.jpg_640x640q85s150_.webp',1),(40,30,'//img.alicdn.com/imgextra/i3/921722821/TB1IgW0aHGYBuNjy0FoXXciBFXa_!!0-item_pic.jpg_640x640q85s150_.webp',2),(41,30,'//img.alicdn.com/imgextra/i2/921722821/TB2fAzdaNGYBuNjy0FnXXX5lpXa_!!921722821.jpg_640x640q85s150_.webp',3),(42,30,'//img.alicdn.com/imgextra/i3/921722821/TB2lOSZXTXYBeNkHFrdXXciuVXa_!!921722821.jpg_640x640q85s150_.webp',4),(43,30,'//img.alicdn.com/imgextra/i2/921722821/TB2NxikXOCYBuNkHFCcXXcHtVXa_!!921722821.jpg_640x640q85s150_.webp',5),(44,30,'//img.alicdn.com/imgextra/i1/921722821/TB2oau.aQCWBuNjy0FaXXXUlXXa_!!921722821.jpg_640x640q85s150_.webp',6),(45,30,'//img.alicdn.com/imgextra/i3/921722821/TB1IgW0aHGYBuNjy0FoXXciBFXa_!!0-item_pic.jpg_640x640q85s150_.webp',7),(46,34,'//img.alicdn.com/imgextra/i3/700195909/O1CN011tWMorNoSiawcUf_!!700195909.jpg_640x640q85s150_.webp',1),(47,34,'//img.alicdn.com/imgextra/i1/700195909/TB2obwvjAfb_uJjSsrbXXb6bVXa_!!700195909.jpg_640x640q85s150_.webp',2),(48,34,'//img.alicdn.com/imgextra/i1/700195909/TB2RrGLk4PI8KJjSspoXXX6MFXa_!!700195909.jpg_640x640q85s150_.webp',3),(49,34,'//img.alicdn.com/imgextra/i3/700195909/TB29jfpkZLJ8KJjy0FnXXcFDpXa_!!700195909.jpg_640x640q85s150_.webp',4),(50,34,'//img.alicdn.com/imgextra/i3/700195909/TB2c3q_k46I8KJjy0FgXXXXzVXa_!!700195909.jpg_640x640q85s150_.webp',5),(51,34,'//img.alicdn.com/imgextra/i3/700195909/O1CN011tWMorNoSiawcUf_!!700195909.jpg_640x640q85s150_.webp',6),(52,34,'//img.alicdn.com/imgextra/i1/700195909/TB2obwvjAfb_uJjSsrbXXb6bVXa_!!700195909.jpg_640x640q85s150_.webp',7),(53,78,'//img.alicdn.com/imgextra/i2/692558542/O1CN01VZL3Fa2CyHh22n71a_!!692558542.jpg_640x640q85s150_.webp',1),(54,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN016GjWTh2CyHhQRZ4uK_!!0-item_pic.jpg_640x640q85s150_.webp',2),(55,78,'//img.alicdn.com/imgextra/i3/692558542/O1CN01CIrolv2CyHh1khMHG_!!692558542.jpg_640x640q85s150_.webp',3),(56,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01rbRw032CyHh1WnkjK_!!692558542.jpg_640x640q85s150_.webp',4),(57,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN01FX0Agq2CyHgzfUmta_!!692558542.jpg_640x640q85s150_.webp',5),(58,78,'//img.alicdn.com/imgextra/i2/692558542/O1CN01VZL3Fa2CyHh22n71a_!!692558542.jpg_640x640q85s150_.webp',6),(59,78,'//img.alicdn.com/imgextra/i4/692558542/O1CN016GjWTh2CyHhQRZ4uK_!!0-item_pic.jpg_640x640q85s150_.webp',7),(60,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01p6wdWr1qOdJVfjGWm_!!1889175486.jpg_640x640q85s150_.webp',1),(61,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01J9UZe21qOdJTDYRPm_!!1889175486.jpg_640x640q85s150_.webp',2),(62,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01NXPeTw1qOdJVHWXBg_!!1889175486.jpg_640x640q85s150_.webp',3),(63,84,'//img.alicdn.com/imgextra/i1/1889175486/O1CN01Qjtxjm1qOdJXuk0NV_!!1889175486.jpg_640x640q85s150_.webp',4),(64,84,'//img.alicdn.com/imgextra/i2/1889175486/O1CN01hdFgfY1qOdJV48LhW_!!1889175486.jpg_640x640q85s150_.webp',5),(65,84,'//img.alicdn.com/imgextra/i4/1889175486/O1CN01p6wdWr1qOdJVfjGWm_!!1889175486.jpg_640x640q85s150_.webp',6),(66,84,'//img.alicdn.com/imgextra/i3/1889175486/O1CN01J9UZe21qOdJTDYRPm_!!1889175486.jpg_640x640q85s150_.webp',7),(67,98,'//img.alicdn.com/imgextra/i3/739171675/O1CN011OFBsezMANh1OUq_!!739171675.jpg_640x640q85s150_.webp',1),(68,98,'//img.alicdn.com/imgextra/i1/739171675/O1CN011OFBsfcHzk7iB9x_!!739171675.jpg_640x640q85s150_.webp',2),(69,98,'//img.alicdn.com/imgextra/i1/739171675/O1CN011OFBsh5V9V7Kn0P_!!739171675.jpg_640x640q85s150_.webp',3),(70,98,'//img.alicdn.com/imgextra/i4/739171675/O1CN011OFBsfKWFGOkqVV_!!739171675.jpg_640x640q85s150_.webp',4),(71,98,'//img.alicdn.com/imgextra/i1/739171675/O1CN011OFBsgssE0kLki8_!!739171675.jpg_640x640q85s150_.webp',5),(72,98,'//img.alicdn.com/imgextra/i3/739171675/O1CN011OFBsezMANh1OUq_!!739171675.jpg_640x640q85s150_.webp',6),(73,98,'//img.alicdn.com/imgextra/i1/739171675/O1CN011OFBsfcHzk7iB9x_!!739171675.jpg_640x640q85s150_.webp',7),(74,99,'//img.alicdn.com/imgextra/i3/53707532/O1CN0147lmxp25VhfBJBE4W_!!53707532.jpg_640x640q85s150_.webp',1),(75,99,'//img.alicdn.com/imgextra/i2/53707532/O1CN01ceDVAg25VhfaTqRYP_!!0-item_pic.jpg_640x640q85s150_.webp',2),(76,99,'//img.alicdn.com/imgextra/i4/53707532/O1CN01nJ2hfR25Vhf9lWYpR_!!53707532.jpg_640x640q85s150_.webp',3),(77,99,'//img.alicdn.com/imgextra/i3/53707532/O1CN0147lmxp25VhfBJBE4W_!!53707532.jpg_640x640q85s150_.webp',4),(78,99,'//img.alicdn.com/imgextra/i2/53707532/O1CN01ceDVAg25VhfaTqRYP_!!0-item_pic.jpg_640x640q85s150_.webp',5);

/*Table structure for table `goods_props` */

DROP TABLE IF EXISTS `goods_props`;

CREATE TABLE `goods_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `prop_key` varchar(20) DEFAULT NULL COMMENT '属性名称',
  `prop_content` text COMMENT '属性值',
  `order_num` int(11) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

/*Data for the table `goods_props` */

insert  into `goods_props`(`id`,`goods_id`,`prop_key`,`prop_content`,`order_num`) values (1,4,'品牌','盛实',NULL),(2,4,'型号','YD55UB8200',NULL),(3,4,'运行内存','2GB',NULL),(4,4,'售后服务','全国联保',NULL),(5,4,'屏幕比例','16:9',NULL),(6,4,'接口类型','AV,HDMI,VGA,耳机接口,USB',NULL),(7,4,'面板类型','IPS',NULL),(8,4,'分辨率','4K电视',NULL),(9,4,'CPU核数','八核心',NULL),(10,4,'颜色分类','32寸高清网络版支持wifi,42寸4k高清网络版,55寸4k高清网络版,60寸4k高清网络版,65寸4k高清网络版,70寸4k高清网络版,75寸4k高清网络版,防爆42寸4k高清网络版,防爆55寸4k高清网络版,防爆60寸4k高清网络版,防爆65寸4k高清网络版,防爆70寸4k高清网络版,防爆75寸4k高清网络版,曲面防爆语音42寸4k网络版,曲面防爆语音55寸4k网络版,曲面防爆语音60寸4k网络版,曲面防爆语音65寸4k网络版,曲面防爆语音75寸4k网络版,曲面防爆语音70寸4k网络版',NULL),(11,4,'标称对比度','10000:1',NULL),(12,4,'同城服务','同城卖家送货上门',NULL),(13,4,'最佳观看距离','3.5-4.0米(52英寸)',NULL),(14,4,'存储内存','8GB',NULL),(15,4,'能效等级','三级',NULL),(16,4,'背光灯类型','LED发光二极管',NULL),(17,4,'电视类型','LED电视',NULL),(18,4,'网络连接方式','全部支持',NULL),(19,4,'刷屏率','60Hz',NULL),(20,4,'扫描方式','逐行扫描',NULL),(21,4,'扬声器数量','2个',NULL),(22,4,'接收制式','PAL\\NTSC\\SECAM',NULL),(23,4,'芯片类型','mstar648',NULL),(24,4,'操作系统','安卓',NULL),(25,4,'亮度','800cd/m^2',NULL),(26,4,'HDMI接口数量','2个',NULL),(27,4,'主机尺寸（不含底座）mm','1127.3*73.1*659.9mm',NULL),(28,4,'毛重','18kg',NULL),(29,4,'包装尺寸','1500x25x700mm',NULL),(30,4,'上市时间','2017-03',NULL),(31,4,'屏幕尺寸','55英寸',NULL),(32,4,'净重(不含底座)','16kg',NULL),(33,4,'电视形态','平板',NULL),(34,4,'采购地','中国大陆',NULL),(35,4,'片源内容','爱奇艺',NULL),(43,5,'品牌','王牌知音',1),(44,5,'型号','YS-K3202',2),(45,5,'售后服务','店铺三包',3),(46,5,'产地','中国大陆',4),(47,5,'屏幕比例','16:9',5),(48,5,'面板类型','IPS',6),(49,5,'分辨率','1366x768',7),(50,5,'颜色分类','32寸高清屏【普通电视版】,32寸高清屏【智能网络版】,42寸高清屏【普通电视版】,42寸高清屏【智能网络版】,55寸高清屏【普通电视版】,55寸高清屏【智能网络版】,30寸高清屏【智能网络版】,32寸高清【曲面网络版WIFI】,42寸高清【曲面网络版WIFI】,32寸高清级【普通电视版】,32寸高清级【智能网络版】,42寸高清级【普通电视版】,42寸高清级【智能网络版】,60寸高清屏【普通电视版】,60寸高清屏【智能网络版】,46寸高清屏【智能网络版】,46寸高清屏【普通电视版】,32寸一线屏【普通电视版】,32寸一线屏【智能网络版】,46寸高清级【普通电视版】,46寸高清级【智能网络版】',8),(51,5,'最佳观看距离','2.5m(含)-2.9m(含)',9),(52,5,'能效等级','三级',10),(53,5,'背光灯类型','LED发光二极管',11),(54,5,'电视类型','LED电视',12),(55,5,'网络连接方式','全部支持',13),(56,5,'扫描方式','逐行扫描',14),(57,5,'扬声器数量','2个',15),(58,5,'接收制式','PAL\\NTSC\\SECAM',16),(59,5,'附加功能','地面数字信号接收,数字一体机,USB媒体播放,WIFI,网络高清播放,网络在线电影',17),(60,5,'操作系统','安卓',18),(61,5,'HDMI接口数量','1个',19),(62,5,'视频显示格式','1080p',20),(63,5,'上市时间','2017-07',21),(64,5,'屏幕尺寸','32英寸',22),(65,5,'能效备案号','201801-22-11021271-2751671104235',23),(66,5,'电视形态','平板',24),(67,5,'采购地','中国大陆',25),(68,6,'品牌','惠菱',1),(69,6,'型号','JM-8832C',2),(70,6,'产地','其他海外地区',3),(71,6,'分辨率','1920x1080',4),(72,6,'颜色分类','17寸液晶电视,19寸液晶电视,22寸液晶电视,26寸液晶电视,28寸液晶电视,30寸液晶电视,32寸液晶电视,17寸液晶电视【网络版】,19寸液晶电视【网络版】,22寸液晶电视【网络版】,26寸液晶电视【网络版】,28寸液晶电视【网络版】,30寸液晶电视【网络版】,32寸液晶电视【网络版】,网络机顶盒',5),(73,6,'套餐类型','官方标配',6),(74,6,'能效等级','无',7),(75,6,'电视类型','LCD电视',8),(76,6,'网络连接方式','全部支持',9),(77,6,'操作系统','安卓',10),(78,6,'上市时间','2019-01',11),(79,6,'屏幕尺寸','32英寸',12),(80,6,'电视形态','平板',13),(81,6,'采购地','其他海外地区',14),(82,30,'生产日期','2018年10月15日 至 2018年10月15日',1),(83,30,'生产许可证编号','SC11723270100977',2),(84,30,'产品标准号','Q/DHS 0001S',3),(85,30,'厂名','大兴安岭黑森野生蓝莓科技开发有限公司',4),(86,30,'厂址','大兴安岭地区加格达奇区东山社区朝阳居委会',5),(87,30,'厂家联系方式','0596-6239666',6),(88,30,'配料表','野生蓝莓干 野生蔓越莓干',7),(89,30,'储藏方法','密封避光置于阴凉干燥处或冰箱冷藏',8),(90,30,'保质期','180',9),(91,30,'食品添加剂','无',10),(92,30,'品牌','许氏醇品',11),(93,30,'系列','健康小食',12),(94,30,'食品工艺','果干类',13),(95,30,'产地','中国大陆',14),(96,30,'省份','黑龙江省',15),(97,30,'城市','大兴安岭地区',16),(98,30,'是否含糖','含糖',17),(99,30,'包装方式','包装',18),(100,30,'特产品类','大兴安岭蓝莓果干',19),(101,30,'净含量','200g',20),(102,34,'生产日期','2019年01月10日 至 2019年02月12日',1),(103,34,'生产许可证编号','SC11837048102009',2),(104,34,'厂名','滕州市解馋电子商务有限公司',3),(105,34,'厂址','山东省枣庄市滕州市龙泉街道西大庙村207号（京福高速路西）',4),(106,34,'厂家联系方式','0632-5055975',5),(107,34,'配料表','种植蓝莓 白砂糖 葵瓜子油',6),(108,34,'储藏方法','阴凉干燥处存放',7),(109,34,'保质期','300',8),(110,34,'食品添加剂','无',9),(111,34,'净含量','250g',10),(112,34,'包装方式','包装',11),(113,34,'品牌','壮壮豆豆',12),(114,34,'系列','蓝莓干',13),(115,34,'产地','中国大陆',14),(116,34,'省份','山东省',15),(117,34,'城市','枣庄市',16),(118,78,'品牌','miss38',1),(119,78,'适用年龄','25-29周岁',2),(120,78,'面料','棉,其他',3),(121,78,'尺码','34,36,38,40,42,44',4),(122,78,'图案','纯色',5),(123,78,'风格','街头',6),(124,78,'大码女装分类','牛仔裤',7),(125,78,'颜色分类','黑色',8),(126,78,'组合形式','单件',9),(127,78,'货号','01097',10),(128,78,'成分含量','96%及以上',11),(129,78,'年份季节','2019年春季',12),(130,78,'厚薄','适中',13),(131,78,'服装版型','修身',14),(132,78,'服装款式细节','口袋',15),(133,78,'服饰工艺','立体裁剪',16),(134,78,'裤长','长裤',17),(135,84,'尺码','大码XL（100-130斤）,大码2XL（130-170斤）,大码3XL（170-210斤）',1),(136,84,'风格','街头',2),(137,84,'领型','圆领',3),(138,84,'颜色分类','印花美女短袖白色,印花美女短袖黑色,印花美女短袖灰色',4),(139,84,'组合形式','单件',5),(140,84,'年份季节','2019年春季',6),(141,84,'袖长','短袖',7),(142,84,'穿着方式','套头',8),(143,84,'厚薄','适中',9),(144,84,'衣长','常规',10),(145,84,'服装版型','宽松',11),(146,84,'服饰工艺','立体裁剪',12),(147,99,'品牌','Lancome/兰蔻',1),(148,99,'兰蔻单品','菁纯臻颜日霜',2),(149,99,'产地','法国',3),(150,99,'乳液/面霜品类','面霜',4),(151,99,'批准文号','国妆备进字J20097183',5),(152,99,'上市时间','2002年',6),(153,99,'功效','修护,保湿,提拉紧致',7),(154,99,'规格类型','小样',8),(155,99,'是否为特殊用途化妆品','否',9);

/*Table structure for table `goods_service` */

DROP TABLE IF EXISTS `goods_service`;

CREATE TABLE `goods_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `service_key` varchar(255) DEFAULT NULL COMMENT '服务名称',
  `service_content` varchar(255) DEFAULT NULL COMMENT '服务内容',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `goods_service` */

insert  into `goods_service`(`id`,`goods_id`,`service_key`,`service_content`,`order_num`) values (1,4,'订单险','保险公司全程担保赔付该商品每笔交易的售后',NULL),(2,4,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',NULL),(3,4,'运费险','卖家为您购买的商品投保退货运费险（保单生效以确认订单页展示的运费险为准）',NULL),(4,4,'公益宝贝','购买该商品，每笔成交都会有相应金额捐赠给公益。感谢您的支持，愿公益的快乐伴随您每一天。',NULL),(5,4,'48小时内发货','卖家会在承诺时间内发货，官方活动期间的发货时间以具体活动要求为准，如买家与卖家另有约定时间（含预约配送），从其约定。',NULL),(6,5,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',1),(7,5,'运费险','卖家为您购买的商品投保退货运费险（保单生效以确认订单页展示的运费险为准）',2),(8,5,'公益宝贝','购买该商品，每笔成交都会有相应金额捐赠给公益。感谢您的支持，愿公益的快乐伴随您每一天。',3),(9,5,'48小时内发货','卖家会在承诺时间内发货，官方活动期间的发货时间以具体活动要求为准，如买家与卖家另有约定时间（含预约配送），从其约定。',4),(10,6,'订单险','保险公司全程担保赔付该商品每笔交易的售后',1),(11,6,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',2),(12,6,'运费险','卖家为您购买的商品投保退货运费险（保单生效以确认订单页展示的运费险为准）',3),(13,6,'公益宝贝','购买该商品，每笔成交都会有相应金额捐赠给公益。感谢您的支持，愿公益的快乐伴随您每一天。',4),(14,6,'48小时内发货','卖家会在承诺时间内发货，官方活动期间的发货时间以具体活动要求为准，如买家与卖家另有约定时间（含预约配送），从其约定。',5),(15,30,'坏单包赔','商家承诺所售商品在签收时如有商品破损、变质、动植物死亡等情况，可在24小时内向商家举证，商家在24小时内响应买家退款或退货需求。',1),(16,30,'订单险','保险公司全程担保赔付该商品每笔交易的售后',2),(17,30,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',3),(18,34,'坏单包赔','商家承诺所售商品在签收时如有商品破损、变质、动植物死亡等情况，可在24小时内向商家举证，商家在24小时内响应买家退款或退货需求。',1),(19,34,'订单险','保险公司全程担保赔付该商品每笔交易的售后',2),(20,34,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',3),(21,78,'15天退货','15天退货，退货邮费买家承担',1),(22,78,'24小时内发货',NULL,2),(23,84,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',1),(24,84,'15天内发货',NULL,2),(25,99,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',1),(26,99,'运费险','卖家为您购买的商品投保退货运费险（保单生效以确认订单页展示的运费险为准）',2),(27,99,'30天内发货',NULL,3);

/*Table structure for table `goods_sku` */

DROP TABLE IF EXISTS `goods_sku`;

CREATE TABLE `goods_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `price_money` int(11) DEFAULT '0' COMMENT '商品价格：分为单位',
  `price_text` varchar(255) DEFAULT NULL COMMENT '价格文本',
  `quantity` int(11) DEFAULT '0' COMMENT '库存',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `goods_sku` */

insert  into `goods_sku`(`id`,`goods_id`,`price_money`,`price_text`,`quantity`,`sku_name`) values (1,5,0,NULL,0,'32寸高清屏【普通电视版】 黑色'),(2,5,0,NULL,0,'32寸高清屏【智能网络版】 黑色'),(3,5,0,NULL,0,'42寸高清屏【普通电视版】 黑色'),(4,5,0,NULL,0,'42寸高清屏【智能网络版】 黑色'),(5,5,0,NULL,0,'55寸高清屏【普通电视版】 金色/黑色'),(6,5,0,NULL,0,'55寸高清屏【智能网络版】 金色/黑色'),(7,5,0,NULL,0,'30寸高清屏【智能网络版】 黑色'),(8,5,0,NULL,0,'32寸高清【曲面网络版WIFI】 黑色'),(9,5,0,NULL,0,'42寸高清【曲面网络版WIFI】 黑色'),(10,5,0,NULL,0,'32寸高清级【普通电视版】 黑色'),(11,5,0,NULL,0,'32寸高清级【智能网络版】 黑色'),(12,5,0,NULL,0,'42寸高清级【普通电视版】 黑色'),(13,5,0,NULL,0,'42寸高清级【智能网络版】 黑色'),(14,5,0,NULL,0,'60寸高清屏【普通电视版】 金色'),(15,5,0,NULL,0,'60寸高清屏【智能网络版】 金色'),(16,5,0,NULL,0,'46寸高清屏【智能网络版】 黑色'),(17,5,0,NULL,0,'46寸高清屏【普通电视版】 黑色'),(18,5,0,NULL,0,'32寸一线屏【普通电视版】 黑色'),(19,5,0,NULL,0,'32寸一线屏【智能网络版】 黑色'),(20,5,0,NULL,0,'46寸高清级【普通电视版】 黑色'),(21,5,0,NULL,0,'46寸高清级【智能网络版】 黑色'),(22,6,0,NULL,0,'17寸液晶电视'),(23,6,0,NULL,0,'19寸液晶电视'),(24,6,0,NULL,0,'22寸液晶电视'),(25,6,0,NULL,0,'26寸液晶电视'),(26,6,0,NULL,0,'28寸液晶电视'),(27,6,0,NULL,0,'30寸液晶电视'),(28,6,0,NULL,0,'32寸液晶电视'),(29,6,0,NULL,0,'17寸液晶电视【网络版】'),(30,6,0,NULL,0,'19寸液晶电视【网络版】'),(31,6,0,NULL,0,'22寸液晶电视【网络版】'),(32,6,0,NULL,0,'26寸液晶电视【网络版】'),(33,6,0,NULL,0,'28寸液晶电视【网络版】'),(34,6,0,NULL,0,'30寸液晶电视【网络版】'),(35,6,0,NULL,0,'32寸液晶电视【网络版】'),(36,6,0,NULL,0,'网络机顶盒'),(37,78,0,NULL,0,'黑色'),(38,84,0,NULL,0,'印花美女短袖白色 预售15天发货'),(39,84,0,NULL,0,'印花美女短袖黑色 预售15天发货'),(40,84,0,NULL,0,'印花美女短袖灰色 预售15天发货');

/*Table structure for table `miaosha_goods` */

DROP TABLE IF EXISTS `miaosha_goods`;

CREATE TABLE `miaosha_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '秒杀商品Id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `miaosha_price` decimal(10,2) DEFAULT '0.00' COMMENT '秒杀价',
  `stock_count` int(11) DEFAULT '0' COMMENT '库存数量',
  `start_date` datetime DEFAULT NULL COMMENT '秒杀开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '秒杀结束时间',
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `miaosha_goods` */

insert  into `miaosha_goods`(`id`,`goods_id`,`miaosha_price`,`stock_count`,`start_date`,`end_date`,`start_time`,`end_time`) values (1,1,'399.00',100,'2019-03-03 21:10:23','2019-03-04 21:10:26','2019-03-04 22:25:21','2019-03-28 22:25:27'),(2,2,'556.00',95,'2019-03-06 15:20:55','2019-03-07 21:10:57','2019-03-03 22:25:29','2019-03-04 22:25:33'),(3,3,'1.99',100,'2019-03-06 21:11:24','2019-03-28 21:11:26','2019-03-13 22:25:36','2019-03-20 22:25:39');

/*Table structure for table `miaosha_order` */

DROP TABLE IF EXISTS `miaosha_order`;

CREATE TABLE `miaosha_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_good_user` (`user_id`,`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `miaosha_order` */

insert  into `miaosha_order`(`id`,`user_id`,`goods_id`,`order_id`) values (6,3,2,6);

/*Table structure for table `order_info` */

DROP TABLE IF EXISTS `order_info`;

CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `delivery_addr_id` bigint(20) DEFAULT NULL COMMENT '收货地址id',
  `goods_name` varchar(16) DEFAULT NULL COMMENT '商品名称',
  `goods_count` int(11) DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `order_channel` tinyint(4) DEFAULT '0' COMMENT '1pc 2android 3ios',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态 0新建支付 1已支付 2 已发货 3已收货 4已退款 5已完成',
  `create_date` datetime DEFAULT NULL COMMENT '订单创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `order_info` */

insert  into `order_info`(`id`,`user_id`,`goods_id`,`delivery_addr_id`,`goods_name`,`goods_count`,`goods_price`,`order_channel`,`status`,`create_date`,`pay_date`) values (6,3,2,0,'万茂液晶电视',1,'556.00',1,0,'2019-03-10 22:24:55',NULL);

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai'),('RenrenScheduler','TASK_2','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X���0xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0有参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),('RenrenScheduler','TASK_2','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X�w�`xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0无参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('RenrenScheduler','SC-2018112510341550208727483',1550208854779,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1550210400000,-1,5,'WAITING','CRON',1550208677000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X���0xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0有参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),('RenrenScheduler','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1550210400000,-1,5,'PAUSED','CRON',1550208677000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X�w�`xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0无参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0x\0');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

/*Data for the table `schedule_job` */

insert  into `schedule_job`(`job_id`,`bean_name`,`method_name`,`params`,`cron_expression`,`status`,`remark`,`create_time`) values (1,'testTask','test','renren','0 0/30 * * * ?',0,'有参数测试','2016-12-01 23:16:46'),(2,'testTask','test2',NULL,'0 0/30 * * * ?',1,'无参数测试','2016-12-03 14:55:56');

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门管理';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`name`,`order_num`,`del_flag`) values (1,0,'人人开源集团',0,0),(2,1,'长沙分公司',1,0),(3,1,'上海分公司',2,0),(4,3,'技术部',0,0),(5,3,'销售部',1,0);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`name`,`type`,`code`,`value`,`order_num`,`remark`,`del_flag`) values (1,'性别','sex','0','女',0,NULL,0),(2,'性别','sex','1','男',1,NULL,0),(3,'性别','sex','2','未知',3,NULL,0);

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values (1,0,'系统管理',NULL,NULL,0,'fa fa-cog',0),(2,1,'管理员管理','modules/sys/user.html',NULL,1,'fa fa-user',1),(3,1,'角色管理','modules/sys/role.html',NULL,1,'fa fa-user-secret',2),(4,1,'菜单管理','modules/sys/menu.html',NULL,1,'fa fa-th-list',3),(5,1,'SQL监控','druid/sql.html',NULL,1,'fa fa-bug',4),(6,1,'定时任务','modules/job/schedule.html',NULL,1,'fa fa-tasks',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:perms',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:perms',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','modules/sys/config.html','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'fa fa-sun-o',6),(29,1,'系统日志','modules/sys/log.html','sys:log:list',1,'fa fa-file-text-o',7),(30,1,'文件上传','modules/oss/oss.html','sys:oss:all',1,'fa fa-file-image-o',6),(31,1,'部门管理','modules/sys/dept.html',NULL,1,'fa fa-file-code-o',1),(32,31,'查看',NULL,'sys:dept:list,sys:dept:info',2,NULL,0),(33,31,'新增',NULL,'sys:dept:save,sys:dept:select',2,NULL,0),(34,31,'修改',NULL,'sys:dept:update,sys:dept:select',2,NULL,0),(35,31,'删除',NULL,'sys:dept:delete',2,NULL,0),(36,1,'字典管理','modules/sys/dict.html',NULL,1,'fa fa-bookmark-o',6),(37,36,'查看',NULL,'sys:dict:list,sys:dict:info',2,NULL,6),(38,36,'新增',NULL,'sys:dict:save',2,NULL,6),(39,36,'修改',NULL,'sys:dict:update',2,NULL,6),(40,36,'删除',NULL,'sys:dict:delete',2,NULL,6);

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

/*Data for the table `sys_oss` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

/*Data for the table `sys_role_dept` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`dept_id`,`create_time`) values (1,'admin','e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

/*Table structure for table `tb_banner` */

DROP TABLE IF EXISTS `tb_banner`;

CREATE TABLE `tb_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(255) DEFAULT NULL COMMENT '点击图片后，跳转的地址',
  `order_num` int(10) unsigned DEFAULT NULL COMMENT '排序标识 数字越小 越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_banner` */

insert  into `tb_banner`(`id`,`img_url`,`link_url`,`order_num`) values (1,'https://gw.alicdn.com/imgextra/i1/65/O1CN01ToDrZD1CLoFYptkY2_!!65-0-lubanu.jpg',NULL,1),(2,'https://aecpm.alicdn.com/simba/img/TB1CWf9KpXXXXbuXpXXSutbFXXX.jpg_q50.jpg',NULL,2),(3,'https://aecpm.alicdn.com/simba/img/TB14ab1KpXXXXclXFXXSutbFXXX.jpg_q50.jpg',NULL,3),(4,'https://gw.alicdn.com/imgextra/i3/190/O1CN01MuOogz1DH3l2SC4v0_!!190-0-lubanu.jpg',NULL,4),(5,'https://gw.alicdn.com/imgextra/i4/99/O1CN015czayt1CbNi8wfAGE_!!99-0-lubanu.jpg',NULL,5),(6,'https://img.alicdn.com/tps/i4/TB1_I0aIY2pK1RjSZFsSuuNlXXa.jpg',NULL,6),(7,'https://gw.alicdn.com/imgextra/i3/159/O1CN01MUsmqT1D2rTWpO4cO_!!159-0-lubanu.jpg',NULL,7),(8,'https://gw.alicdn.com/imgextra/i4/89/O1CN01h7lp731CWnks8nKH6_!!89-0-lubanu.jpg',NULL,8);

/*Table structure for table `tb_nav` */

DROP TABLE IF EXISTS `tb_nav`;

CREATE TABLE `tb_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `order_num` int(10) unsigned DEFAULT NULL COMMENT '排序标识 越小越靠前',
  `nav_name` varchar(10) DEFAULT NULL COMMENT '导航名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tb_nav` */

insert  into `tb_nav`(`id`,`img_url`,`link_url`,`order_num`,`nav_name`) values (1,'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',NULL,1,'天猫'),(2,'https://img.alicdn.com/tfs/TB10UHQaNjaK1RjSZKzXXXVwXXa-183-144.png?getAvatar=1_.webp',NULL,2,'聚划算'),(3,'https://gw.alicdn.com/tfs/TB11rTqtj7nBKNjSZLeXXbxCFXa-183-144.png?getAvatar=1_.webp',NULL,3,'天猫国际'),(4,'https://gw.alicdn.com/tps/TB1eXc7PFXXXXb4XpXXXXXXXXXX-183-144.png?getAvatar=1_.webp',NULL,4,'外卖'),(5,'https://gw.alicdn.com/tfs/TB1IKqDtpooBKNjSZFPXXXa2XXa-183-144.png_.webp',NULL,5,'天猫超市'),(6,'https://gw.alicdn.com/tfs/TB1o0FLtyMnBKNjSZFoXXbOSFXa-183-144.png_.webp',NULL,6,'充值中心'),(7,'https://gw.alicdn.com/tfs/TB1ydXzhCzqK1RjSZPcXXbTepXa-183-144.png?getAvatar=1_.webp',NULL,7,'飞猪旅行'),(8,'https://gw.alicdn.com/tfs/TB1BqystrZnBKNjSZFrXXaRLFXa-183-144.png?getAvatar=1_.webp',NULL,8,'领金币'),(9,'https://gw.alicdn.com/tfs/TB1CMf4tlnTBKNjSZPfXXbf1XXa-183-144.png?getAvatar=1_.webp',NULL,9,'拍卖'),(10,'https://gw.alicdn.com/tfs/TB18P98tyQnBKNjSZFmXXcApVXa-183-144.png?getAvatar=1_.webp',NULL,10,'分类');

/*Table structure for table `tb_token` */

DROP TABLE IF EXISTS `tb_token`;

CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

/*Data for the table `tb_token` */

insert  into `tb_token`(`user_id`,`token`,`expire_time`,`update_time`) values (2,'5ca17a5077ba47048dc8c0274296dc64','2019-02-25 04:28:21','2019-02-24 16:28:21'),(3,'986ccf64e75346b39bb5728bb01c23a8','2019-03-17 01:24:18','2019-03-16 13:24:18');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(30) DEFAULT NULL COMMENT '登录ip',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`mobile`,`password`,`create_time`,`ip`,`login_time`) values (1,'mark','13612345678','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','2017-03-23 22:37:41',NULL,NULL),(2,'admin','13562959695','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,NULL,NULL),(3,'18865392565','18865392565','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','2019-02-25 14:17:16','0:0:0:0:0:0:0:1','2019-03-16 13:24:18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
