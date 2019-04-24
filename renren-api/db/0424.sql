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

/*Table structure for table `cms_help` */

DROP TABLE IF EXISTS `cms_help`;

CREATE TABLE `cms_help` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int(1) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助表';

/*Data for the table `cms_help` */

/*Table structure for table `cms_help_category` */

DROP TABLE IF EXISTS `cms_help_category`;

CREATE TABLE `cms_help_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `help_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助分类表';

/*Data for the table `cms_help_category` */

/*Table structure for table `cms_member_report` */

DROP TABLE IF EXISTS `cms_member_report`;

CREATE TABLE `cms_member_report` (
  `id` bigint(20) DEFAULT NULL,
  `report_type` int(1) DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) DEFAULT NULL COMMENT '举报人',
  `create_time` datetime DEFAULT NULL,
  `report_object` varchar(100) DEFAULT NULL,
  `report_status` int(1) DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(1) DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户举报表';

/*Data for the table `cms_member_report` */

/*Table structure for table `cms_prefrence_area` */

DROP TABLE IF EXISTS `cms_prefrence_area`;

CREATE TABLE `cms_prefrence_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `pic` varbinary(500) DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优选专区';

/*Data for the table `cms_prefrence_area` */

insert  into `cms_prefrence_area`(`id`,`name`,`sub_title`,`pic`,`sort`,`show_status`) values (1,'让音质更出众','音质不打折 完美现场感',NULL,NULL,1),(2,'让音质更出众22','让音质更出众22',NULL,NULL,NULL),(3,'让音质更出众33',NULL,NULL,NULL,NULL),(4,'让音质更出众44',NULL,NULL,NULL,NULL);

/*Table structure for table `cms_prefrence_area_product_relation` */

DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;

CREATE TABLE `cms_prefrence_area_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='优选专区和产品关系表';

/*Data for the table `cms_prefrence_area_product_relation` */

insert  into `cms_prefrence_area_product_relation`(`id`,`prefrence_area_id`,`product_id`) values (1,1,12),(2,1,13),(3,1,14),(4,1,18),(5,1,7),(6,2,7),(7,1,22),(24,1,23);

/*Table structure for table `cms_subject` */

DROP TABLE IF EXISTS `cms_subject`;

CREATE TABLE `cms_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `album_pics` varchar(1000) DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text,
  `forward_count` int(11) DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='专题表';

/*Data for the table `cms_subject` */

insert  into `cms_subject`(`id`,`category_id`,`title`,`pic`,`product_count`,`recommend_status`,`create_time`,`collect_count`,`read_count`,`comment_count`,`album_pics`,`description`,`show_status`,`content`,`forward_count`,`category_name`) values (1,1,'轮廓分明，双摄手机映现细腻美照','https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t26434/217/1381240043/254214/290f9d5b/5bc6c11cN54567a27.jpg!q70.jpg',NULL,1,'2018-11-11 13:26:55',100,1000,100,NULL,'手机对于拍照党来说，已经不仅仅是通讯工具那么简单了。因为有时TA还充当着“单反”的角色，来不断地带给那些喜欢拍照的人惊喜。所以，在这里准备一波高颜值的双摄手机来给大家。让TA们灵敏捕捉影像的能力，为你展现出轮廓更加分明、且画质更加细腻的美照。',1,NULL,NULL,'精选专题'),(2,1,'交通拥挤有妙招，电动车小巧穿行无障碍','https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t14224/229/529700229/74868/a1cc7364/5a314f85N5bfd22c7.jpg!q70.jpg',NULL,1,'2018-11-12 13:27:00',100,1000,100,NULL,'随着人们消费水平的提高，公路上的小车是越来越多了，导致每到上下班高峰期的时候，大路的车辆堵了一环又一环，而且你根本不知道它到底会塞多久，所以我们需要变通一下，不妨骑上电动车来个绿色出行，它够小巧玲珑，即使交通再怎么拥挤，也总有它可以通过的地方。',1,NULL,NULL,'精选专题'),(3,1,'无酒不成席，甘香白酒开怀助兴','https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t1/881/4/12265/114011/5bd1446fEc71114bf/68925bfb4a2adc44.jpg!q70.jpg',NULL,1,'2018-11-13 13:27:05',100,1000,100,NULL,'白酒是由各种优质的高粱，小麦，大米等谷物为原料，经过传统工艺的长时间酿造，酒液在这样的环境中慢慢发酵，最终变成清香浓郁的白酒，被摆上人们的餐桌，供人畅饮，是一种受到大众喜爱的绝佳饮品。',1,NULL,NULL,'精选专题'),(4,2,'真规划不盲扫，全域清洁净无尘','https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t15205/35/2539924281/429185/72fa7857/5aab2c4bN6a32a6c5.png',NULL,1,'2018-11-01 13:27:09',100,1000,100,NULL,'科技时代，聪明女人会选择用智慧来减负，和繁琐的家务挥手再见，才能腾出更多休闲时间。规划式扫地机器人设计个性化，它能够跟据房间布置呈现清扫路线，实现规划式覆盖性清洁，少遗漏不盲扫，从而大幅度降低损耗，侦测技术遇到家具及时避让，杜绝猛烈撞击，任它灵巧穿梭于低矮空间，坐享居家净无尘。',1,NULL,NULL,'家电专题'),(5,2,'抑菌更纯净，直饮净水保家人健康','https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t11428/340/1504074828/20474/1e8cab1e/5a0305d3Nb1e7a762.jpg!q70.jpg',NULL,1,'2018-11-06 13:27:18',100,1000,100,NULL,'在城里居住，首先要担心的是饮水问题。桶装水太贵不够经济，还不一定是干净的。自己去干净的水源地取水也不切实际。此时只有选择在家里安装一台净水器才实在。装上一台直饮式的净水器，方便安全，关键是水质过滤得比较纯净，很大限度地处理了大部分的废弃物，留下健康的矿物质水。好生活，从一口干净的纯净水开始。',1,NULL,NULL,'家电专题'),(6,2,'储鲜冷冻灵活变，多门无霜更贴心','https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t13015/356/2397552584/605232/46c88e6e/5a5321bcN6a8866f0.png',NULL,1,'2018-11-07 13:27:21',100,1000,100,NULL,'春节临近，每个家庭都要储备不少食材，但各种食材的保鲜方式与温度不尽相同，而多门风冷冰箱能轻松满足您。它们容积大占地小，拥有多个可以独立调节温度的温区，满足对不同类食材的存放需求，同时省去除霜烦恼，还可以通过温度调节满足您对大冷藏及大冷冻的需求变化，从而带来更好的保鲜冷冻体验，为新年宴请保驾护航。',1,NULL,NULL,'家电专题'),(7,2,'想喝健康水，就用304不锈钢热水壶','https://img13.360buyimg.com/mobilecms/s1500x600_jfs/t12541/90/443985343/33603/65d6e884/5a0bb77aNff08550a.jpg!q70.jpg',NULL,1,'2019-01-29 11:21:55',100,1000,100,NULL,'大冬天的喝一口热水，不仅能够暧身还可以给身体补充足够的水份，但是对于热水壶的购买却是需要慎之又慎，材质不好的热水壶在烧水的过程当中极容易产生对身体不利的有害物，极大影响人们的身体健康。304不锈钢热水壶选用食品级不不锈钢，确保水质安全，烧水健康好水，为您的饮水健康保驾护航。',1,NULL,NULL,'家电专题'),(8,2,'你尽情赖床！早餐“煲”在它身上','https://img14.360buyimg.com/mobilecms/s1500x600_jfs/t15949/363/1450937723/89513/7d8c1219/5a531d28N2aaec2a6.jpg!q70.jpg',NULL,1,'2019-01-29 13:07:13',100,1000,100,NULL,'赖床不想起，饿了的时候想吃饭又要现做等待简直饥肠辘辘让人心烦，所以一款带有预约功能的电饭煲简直不要太贴心，你睡懒觉的时候它已经给你做好了香滑软糯的粥，起床就能享美味是不是很贴心呐。',1,NULL,NULL,'家电专题'),(9,2,'小白变大厨，微波炉为实力加持','https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t1/8774/21/11460/38908/5c2cbfcfEdab1ef03/d5800f0f7cf05b38.jpg!q70.jpg',NULL,1,'2019-01-29 13:08:18',100,1000,100,NULL,'对于厨艺小白而言，没有什么能比掌握好火候更来得困难的了！毕竟烹饪出食物的味道好坏，很大程度上还是对火候的掌控，想要轻松掌握火候，当然少不了一款微波炉的撑场，内设多功能，满足不同的烹饪需求，简单方便易操作，让厨艺小白秒变大师！',1,NULL,NULL,'家电专题'),(10,2,'十秒鲜榨，冬日把爱浓缩成杯果汁','https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t13708/126/308291722/542847/26ee6edd/5a07dc72N3252a9e0.png',NULL,1,'2019-01-29 13:10:02',100,1000,100,NULL,'寒瑟冬日女友不喜欢吃水果，用便携迷你果汁机，撩妹又养胃。一按一转，碾压切割，简单快速制作，压榨出纯原味果汁。一键启动，十秒出汁，保留食物营养，轻轻松松粉碎食物，营养在手，说走就走。',1,NULL,NULL,'家电专题'),(11,3,'饭点未到肚已空？美味饼干先充饥','https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t13240/79/443357432/38567/94792c4c/5a0ba054N89388654.jpg!q70.jpg',NULL,1,'2019-01-29 13:10:45',100,1000,100,NULL,'一上午都把精力集中在工作中，刚闲下来就发现自己已是饥肠辘辘了，可饭点却还没到，怎么办呢？不妨让这些美味饼干先帮你充充饥吧！酥香松脆有营养，每一口都让人回味无穷，既能满足你挑剔的味蕾又能起到果腹效果，快快为自己备上吧！',1,NULL,NULL,'美食专题'),(12,3,'赖床无罪，香酥面包营养又便捷','https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t9775/33/1197239610/38547/34899011/59ddbd01N0bd693bb.jpg!q70.jpg',NULL,1,'2019-01-29 13:11:41',100,1000,100,NULL,'赖床是很多年轻人的通病，特别是秋冬季节，都会恋恋不舍温暖的被窝。对于苦逼的上班族来说，就算再多睡几分钟，还是要起床的，甚至来不及吃早餐。面包营养丰富，能快速饱腹，且携带方便，再搭配一盒牛奶，一顿简单而不失营养的早餐能提供一天的能量，让赖床族多睡几分钟也无妨。',1,NULL,NULL,'美食专题'),(13,3,'夹心饼干，予多重滋味交织舌尖','https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t18877/139/652452758/27262/36e6ed6e/5a9d5b6dN327150e8.jpg!q70.jpg',NULL,1,'2019-01-29 13:12:38',100,1000,100,NULL,'饼干味道香脆可口，深受不少人的青睐。饼干的种类多样，而夹心饼干就是其中一种，相比普通饼干而言，夹心饼干有着更丰富的口感，当肚子空空如也的时候，来一些美味的夹心饼干，既能解馋，又能扛饿。下面就为大家推荐一组好吃的夹心饼干，作为办公室小零食非常不错。',1,NULL,NULL,'美食专题'),(14,4,'户外Party，便携音箱烘气氛','https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t17125/265/644948348/42066/6f2dc610/5a9c9da1N9a95ee2c.jpg!q70.jpg',NULL,1,'2019-01-29 13:13:53',100,1000,100,NULL,'初春的季节，除了户外的各种踏青旅行，在户外开异常Party也是很惬意。户外派对，气氛的烘托肯定不能离开音箱的衬托，选择一款户外的便携音箱，无线蓝牙连接，免去有线的束缚，携带使用更方便。',1,NULL,NULL,'数码专题'),(15,5,'今冬潮包look，凹出绚丽女王范','https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t8365/191/1901440450/575969/c71560c9/59c3144dNe6d8dd2f.png',NULL,1,'2019-01-29 13:15:12',100,1000,100,NULL,'潮流时尚的美包，搭配潮服，会让你魅力一直在线。因为潮包一直是女性出游扮美的秘籍，它不仅能够帮你收纳日常小物件，还能让你解放双手，这里推荐的时尚美包，随意搭配一件服饰，都可以让你潮范十足，凹出绚丽女王范。',1,NULL,NULL,'服饰专题');

/*Table structure for table `cms_subject_category` */

DROP TABLE IF EXISTS `cms_subject_category`;

CREATE TABLE `cms_subject_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='专题分类表';

/*Data for the table `cms_subject_category` */

insert  into `cms_subject_category`(`id`,`name`,`icon`,`subject_count`,`show_status`,`sort`) values (1,'精选专题','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jingxuan.png',3,1,100),(2,'家电专题','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png',7,1,0),(3,'美食专题','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_meishi.png',3,1,0),(4,'数码专题','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png',1,1,0),(5,'服饰专题','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png',1,1,0);

/*Table structure for table `cms_subject_comment` */

DROP TABLE IF EXISTS `cms_subject_comment`;

CREATE TABLE `cms_subject_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';

/*Data for the table `cms_subject_comment` */

/*Table structure for table `cms_subject_product_relation` */

DROP TABLE IF EXISTS `cms_subject_product_relation`;

CREATE TABLE `cms_subject_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='专题商品关系表';

/*Data for the table `cms_subject_product_relation` */

insert  into `cms_subject_product_relation`(`id`,`subject_id`,`product_id`) values (1,1,26),(2,1,27),(3,1,28),(4,1,29),(5,2,30),(6,2,31),(7,2,35),(29,2,36),(30,2,32),(31,3,33),(38,3,34);

/*Table structure for table `cms_topic` */

DROP TABLE IF EXISTS `cms_topic`;

CREATE TABLE `cms_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `attend_count` int(11) DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(11) DEFAULT NULL COMMENT '关注人数',
  `read_count` int(11) DEFAULT NULL,
  `award_name` varchar(100) DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) DEFAULT NULL COMMENT '参与方式',
  `content` text COMMENT '话题内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题表';

/*Data for the table `cms_topic` */

/*Table structure for table `cms_topic_category` */

DROP TABLE IF EXISTS `cms_topic_category`;

CREATE TABLE `cms_topic_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题分类表';

/*Data for the table `cms_topic_category` */

/*Table structure for table `cms_topic_comment` */

DROP TABLE IF EXISTS `cms_topic_comment`;

CREATE TABLE `cms_topic_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';

/*Data for the table `cms_topic_comment` */

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
  `one_category_id` int(11) DEFAULT '0' COMMENT '一级分类ID',
  `two_category_id` int(11) DEFAULT NULL COMMENT '二级分类ID',
  `three_category_id` int(11) DEFAULT NULL COMMENT '三级分类ID',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌表的ID',
  `publish_status` tinyint(4) DEFAULT '1' COMMENT '上下架状态：0下架1上架',
  `audit_status` tinyint(4) DEFAULT '1' COMMENT '审核状态：0未审核，1已审核',
  `seller_id` int(11) DEFAULT NULL COMMENT '所属卖家id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_title`,`goods_img`,`goods_detail`,`goods_stock`,`goods_min_price`,`goods_max_price`,`org_min_price`,`org_max_price`,`location`,`delivery_free`,`pay_count`,`one_category_id`,`two_category_id`,`three_category_id`,`brand_id`,`publish_status`,`audit_status`,`seller_id`) values (4,'32寸网络智能wifi液晶电视机40家用特价彩电','https://img.alicdn.com/img/i2/17618906/O1CN01GU9dOb2FezqlhK6Fh_!!0-saturn_solar.jpg_210x210.jpg',NULL,7606,'478.00','0.00','878.00','0.00','广东广州','0.00',0,10,1412,NULL,2,1,1,5),(5,'王牌知音特价32寸42寸智能wifi网络电视机','//img.alicdn.com/img/i4/127784991/O1CN01hpNalr1mjvGJHK6Fg_!!0-saturn_solar.jpg_210x210.jpg',NULL,7355,'388.00','1998.00','398.00','2008.00','广州','0.00',677,10,1412,NULL,2,1,1,5),(6,'特价创维视云LED32 26智能Wifi网络19 28寸小型高清22液晶电视机','//gw3.alicdn.com/bao/uploaded/i3/3998358685/O1CN01geZTLK2E1mKRrNz8J_!!3998358685.jpg_210x210.jpg',NULL,11729,'138.00','798.00','238.00','898.00','上海','0.00',32,10,1412,NULL,2,1,1,5),(7,'coocaa/酷开 50K5S创维50英寸4K超高清智能网络平板液晶电视机55','//gw3.alicdn.com/bao/uploaded/i3/2555391676/O1CN01OjN3T21OFeIyRbsvU_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1899.00','0.00','2699.00','0.00','深圳','0.00',2,10,1412,NULL,2,1,1,5),(8,'TCL 65V2 65英寸4K全金属超薄高清人工智能网络平板液晶大电视机','//gw3.alicdn.com/bao/uploaded/i4/2050532947/O1CN01aGSifj1XdliC7QPgn_!!0-item_pic.jpg_210x210.jpg',NULL,0,'3999.00','0.00','5999.00','0.00','惠州','0.00',51,10,1412,NULL,2,1,1,5),(9,'触摸教学一体机55/65/75/85寸电视幼儿园多媒体培训会议电子白板','//gw3.alicdn.com/bao/uploaded/i2/2989209262/O1CN012II2omct1lCKQV8_!!2989209262.jpg_210x210.jpg',NULL,0,'3800.00','0.00','0.00','0.00','广州','0.00',135,10,1412,NULL,2,1,1,5),(10,'coocaa/酷开 43K5C创维43英寸网络WIFI智能LED液晶平板电视机42','//gw2.alicdn.com/bao/uploaded/i2/250840343/O1CN01YwKgoA1EP8Lah9ZLw_!!250840343.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1899.00','0.00','深圳','0.00',6,10,1412,NULL,2,1,1,5),(11,'TCL 43L2F 43英寸高清智能WIFI网络安卓20核平板LED液晶电视机','//gw1.alicdn.com/bao/uploaded/i4/2050532947/O1CN01CCamPU1XdliADdrBo_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1499.00','0.00','2999.00','0.00','惠州','0.00',97,10,1412,NULL,2,1,1,5),(12,'创维coocaa/酷开43 K6S网络43英寸智能wifi平板液晶彩电视机40 50','//gw2.alicdn.com/bao/uploaded/i3/708557835/O1CN01VFjkEB27kTgJzzgKs_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1499.00','0.00','2199.00','0.00','北京','0.00',4,10,1412,NULL,2,1,1,5),(13,'Changhong/长虹 39D3F 39英寸64位24核智能网络LED平板液晶电视机','//gw1.alicdn.com/bao/uploaded/i3/2430118810/O1CN01R1Uksi2Ex1qOMvis8_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1599.00','0.00','成都','0.00',5,10,1412,NULL,2,1,1,5),(14,'Changhong/长虹 55A3U 55英寸液晶电视4K超清人工智能网络安卓led','//gw3.alicdn.com/bao/uploaded/i1/2430118810/O1CN015HEOZd2Ex1qUDYXUX_!!0-item_pic.jpg_210x210.jpg',NULL,0,'2599.00','0.00','3999.00','0.00','成都','0.00',3,10,1412,NULL,2,1,1,5),(15,'kktv K5 43英寸康佳电视机43英寸1+16G电视机网络液晶康佳K43K5','//gw2.alicdn.com/bao/uploaded/i2/3869442185/O1CN01IYWBnq1S0luO6egNr_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','2299.00','0.00','深圳','0.00',7,10,1412,NULL,2,1,1,5),(16,'Changhong/长虹 39D3F 39寸LED液晶电视机平板智能网络wifi彩电40','//gw2.alicdn.com/bao/uploaded/i2/2831322485/O1CN01Ua1jsg1UEAjC2E7M2_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1999.00','0.00','绵阳','0.00',3,10,1412,NULL,2,1,1,5),(17,'coocaa/酷开 43K5C创维43英寸网络WIFI智能LED液晶平板电视机42','//gw3.alicdn.com/bao/uploaded/i3/2555391676/O1CN01WCypRt1OFeJR5vDaD_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1899.00','0.00','北京','0.00',15,10,1412,NULL,2,1,1,5),(18,'kktv U40 康佳40英寸电视机4K高清31核智能网络LED液晶42 43电视','//gw3.alicdn.com/bao/uploaded/i1/3515402915/O1CN01aN2TQE1XP72Lebobj_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','2599.00','0.00','深圳','0.00',7,10,1412,NULL,2,1,1,5),(19,'Hisense/海信 HZ43E35A 43英寸高清智能WIFI网络平板LED液晶电视','//gw3.alicdn.com/bao/uploaded/i1/1728252713/O1CN01ynDl271Vub1Sm1eXK_!!1728252713.jpg_210x210.jpg',NULL,0,'1499.00','0.00','0.00','0.00','青岛','0.00',34,10,1412,NULL,2,1,1,5),(20,'小米电视4A 40英寸智能网络wifi超高清4k液晶平板电视机43 32彩电','//gw1.alicdn.com/bao/uploaded/i2/2217765233/O1CN01sO2mkO1oWl70FzF3t_!!2217765233.jpg_210x210.jpg',NULL,0,'786.00','0.00','986.00','0.00','深圳','0.00',48,10,1412,NULL,2,1,1,5),(21,'创维coocaa/酷开43K5C网络43英寸WIFI智能液晶平板彩电视机42 32','//gw3.alicdn.com/bao/uploaded/i3/708557835/O1CN01NKYpVe27kTgHFebPG_!!0-item_pic.jpg_210x210.jpg',NULL,0,'1399.00','0.00','1899.00','0.00','北京','0.00',3,10,1412,NULL,2,1,1,5),(22,'小米电视4S 43英寸超高清4K智能网络WIFi液晶平板电视机40 50彩电','//gw2.alicdn.com/bao/uploaded/i2/2217765233/O1CN01oyqzpd1oWl73n2MP5_!!2217765233.jpg_210x210.jpg',NULL,0,'1159.00','0.00','1359.00','0.00','深圳','0.00',18,10,1412,NULL,2,1,1,5),(23,'Skyworth/创维 49H5 49吋4K超清智能网络全面屏平板液晶电视机50','//gw2.alicdn.com/bao/uploaded/i4/2168706440/O1CN012AbAXg1xRZAcVHXeE_!!0-item_pic.jpg_210x210.jpg',NULL,0,'2699.00','0.00','3599.00','0.00','深圳','0.00',3,10,1412,NULL,2,1,1,5),(24,'Panasonic/松下 TH-50FX520C 50英寸4K超高清智能HDR液晶电视机','//gw3.alicdn.com/bao/uploaded/i3/3970536945/O1CN01T5v14O21ArBOOfhKB_!!0-item_pic.jpg_210x210.jpg',NULL,0,'2999.00','0.00','4999.00','0.00','苏州','0.00',3,10,1412,NULL,2,1,1,5),(25,'全新特价32寸平板电视30/42/46/55/65/70寸usb高清4K智能wifi液晶','//gw3.alicdn.com/bao/uploaded/i2/4117220918/O1CN01or5FA41IeU5NjED6N_!!4117220918.jpg_210x210.jpg',NULL,0,'368.00','0.00','408.00','0.00','广州','0.00',17,10,1412,NULL,2,1,1,5),(26,'电视机55寸60 70 65 32英寸电视曲面平板4k','//img.alicdn.com/img/i4/132655463/O1CN01WhQ5kf1qE6CsMeh6R_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'399.00','0.00','0.00','0.00','广州','0.00',399,10,1412,NULL,2,1,1,5),(27,'wifi智能网络55寸液晶电视电视机42 65 75','//img.alicdn.com/img/i1/33081960/O1CN01miNzSQ1QLimlUyPSM_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'688.00','0.00','888.00','0.00','广州','0.00',879,10,1412,NULL,2,1,1,5),(28,'买一送一秘鲁蓝莓鲜果新鲜水果进口包邮当季','//img.alicdn.com/img/i4/116694812/O1CN01a6EiJs1lPwNDVi4cj_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'89.00','0.00','185.10','0.00','嘉兴','0.00',2776,10,1412,NULL,2,1,1,5),(29,'野生蓝莓果干 新老顾客都来买吧 浆果之王','//gw2.alicdn.com/bao/uploaded/i1/19165025794055546/T19_1UXCthXXXXXXXX_!!0-item_pic.jpg_210x210.jpg',NULL,0,'106.00','0.00','0.00','0.00','哈尔滨','0.00',99,10,1412,NULL,2,1,1,5),(30,'许氏醇品山果集 野生蓝莓干 蔓越莓干无添加大兴安岭特级非长白山','//gw1.alicdn.com/bao/uploaded/i3/921722821/TB1IgW0aHGYBuNjy0FoXXciBFXa_!!0-item_pic.jpg_210x210.jpg',NULL,0,'65.00','0.00','130.00','0.00','漳州','6.00',43,10,1412,NULL,2,1,1,5),(31,'长白山野生无添加蓝莓干网红小吃果干500g休闲食品小包装 护眼','//gw3.alicdn.com/bao/uploaded/i2/52943580/O1CN01yOtEbn1cJgQAC7p74_!!2-item_pic.png_210x210.jpg',NULL,0,'49.50','0.00','0.00','0.00','白山','0.00',37,10,1412,NULL,2,1,1,5),(32,'香港代购 楼上【美国特选天然蓝莓干】227g 不含防腐剂','//gw1.alicdn.com/bao/uploaded/i2/1592283956/TB2zgzvEhSYBuNjSspjXXX73VXa_!!1592283956.jpg_210x210.jpg',NULL,0,'38.00','0.00','0.00','0.00','深圳','0.00',71,10,1412,NULL,2,1,1,5),(33,'香港代购 楼上 【美国天然蓝莓干】227g','//gw3.alicdn.com/bao/uploaded/i4/1592283956/TB2iUTsw9tYBeNjSspaXXaOOFXa_!!1592283956.jpg_210x210.jpg',NULL,0,'42.00','0.00','0.00','0.00','深圳','0.00',36,10,1412,NULL,2,1,1,5),(34,'【壮壮豆豆】蓝莓果美国进口格林斯丹蓝莓果干蜜饯零食250g包邮','//gw3.alicdn.com/bao/uploaded/i1/700195909/TB2obwvjAfb_uJjSsrbXXb6bVXa_!!700195909.jpg_210x210.jpg',NULL,0,'42.60','0.00','80.00','0.00','枣庄','0.00',41,10,1412,NULL,2,1,1,5),(35,'小林制药日本原装进口保护视力缓解眼干预防眼疾蓝莓精华颗粒60粒','//gw2.alicdn.com/bao/uploaded/i4/2883870050/O1CN01hOkAuV1CEwJ8lWlhl_!!0-item_pic.jpg_210x210.jpg',NULL,0,'158.00','0.00','328.00','0.00','日本','0.00',216,10,1412,NULL,2,1,1,5),(36,'现货澳洲 bio island越桔精华蓝莓素叶黄素护眼胶囊 180粒','//gw2.alicdn.com/bao/uploaded/i2/2329313549/TB2OBv7i3fH8KJjy1zcXXcTzpXa_!!2329313549.jpg_210x210.jpg',NULL,0,'169.00','0.00','0.00','0.00','宁波','0.00',24,10,1412,NULL,2,1,1,5),(37,'8408 熊宝宝儿童蓝莓咀嚼糖果 90克 保护眼睛 正品 包邮','//gw1.alicdn.com/bao/uploaded/i4/929788782/TB2aPvCaRyWBuNkSmFPXXXguVXa_!!929788782.jpg_210x210.jpg',NULL,0,'130.00','0.00','0.00','0.00','沈阳','0.00',45,10,1412,NULL,2,1,1,5),(38,'克拉农场原味蓝莓干 美国原产蓝莓果干蛋糕装饰 烘焙原料原装50g','//gw1.alicdn.com/bao/uploaded/i3/27567810/O1CN01BlUDVJ27Z1mLaRWaH_!!0-item_pic.jpg_210x210.jpg',NULL,0,'13.80','0.00','0.00','0.00','上海','0.00',39,10,1412,NULL,2,1,1,5),(39,'8408美乐家儿童蓝莓咀嚼糖果60粒美乐家儿童观适健熊宝宝蓝莓包邮','//gw2.alicdn.com/bao/uploaded/i2/3173186906/TB1jIoczxGYBuNjy0FnXXX5lpXa_!!0-item_pic.jpg_210x210.jpg',NULL,0,'128.00','0.00','0.00','0.00','鞍山','0.00',47,10,1412,NULL,2,1,1,5),(40,'20.5月新包装240粒眼睛 越橘蓝莓叶黄素精华软胶囊 美国普丽普莱','//gw3.alicdn.com/bao/uploaded/i1/43476983/O1CN01FNTzPX21SGDyJAaL8_!!0-item_pic.jpg_210x210.jpg',NULL,0,'54.00','0.00','0.00','0.00','新界','0.00',151,10,1412,NULL,2,1,1,5),(41,'【老爸推荐】-粒大味美的蓝莓干 150g','//gw3.alicdn.com/bao/uploaded/i3/3012015722/TB2NHvmDKOSBuNjy0FdXXbDnVXa_!!3012015722.jpg_210x210.jpg',NULL,0,'39.00','0.00','0.00','0.00','杭州','0.00',572,10,1412,NULL,2,1,1,5),(42,'澳洲澳佳宝Blackmores 叶黄素片护眼宁蓝莓 缓解视力疲劳30粒','//gw3.alicdn.com/bao/uploaded/i2/2329313549/TB2XjI6awLD8KJjSszeXXaGRpXa_!!2329313549.jpg_210x210.jpg',NULL,0,'58.00','0.00','0.00','0.00','宁波','0.00',14,10,1412,NULL,2,1,1,5),(43,'雪海梅乡 蓝钻石蓝莓干110g 蓝莓果干蜜饯果脯 零食小吃休闲食品','//gw3.alicdn.com/bao/uploaded/i3/1837119081/O1CN011FrE1f2Gx9B0yiHFo_!!0-item_pic.jpg_210x210.jpg',NULL,0,'29.90','0.00','59.00','0.00','杭州','0.00',28,10,1412,NULL,2,1,1,5),(44,'【沃隆蓝莓干180g】 蜜饯水果干休闲零食 蓝莓果干烘焙原料特产','//gw2.alicdn.com/bao/uploaded/i2/2745562235/O1CN01QP8OQV1SNfiGGcGZE_!!0-item_pic.jpg_210x210.jpg',NULL,0,'36.90','0.00','109.80','0.00','青岛','0.00',610,10,1412,NULL,2,1,1,5),(45,'美国特产大粒蓝莓果干500g非东北野生蓝莓 自配混合坚果烘焙材料','//gw1.alicdn.com/bao/uploaded/i4/302101255/TB2eF1Zq3mTBuNjy1XbXXaMrVXa_!!302101255.jpg_210x210.jpg',NULL,0,'59.90','0.00','70.00','0.00','上海','0.00',116,10,1412,NULL,2,1,1,5),(46,'野生蓝莓果干500g产自伊春小兴安岭','//gw3.alicdn.com/bao/uploaded/i1/2068919544/O1CN01yKlFyj2KNCX5qQJ7u_!!2068919544.jpg_210x210.jpg',NULL,0,'42.80','0.00','80.00','0.00','伊春','0.00',1408,10,1412,NULL,2,1,1,5),(47,'楼上 蓝莓干 美国进口蓝莓干原粒即食 227克（中通)','//gw2.alicdn.com/bao/uploaded/i3/2194740761/O1CN011HUZrrF5N7a857O_!!0-item_pic.jpg_210x210.jpg',NULL,0,'34.00','0.00','0.00','0.00','新界','0.00',1158,10,1412,NULL,2,1,1,5),(48,'ORBIS/奥蜜思护眼蓝莓丸40粒 护眼保健品呵护视力护眼丸 官方正品','//gw3.alicdn.com/bao/uploaded/i4/2831342753/O1CN01unPhQO1WCus0qyvKD_!!0-item_pic.jpg_210x210.jpg',NULL,0,'129.00','0.00','149.00','0.00','日本','0.00',29,10,1412,NULL,2,1,1,5),(49,'小林仙蓝莓干500g野生无添加蓝莓干蓝莓果干','//img.alicdn.com/img/i2/1232906027266910285/TB2yuelp.hnpuFjSZFEXXX0PFXa_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'49.90','0.00','69.00','0.00','延边朝鲜族','0.00',1764,10,1412,NULL,2,1,1,5),(50,'4盒智利进口蓝莓鲜果空运当季精选500g','//img.alicdn.com/img/i4/304290151/O1CN01RqyNtQ1CzCJLwqEw1_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'69.90','0.00','216.00','0.00','上海','0.00',18,10,1412,NULL,2,1,1,5),(51,'花花公子男士外套2019春商务夹克中年人褂子','//img.alicdn.com/img/i2/98332397/O1CN01XvTX6O1TZrrnMLeEA_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'269.00','0.00','698.00','0.00','嘉兴','0.00',2679,10,1412,NULL,2,1,1,5),(52,'Hollister2019年春季新品连帽图案T恤 男 240809-1','//gw3.alicdn.com/bao/uploaded/i2/2091178755/O1CN017cuEhU2EXq32uBqdR_!!0-item_pic.jpg_210x210.jpg',NULL,0,'269.00','0.00','0.00','0.00','上海','0.00',106,10,1412,NULL,2,1,1,5),(53,'GUESS2019新款春男士纯色倒三角LOGO套头卫衣-X84P07R2080','//gw1.alicdn.com/bao/uploaded/i4/1656456252/O1CN01r9vV591w3SgzpniYL_!!0-item_pic.jpg_210x210.jpg',NULL,0,'279.00','0.00','399.00','0.00','上海','0.00',70,10,1412,NULL,2,1,1,5),(54,'Hollister2019年春季新品Logo图案短袖T恤 男 240807-1','//gw3.alicdn.com/bao/uploaded/i2/2091178755/O1CN01YVzTZ22EXq3kdGLUv_!!2091178755.jpg_210x210.jpg',NULL,0,'179.00','0.00','199.00','0.00','上海','0.00',97,10,1412,NULL,2,1,1,5),(55,'马克华菲短袖T恤男士2019春季新款简约字母刺绣异色拼接休闲上衣','//gw3.alicdn.com/bao/uploaded/i1/94399436/O1CN01bRxykM2JZjmRZ3SFb_!!0-item_pic.jpg_210x210.jpg',NULL,0,'188.00','0.00','325.00','0.00','上海','0.00',182,10,1412,NULL,2,1,1,5),(56,'A21春季2019新款男装卫衣 青春活力色块撞色宽松立领长袖卫衣外套','//gw1.alicdn.com/bao/uploaded/i4/1601145275/O1CN01vWdZtq1opzklIhuii-1601145275.jpg_210x210.jpg',NULL,0,'179.00','0.00','369.00','0.00','东莞','0.00',105,10,1412,NULL,2,1,1,5),(57,'it UNDER GARDEN男装短袖T恤2019春季新品个性图案印花1163XAC','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'229.00','0.00','269.00','0.00','上海','0.00',699,10,1412,NULL,2,1,1,5),(58,'花花公子2019春季新款外套男学生韩版潮流运动休闲透气修身夹克男','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'189.00','0.00','368.00','0.00','泉州','0.00',305,10,1412,NULL,2,1,1,5),(59,'Gap男装印花连帽卫衣春装436778 E 2019春季新款男士潮流logo上衣','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'259.00','0.00','399.00','0.00','苏州','0.00',34,10,1412,NULL,2,1,1,5),(60,'花花公子2019春季新款夹克男青年韩版休闲透气迷彩针织男士潮外套','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'189.00','0.00','368.00','0.00','泉州','0.00',82,10,1412,NULL,2,1,1,5),(61,'美特斯邦威T恤男2019春季新款男士韩版潮流印花学生T恤男-拼下','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'89.90','0.00','119.00','0.00','上海','0.00',409,10,1412,NULL,2,1,1,5),(62,'A21春季2019新款男装 潮流男生长袖T恤衫圆领男套衫时尚打底衣','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'79.00','0.00','159.00','0.00','东莞','0.00',353,10,1412,NULL,2,1,1,5),(63,'UR2019春季新品男装成熟风字母纽扣饰帽领短外套MV08S1BN2006','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'559.00','0.00','0.00','0.00','广州','0.00',8,10,1412,NULL,2,1,1,5),(64,'外套男春秋韩版潮流2019新款帅气衣服休闲时尚工装夹克青少年男装','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'128.00','0.00','338.00','0.00','厦门','0.00',15,10,1412,NULL,2,1,1,5),(65,'H＆M DIVIDED男装2019年春季新款上衣男拼色卫衣HM0710400','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'129.00','0.00','0.00','0.00','苏州','0.00',101,10,1412,NULL,2,1,1,5),(66,'男士春季外套2019新款春秋衣服韩版学生帅气工装牛仔夹克春装潮流','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'118.00','0.00','236.00','0.00','泉州','0.00',11,10,1412,NULL,2,1,1,5),(67,'骆驼牌男装 2019春季新款防风透气时尚纯色夹克男士日常休闲外套','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'348.00','0.00','698.00','0.00','广州','0.00',119,10,1412,NULL,2,1,1,5),(68,'H＆M 男装DIVIDED2019年春季新款 连帽外套 HM0733461','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'199.00','0.00','0.00','0.00','苏州','0.00',38,10,1412,NULL,2,1,1,5),(69,'Gap男装抓绒打底套头卫衣852079-2 2019新款春装男士圆领内搭上衣','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'195.00','0.00','299.00','0.00','苏州','0.00',56,10,1412,NULL,2,1,1,5),(70,'森马卫衣男2019春季新款撞色圆领套头上衣男士简约字母印花外套','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'139.90','0.00','199.00','0.00','杭州','0.00',258,10,1412,NULL,2,1,1,5),(71,'DJPY男装2019新款春季夹克男宽松大码日系复古连帽工装外套男潮牌','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'168.00','0.00','0.00','0.00','杭州','0.00',10,10,1412,NULL,2,1,1,5),(72,'情侣运动服装女套装男长袖春秋休闲卫衣','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'178.00','0.00','298.00','0.00','武汉','0.00',2279,10,1412,NULL,2,1,1,5),(73,'春季男士薄款夹克衫春秋中年男装休闲西装男','//assets.alicdn.com/mw/s/common/icons/nopic/no-90.png',NULL,0,'238.00','0.00','888.00','0.00','济南','0.00',908,10,1412,NULL,2,1,1,5),(74,'2019新款女装时尚女士春季显瘦休闲套装春秋','//img.alicdn.com/img/i2/123490205507571099/TB2wcADnFXXXXccXXXXXXXXXXXX_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'178.00','0.00','296.00','0.00','佛山','0.00',3005,10,1412,NULL,2,1,1,5),(75,'MsShe大码女装2019新款春装胖mm印花抽绳橡筋腰弹力棉裤M1903113','//gw3.alicdn.com/bao/uploaded/i4/445529553/O1CN01eTHRu52KRK74i3KzZ_!!0-item_pic.jpg_210x210.jpg',NULL,0,'179.00','0.00','249.00','0.00','广州','0.00',584,10,1412,NULL,2,1,1,5),(76,'MsShe大码女装2019新款春装胖mm字母印花圆领七分袖卫衣M1903021','//gw1.alicdn.com/bao/uploaded/i4/445529553/O1CN01BNEQ2G2KRK7I5cVfl_!!0-item_pic.jpg_210x210.jpg',NULL,0,'159.00','0.00','199.00','0.00','广州','0.00',176,10,1412,NULL,2,1,1,5),(77,'范奎恩大码女装胖MM裤子2019新款春装胖妹妹200斤显瘦破洞牛仔裤','//gw3.alicdn.com/bao/uploaded/i3/2088979982/O1CN01VeD4KL2Nbo1jNlZbB_!!0-item_pic.jpg_210x210.jpg',NULL,0,'159.00','0.00','308.00','0.00','济南','0.00',174,10,1412,NULL,2,1,1,5),(78,'胖mm阔腿裤2019新款春装胖妹妹牛仔九分裤大码女装弹力显痩裤子女','//gw3.alicdn.com/bao/uploaded/i4/692558542/O1CN016GjWTh2CyHhQRZ4uK_!!0-item_pic.jpg_210x210.jpg',NULL,60,'139.00','0.00','278.00','0.00','东莞','0.00',240,10,1412,NULL,2,1,1,5),(79,'春哥大码女装2019春季新款200斤胖妹妹藏肉针织衫宽松显瘦上衣','//gw3.alicdn.com/bao/uploaded/i2/657171867/O1CN01sb97y31Pf7xA02cgb_!!657171867.jpg_210x210.jpg',NULL,0,'129.00','0.00','258.00','0.00','东莞','0.00',179,10,1412,NULL,2,1,1,5),(80,'肉卷家大码衬衫复古格子撞色领百搭打底雪纺衫2019春季新款女装','//gw3.alicdn.com/bao/uploaded/i2/271971668/O1CN01tDUcnC1OBz8b2W5Zc_!!271971668.jpg_210x210.jpg',NULL,0,'119.00','0.00','0.00','0.00','北京','0.00',122,10,1412,NULL,2,1,1,5),(81,'夏大大大码女装高腰显瘦休闲裤春装新款2019胖mm洋气个性气质阔腿','//gw1.alicdn.com/bao/uploaded/i2/2836003954/O1CN01bHsLTD1f4yXw6MF0Z_!!2836003954.jpg_210x210.jpg',NULL,0,'108.00','0.00','216.00','0.00','杭州','0.00',75,10,1412,NULL,2,1,1,5),(82,'2019春夏新款大码女装两件套装胖mm长袖V领衬衣+显瘦阔腿裤长裤','//gw1.alicdn.com/bao/uploaded/i4/3086586285/O1CN01GvdWAO1wIZmCg4nzD_!!0-item_pic.jpg_210x210.jpg',NULL,0,'179.00','0.00','358.00','0.00','广州','0.00',63,10,1412,NULL,2,1,1,5),(83,'大姗姗家2019春季新款韩版牛仔裤胖妹妹宽松大码女装复古时尚潮裤','//gw3.alicdn.com/bao/uploaded/i3/1889175486/O1CN01mZF3no1qOdJX3Bc9l_!!1889175486.jpg_210x210.jpg',NULL,0,'99.88','0.00','113.50','0.00','鞍山','0.00',49,10,1412,NULL,2,1,1,5),(84,'大姗姗家胖mm加肥加大码女装2019春季网红款弹力短袖T恤上衣200斤','//gw1.alicdn.com/bao/uploaded/i3/1889175486/O1CN01J9UZe21qOdJTDYRPm_!!1889175486.jpg_210x210.jpg',NULL,2594,'90.64','0.00','103.00','0.00','鞍山','0.00',74,10,1412,NULL,2,1,1,5),(85,'胖mm春装2019新款大码女装韩版显瘦大方领条纹针织衫百搭打底衫','//gw3.alicdn.com/bao/uploaded/i3/73903600/O1CN01QbBT0C1cSqL2lawBb_!!73903600.jpg_210x210.jpg',NULL,0,'99.00','0.00','0.00','0.00','重庆','0.00',293,10,1412,NULL,2,1,1,5),(86,'范奎恩大码女装胖MM2019春装新款显瘦上衣200斤胖妹妹打底宽松T恤','//gw2.alicdn.com/bao/uploaded/i1/2088979982/O1CN01LbTnXY2Nbo1jSFBeE_!!0-item_pic.jpg_210x210.jpg',NULL,0,'89.00','0.00','168.00','0.00','济南','0.00',202,10,1412,NULL,2,1,1,5),(87,'南岛风大码女装遮肚子连衣裙洋气显瘦新款2019春装胖mm格子裙子潮','//gw3.alicdn.com/bao/uploaded/i3/879341624/O1CN01KkxHw01Nrphqv7J2U_!!879341624.jpg_210x210.jpg',NULL,0,'139.90','0.00','186.00','0.00','杭州','0.00',79,10,1412,NULL,2,1,1,5),(88,'◆ASM◆2019春季新款复古挂肩套头上衣气质修身休闲T恤打底衫女装','//gw2.alicdn.com/bao/uploaded/i3/266969832/O1CN01N4IS0T2MV6cORiGXi_!!266969832.jpg_210x210.jpg',NULL,0,'99.99','0.00','0.00','0.00','杭州','0.00',9251,10,1412,NULL,2,1,1,5),(89,'2019春季新款大码女装200斤胖MM甜美减龄网红针织两件套装裙67318','//gw3.alicdn.com/bao/uploaded/i3/118548351/O1CN01ygK9W52BYo1ho7OiR_!!118548351.jpg_210x210.jpg',NULL,0,'89.00','0.00','148.00','0.00','东莞','0.00',84,10,1412,NULL,2,1,1,5),(90,'夏大大大码女装春装新款2019洋气长袖V领T恤小心机胖mm上衣加大','//gw3.alicdn.com/bao/uploaded/i3/2836003954/O1CN011f4yUqYDZxWgFt6_!!2836003954.jpg_210x210.jpg',NULL,0,'98.00','0.00','196.00','0.00','杭州','0.00',18,10,1412,NULL,2,1,1,5),(91,'蓝语定制大码女装2019新款洋气裙子胖妹妹mm宽松显瘦遮肚连衣裙春','//gw2.alicdn.com/bao/uploaded/i4/743792891/O1CN01wd2JA21XE7Wsw9vOm_!!743792891.jpg_210x210.jpg',NULL,0,'159.80','0.00','318.00','0.00','杭州','0.00',62,10,1412,NULL,2,1,1,5),(92,'大码女装胖mm2019早春新款棉质上衣韩版宽松休闲百搭印花短袖T恤','//gw3.alicdn.com/bao/uploaded/i3/73903600/O1CN01ZTIzKB1cSqKYPVd6S_!!73903600.jpg_210x210.jpg',NULL,0,'75.00','0.00','0.00','0.00','重庆','0.00',9,10,1412,NULL,2,1,1,5),(93,'vogana戛纳家大码女装紧身小脚牛仔裤2019春季新款高腰显瘦微胖mm','//gw1.alicdn.com/bao/uploaded/i2/111105495/O1CN01qjNPGd1qSksX3l64O_!!111105495.jpg_210x210.jpg',NULL,0,'128.00','0.00','0.00','0.00','宁波','0.00',320,10,1412,NULL,2,1,1,5),(94,'新款大码女装韩版纯色弹力修身脚口开叉牛仔裤2019春季百搭铅笔裤','//gw3.alicdn.com/bao/uploaded/i4/303431599/O1CN01TfvnfD1NgNniDlZyu_!!0-item_pic.jpg_210x210.jpg',NULL,0,'79.00','0.00','0.00','0.00','苏州','0.00',118,10,1412,NULL,2,1,1,5),(95,'新款春秋很仙的雪纺连衣裙复古a字性感长裙','//img.alicdn.com/img/i2/15171914/O1CN01bPBbRF1Q0eZXMGF7h_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'239.00','0.00','9999.00','0.00','厦门','0.00',466,10,1412,NULL,2,1,1,5),(96,'初春欧货两件套御姐洋气小西装套装裙气质法','//img.alicdn.com/img/i3/28601063/O1CN017zVllh1JitWDa1lnV_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'298.00','0.00','688.00','0.00','杭州','0.00',595,10,1412,NULL,2,1,1,5),(97,'[官方正品] 兰蔻小黑瓶精华肌底液 补水保湿','//img.alicdn.com/img/i2/107515971/O1CN01a4I5Ap1tylPdhXzQ4_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'760.00','0.00','0.00','0.00','苏州','0.00',10426,10,1412,NULL,2,1,1,5),(98,'稀缺的中样兰蔻新菁纯臻颜丝润晚霜15ml 2020年抗皱国内专柜中样','//gw3.alicdn.com/bao/uploaded/i1/739171675/O1CN011OFBsfcHzk7iB9x_!!739171675.jpg_210x210.jpg',NULL,0,'129.00','0.00','0.00','0.00','长沙','0.00',33,10,1412,NULL,2,1,1,5),(99,'2瓶包邮 贵妇霜！兰蔻新菁纯臻颜润养日霜15ml紧致抗皱 价值804元','//gw3.alicdn.com/bao/uploaded/i2/53707532/O1CN01ceDVAg25VhfaTqRYP_!!0-item_pic.jpg_210x210.jpg',NULL,0,'115.00','0.00','120.00','0.00','唐山','0.00',56,10,1412,NULL,2,1,1,5),(100,'国内柜台兰蔻 菁纯 臻颜 滋润 眼霜 5ml 中文标2021 3个打包价370','//gw1.alicdn.com/bao/uploaded/i4/22751123/O1CN01XkzSa21KANGQ3RyUM_!!22751123.jpg_210x210.jpg',NULL,0,'135.00','0.00','0.00','0.00','南京','0.00',82,10,1412,NULL,2,1,1,5),(101,'西安专柜正品小样 兰蔻黑金臻宠美容液10ml 柜台价1520 高端限量','//gw2.alicdn.com/bao/uploaded/i3/478983551/O1CN0170vQME1c6OvN30UoR_!!0-item_pic.jpg_210x210.jpg',NULL,0,'78.00','0.00','0.00','0.00','西安','0.00',16,10,1412,NULL,2,1,1,5),(102,'专柜中小样 兰蔻塑颜紧致焕白霜15ml 新品雪花霜 滋润提拉','//gw3.alicdn.com/bao/uploaded/i1/735720621/O1CN011GSSQ2kivXs74O4_!!735720621.jpg_210x210.jpg',NULL,0,'70.00','0.00','0.00','0.00','北京','0.00',27,10,1412,NULL,2,1,1,5),(103,'兰蔻菁纯臻颜滋润眼霜3ml/5ml 国内专柜小样 改善眼袋细纹干燥','//gw3.alicdn.com/bao/uploaded/i1/36247128/TB2q56dyuSSBuNjy0FlXXbBpVXa_!!36247128.jpg_210x210.jpg',NULL,0,'118.00','0.00','0.00','0.00','常州','0.00',122,10,1412,NULL,2,1,1,5),(104,'淡化黑眼圈+保湿 | 兰蔻 小黑瓶眼霜 发光眼霜 5ml 价值173元','//gw3.alicdn.com/bao/uploaded/i3/86109864/O1CN012MjlGLW0OtylgUI_!!86109864.jpg_210x210.jpg',NULL,0,'60.00','0.00','0.00','0.00','广州','0.00',287,10,1412,NULL,2,1,1,5),(105,'国内专柜小样 兰蔻小黑瓶7ml新精华肌底液 3瓶145元包邮 21年03月','//gw1.alicdn.com/bao/uploaded/i3/21792573/O1CN01fSjNJV1UsTZqf4uQy_!!21792573.jpg_210x210.jpg',NULL,0,'50.00','0.00','0.00','0.00','长沙','0.00',136,10,1412,NULL,2,1,1,5),(106,'30片包邮兰蔻/Lancome精华肌底液小样1ml 小黑瓶 补水保湿发老款','//gw1.alicdn.com/bao/uploaded/i2/750428440/O1CN01Vbatw12CDZIbuZmYk_!!0-item_pic.jpg_210x210.jpg',NULL,0,'4.99','0.00','0.00','0.00','杭州','0.00',494,10,1412,NULL,2,1,1,5),(107,'新版 兰蔻新精华肌底液1ml 小黑瓶基底精华片装 20年 专柜中小样','//gw2.alicdn.com/bao/uploaded/i2/1469871/O1CN012Mmy22EKoCsidIK_!!1469871.jpg_210x210.jpg',NULL,0,'5.48','0.00','0.00','0.00','北京','0.00',167,10,1412,NULL,2,1,1,5),(108,'兰蔻新肌底修护舒缓精华液1ml 小黑瓶安瓶精华 片装小样20年到期','//gw3.alicdn.com/bao/uploaded/i1/1469871/TB2V2uInxHI8KJjy1zbXXaxdpXa_!!1469871.jpg_210x210.jpg',NULL,0,'7.48','0.00','0.00','0.00','北京','0.00',61,10,1412,NULL,2,1,1,5),(109,'兰蔻粉水 新清滢柔肤水50ml专柜中样试用装玫瑰水舒缓滋润补水','//gw2.alicdn.com/bao/uploaded/i4/64898582/O1CN018tbaFd2DGbWRb2s8G_!!64898582.jpg_210x210.jpg',NULL,0,'55.00','0.00','0.00','0.00','长沙','0.00',160,10,1412,NULL,2,1,1,5),(110,'【国内专柜】Lancome专柜兰蔻粉水 清莹柔肤水保湿水400ml包邮','//gw2.alicdn.com/bao/uploaded/i2/816290202/O1CN011DMYSV2KSygCzHU_!!816290202.jpg_210x210.jpg',NULL,0,'315.00','0.00','0.00','0.00','深圳','0.00',16,10,1412,NULL,2,1,1,5),(111,'新品兰蔻塑颜紧致焕白霜 15ML雪花霜中文标2021','//gw3.alicdn.com/bao/uploaded/i2/22751123/O1CN011KANF3aLWUnFK1G_!!22751123.jpg_210x210.jpg',NULL,0,'62.00','0.00','0.00','0.00','南京','0.00',48,10,1412,NULL,2,1,1,5),(112,'【10片包邮】兰蔻新肌底修护舒缓精华液 1ML小样 安瓶精华 20年','//gw3.alicdn.com/bao/uploaded/i2/1878511629/TB2N6GlgQyWBuNjy0FpXXassXXa_!!1878511629.jpg_210x210.jpg',NULL,0,'7.99','0.00','0.00','0.00','南京','0.00',44,10,1412,NULL,2,1,1,5),(113,'兰蔻小黑瓶小嫩膜肌底精华浸润修护补水面膜28g 保湿滋润滋养','//gw2.alicdn.com/bao/uploaded/i2/2360209412/O1CN01N6gI8T2JOkHCS16pZ_!!0-item_pic.jpg_210x210.jpg',NULL,0,'95.00','0.00','0.00','0.00','苏州','0.00',19,10,1412,NULL,2,1,1,5),(114,'美白+抗老 对标菁纯美白线！兰蔻 紧致焕白霜 雪花霜15ml 值268元','//gw2.alicdn.com/bao/uploaded/i3/86109864/O1CN01bZno7G2MjlHAXcmim_!!86109864.jpg_210x210.jpg',NULL,0,'66.00','0.00','0.00','0.00','广州','0.00',175,10,1412,NULL,2,1,1,5),(115,'5个包邮 Lancome/兰蔻玫瑰露清滢柔肤化妆水/粉水50ml 舒缓补水','//gw3.alicdn.com/bao/uploaded/i4/53707532/O1CN01qBr04I25VhfhDd48R_!!0-item_pic.jpg_210x210.jpg',NULL,0,'45.00','0.00','0.00','0.00','唐山','0.00',107,10,1412,NULL,2,1,1,5),(116,'兰蔻粉水清滢柔肤水50ml 补水保湿舒缓敏感肌可用正品中小样','//gw1.alicdn.com/bao/uploaded/i1/2965033674/TB2gPqLHMmTBuNjy1XbXXaMrVXa_!!2965033674.jpg_210x210.jpg',NULL,0,'48.90','0.00','0.00','0.00','唐山','0.00',38,10,1412,NULL,2,1,1,5),(117,'三个包邮 国柜兰蔻菁纯臻颜润养美容液50ml 保湿抗老 专柜820！','//gw2.alicdn.com/bao/uploaded/i2/861157734/O1CN01arB4vp270DfnAkx60_!!861157734.jpg_210x210.jpg',NULL,0,'64.00','0.00','0.00','0.00','厦门','0.00',140,10,1412,NULL,2,1,1,5),(118,'[官方正品]兰蔻新持妆粉底液 自然不假面','//img.alicdn.com/img/i2/107515971/O1CN01m0GENd1tylPbarAKw_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'420.00','0.00','0.00','0.00','苏州','0.00',18513,10,1412,NULL,2,1,1,5),(119,'法国珍爱女香水璀璨+催眠+爱恋+美丽Q版礼盒','//img.alicdn.com/img/i2/14431692/O1CN01I5EizQ1OMydxoLDl8_!!0-saturn_solar.jpg_210x210.jpg',NULL,0,'300.00','0.00','0.00','0.00','上海','0.00',6,10,1412,NULL,2,1,1,5);

/*Table structure for table `goods_category` */

DROP TABLE IF EXISTS `goods_category`;

CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父id',
  `name_cn` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `level` int(11) DEFAULT '1' COMMENT '层级标识',
  `root_id` int(11) DEFAULT '1' COMMENT '根分类id',
  `root_name` varchar(100) DEFAULT NULL COMMENT '根分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1413 DEFAULT CHARSET=utf8;

/*Data for the table `goods_category` */

insert  into `goods_category`(`id`,`pid`,`name_cn`,`level`,`root_id`,`root_name`) values (1,0,'女装',1,1,'女装'),(2,0,'男装',1,1,'男装'),(3,0,'内衣',1,1,'内衣'),(4,0,'鞋靴',1,1,'鞋靴'),(5,0,'箱包',1,1,'箱包'),(6,0,'配件',1,1,'配件'),(7,0,'童装玩具',1,1,'童装玩具'),(8,0,'孕产用品',1,1,'孕产用品'),(9,0,'奶粉辅食',1,1,'奶粉辅食'),(10,0,'家电',1,1,'家电'),(11,0,'数码',1,1,'数码'),(12,0,'手机',1,1,'手机'),(13,0,'美妆',1,1,'美妆'),(14,0,'洗护',1,1,'洗护'),(15,0,'保健品',1,1,'保健品'),(16,0,'珠宝',1,1,'珠宝'),(17,0,'眼镜',1,1,'眼镜'),(18,0,'手表',1,1,'手表'),(19,0,'运动',1,1,'运动'),(20,0,'户外',1,1,'户外'),(21,0,'乐器',1,1,'乐器'),(22,0,'游戏',1,1,'游戏'),(23,0,'动漫',1,1,'动漫'),(24,0,'影视',1,1,'影视'),(25,0,'美食',1,1,'美食'),(26,0,'生鲜',1,1,'生鲜'),(27,0,'零食',1,1,'零食'),(28,0,'鲜花',1,1,'鲜花'),(29,0,'宠物',1,1,'宠物'),(30,0,'农资',1,1,'农资'),(31,0,'工具',1,1,'工具'),(32,0,'装修',1,1,'装修'),(33,0,'建材',1,1,'建材'),(34,0,'家具',1,1,'家具'),(35,0,'家饰',1,1,'家饰'),(36,0,'家纺',1,1,'家纺'),(37,0,'汽车',1,1,'汽车'),(38,0,'二手车',1,1,'二手车'),(39,0,'汽车用品',1,1,'汽车用品'),(40,0,'办公',1,1,'办公'),(41,0,'DIY',1,1,'DIY'),(42,0,'五金电子',1,1,'五金电子'),(43,0,'百货',1,1,'百货'),(44,0,'餐厨',1,1,'餐厨'),(45,0,'家庭保健',1,1,'家庭保健'),(46,0,'学习',1,1,'学习'),(47,0,'卡券',1,1,'卡券'),(48,0,'本地服务',1,1,'本地服务'),(49,1,'春上新',2,1,'女装'),(50,1,'连衣裙',2,1,'女装'),(51,1,'T恤',2,1,'女装'),(52,1,'衬衫',2,1,'女装'),(53,1,'裤子',2,1,'女装'),(54,1,'牛仔裤',2,1,'女装'),(55,1,'西装',2,1,'女装'),(56,1,'短外套',2,1,'女装'),(57,1,'时尚套装',2,1,'女装'),(58,1,'半身裙',2,1,'女装'),(59,1,'毛针织衫',2,1,'女装'),(60,1,'风衣',2,1,'女装'),(61,1,'休闲裤',2,1,'女装'),(62,1,'卫衣绒衫',2,1,'女装'),(63,1,'大码女装',2,1,'女装'),(64,1,'蕾丝衫/雪纺衫',2,1,'女装'),(65,1,'背心吊带',2,1,'女装'),(66,1,'毛衣',2,1,'女装'),(67,1,'毛呢外套',2,1,'女装'),(68,1,'羽绒服',2,1,'女装'),(69,1,'皮衣',2,1,'女装'),(70,1,'皮草',2,1,'女装'),(71,1,'棉衣棉服',2,1,'女装'),(72,1,'马夹',2,1,'女装'),(73,1,'牛仔外套',2,1,'女装'),(74,1,'阔腿裤',2,1,'女装'),(75,1,'中老年女装',2,1,'女装'),(76,1,'婚纱礼服',2,1,'女装'),(77,1,'民族服装',2,1,'女装'),(78,1,'打底裤',2,1,'女装'),(79,1,'西装裤',2,1,'女装'),(80,1,'唐装',2,1,'女装'),(81,1,'汉服',2,1,'女装'),(82,1,'旗袍',2,1,'女装'),(83,2,'外套',2,2,'男装'),(84,2,'羽绒服',2,2,'男装'),(85,2,'棉衣',2,2,'男装'),(86,2,'品质好物',2,2,'男装'),(87,2,'夹克',2,2,'男装'),(88,2,'卫衣',2,2,'男装'),(89,2,'皮衣',2,2,'男装'),(90,2,'衬衫',2,2,'男装'),(91,2,'针织衫/毛衣',2,2,'男装'),(92,2,'毛呢大衣',2,2,'男装'),(93,2,'T恤',2,2,'男装'),(94,2,'POLO衫',2,2,'男装'),(95,2,'休闲裤',2,2,'男装'),(96,2,'牛仔裤',2,2,'男装'),(97,2,'风衣',2,2,'男装'),(98,2,'西装',2,2,'男装'),(99,2,'牛仔外套',2,2,'男装'),(100,2,'棒球服',2,2,'男装'),(101,2,'运动裤',2,2,'男装'),(102,2,'九分裤',2,2,'男装'),(103,2,'套装',2,2,'男装'),(104,2,'开衫',2,2,'男装'),(105,2,'马甲',2,2,'男装'),(106,2,'中老年',2,2,'男装'),(107,2,'情侣装',2,2,'男装'),(108,2,'大码',2,2,'男装'),(109,2,'民族风',2,2,'男装'),(110,2,'专柜大牌',2,2,'男装'),(111,2,'明星网红',2,2,'男装'),(112,2,'原创设计',2,2,'男装'),(113,3,'法式内衣',2,3,'内衣'),(114,3,'无钢圈内衣',2,3,'内衣'),(115,3,'内裤女',2,3,'内衣'),(116,3,'文胸',2,3,'内衣'),(117,3,'内裤男',2,3,'内衣'),(118,3,'长袖睡衣',2,3,'内衣'),(119,3,'睡裙',2,3,'内衣'),(120,3,'真丝睡衣',2,3,'内衣'),(121,3,'丝袜',2,3,'内衣'),(122,3,'船袜',2,3,'内衣'),(123,3,'情侣睡衣',2,3,'内衣'),(124,3,'抹胸',2,3,'内衣'),(125,3,'背心',2,3,'内衣'),(126,3,'睡袍',2,3,'内衣'),(127,3,'男士睡衣',2,3,'内衣'),(128,3,'塑身衣',2,3,'内衣'),(129,3,'内衣套装',2,3,'内衣'),(130,3,'打底裤',2,3,'内衣'),(131,3,'连体睡衣',2,3,'内衣'),(132,3,'聚拢文胸',2,3,'内衣'),(133,3,'男士袜子',2,3,'内衣'),(134,3,'棉袜女',2,3,'内衣'),(135,3,'卡通睡衣',2,3,'内衣'),(136,3,'无痕内裤',2,3,'内衣'),(137,3,'少女文胸',2,3,'内衣'),(138,4,'流行女鞋',2,4,'鞋靴'),(139,4,'春上新',2,4,'鞋靴'),(140,4,'当季热销',2,4,'鞋靴'),(141,4,'潮流新品',2,4,'鞋靴'),(142,4,'单鞋',2,4,'鞋靴'),(143,4,'靴子',2,4,'鞋靴'),(144,4,'运动风',2,4,'鞋靴'),(145,4,'高跟鞋',2,4,'鞋靴'),(146,4,'红人同款',2,4,'鞋靴'),(147,4,'厚底鞋',2,4,'鞋靴'),(148,4,'内增高',2,4,'鞋靴'),(149,4,'玛丽珍鞋',2,4,'鞋靴'),(150,4,'蝴蝶结鞋',2,4,'鞋靴'),(151,4,'小白鞋',2,4,'鞋靴'),(152,4,'一脚蹬',2,4,'鞋靴'),(153,4,'圆头鞋',2,4,'鞋靴'),(154,4,'方根鞋',2,4,'鞋靴'),(155,4,'水晶鞋',2,4,'鞋靴'),(156,4,'尖头鞋',2,4,'鞋靴'),(157,4,'平底低跟',2,4,'鞋靴'),(158,4,'穆勒鞋',2,4,'鞋靴'),(159,4,'异型跟',2,4,'鞋靴'),(160,4,'新年红',2,4,'鞋靴'),(161,4,'男鞋',2,4,'鞋靴'),(162,4,'休闲鞋',2,4,'鞋靴'),(163,4,'板鞋',2,4,'鞋靴'),(164,4,'帆布鞋',2,4,'鞋靴'),(165,4,'运动风',2,4,'鞋靴'),(166,4,'豆豆鞋',2,4,'鞋靴'),(167,4,'乐福鞋',2,4,'鞋靴'),(168,4,'雕花布洛克',2,4,'鞋靴'),(169,4,'船鞋',2,4,'鞋靴'),(170,4,'增高鞋',2,4,'鞋靴'),(171,4,'正装商务',2,4,'鞋靴'),(172,4,'户外休闲',2,4,'鞋靴'),(173,4,'爸爸鞋',2,4,'鞋靴'),(174,4,'德比鞋',2,4,'鞋靴'),(175,4,'孟克鞋',2,4,'鞋靴'),(176,4,'布鞋',2,4,'鞋靴'),(177,5,'女包',2,5,'箱包'),(178,5,'骚包',2,5,'箱包'),(179,5,'双肩包',2,5,'箱包'),(180,5,'男包',2,5,'箱包'),(181,5,'旅行箱',2,5,'箱包'),(182,5,'钱包',2,5,'箱包'),(183,5,'真皮包',2,5,'箱包'),(184,5,'大牌',2,5,'箱包'),(185,5,'宽肩带',2,5,'箱包'),(186,5,'小方包',2,5,'箱包'),(187,5,'水桶包',2,5,'箱包'),(188,5,'迷你包',2,5,'箱包'),(189,5,'链条包',2,5,'箱包'),(190,5,'贝壳包',2,5,'箱包'),(191,5,'波士顿包',2,5,'箱包'),(192,5,'手拿包',2,5,'箱包'),(193,5,'单肩包',2,5,'箱包'),(194,5,'手提包',2,5,'箱包'),(195,5,'斜挎包',2,5,'箱包'),(196,5,'零钱包',2,5,'箱包'),(197,5,'妈妈包',2,5,'箱包'),(198,5,'欧美潮搭',2,5,'箱包'),(199,5,'日韩流行',2,5,'箱包'),(200,5,'青春学院',2,5,'箱包'),(201,5,'男士商务',2,5,'箱包'),(202,5,'雅痞休闲',2,5,'箱包'),(203,5,'拉杆箱',2,5,'箱包'),(204,5,'腰包',2,5,'箱包'),(205,5,'胸包',2,5,'箱包'),(206,5,'手工皮具',2,5,'箱包'),(207,5,'红人优品',2,5,'箱包'),(208,6,'帽子',2,6,'配件'),(209,6,'贝雷帽',2,6,'配件'),(210,6,'渔夫帽',2,6,'配件'),(211,6,'鸭舌帽',2,6,'配件'),(212,6,'礼帽',2,6,'配件'),(213,6,'草帽',2,6,'配件'),(214,6,'爵士帽',2,6,'配件'),(215,6,'盆帽',2,6,'配件'),(216,6,'八角帽',2,6,'配件'),(217,6,'丝巾',2,6,'配件'),(218,6,'披肩',2,6,'配件'),(219,6,'真丝围巾',2,6,'配件'),(220,6,'棉麻围巾',2,6,'配件'),(221,6,'方巾',2,6,'配件'),(222,6,'手套',2,6,'配件'),(223,6,'真皮手套',2,6,'配件'),(224,6,'触屏手套',2,6,'配件'),(225,6,'半指手套',2,6,'配件'),(226,6,'全指手套',2,6,'配件'),(227,6,'真皮腰带',2,6,'配件'),(228,6,'腰带',2,6,'配件'),(229,6,'手工皮带',2,6,'配件'),(230,7,'连衣裙',2,7,'童装玩具'),(231,7,'保暖连体',2,7,'童装玩具'),(232,7,'裤子',2,7,'童装玩具'),(233,7,'羽绒',2,7,'童装玩具'),(234,7,'居家睡衣',2,7,'童装玩具'),(235,7,'针织',2,7,'童装玩具'),(236,7,'帽子',2,7,'童装玩具'),(237,7,'亲子装',2,7,'童装玩具'),(238,7,'童鞋',2,7,'童装玩具'),(239,7,'学步鞋',2,7,'童装玩具'),(240,7,'女童运动鞋',2,7,'童装玩具'),(241,7,'男童运动鞋',2,7,'童装玩具'),(242,7,'毛毛虫童鞋',2,7,'童装玩具'),(243,7,'雪地靴',2,7,'童装玩具'),(244,7,'马丁靴',2,7,'童装玩具'),(245,7,'长靴',2,7,'童装玩具'),(246,7,'玩具',2,7,'童装玩具'),(247,7,'积木',2,7,'童装玩具'),(248,7,'毛绒玩具',2,7,'童装玩具'),(249,7,'早教',2,7,'童装玩具'),(250,7,'儿童自行车',2,7,'童装玩具'),(251,7,'电动童车',2,7,'童装玩具'),(252,7,'遥控模型',2,7,'童装玩具'),(253,7,'户外玩具',2,7,'童装玩具'),(254,7,'亲子玩具',2,7,'童装玩具'),(255,7,'学习用品',2,7,'童装玩具'),(256,7,'描红本',2,7,'童装玩具'),(257,8,'美妈大衣',2,8,'孕产用品'),(258,8,'孕妇裤',2,8,'孕产用品'),(259,8,'月子服',2,8,'孕产用品'),(260,8,'哺乳文胸',2,8,'孕产用品'),(261,8,'吸奶器',2,8,'孕产用品'),(262,8,'防辐射',2,8,'孕产用品'),(263,8,'孕妇内裤',2,8,'孕产用品'),(264,8,'连衣裙',2,8,'孕产用品'),(265,8,'待产包',2,8,'孕产用品'),(266,8,'孕妇牛仔裤',2,8,'孕产用品'),(267,8,'孕妇营养品',2,8,'孕产用品'),(268,8,'防溢乳垫',2,8,'孕产用品'),(269,8,'美德乐',2,8,'孕产用品'),(270,8,'十月妈咪',2,8,'孕产用品'),(271,8,'三洋',2,8,'孕产用品'),(272,8,'Bravado',2,8,'孕产用品'),(273,8,'新生儿',2,8,'孕产用品'),(274,8,'婴儿床',2,8,'孕产用品'),(275,8,'婴儿推车',2,8,'孕产用品'),(276,8,'睡袋',2,8,'孕产用品'),(277,8,'抱被',2,8,'孕产用品'),(278,8,'隔尿垫',2,8,'孕产用品'),(279,8,'学步车',2,8,'孕产用品'),(280,8,'安抚奶嘴',2,8,'孕产用品'),(281,8,'体温计',2,8,'孕产用品'),(282,8,'纸尿裤',2,8,'孕产用品'),(283,8,'花王',2,8,'孕产用品'),(284,8,'洗衣液',2,8,'孕产用品'),(285,8,'湿巾',2,8,'孕产用品'),(286,9,'爱他美',2,9,'奶粉辅食'),(287,9,'羊奶粉',2,9,'奶粉辅食'),(288,9,'特殊配方奶粉',2,9,'奶粉辅食'),(289,9,'喜宝',2,9,'奶粉辅食'),(290,9,'惠氏',2,9,'奶粉辅食'),(291,9,'启赋',2,9,'奶粉辅食'),(292,9,'牛栏',2,9,'奶粉辅食'),(293,9,'美素佳儿',2,9,'奶粉辅食'),(294,9,'贝因美',2,9,'奶粉辅食'),(295,9,'雅培',2,9,'奶粉辅食'),(296,9,'美赞臣',2,9,'奶粉辅食'),(297,9,'可瑞康',2,9,'奶粉辅食'),(298,9,'a2',2,9,'奶粉辅食'),(299,9,'嘉宝',2,9,'奶粉辅食'),(300,9,'美林',2,9,'奶粉辅食'),(301,9,'米粉',2,9,'奶粉辅食'),(302,9,'泡芙',2,9,'奶粉辅食'),(303,9,'溶溶豆',2,9,'奶粉辅食'),(304,9,'肉肠',2,9,'奶粉辅食'),(305,9,'果肉条',2,9,'奶粉辅食'),(306,9,'奶片',2,9,'奶粉辅食'),(307,9,'益生菌',2,9,'奶粉辅食'),(308,9,'维生素',2,9,'奶粉辅食'),(309,9,'钙铁锌',2,9,'奶粉辅食'),(310,9,'DHA',2,9,'奶粉辅食'),(311,9,'宝宝食用油',2,9,'奶粉辅食'),(312,9,'核桃油',2,9,'奶粉辅食'),(313,9,'葡萄糖',2,9,'奶粉辅食'),(314,9,'宝宝调料',2,9,'奶粉辅食'),(315,9,'奶瓶',2,9,'奶粉辅食'),(316,9,'餐具',2,9,'奶粉辅食'),(317,9,'餐椅',2,9,'奶粉辅食'),(318,9,'暖奶器',2,9,'奶粉辅食'),(319,9,'消毒锅',2,9,'奶粉辅食'),(320,9,'辅食机',2,9,'奶粉辅食'),(321,10,'淘宝速达',2,10,'家电'),(322,10,'实体商场服务',2,10,'家电'),(323,10,'淘火炬品牌',2,10,'家电'),(324,10,'生活电器',2,10,'家电'),(325,10,'厨房电器',2,10,'家电'),(326,10,'个人护理',2,10,'家电'),(327,10,'空气净化器',2,10,'家电'),(328,10,'扫地机器人',2,10,'家电'),(329,10,'吸尘器',2,10,'家电'),(330,10,'取暖器',2,10,'家电'),(331,10,'烤箱',2,10,'家电'),(332,10,'豆浆机',2,10,'家电'),(333,10,'榨汁料理',2,10,'家电'),(334,10,'电饭煲',2,10,'家电'),(335,10,'吹风机',2,10,'家电'),(336,10,'足浴盆',2,10,'家电'),(337,10,'剃须刀',2,10,'家电'),(338,10,'卷发器',2,10,'家电'),(339,10,'按摩器材',2,10,'家电'),(340,10,'冬季火锅',2,10,'家电'),(341,10,'蓝牙耳机',2,10,'家电'),(342,10,'电暖桌',2,10,'家电'),(343,10,'蓝牙音箱',2,10,'家电'),(344,10,'电热毯',2,10,'家电'),(345,10,'加湿器',2,10,'家电'),(346,10,'暖风机',2,10,'家电'),(347,11,'游戏主机',2,11,'数码'),(348,11,'数码精选',2,11,'数码'),(349,11,'手机壳套',2,11,'数码'),(350,11,'苹果手机壳',2,11,'数码'),(351,11,'surface平板电脑',2,11,'数码'),(352,11,'苹果/Apple iPad Pro',2,11,'数码'),(353,11,'电脑主机',2,11,'数码'),(354,11,'数码相机',2,11,'数码'),(355,11,'电玩动漫',2,11,'数码'),(356,11,'单反相机',2,11,'数码'),(357,11,'华为 MateBook',2,11,'数码'),(358,11,'IPAD mini4',2,11,'数码'),(359,11,'游戏主机',2,11,'数码'),(360,11,'鼠标键盘',2,11,'数码'),(361,11,'无人机',2,11,'数码'),(362,11,'二手数码',2,11,'数码'),(363,11,'二手手机',2,11,'数码'),(364,11,'二手笔记本',2,11,'数码'),(365,11,'二手平板电脑',2,11,'数码'),(366,12,'iPhone xs',2,12,'手机'),(367,12,'iPhone xs max',2,12,'手机'),(368,12,'iPhone xr',2,12,'手机'),(369,12,'华为Mate20P',2,12,'手机'),(370,12,'小米MIX3',2,12,'手机'),(371,12,'荣耀Magic2',2,12,'手机'),(372,12,'一加6T',2,12,'手机'),(373,12,'黑鲨2代',2,12,'手机'),(374,12,'努比亚X',2,12,'手机'),(375,12,'iPhone X',2,12,'手机'),(376,12,'iPhone 8',2,12,'手机'),(377,12,'OPPO',2,12,'手机'),(378,12,'vivo',2,12,'手机'),(379,12,'华为P20',2,12,'手机'),(380,12,'小米',2,12,'手机'),(381,12,'魅族',2,12,'手机'),(382,12,'二手手机',2,12,'手机'),(383,12,'手机以旧换新',2,12,'手机'),(384,13,'面膜',2,13,'美妆'),(385,13,'洁面',2,13,'美妆'),(386,13,'防晒',2,13,'美妆'),(387,13,'爽肤水',2,13,'美妆'),(388,13,'眼霜',2,13,'美妆'),(389,13,'乳液',2,13,'美妆'),(390,13,'面霜',2,13,'美妆'),(391,13,'精华',2,13,'美妆'),(392,13,'卸妆',2,13,'美妆'),(393,13,'男士护肤',2,13,'美妆'),(394,13,'眼线',2,13,'美妆'),(395,13,'粉底液',2,13,'美妆'),(396,13,'BB霜',2,13,'美妆'),(397,13,'隔离',2,13,'美妆'),(398,13,'睫毛膏',2,13,'美妆'),(399,13,'彩妆盘',2,13,'美妆'),(400,13,'唇膏',2,13,'美妆'),(401,13,'腮红',2,13,'美妆'),(402,13,'香水',2,13,'美妆'),(403,13,'精油',2,13,'美妆'),(404,13,'身体护理',2,13,'美妆'),(405,13,'丰胸',2,13,'美妆'),(406,13,'纤体',2,13,'美妆'),(407,13,'脱毛',2,13,'美妆'),(408,13,'海外直邮',2,13,'美妆'),(409,14,'洗发水',2,14,'洗护'),(410,14,'护发素',2,14,'洗护'),(411,14,'发膜',2,14,'洗护'),(412,14,'头发造型',2,14,'洗护'),(413,14,'染发膏',2,14,'洗护'),(414,14,'烫发水',2,14,'洗护'),(415,14,'假发',2,14,'洗护'),(416,14,'沐浴露',2,14,'洗护'),(417,14,'私处护理',2,14,'洗护'),(418,14,'身体乳液',2,14,'洗护'),(419,14,'牙膏',2,14,'洗护'),(420,14,'牙刷',2,14,'洗护'),(421,14,'漱口水',2,14,'洗护'),(422,14,'足浴',2,14,'洗护'),(423,14,'足贴',2,14,'洗护'),(424,14,'洗手液',2,14,'洗护'),(425,14,'卫生巾',2,14,'洗护'),(426,14,'成人纸尿裤',2,14,'洗护'),(427,14,'抽纸',2,14,'洗护'),(428,14,'卷纸',2,14,'洗护'),(429,14,'洗衣液',2,14,'洗护'),(430,14,'清洁剂',2,14,'洗护'),(431,14,'厨房清洁',2,14,'洗护'),(432,14,'家私/皮具护理',2,14,'洗护'),(433,14,'香薰',2,14,'洗护'),(434,15,'B族维生素',2,15,'保健品'),(435,15,'葡萄籽',2,15,'保健品'),(436,15,'辅酶Q10',2,15,'保健品'),(437,15,'消化酶',2,15,'保健品'),(438,15,'软骨素',2,15,'保健品'),(439,15,'维生素C',2,15,'保健品'),(440,15,'钙',2,15,'保健品'),(441,15,'大豆异黄酮',2,15,'保健品'),(442,15,'益生菌',2,15,'保健品'),(443,15,'鱼油',2,15,'保健品'),(444,15,'氨基葡萄糖',2,15,'保健品'),(445,15,'葡萄籽',2,15,'保健品'),(446,15,'生物素',2,15,'保健品'),(447,15,'玛咖（玛卡）',2,15,'保健品'),(448,15,'酵素',2,15,'保健品'),(449,15,'螺旋藻',2,15,'保健品'),(450,15,'胶原蛋白',2,15,'保健品'),(451,15,'月见草油',2,15,'保健品'),(452,15,'DHA',2,15,'保健品'),(453,15,'蔓越莓',2,15,'保健品'),(454,15,'左旋肉碱',2,15,'保健品'),(455,15,'褪黑素',2,15,'保健品'),(456,15,'锯棕榈',2,15,'保健品'),(457,16,'琥珀蜜蜡',2,16,'珠宝'),(458,16,'翡翠手镯',2,16,'珠宝'),(459,16,'钻戒',2,16,'珠宝'),(460,16,'铂金',2,16,'珠宝'),(461,16,'黄金首饰',2,16,'珠宝'),(462,16,'高端定制',2,16,'珠宝'),(463,16,'彩色宝石',2,16,'珠宝'),(464,16,'珍珠',2,16,'珠宝'),(465,16,'金镶玉',2,16,'珠宝'),(466,16,'钻石',2,16,'珠宝'),(467,16,'K金首饰',2,16,'珠宝'),(468,16,'岫岩玉雕',2,16,'珠宝'),(469,16,'和田籽料拍卖',2,16,'珠宝'),(470,16,'裸石',2,16,'珠宝'),(471,16,'翡翠玉石',2,16,'珠宝'),(472,16,'一元起拍',2,16,'珠宝'),(473,16,'设计师',2,16,'珠宝'),(474,16,'珠宝首饰',2,16,'珠宝'),(475,16,'金条',2,16,'珠宝'),(476,16,'情侣对戒',2,16,'珠宝'),(477,16,'琥珀原石',2,16,'珠宝'),(478,16,'老坑冰种拍卖',2,16,'珠宝'),(479,17,'眼镜架',2,17,'眼镜'),(480,17,'3D眼镜',2,17,'眼镜'),(481,17,'司机镜',2,17,'眼镜'),(482,17,'防辐射眼镜',2,17,'眼镜'),(483,17,'老花镜',2,17,'眼镜'),(484,17,'儿童镜',2,17,'眼镜'),(485,17,'色盲眼镜',2,17,'眼镜'),(486,17,'无框眼镜',2,17,'眼镜'),(487,17,'眼镜片',2,17,'眼镜'),(488,17,'依视路',2,17,'眼镜'),(489,17,'雷朋',2,17,'眼镜'),(490,17,'复古眼镜',2,17,'眼镜'),(491,17,'超轻眼镜',2,17,'眼镜'),(492,17,'护目镜',2,17,'眼镜'),(493,17,'眼镜配件',2,17,'眼镜'),(494,17,'滑雪镜',2,17,'眼镜'),(495,17,'超耐磨',2,17,'眼镜'),(496,17,'GM眼镜',2,17,'眼镜'),(497,17,'配镜服务',2,17,'眼镜'),(498,18,'运动表',2,18,'手表'),(499,18,'卡西欧',2,18,'手表'),(500,18,'国表',2,18,'手表'),(501,18,'时尚表',2,18,'手表'),(502,18,'女表',2,18,'手表'),(503,18,'儿童表',2,18,'手表'),(504,18,'学生表',2,18,'手表'),(505,18,'浪琴',2,18,'手表'),(506,18,'斯沃琪表',2,18,'手表'),(507,18,'镂空机械表',2,18,'手表'),(508,18,'皮带表',2,18,'手表'),(509,18,'钢带表',2,18,'手表'),(510,18,'欧米茄',2,18,'手表'),(511,18,'电子表',2,18,'手表'),(512,18,'陶瓷表',2,18,'手表'),(513,18,'瑞士表',2,18,'手表'),(514,18,'手表放心淘',2,18,'手表'),(515,18,'日韩腕表',2,18,'手表'),(516,18,'情侣表',2,18,'手表'),(517,18,'光能表',2,18,'手表'),(518,18,'怀表',2,18,'手表'),(519,18,'表带',2,18,'手表'),(520,18,'手表配件',2,18,'手表'),(521,18,'休闲',2,18,'手表'),(522,18,'精钢',2,18,'手表'),(523,18,'复古手表',2,18,'手表'),(524,18,'中性手表',2,18,'手表'),(525,18,'帆布表带',2,18,'手表'),(526,18,'深度防水',2,18,'手表'),(527,19,'Yeezy 350',2,19,'运动'),(528,19,'Alpha Bounce',2,19,'运动'),(529,19,'AJ30',2,19,'运动'),(530,19,'Stan Smith',2,19,'运动'),(531,19,'大Air皮蓬',2,19,'运动'),(532,19,'KD9',2,19,'运动'),(533,19,'Kayano23',2,19,'运动'),(534,19,'Sock Dart',2,19,'运动'),(535,19,'Hyperdunk',2,19,'运动'),(536,19,'耐克',2,19,'运动'),(537,19,'阿迪达斯',2,19,'运动'),(538,19,'New Balance',2,19,'运动'),(539,19,'亚瑟士',2,19,'运动'),(540,19,'Under Armour',2,19,'运动'),(541,19,'匡威',2,19,'运动'),(542,19,'彪马',2,19,'运动'),(543,19,'VANS',2,19,'运动'),(544,19,'锐步',2,19,'运动'),(545,19,'斯凯奇',2,19,'运动'),(546,19,'美津浓',2,19,'运动'),(547,19,'李宁',2,19,'运动'),(548,19,'跑鞋',2,19,'运动'),(549,19,'篮球鞋',2,19,'运动'),(550,19,'复古休闲',2,19,'运动'),(551,19,'健身',2,19,'运动'),(552,19,'足球',2,19,'运动'),(553,19,'羽毛球',2,19,'运动'),(554,20,'鱼线',2,20,'户外'),(555,20,'鱼线轮',2,20,'户外'),(556,20,'户外鞋',2,20,'户外'),(557,20,'登山包',2,20,'户外'),(558,20,'帐篷',2,20,'户外'),(559,20,'睡袋',2,20,'户外'),(560,20,'望远镜',2,20,'户外'),(561,20,'皮肤衣',2,20,'户外'),(562,20,'速干衣',2,20,'户外'),(563,20,'速干裤',2,20,'户外'),(564,20,'手电筒',2,20,'户外'),(565,20,'山地车',2,20,'户外'),(566,20,'公路车',2,20,'户外'),(567,20,'骑行服',2,20,'户外'),(568,20,'护具',2,20,'户外'),(569,20,'军迷用品',2,20,'户外'),(570,20,'舞蹈体操',2,20,'户外'),(571,20,'羽毛球',2,20,'户外'),(572,20,'游泳',2,20,'户外'),(573,20,'瑜伽',2,20,'户外'),(574,20,'跑步机',2,20,'户外'),(575,20,'健身器',2,20,'户外'),(576,20,'烧烤架',2,20,'户外'),(577,20,'休闲鞋',2,20,'户外'),(578,20,'冲锋裤',2,20,'户外'),(579,20,'单车零件',2,20,'户外'),(580,20,'骑行装备',2,20,'户外'),(581,20,'遮阳棚',2,20,'户外'),(582,20,'户外手表',2,20,'户外'),(583,20,'户外风衣',2,20,'户外'),(584,20,'军迷套装',2,20,'户外'),(585,20,'战术鞋',2,20,'户外'),(586,21,'全新钢琴',2,21,'乐器'),(587,21,'二手钢琴',2,21,'乐器'),(588,21,'电钢琴',2,21,'乐器'),(589,21,'电子琴',2,21,'乐器'),(590,21,'萨克斯',2,21,'乐器'),(591,21,'尤克里里',2,21,'乐器'),(592,21,'架子鼓',2,21,'乐器'),(593,21,'小提琴',2,21,'乐器'),(594,21,'口琴',2,21,'乐器'),(595,21,'手卷钢琴',2,21,'乐器'),(596,21,'古筝',2,21,'乐器'),(597,21,'古琴',2,21,'乐器'),(598,21,'二胡',2,21,'乐器'),(599,21,'葫芦丝',2,21,'乐器'),(600,21,'陶笛',2,21,'乐器'),(601,21,'琵琶',2,21,'乐器'),(602,21,'笛子',2,21,'乐器'),(603,21,'非洲鼓',2,21,'乐器'),(604,21,'贝斯',2,21,'乐器'),(605,21,'调音器',2,21,'乐器'),(606,21,'节拍器',2,21,'乐器'),(607,21,'电吉他',2,21,'乐器'),(608,21,'电箱吉他',2,21,'乐器'),(609,21,'乐器音箱',2,21,'乐器'),(610,21,'电子鼓',2,21,'乐器'),(611,21,'手风琴',2,21,'乐器'),(612,21,'大提琴',2,21,'乐器'),(613,21,'合成器',2,21,'乐器'),(614,21,'乐器租赁',2,21,'乐器'),(615,22,'DNF',2,22,'游戏'),(616,22,'梦幻西游',2,22,'游戏'),(617,22,'魔兽',2,22,'游戏'),(618,22,'LOL',2,22,'游戏'),(619,22,'坦克世界',2,22,'游戏'),(620,22,'剑网3',2,22,'游戏'),(621,22,'魔域',2,22,'游戏'),(622,22,'DOTA2',2,22,'游戏'),(623,22,'街头篮球',2,22,'游戏'),(624,22,'CF',2,22,'游戏'),(625,22,'天龙八部',2,22,'游戏'),(626,22,'大话西游2',2,22,'游戏'),(627,22,'三国争霸',2,22,'游戏'),(628,22,'YY',2,22,'游戏'),(629,22,'劲舞团',2,22,'游戏'),(630,22,'倩女幽魂',2,22,'游戏'),(631,22,'天下3',2,22,'游戏'),(632,22,'反恐精英',2,22,'游戏'),(633,22,'冒险岛',2,22,'游戏'),(634,22,'问道',2,22,'游戏'),(635,22,'逆战',2,22,'游戏'),(636,22,'大唐无双',2,22,'游戏'),(637,22,'征途2',2,22,'游戏'),(638,22,'九阴真经',2,22,'游戏'),(639,22,'龙之谷',2,22,'游戏'),(640,22,'热血江湖',2,22,'游戏'),(641,22,'剑灵',2,22,'游戏'),(642,23,'手办',2,23,'动漫'),(643,23,'盲盒',2,23,'动漫'),(644,23,'航海王',2,23,'动漫'),(645,23,'命运之夜',2,23,'动漫'),(646,23,'高达模型',2,23,'动漫'),(647,23,'火影忍者',2,23,'动漫'),(648,23,'LOLITA洋装',2,23,'动漫'),(649,23,'潮玩',2,23,'动漫'),(650,23,'变形金刚',2,23,'动漫'),(651,23,'钢铁侠',2,23,'动漫'),(652,23,'COSPLAY服装',2,23,'动漫'),(653,23,'魔道祖师',2,23,'动漫'),(654,23,'BJD娃娃',2,23,'动漫'),(655,23,'假面骑士',2,23,'动漫'),(656,23,'名侦探柯南',2,23,'动漫'),(657,23,'我的英雄学院',2,23,'动漫'),(658,23,'哈利波特',2,23,'动漫'),(659,23,'秦时明月',2,23,'动漫'),(660,23,'剑网三',2,23,'动漫'),(661,23,'游戏王',2,23,'动漫'),(662,23,'兵人',2,23,'动漫'),(663,23,'车模',2,23,'动漫'),(664,23,'精灵宝可梦',2,23,'动漫'),(665,23,'七龙珠',2,23,'动漫'),(666,23,'美国队长',2,23,'动漫'),(667,23,'夏目友人帐',2,23,'动漫'),(668,23,'布袋戏',2,23,'动漫'),(669,24,'你的名字',2,24,'影视'),(670,24,'刀剑神域',2,24,'影视'),(671,24,'动物世界',2,24,'影视'),(672,24,'大圣归来',2,24,'影视'),(673,24,'大鱼海棠',2,24,'影视'),(674,24,'毒液',2,24,'影视'),(675,24,'战狼',2,24,'影视'),(676,24,'星球大战',2,24,'影视'),(677,24,'海绵宝宝历险记',2,24,'影视'),(678,24,'深夜食堂',2,24,'影视'),(679,24,'碟中谍',2,24,'影视'),(680,24,'神奇动物',2,24,'影视'),(681,24,'老九门',2,24,'影视'),(682,24,'赛尔号',2,24,'影视'),(683,24,'黑豹',2,24,'影视'),(684,24,'玩具总动员',2,24,'影视'),(685,24,'正义联盟',2,24,'影视'),(686,24,'环太平洋',2,24,'影视'),(687,24,'金刚狼',2,24,'影视'),(688,24,'小猪佩奇',2,24,'影视'),(689,24,'流浪地球',2,24,'影视'),(690,25,'牛奶',2,25,'美食'),(691,25,'柚子茶',2,25,'美食'),(692,25,'酸梅汤',2,25,'美食'),(693,25,'矿泉水',2,25,'美食'),(694,25,'酵素',2,25,'美食'),(695,25,'藕粉',2,25,'美食'),(696,25,'大米',2,25,'美食'),(697,25,'小米',2,25,'美食'),(698,25,'黄豆',2,25,'美食'),(699,25,'火腿',2,25,'美食'),(700,25,'香肠',2,25,'美食'),(701,25,'木耳',2,25,'美食'),(702,25,'枸杞',2,25,'美食'),(703,25,'人参',2,25,'美食'),(704,25,'石斛',2,25,'美食'),(705,25,'雪蛤',2,25,'美食'),(706,25,'蜂蜜',2,25,'美食'),(707,25,'天麻花粉',2,25,'美食'),(708,25,'铁观音',2,25,'美食'),(709,25,'红茶',2,25,'美食'),(710,25,'花草茶',2,25,'美食'),(711,25,'龙井',2,25,'美食'),(712,25,'黑茶',2,25,'美食'),(713,25,'绿茶',2,25,'美食'),(714,25,'鸡尾酒',2,25,'美食'),(715,25,'精酿啤酒',2,25,'美食'),(716,25,'洋酒',2,25,'美食'),(717,25,'红酒',2,25,'美食'),(718,26,'荔枝',2,26,'生鲜'),(719,26,'水果',2,26,'生鲜'),(720,26,'百香果',2,26,'生鲜'),(721,26,'芒果',2,26,'生鲜'),(722,26,'小龙虾',2,26,'生鲜'),(723,26,'樱桃',2,26,'生鲜'),(724,26,'榴莲',2,26,'生鲜'),(725,26,'杨梅',2,26,'生鲜'),(726,26,'牛排',2,26,'生鲜'),(727,26,'柠檬',2,26,'生鲜'),(728,26,'海参',2,26,'生鲜'),(729,26,'水蜜桃',2,26,'生鲜'),(730,26,'咸鸭蛋',2,26,'生鲜'),(731,26,'李子',2,26,'生鲜'),(732,26,'桃子',2,26,'生鲜'),(733,26,'龙虾',2,26,'生鲜'),(734,26,'苹果',2,26,'生鲜'),(735,26,'黄桃',2,26,'生鲜'),(736,26,'火龙果',2,26,'生鲜'),(737,26,'波罗蜜',2,26,'生鲜'),(738,26,'山竹',2,26,'生鲜'),(739,26,'蓝莓',2,26,'生鲜'),(740,26,'鸡胸肉',2,26,'生鲜'),(741,26,'猕猴桃',2,26,'生鲜'),(742,26,'三文鱼',2,26,'生鲜'),(743,26,'红薯',2,26,'生鲜'),(744,26,'车厘子',2,26,'生鲜'),(745,26,'海鲜',2,26,'生鲜'),(746,27,'冰皮月饼',2,27,'零食'),(747,27,'零食大礼包',2,27,'零食'),(748,27,'牛肉干',2,27,'零食'),(749,27,'面包',2,27,'零食'),(750,27,'辣条',2,27,'零食'),(751,27,'红枣',2,27,'零食'),(752,27,'核桃',2,27,'零食'),(753,27,'饼干',2,27,'零食'),(754,27,'巧克力',2,27,'零食'),(755,27,'葡萄干',2,27,'零食'),(756,27,'芒果干',2,27,'零食'),(757,27,'绿豆糕',2,27,'零食'),(758,27,'薯片',2,27,'零食'),(759,27,'锅巴',2,27,'零食'),(760,27,'海苔',2,27,'零食'),(761,27,'月饼',2,27,'零食'),(762,27,'蛋黄酥',2,27,'零食'),(763,27,'猪肉脯',2,27,'零食'),(764,27,'花生',2,27,'零食'),(765,27,'长沙臭豆腐',2,27,'零食'),(766,27,'瓜子',2,27,'零食'),(767,27,'棒棒糖',2,27,'零食'),(768,27,'糖果',2,27,'零食'),(769,27,'手撕面包',2,27,'零食'),(770,27,'豆干',2,27,'零食'),(771,27,'罗汉果',2,27,'零食'),(772,27,'开心果',2,27,'零食'),(773,27,'山楂',2,27,'零食'),(774,27,'全麦面包',2,27,'零食'),(775,27,'早餐',2,27,'零食'),(776,27,'腰果',2,27,'零食'),(777,27,'压缩饼干',2,27,'零食'),(778,28,'鲜花速递',2,28,'鲜花'),(779,28,'多肉植物',2,28,'鲜花'),(780,28,'干花',2,28,'鲜花'),(781,28,'永生花',2,28,'鲜花'),(782,28,'食虫植物',2,28,'鲜花'),(783,28,'桌面盆栽',2,28,'鲜花'),(784,28,'鲜果蓝',2,28,'鲜花'),(785,28,'仿真植物',2,28,'鲜花'),(786,28,'仿真蔬果',2,28,'鲜花'),(787,28,'开业花篮',2,28,'鲜花'),(788,28,'花瓶',2,28,'鲜花'),(789,28,'绿植同城',2,28,'鲜花'),(790,28,'蔬菜种子',2,28,'鲜花'),(791,28,'水培花卉',2,28,'鲜花'),(792,28,'苔藓景观',2,28,'鲜花'),(793,28,'空气凤梨',2,28,'鲜花'),(794,28,'肥料',2,28,'鲜花'),(795,28,'花盆花器',2,28,'鲜花'),(796,28,'花卉药剂',2,28,'鲜花'),(797,28,'营养土',2,28,'鲜花'),(798,28,'园艺工具',2,28,'鲜花'),(799,28,'洒水壶',2,28,'鲜花'),(800,28,'花架',2,28,'鲜花'),(801,28,'铺面石',2,28,'鲜花'),(802,28,'花卉药剂',2,28,'鲜花'),(803,28,'月季',2,28,'鲜花'),(804,28,'铁线莲',2,28,'鲜花'),(805,28,'绣球',2,28,'鲜花'),(806,29,'进口狗粮',2,29,'宠物'),(807,29,'宠物服饰',2,29,'宠物'),(808,29,'狗厕所',2,29,'宠物'),(809,29,'宠物窝',2,29,'宠物'),(810,29,'航空箱',2,29,'宠物'),(811,29,'海藻粉',2,29,'宠物'),(812,29,'羊奶粉',2,29,'宠物'),(813,29,'宠物笼',2,29,'宠物'),(814,29,'狗零食',2,29,'宠物'),(815,29,'剃毛器',2,29,'宠物'),(816,29,'营养膏',2,29,'宠物'),(817,29,'上门服务',2,29,'宠物'),(818,29,'猫砂',2,29,'宠物'),(819,29,'猫粮',2,29,'宠物'),(820,29,'猫爬架',2,29,'宠物'),(821,29,'猫砂盆',2,29,'宠物'),(822,29,'化毛膏',2,29,'宠物'),(823,29,'猫罐头',2,29,'宠物'),(824,29,'喂食器',2,29,'宠物'),(825,29,'猫抓板',2,29,'宠物'),(826,29,'猫玩具',2,29,'宠物'),(827,29,'猫笼',2,29,'宠物'),(828,29,'水草',2,29,'宠物'),(829,29,'水草泥',2,29,'宠物'),(830,29,'仿真水草',2,29,'宠物'),(831,29,'氧气泵',2,29,'宠物'),(832,29,'过滤器',2,29,'宠物'),(833,29,'鱼缸',2,29,'宠物'),(834,29,'水草灯',2,29,'宠物'),(835,29,'鱼粮',2,29,'宠物'),(836,29,'水质维护',2,29,'宠物'),(837,29,'硝化细菌',2,29,'宠物'),(838,29,'除藻剂',2,29,'宠物'),(839,30,'农药',2,30,'农资'),(840,30,'除草剂',2,30,'农资'),(841,30,'杀虫剂',2,30,'农资'),(842,30,'杀菌剂',2,30,'农资'),(843,30,'肥料',2,30,'农资'),(844,30,'叶面肥',2,30,'农资'),(845,30,'有机肥',2,30,'农资'),(846,30,'新型肥料',2,30,'农资'),(847,30,'氮肥',2,30,'农资'),(848,30,'磷肥',2,30,'农资'),(849,30,'钾肥',2,30,'农资'),(850,30,'种子/种苗',2,30,'农资'),(851,30,'粮油种',2,30,'农资'),(852,30,'蔬菜种',2,30,'农资'),(853,30,'果树苗',2,30,'农资'),(854,30,'食用菌菌种',2,30,'农资'),(855,30,'动物种苗',2,30,'农资'),(856,30,'饲料',2,30,'农资'),(857,30,'预混料',2,30,'农资'),(858,30,'浓缩料',2,30,'农资'),(859,30,'饲料添加剂',2,30,'农资'),(860,30,'全价料',2,30,'农资'),(861,30,'农具',2,30,'农资'),(862,30,'农膜',2,30,'农资'),(863,30,'农机',2,30,'农资'),(864,30,'农配件',2,30,'农资'),(865,30,'畜牧药品/兽药',2,30,'农资'),(866,30,'化学药',2,30,'农资'),(867,30,'中兽药',2,30,'农资'),(868,30,'消毒剂',2,30,'农资'),(869,30,'驱虫药',2,30,'农资'),(870,30,'畜牧设备',2,30,'农资'),(871,31,'电钻',2,31,'工具'),(872,31,'气钉枪',2,31,'工具'),(873,31,'电锯',2,31,'工具'),(874,31,'抛光机',2,31,'工具'),(875,31,'磨砂机',2,31,'工具'),(876,31,'修边机',2,31,'工具'),(877,31,'焊接设备',2,31,'工具'),(878,31,'扳手',2,31,'工具'),(879,31,'钳子',2,31,'工具'),(880,31,'锉、刨',2,31,'工具'),(881,31,'打磨机',2,31,'工具'),(882,31,'角磨机',2,31,'工具'),(883,31,'工具组套',2,31,'工具'),(884,31,'电锯片',2,31,'工具'),(885,31,'电锤',2,31,'工具'),(886,31,'云石片',2,31,'工具'),(887,31,'电动螺丝批',2,31,'工具'),(888,31,'测电笔',2,31,'工具'),(889,31,'电子钳',2,31,'工具'),(890,31,'电烙铁',2,31,'工具'),(891,31,'电子焊接工具套装',2,31,'工具'),(892,31,'接线板/插头',2,31,'工具'),(893,31,'断路器',2,31,'工具'),(894,31,'开关',2,31,'工具'),(895,31,'布线箱',2,31,'工具'),(896,31,'转换器',2,31,'工具'),(897,31,'断路器',2,31,'工具'),(898,31,'插座',2,31,'工具'),(899,31,'底盒',2,31,'工具'),(900,31,'电线',2,31,'工具'),(901,31,'电工套管',2,31,'工具'),(902,31,'监控器材及系统',2,31,'工具'),(903,31,'防盗报警器材及系统',2,31,'工具'),(904,31,'楼宇智能系统',2,31,'工具'),(905,32,'全包',2,32,'装修'),(906,32,'半包',2,32,'装修'),(907,32,'免费设计',2,32,'装修'),(908,32,'全套设计',2,32,'装修'),(909,32,'优质装修公司',2,32,'装修'),(910,32,'样板',2,32,'装修'),(911,32,'小户型',2,32,'装修'),(912,32,'美式风',2,32,'装修'),(913,32,'宜家风',2,32,'装修'),(914,32,'集成吊顶',2,32,'装修'),(915,33,'全包',2,33,'装修'),(916,33,'半包',2,33,'装修'),(917,33,'免费设计',2,33,'装修'),(918,33,'全套设计',2,33,'装修'),(919,33,'优质装修公司',2,33,'装修'),(920,33,'样板',2,33,'装修'),(921,33,'小户型',2,33,'装修'),(922,33,'美式风',2,33,'装修'),(923,33,'宜家风',2,33,'装修'),(924,33,'集成吊顶',2,33,'装修'),(925,34,'沙发',2,34,'家具'),(926,34,'床',2,34,'家具'),(927,34,'高低床',2,34,'家具'),(928,34,'餐桌',2,34,'家具'),(929,34,'床垫',2,34,'家具'),(930,34,'茶几',2,34,'家具'),(931,34,'电视柜',2,34,'家具'),(932,34,'衣柜',2,34,'家具'),(933,34,'鞋柜',2,34,'家具'),(934,34,'椅凳',2,34,'家具'),(935,34,'书桌',2,34,'家具'),(936,34,'电脑桌',2,34,'家具'),(937,34,'坐具',2,34,'家具'),(938,34,'现代简约',2,34,'家具'),(939,34,'美式家具',2,34,'家具'),(940,34,'北欧家具',2,34,'家具'),(941,34,'中式家具',2,34,'家具'),(942,34,'儿童家具',2,34,'家具'),(943,34,'真皮沙发',2,34,'家具'),(944,34,'布艺沙发',2,34,'家具'),(945,34,'皮床',2,34,'家具'),(946,34,'实木床',2,34,'家具'),(947,34,'儿童床',2,34,'家具'),(948,34,'乳胶床垫',2,34,'家具'),(949,34,'儿童学习桌',2,34,'家具'),(950,34,'书架',2,34,'家具'),(951,34,'花架',2,34,'家具'),(952,34,'椅子',2,34,'家具'),(953,34,'电脑椅',2,34,'家具'),(954,34,'佛山家具',2,34,'家具'),(955,35,'窗帘',2,35,'家饰'),(956,35,'地毯',2,35,'家饰'),(957,35,'沙发垫',2,35,'家饰'),(958,35,'十字绣',2,35,'家饰'),(959,35,'桌布',2,35,'家饰'),(960,35,'地垫',2,35,'家饰'),(961,35,'抱枕',2,35,'家饰'),(962,35,'坐垫',2,35,'家饰'),(963,35,'飘窗垫',2,35,'家饰'),(964,35,'门帘',2,35,'家饰'),(965,35,'缝纫机',2,35,'家饰'),(966,35,'洗衣机罩',2,35,'家饰'),(967,35,'卷帘',2,35,'家饰'),(968,35,'珠帘',2,35,'家饰'),(969,35,'沙发巾',2,35,'家饰'),(970,35,'靠垫',2,35,'家饰'),(971,35,'空调罩',2,35,'家饰'),(972,35,'餐桌布',2,35,'家饰'),(973,35,'门垫',2,35,'家饰'),(974,35,'浴室防滑垫',2,35,'家饰'),(975,35,'茶几桌布',2,35,'家饰'),(976,35,'桌垫',2,35,'家饰'),(977,35,'装饰画',2,35,'家饰'),(978,35,'摆件',2,35,'家饰'),(979,35,'照片墙',2,35,'家饰'),(980,35,'相框',2,35,'家饰'),(981,35,'墙贴',2,35,'家饰'),(982,35,'花瓶',2,35,'家饰'),(983,35,'壁纸',2,35,'家饰'),(984,35,'挂钟',2,35,'家饰'),(985,35,'仿真花',2,35,'家饰'),(986,35,'油画',2,35,'家饰'),(987,35,'客厅装饰画',2,35,'家饰'),(988,35,'玻璃贴纸',2,35,'家饰'),(989,35,'香炉',2,35,'家饰'),(990,35,'玻璃花瓶',2,35,'家饰'),(991,35,'相框挂墙',2,35,'家饰'),(992,35,'数字油画',2,35,'家饰'),(993,35,'假花',2,35,'家饰'),(994,35,'画框',2,35,'家饰'),(995,35,'干花',2,35,'家饰'),(996,35,'挂画',2,35,'家饰'),(997,35,'钟',2,35,'家饰'),(998,35,'音乐盒',2,35,'家饰'),(999,35,'倒流香炉',2,35,'家饰'),(1000,36,'夏凉被',2,36,'家纺'),(1001,36,'草席',2,36,'家纺'),(1002,36,'床褥',2,36,'家纺'),(1003,36,'U型枕',2,36,'家纺'),(1004,36,'蚊帐',2,36,'家纺'),(1005,36,'凉席',2,36,'家纺'),(1006,36,'天丝套件',2,36,'家纺'),(1007,36,'贡缎套件',2,36,'家纺'),(1008,36,'提花套件',2,36,'家纺'),(1009,36,'婚庆套件',2,36,'家纺'),(1010,36,'儿童套件',2,36,'家纺'),(1011,36,'空调被',2,36,'家纺'),(1012,36,'儿童床品',2,36,'家纺'),(1013,36,'麻将凉席',2,36,'家纺'),(1014,36,'四件套',2,36,'家纺'),(1015,36,'毛巾被',2,36,'家纺'),(1016,36,'记忆枕',2,36,'家纺'),(1017,36,'老粗布',2,36,'家纺'),(1018,36,'床垫',2,36,'家纺'),(1019,36,'婚庆床品',2,36,'家纺'),(1020,36,'床笠',2,36,'家纺'),(1021,36,'蒙古包蚊帐',2,36,'家纺'),(1022,36,'空调毯',2,36,'家纺'),(1023,36,'枕头',2,36,'家纺'),(1024,36,'宫廷蚊帐',2,36,'家纺'),(1025,36,'牛皮席',2,36,'家纺'),(1026,36,'冰丝席',2,36,'家纺'),(1027,36,'竹席',2,36,'家纺'),(1028,36,'藤席',2,36,'家纺'),(1029,36,'床单',2,36,'家纺'),(1030,36,'四件套',2,36,'家纺'),(1031,36,'全棉套件',2,36,'家纺'),(1032,36,'磨毛四件套',2,36,'家纺'),(1033,36,'保暖套件',2,36,'家纺'),(1034,36,'婚庆',2,36,'家纺'),(1035,36,'婚庆套件',2,36,'家纺'),(1036,36,'儿童套件',2,36,'家纺'),(1037,36,'儿童床品',2,36,'家纺'),(1038,36,'贡缎套件',2,36,'家纺'),(1039,36,'提花套件',2,36,'家纺'),(1040,36,'被子',2,36,'家纺'),(1041,36,'蚕丝被',2,36,'家纺'),(1042,36,'羽绒被',2,36,'家纺'),(1043,36,'厚被',2,36,'家纺'),(1044,36,'冬被',2,36,'家纺'),(1045,36,'七孔被',2,36,'家纺'),(1046,36,'保暖被',2,36,'家纺'),(1047,36,'枕头',2,36,'家纺'),(1048,36,'乳胶枕',2,36,'家纺'),(1049,36,'羽绒枕',2,36,'家纺'),(1050,36,'记忆枕',2,36,'家纺'),(1051,36,'床褥',2,36,'家纺'),(1052,36,'床单被罩',2,36,'家纺'),(1053,36,'毛毯',2,36,'家纺'),(1054,36,'毯子',2,36,'家纺'),(1055,36,'绒毯',2,36,'家纺'),(1056,37,'买车送油卡',2,37,'汽车'),(1057,37,'v60一口价39.99万',2,37,'汽车'),(1058,37,'首付一成开新车',2,37,'汽车'),(1059,37,'超级试驾',2,37,'汽车'),(1060,37,'新能源车',2,37,'汽车'),(1061,37,'轿车',2,37,'汽车'),(1062,37,'SUV',2,37,'汽车'),(1063,37,'小型车',2,37,'汽车'),(1064,37,'玛莎拉蒂',2,37,'汽车'),(1065,37,'沃尔沃',2,37,'汽车'),(1066,37,'荣威',2,37,'汽车'),(1067,37,'别克',2,37,'汽车'),(1068,37,'雪佛兰',2,37,'汽车'),(1069,37,'日产',2,37,'汽车'),(1070,37,'本田',2,37,'汽车'),(1071,37,'起亚',2,37,'汽车'),(1072,37,'标致',2,37,'汽车'),(1073,37,'奇瑞',2,37,'汽车'),(1074,37,'海马',2,37,'汽车'),(1075,37,'宝马新1系',2,37,'汽车'),(1076,37,'smart',2,37,'汽车'),(1077,37,'Mini',2,37,'汽车'),(1078,37,'荣威',2,37,'汽车'),(1079,37,'本田',2,37,'汽车'),(1080,37,'天猫养车',2,37,'汽车'),(1081,37,'4S保养',2,37,'汽车'),(1082,37,'上门保养',2,37,'汽车'),(1083,37,'镀晶服务',2,37,'汽车'),(1084,37,'打蜡服务',2,37,'汽车'),(1085,37,'空调清洗',2,37,'汽车'),(1086,38,'司法车拍卖',2,38,'二手车'),(1087,38,'公车拍卖',2,38,'二手车'),(1088,38,'二手车卖场',2,38,'二手车'),(1089,38,'二手车拍卖',2,38,'二手车'),(1090,38,'汽车估价',2,38,'二手车'),(1091,38,'车秒拍',2,38,'二手车'),(1092,38,'大众',2,38,'二手车'),(1093,38,'宝马',2,38,'二手车'),(1094,38,'奥迪',2,38,'二手车'),(1095,38,'丰田',2,38,'二手车'),(1096,38,'奔驰',2,38,'二手车'),(1097,38,'本田',2,38,'二手车'),(1098,38,'别克',2,38,'二手车'),(1099,38,'福特',2,38,'二手车'),(1100,38,'马自达',2,38,'二手车'),(1101,38,'雪佛兰',2,38,'二手车'),(1102,38,'3万以下',2,38,'二手车'),(1103,38,'3-5万',2,38,'二手车'),(1104,38,'5-10万',2,38,'二手车'),(1105,38,'10-20万',2,38,'二手车'),(1106,38,'20-30万',2,38,'二手车'),(1107,38,'30-40万',2,38,'二手车'),(1108,38,'40万以上',2,38,'二手车'),(1109,38,'SUV',2,38,'二手车'),(1110,38,'MPV',2,38,'二手车'),(1111,38,'跑车',2,38,'二手车'),(1112,38,'越野车',2,38,'二手车'),(1113,38,'玛莎拉蒂特价车',2,38,'二手车'),(1114,39,'车载空气净化器',2,39,'汽车用品'),(1115,39,'脚垫',2,39,'汽车用品'),(1116,39,'夏季坐垫',2,39,'汽车用品'),(1117,39,'后备箱垫',2,39,'汽车用品'),(1118,39,'座套',2,39,'汽车用品'),(1119,39,'安全座椅',2,39,'汽车用品'),(1120,39,'香水',2,39,'汽车用品'),(1121,39,'记录仪',2,39,'汽车用品'),(1122,39,'手机支架',2,39,'汽车用品'),(1123,39,'车载导航',2,39,'汽车用品'),(1124,39,'安全预警仪',2,39,'汽车用品'),(1125,39,'后视镜导航',2,39,'汽车用品'),(1126,39,'机油',2,39,'汽车用品'),(1127,39,'燃油宝',2,39,'汽车用品'),(1128,39,'轮胎',2,39,'汽车用品'),(1129,39,'贴膜',2,39,'汽车用品'),(1130,39,'车载吸尘器',2,39,'汽车用品'),(1131,39,'镀晶',2,39,'汽车用品'),(1132,39,'车蜡',2,39,'汽车用品'),(1133,39,'洗车机',2,39,'汽车用品'),(1134,39,'轮胎报警器',2,39,'汽车用品'),(1135,39,'车充',2,39,'汽车用品'),(1136,39,'氙气灯',2,39,'汽车用品'),(1137,39,'雨刮',2,39,'汽车用品'),(1138,39,'空调滤芯',2,39,'汽车用品'),(1139,39,'大灯总成',2,39,'汽车用品'),(1140,39,'车挂',2,39,'汽车用品'),(1141,39,'安全锤',2,39,'汽车用品'),(1142,39,'应急工具',2,39,'汽车用品'),(1161,40,'打印机',2,40,'办公'),(1162,40,'一体机',2,40,'办公'),(1163,40,'复合机',2,40,'办公'),(1164,40,'3D打印机',2,40,'办公'),(1165,40,'投影机',2,40,'办公'),(1166,40,'收银机',2,40,'办公'),(1167,40,'收银纸',2,40,'办公'),(1168,40,'电子面单机',2,40,'办公'),(1169,40,'考勤门禁',2,40,'办公'),(1170,40,'保险箱',2,40,'办公'),(1171,40,'会议白板',2,40,'办公'),(1172,40,'安防摄像',2,40,'办公'),(1173,40,'无线网卡',2,40,'办公'),(1174,40,'WiFi放大器',2,40,'办公'),(1175,40,'无线呼叫器',2,40,'办公'),(1176,40,'格子间',2,40,'办公'),(1177,40,'电脑桌',2,40,'办公'),(1178,40,'办公椅',2,40,'办公'),(1179,40,'理线器',2,40,'办公'),(1180,40,'计算器',2,40,'办公'),(1181,40,'荧光告示贴',2,40,'办公'),(1182,40,'翻译笔',2,40,'办公'),(1183,40,'毛笔',2,40,'办公'),(1184,40,'马克笔',2,40,'办公'),(1185,40,'文件收纳',2,40,'办公'),(1186,40,'本册',2,40,'办公'),(1187,40,'书写工具',2,40,'办公'),(1188,40,'文具',2,40,'办公'),(1189,40,'画具画材',2,40,'办公'),(1190,40,'钢笔',2,40,'办公'),(1191,40,'中性笔',2,40,'办公'),(1192,40,'财会用品',2,40,'办公'),(1193,40,'碎纸机',2,40,'办公'),(1194,40,'包装设备',2,40,'办公'),(1195,41,'定制T恤',2,41,'DIY'),(1196,41,'文化衫',2,41,'DIY'),(1197,41,'工作服',2,41,'DIY'),(1198,41,'卫衣定制',2,41,'DIY'),(1199,41,'LOGO设计',2,41,'DIY'),(1200,41,'VI设计',2,41,'DIY'),(1201,41,'海报定制',2,41,'DIY'),(1202,41,'3D效果图制作',2,41,'DIY'),(1203,41,'广告扇',2,41,'DIY'),(1204,41,'水晶奖杯',2,41,'DIY'),(1205,41,'胸牌工牌',2,41,'DIY'),(1206,41,'奖杯',2,41,'DIY'),(1207,41,'徽章',2,41,'DIY'),(1208,41,'洗照片',2,41,'DIY'),(1209,41,'照片冲印',2,41,'DIY'),(1210,41,'相册/照片书',2,41,'DIY'),(1211,41,'软陶人偶',2,41,'DIY'),(1212,41,'手绘漫画',2,41,'DIY'),(1213,41,'纸箱',2,41,'DIY'),(1214,41,'搬家纸箱',2,41,'DIY'),(1215,41,'胶带',2,41,'DIY'),(1216,41,'标签贴纸',2,41,'DIY'),(1217,41,'二维码贴纸',2,41,'DIY'),(1218,41,'塑料袋',2,41,'DIY'),(1219,41,'自封袋',2,41,'DIY'),(1220,41,'快递袋',2,41,'DIY'),(1221,41,'气泡膜',2,41,'DIY'),(1222,41,'编织袋',2,41,'DIY'),(1223,41,'飞机盒',2,41,'DIY'),(1224,41,'泡沫箱',2,41,'DIY'),(1225,41,'气柱袋',2,41,'DIY'),(1226,41,'纸手提袋',2,41,'DIY'),(1227,41,'打包绳带',2,41,'DIY'),(1228,41,'气泡信封',2,41,'DIY'),(1229,41,'缠绕膜',2,41,'DIY'),(1230,42,'物联网市场',2,42,'五金电子'),(1231,42,'万用表',2,42,'五金电子'),(1232,42,'电动螺丝刀',2,42,'五金电子'),(1233,42,'管钳子',2,42,'五金电子'),(1234,42,'电钻',2,42,'五金电子'),(1235,42,'无尘锯',2,42,'五金电子'),(1236,42,'电焊机',2,42,'五金电子'),(1237,42,'角磨机',2,42,'五金电子'),(1238,42,'切割机',2,42,'五金电子'),(1239,42,'发电机',2,42,'五金电子'),(1240,42,'快排阀',2,42,'五金电子'),(1241,42,'增压泵',2,42,'五金电子'),(1242,42,'钢珠',2,42,'五金电子'),(1243,42,'测距仪',2,42,'五金电子'),(1244,42,'水平仪',2,42,'五金电子'),(1245,42,'传感器',2,42,'五金电子'),(1246,42,'电容器',2,42,'五金电子'),(1247,42,'变压器',2,42,'五金电子'),(1248,42,'单片机开发板',2,42,'五金电子'),(1249,42,'智能小车',2,42,'五金电子'),(1250,42,'机器人套件',2,42,'五金电子'),(1251,42,'3D打印耗材',2,42,'五金电子'),(1252,42,'GPS',2,42,'五金电子'),(1253,42,'蓝牙',2,42,'五金电子'),(1254,42,'LED灯珠',2,42,'五金电子'),(1255,42,'树莓派',2,42,'五金电子'),(1256,43,'保温杯',2,43,'百货'),(1257,43,'饭盒',2,43,'百货'),(1258,43,'玻璃杯',2,43,'百货'),(1259,43,'马克杯',2,43,'百货'),(1260,43,'餐具套装',2,43,'百货'),(1261,43,'碗',2,43,'百货'),(1262,43,'盘',2,43,'百货'),(1263,43,'碟',2,43,'百货'),(1264,43,'茶具套装',2,43,'百货'),(1265,43,'茶杯',2,43,'百货'),(1266,43,'茶壶',2,43,'百货'),(1267,43,'茶具',2,43,'百货'),(1268,43,'陶瓷餐具',2,43,'百货'),(1269,43,'拖鞋',2,43,'百货'),(1270,43,'雨伞雨具',2,43,'百货'),(1271,43,'口罩',2,43,'百货'),(1272,43,'垃圾桶',2,43,'百货'),(1273,43,'居家鞋',2,43,'百货'),(1274,43,'省力拖把',2,43,'百货'),(1275,43,'家务清洁',2,43,'百货'),(1276,43,'垃圾袋',2,43,'百货'),(1277,43,'梳子',2,43,'百货'),(1278,43,'抹布',2,43,'百货'),(1279,43,'围裙',2,43,'百货'),(1280,43,'拖把',2,43,'百货'),(1281,43,'浴帘',2,43,'百货'),(1282,43,'浴室置物架',2,43,'百货'),(1283,43,'拖把桶旋转',2,43,'百货'),(1284,43,'镜子',2,43,'百货'),(1285,43,'铸铁锅',2,43,'百货'),(1286,43,'炒锅',2,43,'百货'),(1287,43,'饮具',2,43,'百货'),(1288,43,'心机小物',2,43,'百货'),(1289,43,'厨房置物架',2,43,'百货'),(1290,43,'密封罐',2,43,'百货'),(1291,43,'潮州陶瓷',2,43,'百货'),(1292,43,'景德镇陶瓷',2,43,'百货'),(1293,43,'厨用小工具',2,43,'百货'),(1294,43,'刀具砧板',2,43,'百货'),(1295,43,'烧烤烘培',2,43,'百货'),(1296,44,'收纳整理',2,44,'餐厨'),(1297,44,'收纳箱',2,44,'餐厨'),(1298,44,'儿童收纳柜',2,44,'餐厨'),(1299,44,'压缩袋',2,44,'餐厨'),(1300,44,'衣柜整理',2,44,'餐厨'),(1301,44,'鞋柜',2,44,'餐厨'),(1302,44,'布艺软收纳',2,44,'餐厨'),(1303,44,'浴室收纳',2,44,'餐厨'),(1304,44,'置物架',2,44,'餐厨'),(1305,44,'强力不粘钩',2,44,'餐厨'),(1306,44,'厨房收纳',2,44,'餐厨'),(1307,44,'桌面收纳',2,44,'餐厨'),(1308,44,'壁挂收纳',2,44,'餐厨'),(1309,44,'旅行收纳',2,44,'餐厨'),(1310,44,'化妆包',2,44,'餐厨'),(1311,44,'购物车',2,44,'餐厨'),(1312,44,'环保袋',2,44,'餐厨'),(1313,44,'野餐蓝',2,44,'餐厨'),(1314,44,'药箱药盒',2,44,'餐厨'),(1315,44,'衣物洗晒',2,44,'餐厨'),(1316,44,'粘毛剪球',2,44,'餐厨'),(1317,44,'脏衣篮',2,44,'餐厨'),(1318,44,'木制衣架',2,44,'餐厨'),(1319,44,'大型晾晒架',2,44,'餐厨'),(1320,44,'裤架',2,44,'餐厨'),(1321,44,'儿童衣架',2,44,'餐厨'),(1322,44,'柳编',2,44,'餐厨'),(1323,44,'ZAKKA风',2,44,'餐厨'),(1324,44,'原生态',2,44,'餐厨'),(1325,44,'棉麻风',2,44,'餐厨'),(1326,44,'纸质收纳',2,44,'餐厨'),(1327,45,'创可贴',2,45,'家庭保健'),(1328,45,'消毒用品',2,45,'家庭保健'),(1329,45,'体温计',2,45,'家庭保健'),(1330,45,'冷敷降温',2,45,'家庭保健'),(1331,45,'急救箱',2,45,'家庭保健'),(1332,45,'医用口罩',2,45,'家庭保健'),(1333,45,'绷带纱布',2,45,'家庭保健'),(1334,45,'血压监测',2,45,'家庭保健'),(1335,45,'血糖监测',2,45,'家庭保健'),(1336,45,'心率监测',2,45,'家庭保健'),(1337,45,'呼吸制氧',2,45,'家庭保健'),(1338,45,'拐杖',2,45,'家庭保健'),(1339,45,'轮椅',2,45,'家庭保健'),(1340,45,'助行器',2,45,'家庭保健'),(1341,45,'矫正牵引',2,45,'家庭保健'),(1342,45,'医用床上护理',2,45,'家庭保健'),(1343,45,'拔罐',2,45,'家庭保健'),(1344,46,'英语四级',2,46,'学习'),(1345,46,'2018考研',2,46,'学习'),(1346,46,'成人学历',2,46,'学习'),(1347,46,'小学教学',2,46,'学习'),(1348,46,'雅思托福',2,46,'学习'),(1349,46,'学历提升',2,46,'学习'),(1350,46,'会计提升',2,46,'学习'),(1351,46,'ps美工技能',2,46,'学习'),(1352,46,'考研辅导',2,46,'学习'),(1353,46,'外教口语课',2,46,'学习'),(1354,46,'建造师',2,46,'学习'),(1355,46,'口语一对一',2,46,'学习'),(1356,46,'驾照报名',2,46,'学习'),(1357,46,'汽车维修',2,46,'学习'),(1358,46,'化妆课程',2,46,'学习'),(1359,46,'电商培训',2,46,'学习'),(1360,46,'少儿英语',2,46,'学习'),(1361,46,'公务员考试',2,46,'学习'),(1362,46,'中小学辅导',2,46,'学习'),(1363,46,'宝宝早教',2,46,'学习'),(1364,46,'健身减肥',2,46,'学习'),(1365,46,'DIY手工',2,46,'学习'),(1366,46,'微信小程序',2,46,'学习'),(1367,46,'JAVA',2,46,'学习'),(1368,46,'CAD教程',2,46,'学习'),(1369,46,'驾校学车',2,46,'学习'),(1370,47,'劳动节福利',2,47,'卡券'),(1371,47,'超市卡',2,47,'卡券'),(1372,47,'沃尔玛',2,47,'卡券'),(1373,47,'家乐福',2,47,'卡券'),(1374,47,'银泰卡',2,47,'卡券'),(1375,47,'面包券',2,47,'卡券'),(1376,47,'来伊份券',2,47,'卡券'),(1377,47,'粽子券',2,47,'卡券'),(1378,47,'熟食/半成品',2,47,'卡券'),(1379,47,'星巴克',2,47,'卡券'),(1380,47,'咖啡',2,47,'卡券'),(1381,47,'哈根达斯',2,47,'卡券'),(1382,47,'冰淇淋',2,47,'卡券'),(1383,47,'网站建设',2,47,'卡券'),(1384,47,'云服务器',2,47,'卡券'),(1385,47,'财务管理',2,47,'卡券'),(1386,47,'网页设计',2,47,'卡券'),(1387,47,'软件',2,47,'卡券'),(1388,48,'婚纱摄影',2,48,'本地服务'),(1389,48,'青岛婚拍',2,48,'本地服务'),(1390,48,'丽江婚拍',2,48,'本地服务'),(1391,48,'三亚婚拍',2,48,'本地服务'),(1392,48,'厦门婚拍',2,48,'本地服务'),(1393,48,'新娘跟妆',2,48,'本地服务'),(1394,48,'婚礼司仪',2,48,'本地服务'),(1395,48,'婚车租赁',2,48,'本地服务'),(1396,48,'婚礼策划',2,48,'本地服务'),(1397,48,'婚宴预订',2,48,'本地服务'),(1398,48,'婚纱礼服',2,48,'本地服务'),(1399,48,'礼服租赁',2,48,'本地服务'),(1400,48,'家电清洗',2,48,'本地服务'),(1401,48,'家庭保洁',2,48,'本地服务'),(1402,48,'搬家搬运',2,48,'本地服务'),(1403,48,'在线洗衣',2,48,'本地服务'),(1404,48,'上门养车',2,48,'本地服务'),(1405,48,'跑腿代办',2,48,'本地服务'),(1406,48,'名企招聘',2,48,'本地服务'),(1407,48,'上门美甲',2,48,'本地服务'),(1408,48,'入职体检',2,48,'本地服务'),(1409,48,'法律咨询',2,48,'本地服务'),(1410,48,'上门按摩',2,48,'本地服务'),(1411,48,'专业翻译',2,48,'本地服务'),(1412,10,'电视',2,10,'家电');

/*Table structure for table `goods_comment` */

DROP TABLE IF EXISTS `goods_comment`;

CREATE TABLE `goods_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '评论的用户名',
  `user_rating` int(5) DEFAULT NULL COMMENT '用户会员等级',
  `content` text COMMENT '评论内容',
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `look_count` int(11) DEFAULT '0' COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='评论表 ';

/*Data for the table `goods_comment` */

insert  into `goods_comment`(`id`,`goods_id`,`order_id`,`user_name`,`user_rating`,`content`,`comment_time`,`look_count`) values (1,4,NULL,'傻**8',4,'买回来连wifi试机了反应慢的要死！跟客户反应说我的网络有问题！这么多天还一直都是这个样子！我的电信宽带在我们这网速是最快的，他们有时间都会来蹭网！这也说明我家网络一直都有问题吗？大家还是别买这个牌子的了！很后悔买他！之前买的海信的都比这个好很多！很不爽的一次网购！','2019-03-12 10:44:32',56),(2,4,NULL,'w**1',8,'这款电视机性价比好，图象清晰，真是价廉物美，收到货物后自已安装，碰到难处咨询客服，在客服耐心细致的指导下顺利的完成了调试，在此再次向客服表示感谢！','2019-03-11 10:45:07',77),(3,4,NULL,'王**贝',8,'电视特别好，非常感谢店主的耐心指导，晚上九点还在指导我，愿上海电视，成功！以后还会买！我的手机像素不太好，电视像素特别好！加油上海电视！向客服致敬！五星好评！','2019-03-07 10:45:44',165),(4,4,NULL,'m**7',2,'这款电视机性价比不错！屏幕分辨率高比较清晰！上海这个牌子也好，勾起了小时侯的回忆！','2019-01-10 10:46:19',221),(5,4,NULL,'上**司',7,'我临时租的房子，这款电视机便宜，适合我，目前还满意，搬家也方便。','2019-03-09 10:46:59',243),(6,4,NULL,'海**云',4,'电视收到了，开箱验货，一切正常，顺丰发货很快，第一次在网上购电视，当时还有点担心，货到后，打开一看，确实真不错，有些调试的问题，客服一一给解答，服务也是一流的，表示感谢','2019-02-15 10:47:32',217),(7,4,NULL,'t**0',6,'第一次在网上购买电视，真的很不错，客服态度又好，店家发货速度也挺快，包装的也很好收到，完好无损，没想到收到之后真的很清楚，质量太好了，用了一段时间也没有什么毛病，有需要还会再来买的','2019-03-06 10:48:21',141);

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

/*Table structure for table `goods_package` */

DROP TABLE IF EXISTS `goods_package`;

CREATE TABLE `goods_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkg_name` varchar(100) DEFAULT NULL COMMENT '打包品名称',
  `pkg_type` tinyint(4) DEFAULT NULL COMMENT '1是组合sku 0是单个sku',
  `pkg_key` varchar(255) DEFAULT NULL COMMENT '打包品key',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打包品表';

/*Data for the table `goods_package` */

/*Table structure for table `goods_package_item` */

DROP TABLE IF EXISTS `goods_package_item`;

CREATE TABLE `goods_package_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkg_id` int(11) DEFAULT NULL COMMENT '打包品Id',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuId',
  `amount` int(11) DEFAULT NULL COMMENT '商品数量',
  `price` decimal(8,2) DEFAULT NULL COMMENT '价格',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打包品商品项';

/*Data for the table `goods_package_item` */

/*Table structure for table `goods_props_key` */

DROP TABLE IF EXISTS `goods_props_key`;

CREATE TABLE `goods_props_key` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prop_key` varchar(20) DEFAULT NULL COMMENT '属性名称',
  `brand_id` int(11) DEFAULT NULL COMMENT '所属品牌Id',
  `alias_flag` tinyint(4) DEFAULT '1' COMMENT '是否允许别名',
  `color_flag` tinyint(4) DEFAULT '0' COMMENT '是否颜色属性',
  `sell_flag` tinyint(4) DEFAULT '1' COMMENT '是否销售属性',
  `search_flag` tinyint(4) DEFAULT '1' COMMENT '是否搜索字段',
  `need_flag` tinyint(4) DEFAULT '0' COMMENT '是否必须',
  `order_num` int(11) DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='属性名';

/*Data for the table `goods_props_key` */

insert  into `goods_props_key`(`id`,`prop_key`,`brand_id`,`alias_flag`,`color_flag`,`sell_flag`,`search_flag`,`need_flag`,`order_num`) values (156,'品牌',2,1,0,1,1,0,1),(157,'型号',2,1,0,1,1,0,2),(158,'售后服务',2,1,0,1,1,0,3),(159,'产地',2,1,0,1,1,0,4),(160,'屏幕比例',2,1,0,1,1,0,5),(161,'面板类型',2,1,0,1,1,0,6),(162,'分辨率',2,1,0,1,1,0,7),(163,'颜色分类',2,1,0,1,1,0,8),(164,'最佳观看距离',2,1,0,1,1,0,9),(165,'能效等级',2,1,0,1,1,0,10),(166,'背光灯类型',2,1,0,1,1,0,11),(167,'电视类型',2,1,0,1,1,0,12),(168,'网络连接方式',2,1,0,1,1,0,13),(169,'扫描方式',2,1,0,1,1,0,14),(170,'扬声器数量',2,1,0,1,1,0,15),(171,'接收制式',2,1,0,1,1,0,16),(172,'附加功能',2,1,0,1,1,0,17),(173,'操作系统',2,1,0,1,1,0,18),(174,'HDMI接口数量',2,1,0,1,1,0,19),(175,'视频显示格式',2,1,0,1,1,0,20),(176,'上市时间',2,1,0,1,1,0,21),(177,'屏幕尺寸',2,1,0,1,1,0,22),(178,'能效备案号',2,1,0,1,1,0,23),(179,'电视形态',2,1,0,1,1,0,24),(180,'采购地',2,1,0,1,1,0,25);

/*Table structure for table `goods_props_value` */

DROP TABLE IF EXISTS `goods_props_value`;

CREATE TABLE `goods_props_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value_name` text COMMENT '属性值',
  `props_id` bigint(20) DEFAULT NULL COMMENT '属性名id',
  `brand_id` int(11) DEFAULT NULL COMMENT '所属品牌Id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `goods_props_value` */

insert  into `goods_props_value`(`id`,`value_name`,`props_id`,`brand_id`,`create_time`) values (1,'志高',156,2,'2019-03-30 21:28:49'),(2,'YS-K3202',157,2,'2019-03-30 21:28:49'),(3,'店铺三包',158,2,'2019-03-30 21:28:49'),(4,'中国大陆',159,2,'2019-03-30 21:28:49'),(5,'16:9',160,2,'2019-03-30 21:28:49'),(6,'IPS',161,2,'2019-03-30 21:28:49'),(7,'1366x768',162,2,'2019-03-30 21:28:49'),(8,'32寸高清屏【普通电视版】,32寸高清屏【智能网络版】,42寸高清屏【普通电视版】,42寸高清屏【智能网络版】,55寸高清屏【普通电视版】,55寸高清屏【智能网络版】,30寸高清屏【智能网络版】,32寸高清【曲面网络版WIFI】,42寸高清【曲面网络版WIFI】,32寸高清级【普通电视版】,32寸高清级【智能网络版】,42寸高清级【普通电视版】,42寸高清级【智能网络版】,60寸高清屏【普通电视版】,60寸高清屏【智能网络版】,46寸高清屏【智能网络版】,46寸高清屏【普通电视版】,32寸一线屏【普通电视版】,32寸一线屏【智能网络版】,46寸高清级【普通电视版】,46寸高清级【智能网络版】',163,2,'2019-03-30 21:28:49'),(9,'2.5m(含)-2.9m(含)',164,2,'2019-03-30 21:28:49'),(10,'三级',165,2,'2019-03-30 21:28:49'),(11,'LED发光二极管',166,2,'2019-03-30 21:28:49'),(12,'LED电视',167,2,'2019-03-30 21:28:49'),(13,'全部支持',168,2,'2019-03-30 21:28:49'),(14,'逐行扫描',169,2,'2019-03-30 21:28:49'),(15,'2个',170,2,'2019-03-30 21:28:49'),(16,'PAL\\NTSC\\SECAM',171,2,'2019-03-30 21:28:49'),(17,'地面数字信号接收,数字一体机,USB媒体播放,WIFI,网络高清播放,网络在线电影',172,2,'2019-03-30 21:28:49'),(18,'安卓',173,2,'2019-03-30 21:28:49'),(19,'1个',174,2,'2019-03-30 21:28:49'),(20,'1080p',175,2,'2019-03-30 21:28:49'),(21,'2017-07',176,2,'2019-03-30 21:28:49'),(22,'32英寸',177,2,'2019-03-30 21:28:49'),(23,'201801-22-11021271-2751671104235',178,2,'2019-03-30 21:28:49'),(24,'平板',179,2,'2019-03-30 21:28:49'),(25,'中国大陆',180,2,'2019-03-30 21:28:49');

/*Table structure for table `goods_service` */

DROP TABLE IF EXISTS `goods_service`;

CREATE TABLE `goods_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `service_key` varchar(255) DEFAULT NULL COMMENT '服务名称',
  `service_content` varchar(255) DEFAULT NULL COMMENT '服务内容',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='商品服务表';

/*Data for the table `goods_service` */

insert  into `goods_service`(`id`,`goods_id`,`service_key`,`service_content`,`order_num`) values (1,4,'订单险','保险公司全程担保赔付该商品每笔交易的售后',NULL),(2,4,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',NULL),(3,4,'运费险','卖家为您购买的商品投保退货运费险（保单生效以确认订单页展示的运费险为准）',NULL),(4,4,'公益宝贝','购买该商品，每笔成交都会有相应金额捐赠给公益。感谢您的支持，愿公益的快乐伴随您每一天。',NULL),(5,4,'48小时内发货','卖家会在承诺时间内发货，官方活动期间的发货时间以具体活动要求为准，如买家与卖家另有约定时间（含预约配送），从其约定。',NULL),(6,5,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',1),(7,5,'运费险','卖家为您购买的商品投保退货运费险（保单生效以确认订单页展示的运费险为准）',2),(8,5,'公益宝贝','购买该商品，每笔成交都会有相应金额捐赠给公益。感谢您的支持，愿公益的快乐伴随您每一天。',3),(9,5,'48小时内发货','卖家会在承诺时间内发货，官方活动期间的发货时间以具体活动要求为准，如买家与卖家另有约定时间（含预约配送），从其约定。',4),(10,6,'订单险','保险公司全程担保赔付该商品每笔交易的售后',1),(11,6,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',2),(12,6,'运费险','卖家为您购买的商品投保退货运费险（保单生效以确认订单页展示的运费险为准）',3),(13,6,'公益宝贝','购买该商品，每笔成交都会有相应金额捐赠给公益。感谢您的支持，愿公益的快乐伴随您每一天。',4),(14,6,'48小时内发货','卖家会在承诺时间内发货，官方活动期间的发货时间以具体活动要求为准，如买家与卖家另有约定时间（含预约配送），从其约定。',5),(15,30,'坏单包赔','商家承诺所售商品在签收时如有商品破损、变质、动植物死亡等情况，可在24小时内向商家举证，商家在24小时内响应买家退款或退货需求。',1),(16,30,'订单险','保险公司全程担保赔付该商品每笔交易的售后',2),(17,30,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',3),(18,34,'坏单包赔','商家承诺所售商品在签收时如有商品破损、变质、动植物死亡等情况，可在24小时内向商家举证，商家在24小时内响应买家退款或退货需求。',1),(19,34,'订单险','保险公司全程担保赔付该商品每笔交易的售后',2),(20,34,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',3),(21,78,'15天退货','15天退货，退货邮费买家承担',1),(22,78,'24小时内发货',NULL,2),(23,84,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',1),(24,84,'15天内发货',NULL,2),(25,99,'7天无理由','满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，非包邮商品需要买家承担发货和退货邮费。',1),(26,99,'运费险','卖家为您购买的商品投保退货运费险（保单生效以确认订单页展示的运费险为准）',2),(27,99,'30天内发货',NULL,3);

/*Table structure for table `goods_sku` */

DROP TABLE IF EXISTS `goods_sku`;

CREATE TABLE `goods_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku名称',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `price_money` decimal(8,2) DEFAULT '0.00' COMMENT '商品价格',
  `quantity` int(11) DEFAULT '0' COMMENT '库存',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `sku_img` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='sku表';

/*Data for the table `goods_sku` */

insert  into `goods_sku`(`id`,`sku_name`,`goods_id`,`price_money`,`quantity`,`create_time`,`sku_img`) values (1,'32寸高清屏【普通电视版】 黑色',4,'688.00',888,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/O1CN011uCxe0w4TLIoPwo_!!906746002.jpg_120x120q50s150.jpg'),(2,'32寸高清屏【智能网络版】 黑色',4,'1088.00',78,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/O1CN011uCxe0w4TLIoPwo_!!906746002.jpg_120x120q50s150.jpg'),(3,'42寸高清屏【普通电视版】 黑色',4,'1499.00',112,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/O1CN011uCxe0w4TLIoPwo_!!906746002.jpg_120x120q50s150.jpg'),(4,'42寸高清屏【智能网络版】 黑色',4,'1799.00',523,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/O1CN011uCxe0w4TLIoPwo_!!906746002.jpg_120x120q50s150.jpg'),(5,'55寸高清屏【普通电视版】 金色/黑色',4,'2199.00',12,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/O1CN011uCxe0w4TLIoPwo_!!906746002.jpg_120x120q50s150.jpg'),(6,'55寸高清屏【智能网络版】 金色/黑色',4,'2299.00',5000,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/O1CN011uCxe0w4TLIoPwo_!!906746002.jpg_120x120q50s150.jpg'),(7,'30寸高清屏【智能网络版】 黑色',4,'2790.00',55,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/O1CN011uCxe0w4TLIoPwo_!!906746002.jpg_120x120q50s150.jpg'),(8,'32寸高清【曲面网络版WIFI】 黑色',4,'1266.00',5,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i2/906746002/O1CN01y8lOzB1uCxfn0uPiJ_!!906746002.png_120x120q50s150.jpg'),(9,'42寸高清【曲面网络版WIFI】 黑色',4,'1588.00',1,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i2/906746002/O1CN01y8lOzB1uCxfn0uPiJ_!!906746002.png_120x120q50s150.jpg'),(10,'32寸高清级【普通电视版】 黑色',4,'1899.00',555,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i2/906746002/O1CN01y8lOzB1uCxfn0uPiJ_!!906746002.png_120x120q50s150.jpg'),(11,'32寸高清级【智能网络版】 黑色',4,'2299.00',15,'2019-03-21 16:59:00','http://img.alicdn.com/imgextra/i2/906746002/O1CN01y8lOzB1uCxfn0uPiJ_!!906746002.png_120x120q50s150.jpg'),(12,'42寸高清级【普通电视版】 黑色',4,'2399.00',666,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i2/906746002/O1CN01y8lOzB1uCxfn0uPiJ_!!906746002.png_120x120q50s150.jpg'),(13,'42寸高清级【智能网络版】 黑色',4,'2890.00',5555,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i2/906746002/O1CN01y8lOzB1uCxfn0uPiJ_!!906746002.png_120x120q50s150.jpg'),(14,'60寸高清屏【普通电视版】 金色',4,'3399.00',55,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/TB2NFqIinTI8KJjSsphXXcFppXa_!!906746002.jpg_120x120q50s150.jpg'),(15,'60寸高清屏【智能网络版】 金色',4,'3500.00',7,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/TB2NFqIinTI8KJjSsphXXcFppXa_!!906746002.jpg_120x120q50s150.jpg'),(16,'46寸高清屏【智能网络版】 黑色',4,'2380.00',222,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/TB2NFqIinTI8KJjSsphXXcFppXa_!!906746002.jpg_120x120q50s150.jpg'),(17,'46寸高清屏【普通电视版】 黑色',4,'2580.00',7,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/TB2NFqIinTI8KJjSsphXXcFppXa_!!906746002.jpg_120x120q50s150.jpg'),(18,'32寸一线屏【普通电视版】 黑色',4,'3399.00',111,'2019-03-14 21:41:13','http://img.alicdn.com/imgextra/i4/906746002/TB2NFqIinTI8KJjSsphXXcFppXa_!!906746002.jpg_120x120q50s150.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `miaosha_goods` */

/*Table structure for table `miaosha_order` */

DROP TABLE IF EXISTS `miaosha_order`;

CREATE TABLE `miaosha_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_good_user` (`user_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `miaosha_order` */

/*Table structure for table `oms_cart_item` */

DROP TABLE IF EXISTS `oms_cart_item`;

CREATE TABLE `oms_cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_sku_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `sp1` varchar(200) DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(200) DEFAULT NULL COMMENT '销售属性2',
  `sp3` varchar(200) DEFAULT NULL COMMENT '销售属性3',
  `product_pic` varchar(1000) DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) DEFAULT '0' COMMENT '是否删除',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(200) DEFAULT NULL,
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='购物车表';

/*Data for the table `oms_cart_item` */

insert  into `oms_cart_item`(`id`,`product_id`,`product_sku_id`,`member_id`,`quantity`,`price`,`sp1`,`sp2`,`sp3`,`product_pic`,`product_name`,`product_sub_title`,`product_sku_code`,`member_nickname`,`create_date`,`modify_date`,`delete_status`,`product_category_id`,`product_brand`,`product_sn`,`product_attr`) values (12,26,90,1,1,'3788.00','金色','16G',NULL,NULL,'华为 HUAWEI P20','AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待','201806070026001','windir','2018-08-27 16:53:44',NULL,0,19,NULL,NULL,NULL),(13,27,98,1,3,'2699.00','黑色','32G',NULL,NULL,'小米8','骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购','201808270027001','windir','2018-08-27 17:11:53',NULL,0,19,NULL,NULL,NULL),(14,28,102,1,1,'649.00','金色','16G',NULL,NULL,'红米5A','8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购','201808270028001','windir','2018-08-27 17:18:02',NULL,0,19,NULL,NULL,NULL),(15,28,103,1,1,'699.00','金色','32G',NULL,NULL,'红米5A','8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购','201808270028001','windir','2018-08-28 10:22:45',NULL,0,19,NULL,NULL,NULL),(16,29,106,1,1,'5499.00','金色','32G',NULL,NULL,'Apple iPhone 8 Plus','【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。','201808270029001','windir','2018-08-28 10:50:50',NULL,0,19,NULL,NULL,NULL);

/*Table structure for table `oms_company_address` */

DROP TABLE IF EXISTS `oms_company_address`;

CREATE TABLE `oms_company_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `region` varchar(64) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公司收发货地址表';

/*Data for the table `oms_company_address` */

insert  into `oms_company_address`(`id`,`address_name`,`send_status`,`receive_status`,`name`,`phone`,`province`,`city`,`region`,`detail_address`) values (1,'深圳发货点',1,1,'大梨','18000000000','广东省','深圳市','南山区','科兴科学园'),(2,'北京发货点',0,0,'大梨','18000000000','北京市',NULL,'南山区','科兴科学园'),(3,'南京发货点',0,0,'大梨','18000000000','江苏省','南京市','南山区','科兴科学园');

/*Table structure for table `oms_order` */

DROP TABLE IF EXISTS `oms_order`;

CREATE TABLE `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单表';

/*Data for the table `oms_order` */

insert  into `oms_order`(`id`,`member_id`,`coupon_id`,`order_sn`,`create_time`,`member_username`,`total_amount`,`pay_amount`,`freight_amount`,`promotion_amount`,`integration_amount`,`coupon_amount`,`discount_amount`,`pay_type`,`source_type`,`status`,`order_type`,`delivery_company`,`delivery_sn`,`auto_confirm_day`,`integration`,`growth`,`promotion_info`,`bill_type`,`bill_header`,`bill_content`,`bill_receiver_phone`,`bill_receiver_email`,`receiver_name`,`receiver_phone`,`receiver_post_code`,`receiver_province`,`receiver_city`,`receiver_region`,`receiver_detail_address`,`note`,`confirm_status`,`delete_status`,`use_integration`,`payment_time`,`delivery_time`,`receive_time`,`comment_time`,`modify_time`) values (12,1,2,'201809150101000001','2018-09-15 12:24:27','test','18732.00','16377.75','20.00','2344.25','0.00','10.00','10.00',0,1,4,0,'','',15,13284,13284,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','江苏省','常州市','天宁区','东晓街道','xxx',0,0,NULL,NULL,NULL,NULL,NULL,'2018-10-30 14:43:49'),(13,1,2,'201809150102000002','2018-09-15 14:24:29','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',1,1,1,0,'','',15,13284,13284,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,1000,'2018-10-11 14:04:19',NULL,NULL,NULL,NULL),(14,1,2,'201809130101000001','2018-09-13 16:57:40','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',2,1,2,0,'顺丰快递','201707196398345',15,13284,13284,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,'2018-10-13 13:44:04','2018-10-16 13:43:41',NULL,NULL,NULL),(15,1,2,'201809130102000002','2018-09-13 17:03:00','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',1,1,3,0,'顺丰快递','201707196398346',15,13284,13284,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,1,0,NULL,'2018-10-13 13:44:54','2018-10-16 13:45:01','2018-10-18 14:05:31',NULL,NULL),(16,1,2,'201809140101000001','2018-09-14 16:16:16','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',2,1,4,0,NULL,NULL,15,13284,13284,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(17,1,2,'201809150101000003','2018-09-15 12:24:27','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',0,1,4,0,'顺丰快递','201707196398345',15,NULL,NULL,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,NULL,'2018-10-12 14:01:28',NULL,NULL,NULL),(18,1,2,'201809150102000004','2018-09-15 14:24:29','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',1,1,1,0,'圆通快递','xx',15,NULL,NULL,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,1000,NULL,'2018-10-16 14:42:17',NULL,NULL,NULL),(19,1,2,'201809130101000003','2018-09-13 16:57:40','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',2,1,2,0,NULL,NULL,15,NULL,NULL,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(20,1,2,'201809130102000004','2018-09-13 17:03:00','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',1,1,3,0,NULL,NULL,15,NULL,NULL,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(21,1,2,'201809140101000002','2018-09-14 16:16:16','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',2,1,4,0,NULL,NULL,15,18682,18682,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(22,1,2,'201809150101000005','2018-09-15 12:24:27','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',0,1,4,0,'顺丰快递','201707196398345',15,0,0,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,NULL,'2018-10-12 14:01:28',NULL,NULL,NULL),(23,1,2,'201809150102000006','2018-09-15 14:24:29','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',1,1,1,0,'顺丰快递','xxx',15,0,0,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,1000,NULL,'2018-10-16 14:41:28',NULL,NULL,NULL),(24,1,2,'201809130101000005','2018-09-13 16:57:40','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',2,1,2,0,NULL,NULL,15,18682,18682,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(25,1,2,'201809130102000006','2018-09-13 17:03:00','test','18732.00','16377.75','10.00','2344.25','0.00','10.00','5.00',1,1,4,0,NULL,NULL,15,18682,18682,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨22','18033441849','518000','北京市','北京城区','东城区','东城街道','xxx',0,0,NULL,NULL,NULL,NULL,NULL,'2018-10-30 15:08:31'),(26,1,2,'201809140101000003','2018-09-14 16:16:16','test','18732.00','16377.75','0.00','2344.25','0.00','10.00','0.00',0,1,4,0,NULL,NULL,15,18682,18682,'单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',NULL,NULL,NULL,NULL,NULL,'大梨','18033441849','518000','广东省','深圳市','福田区','东晓街道',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `oms_order_item` */

DROP TABLE IF EXISTS `oms_order_item`;

CREATE TABLE `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) DEFAULT NULL,
  `product_pic` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(64) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) DEFAULT NULL,
  `sp3` varchar(100) DEFAULT NULL,
  `promotion_name` varchar(200) DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) DEFAULT '0',
  `gift_growth` int(11) DEFAULT '0',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='订单中所包含的商品';

/*Data for the table `oms_order_item` */

insert  into `oms_order_item`(`id`,`order_id`,`order_sn`,`product_id`,`product_pic`,`product_name`,`product_brand`,`product_sn`,`product_price`,`product_quantity`,`product_sku_id`,`product_sku_code`,`product_category_id`,`sp1`,`sp2`,`sp3`,`promotion_name`,`promotion_amount`,`coupon_amount`,`integration_amount`,`real_amount`,`gift_integration`,`gift_growth`,`product_attr`) values (21,12,'201809150101000001',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605','3788.00',1,90,'201806070026001',19,NULL,NULL,NULL,'单品促销','200.00','2.02','0.00','3585.98',3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(22,12,'201809150101000001',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788','2699.00',3,98,'201808270027001',19,NULL,NULL,NULL,'打折优惠：满3件，打7.50折','674.75','1.44','0.00','2022.81',2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(23,12,'201809150101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','649.00',1,102,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','57.60','0.35','0.00','591.05',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(24,12,'201809150101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','699.00',1,103,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','62.40','0.37','0.00','636.23',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(25,12,'201809150101000001',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799','5499.00',1,106,'201808270029001',19,NULL,NULL,NULL,'无优惠','0.00','2.94','0.00','5496.06',5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(26,13,'201809150102000002',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605','3788.00',1,90,'201806070026001',19,NULL,NULL,NULL,'单品促销','200.00','2.02','0.00','3585.98',3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(27,13,'201809150102000002',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788','2699.00',3,98,'201808270027001',19,NULL,NULL,NULL,'打折优惠：满3件，打7.50折','674.75','1.44','0.00','2022.81',2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(28,13,'201809150102000002',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','649.00',1,102,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','57.60','0.35','0.00','591.05',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(29,13,'201809150102000002',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','699.00',1,103,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','62.40','0.37','0.00','636.23',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(30,13,'201809150102000002',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799','5499.00',1,106,'201808270029001',19,NULL,NULL,NULL,'无优惠','0.00','2.94','0.00','5496.06',5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(31,14,'201809130101000001',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605','3788.00',1,90,'201806070026001',19,NULL,NULL,NULL,'单品促销','200.00','2.02','0.00','3585.98',3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(32,14,'201809130101000001',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788','2699.00',3,98,'201808270027001',19,NULL,NULL,NULL,'打折优惠：满3件，打7.50折','674.75','1.44','0.00','2022.81',2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(33,14,'201809130101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','649.00',1,102,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','57.60','0.35','0.00','591.05',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(34,14,'201809130101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','699.00',1,103,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','62.40','0.37','0.00','636.23',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(35,14,'201809130101000001',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799','5499.00',1,106,'201808270029001',19,NULL,NULL,NULL,'无优惠','0.00','2.94','0.00','5496.06',5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(36,15,'201809130101000001',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605','3788.00',1,90,'201806070026001',19,NULL,NULL,NULL,'单品促销','200.00','2.02','0.00','3585.98',3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(37,15,'201809130101000001',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788','2699.00',3,98,'201808270027001',19,NULL,NULL,NULL,'打折优惠：满3件，打7.50折','674.75','1.44','0.00','2022.81',2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(38,15,'201809130101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','649.00',1,102,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','57.60','0.35','0.00','591.05',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(39,15,'201809130101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','699.00',1,103,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','62.40','0.37','0.00','636.23',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(40,15,'201809130101000001',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799','5499.00',1,106,'201808270029001',19,NULL,NULL,NULL,'无优惠','0.00','2.94','0.00','5496.06',5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(41,16,'201809140101000001',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605','3788.00',1,90,'201806070026001',19,NULL,NULL,NULL,'单品促销','200.00','2.02','0.00','3585.98',3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(42,16,'201809140101000001',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788','2699.00',3,98,'201808270027001',19,NULL,NULL,NULL,'打折优惠：满3件，打7.50折','674.75','1.44','0.00','2022.81',2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(43,16,'201809140101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','649.00',1,102,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','57.60','0.35','0.00','591.05',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(44,16,'201809140101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789','699.00',1,103,'201808270028001',19,NULL,NULL,NULL,'满减优惠：满1000.00元，减120.00元','62.40','0.37','0.00','636.23',649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(45,16,'201809140101000001',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799','5499.00',1,106,'201808270029001',19,NULL,NULL,NULL,'无优惠','0.00','2.94','0.00','5496.06',5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');

/*Table structure for table `oms_order_operate_history` */

DROP TABLE IF EXISTS `oms_order_operate_history`;

CREATE TABLE `oms_order_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='订单操作历史记录';

/*Data for the table `oms_order_operate_history` */

insert  into `oms_order_operate_history`(`id`,`order_id`,`operate_man`,`create_time`,`order_status`,`note`) values (5,12,'后台管理员','2018-10-12 14:01:29',2,'完成发货'),(6,13,'后台管理员','2018-10-12 14:01:29',2,'完成发货'),(7,12,'后台管理员','2018-10-12 14:13:10',4,'订单关闭:买家退货'),(8,13,'后台管理员','2018-10-12 14:13:10',4,'订单关闭:买家退货'),(9,22,'后台管理员','2018-10-15 16:31:48',4,'订单关闭:xxx'),(10,22,'后台管理员','2018-10-15 16:35:08',4,'订单关闭:xxx'),(11,22,'后台管理员','2018-10-15 16:35:59',4,'订单关闭:xxx'),(12,17,'后台管理员','2018-10-15 16:43:40',4,'订单关闭:xxx'),(13,25,'后台管理员','2018-10-15 16:52:14',4,'订单关闭:xxx'),(14,26,'后台管理员','2018-10-15 16:52:14',4,'订单关闭:xxx'),(15,23,'后台管理员','2018-10-16 14:41:28',2,'完成发货'),(16,13,'后台管理员','2018-10-16 14:42:17',2,'完成发货'),(17,18,'后台管理员','2018-10-16 14:42:17',2,'完成发货'),(18,26,'后台管理员','2018-10-30 14:37:44',4,'订单关闭:关闭订单'),(19,25,'后台管理员','2018-10-30 15:07:01',0,'修改收货人信息'),(20,25,'后台管理员','2018-10-30 15:08:13',0,'修改费用信息'),(21,25,'后台管理员','2018-10-30 15:08:31',0,'修改备注信息：xxx'),(22,25,'后台管理员','2018-10-30 15:08:39',4,'订单关闭:2222');

/*Table structure for table `oms_order_return_apply` */

DROP TABLE IF EXISTS `oms_order_return_apply`;

CREATE TABLE `oms_order_return_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单退货申请';

/*Data for the table `oms_order_return_apply` */

insert  into `oms_order_return_apply`(`id`,`order_id`,`company_address_id`,`product_id`,`order_sn`,`create_time`,`member_username`,`return_amount`,`return_name`,`return_phone`,`status`,`handle_time`,`product_pic`,`product_name`,`product_brand`,`product_attr`,`product_count`,`product_price`,`product_real_price`,`reason`,`description`,`proof_pics`,`handle_note`,`handle_man`,`receive_man`,`receive_time`,`receive_note`) values (3,12,NULL,26,'201809150101000001','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,'3788.00','3585.98','质量问题','老是卡','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg',NULL,NULL,NULL,NULL,NULL),(4,12,2,27,'201809150101000001','2018-10-17 14:40:21','test','3585.98','大梨','18000000000',1,'2018-10-18 13:54:10','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,'2699.00','2022.81','质量问题','不够高端','','已经处理了','admin',NULL,NULL,NULL),(5,12,3,28,'201809150101000001','2018-10-17 14:44:18','test','3585.98','大梨','18000000000',2,'2018-10-18 13:55:28','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,'649.00','591.05','质量问题','颜色太土','','已经处理了','admin','admin','2018-10-18 13:55:58','已经处理了'),(8,13,NULL,28,'201809150102000002','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',3,'2018-10-18 13:57:12','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,'649.00','591.05','质量问题','颜色太土','','理由不够充分','admin',NULL,NULL,NULL),(9,14,2,26,'201809130101000001','2018-10-17 14:34:57','test','3500.00','大梨','18000000000',2,'2018-10-24 15:44:56','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,'3788.00','3585.98','质量问题','老是卡','','呵呵','admin','admin','2018-10-24 15:46:35','收货了'),(10,14,NULL,27,'201809130101000001','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',3,'2018-10-24 15:46:57','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,'2699.00','2022.81','质量问题','不够高端','','就是不退','admin',NULL,NULL,NULL),(11,14,2,28,'201809130101000001','2018-10-17 14:44:18','test','591.05','大梨','18000000000',1,'2018-10-24 17:09:04','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,'649.00','591.05','质量问题','颜色太土','','可以退款','admin',NULL,NULL,NULL),(12,15,3,26,'201809130102000002','2018-10-17 14:34:57','test','3500.00','大梨','18000000000',2,'2018-10-24 17:22:54','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,'3788.00','3585.98','质量问题','老是卡','','退货了','admin','admin','2018-10-24 17:23:06','收货了'),(13,15,NULL,27,'201809130102000002','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',3,'2018-10-24 17:23:30','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,'2699.00','2022.81','质量问题','不够高端','','无法退货','admin',NULL,NULL,NULL),(15,16,NULL,26,'201809140101000001','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,'3788.00','3585.98','质量问题','老是卡','',NULL,NULL,NULL,NULL,NULL),(16,16,NULL,27,'201809140101000001','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,'2699.00','2022.81','质量问题','不够高端','',NULL,NULL,NULL,NULL,NULL),(17,16,NULL,28,'201809140101000001','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,'649.00','591.05','质量问题','颜色太土','',NULL,NULL,NULL,NULL,NULL),(18,17,NULL,26,'201809150101000003','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,'3788.00','3585.98','质量问题','老是卡','',NULL,NULL,NULL,NULL,NULL),(19,17,NULL,27,'201809150101000003','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,'2699.00','2022.81','质量问题','不够高端','',NULL,NULL,NULL,NULL,NULL),(20,17,NULL,28,'201809150101000003','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,'649.00','591.05','质量问题','颜色太土','',NULL,NULL,NULL,NULL,NULL),(21,18,NULL,26,'201809150102000004','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,'3788.00','3585.98','质量问题','老是卡','',NULL,NULL,NULL,NULL,NULL),(22,18,NULL,27,'201809150102000004','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,'2699.00','2022.81','质量问题','不够高端','',NULL,NULL,NULL,NULL,NULL),(23,18,NULL,28,'201809150102000004','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,'649.00','591.05','质量问题','颜色太土','',NULL,NULL,NULL,NULL,NULL),(24,19,NULL,26,'201809130101000003','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,'3788.00','3585.98','质量问题','老是卡','',NULL,NULL,NULL,NULL,NULL),(25,19,NULL,27,'201809130101000003','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,'2699.00','2022.81','质量问题','不够高端','',NULL,NULL,NULL,NULL,NULL),(26,19,NULL,28,'201809130101000003','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,'649.00','591.05','质量问题','颜色太土','',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `oms_order_return_reason` */

DROP TABLE IF EXISTS `oms_order_return_reason`;

CREATE TABLE `oms_order_return_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='退货原因表';

/*Data for the table `oms_order_return_reason` */

insert  into `oms_order_return_reason`(`id`,`name`,`sort`,`status`,`create_time`) values (1,'质量问题',1,0,'2018-10-17 10:00:45'),(2,'尺码太大',1,1,'2018-10-17 10:01:03'),(3,'颜色不喜欢',1,1,'2018-10-17 10:01:13'),(4,'7天无理由退货',1,1,'2018-10-17 10:01:47'),(5,'价格问题',1,0,'2018-10-17 10:01:57'),(12,'发票问题',0,1,'2018-10-19 16:28:36'),(13,'其他问题',0,1,'2018-10-19 16:28:51'),(14,'物流问题',0,1,'2018-10-19 16:29:01'),(15,'售后问题',0,1,'2018-10-19 16:29:11');

/*Table structure for table `oms_order_setting` */

DROP TABLE IF EXISTS `oms_order_setting`;

CREATE TABLE `oms_order_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单设置表';

/*Data for the table `oms_order_setting` */

insert  into `oms_order_setting`(`id`,`flash_order_overtime`,`normal_order_overtime`,`confirm_overtime`,`finish_overtime`,`comment_overtime`) values (1,60,120,15,7,7);

/*Table structure for table `order_buy_cart` */

DROP TABLE IF EXISTS `order_buy_cart`;

CREATE TABLE `order_buy_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `amount` int(11) DEFAULT NULL COMMENT '加入购物车商品数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入购物车时间',
  `seller_id` int(11) DEFAULT NULL COMMENT '卖家id',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '卖家名称',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='购物车表';

/*Data for the table `order_buy_cart` */

insert  into `order_buy_cart`(`id`,`user_id`,`sku_id`,`amount`,`price`,`add_time`,`seller_id`,`seller_name`,`modified_time`,`del_flag`) values (1,4,1,5,'688.00','2019-03-31 19:41:46',5,'海尔官方旗舰店','2019-03-31 19:41:49',1),(2,4,6,5,'9196.00','2019-03-31 19:42:14',5,'海尔官方旗舰店','2019-03-31 19:42:17',1),(3,4,2,4,'1088.00','2019-04-04 16:00:53',5,'海尔官方旗舰店','2019-04-04 16:00:53',1),(4,4,1,5,'688.00','2019-04-18 15:25:54',5,'海尔官方旗舰店','2019-04-18 15:25:54',0),(5,4,10,3,'1899.00','2019-04-18 15:26:34',5,'海尔官方旗舰店','2019-04-18 15:26:34',0);

/*Table structure for table `order_master` */

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单编号 yyyymmddnnnnnnnn',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `pkg_id` bigint(20) DEFAULT NULL COMMENT '打包品id',
  `delivery_addr_id` bigint(20) DEFAULT NULL COMMENT '收货地址id',
  `order_channel` tinyint(4) DEFAULT '0' COMMENT '1pc 2android 3ios',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态 0新建 1已支付 2 已发货 3已收货 4已退款 5已完成',
  `province` int(11) DEFAULT NULL COMMENT '省',
  `city` int(11) DEFAULT NULL COMMENT '市',
  `area` int(11) DEFAULT NULL COMMENT '区',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `payment_method` tinyint(4) DEFAULT NULL COMMENT '支付方式：1现金，2余额，3网银，4支付宝，5微信',
  `order_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `district_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `payment_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `shipping_comp_name` varchar(20) DEFAULT NULL COMMENT '快递公司名称',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `shipping_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `create_date` datetime DEFAULT NULL COMMENT '订单创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  `order_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单积分',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否被用户删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='订单主表';

/*Data for the table `order_master` */

insert  into `order_master`(`id`,`order_sn`,`user_id`,`pkg_id`,`delivery_addr_id`,`order_channel`,`status`,`province`,`city`,`area`,`address`,`payment_method`,`order_money`,`district_money`,`payment_money`,`shipping_comp_name`,`shipping_sn`,`shipping_time`,`receive_time`,`create_date`,`pay_date`,`order_point`,`del_flag`) values (6,NULL,3,2,0,1,0,NULL,NULL,NULL,NULL,NULL,'0.00','0.00','0.00',NULL,NULL,NULL,NULL,'2019-03-10 22:24:55',NULL,0,0);

/*Table structure for table `pms_album` */

DROP TABLE IF EXISTS `pms_album`;

CREATE TABLE `pms_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `cover_pic` varchar(1000) DEFAULT NULL,
  `pic_count` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册表';

/*Data for the table `pms_album` */

/*Table structure for table `pms_album_pic` */

DROP TABLE IF EXISTS `pms_album_pic`;

CREATE TABLE `pms_album_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='画册图片表';

/*Data for the table `pms_album_pic` */

/*Table structure for table `pms_brand` */

DROP TABLE IF EXISTS `pms_brand`;

CREATE TABLE `pms_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT NULL,
  `factory_status` int(1) DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `brand_story` text COMMENT '品牌故事',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='品牌表';

/*Data for the table `pms_brand` */

insert  into `pms_brand`(`id`,`name`,`first_letter`,`sort`,`factory_status`,`show_status`,`product_count`,`product_comment_count`,`logo`,`big_pic`,`brand_story`) values (1,'万和','W',0,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg','','Victoria\'s Secret的故事'),(2,'三星','S',100,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg',NULL,'三星的故事'),(3,'华为','H',100,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg',NULL,'Victoria\'s Secret的故事'),(4,'格力','G',30,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg',NULL,'Victoria\'s Secret的故事'),(5,'方太','F',20,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg',NULL,'Victoria\'s Secret的故事'),(6,'小米','M',500,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/1e34aef2a409119018a4c6258e39ecfb_222_222.png','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg','小米手机的故事'),(21,'OPPO','O',0,1,1,88,500,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg','','string'),(49,'七匹狼','S',200,1,1,77,400,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/18d8bc3eb13533fab466d702a0d3fd1f40345bcd.jpg',NULL,'BOOB的故事'),(50,'海澜之家','H',200,1,1,66,300,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/99d3279f1029d32b929343b09d3c72de_222_222.jpg','','海澜之家的故事'),(51,'苹果','A',200,1,1,55,200,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg',NULL,'苹果的故事'),(58,'NIKE','N',0,1,1,33,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg','','NIKE的故事');

/*Table structure for table `pms_comment` */

DROP TABLE IF EXISTS `pms_comment`;

CREATE TABLE `pms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `star` int(3) DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `product_attribute` varchar(255) DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `content` text,
  `pics` varchar(1000) DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评价表';

/*Data for the table `pms_comment` */

/*Table structure for table `pms_comment_replay` */

DROP TABLE IF EXISTS `pms_comment_replay`;

CREATE TABLE `pms_comment_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品评价回复表';

/*Data for the table `pms_comment_replay` */

/*Table structure for table `pms_feight_template` */

DROP TABLE IF EXISTS `pms_feight_template`;

CREATE TABLE `pms_feight_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `charge_type` int(1) DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL,
  `continme_fee` decimal(10,2) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费模版';

/*Data for the table `pms_feight_template` */

/*Table structure for table `pms_member_price` */

DROP TABLE IF EXISTS `pms_member_price`;

CREATE TABLE `pms_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_level_id` bigint(20) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COMMENT='商品会员价格表';

/*Data for the table `pms_member_price` */

insert  into `pms_member_price`(`id`,`product_id`,`member_level_id`,`member_price`,`member_level_name`) values (26,7,1,'500.00',NULL),(27,8,1,'500.00',NULL),(28,9,1,'500.00',NULL),(29,10,1,'500.00',NULL),(30,11,1,'500.00',NULL),(31,12,1,'500.00',NULL),(32,13,1,'500.00',NULL),(33,14,1,'500.00',NULL),(37,18,1,'500.00',NULL),(44,7,2,'480.00',NULL),(45,7,3,'450.00',NULL),(52,22,1,NULL,NULL),(53,22,2,NULL,NULL),(54,22,3,NULL,NULL),(58,24,1,NULL,NULL),(59,24,2,NULL,NULL),(60,24,3,NULL,NULL),(112,23,1,'88.00','黄金会员'),(113,23,2,'88.00','白金会员'),(114,23,3,'66.00','钻石会员'),(142,31,1,NULL,'黄金会员'),(143,31,2,NULL,'白金会员'),(144,31,3,NULL,'钻石会员'),(148,32,1,NULL,'黄金会员'),(149,32,2,NULL,'白金会员'),(150,32,3,NULL,'钻石会员'),(154,33,1,NULL,'黄金会员'),(155,33,2,NULL,'白金会员'),(156,33,3,NULL,'钻石会员'),(169,36,1,NULL,'黄金会员'),(170,36,2,NULL,'白金会员'),(171,36,3,NULL,'钻石会员'),(172,35,1,NULL,'黄金会员'),(173,35,2,NULL,'白金会员'),(174,35,3,NULL,'钻石会员'),(175,34,1,NULL,'黄金会员'),(176,34,2,NULL,'白金会员'),(177,34,3,NULL,'钻石会员'),(178,30,1,NULL,'黄金会员'),(179,30,2,NULL,'白金会员'),(180,30,3,NULL,'钻石会员'),(186,26,1,NULL,'黄金会员'),(187,26,2,NULL,'白金会员'),(188,26,3,NULL,'钻石会员'),(192,27,1,NULL,'黄金会员'),(193,27,2,NULL,'白金会员'),(194,27,3,NULL,'钻石会员'),(195,28,1,NULL,'黄金会员'),(196,28,2,NULL,'白金会员'),(197,28,3,NULL,'钻石会员'),(198,29,1,NULL,'黄金会员'),(199,29,2,NULL,'白金会员'),(200,29,3,NULL,'钻石会员');

/*Table structure for table `pms_product` */

DROP TABLE IF EXISTS `pms_product`;

CREATE TABLE `pms_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `feight_template_id` bigint(20) DEFAULT NULL,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `product_sn` varchar(64) NOT NULL COMMENT '货号',
  `delete_status` int(1) DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL,
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `use_point_limit` int(11) DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `description` text COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `album_pics` varchar(255) DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) DEFAULT NULL,
  `detail_desc` text,
  `detail_html` text COMMENT '产品详情网页内容',
  `detail_mobile_html` text COMMENT '移动端网页详情',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(1) DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='商品信息';

/*Data for the table `pms_product` */

insert  into `pms_product`(`id`,`brand_id`,`product_category_id`,`feight_template_id`,`product_attribute_category_id`,`name`,`pic`,`product_sn`,`delete_status`,`publish_status`,`new_status`,`recommand_status`,`verify_status`,`sort`,`sale`,`price`,`promotion_price`,`gift_growth`,`gift_point`,`use_point_limit`,`sub_title`,`description`,`original_price`,`stock`,`low_stock`,`unit`,`weight`,`preview_status`,`service_ids`,`keywords`,`note`,`album_pics`,`detail_title`,`detail_desc`,`detail_html`,`detail_mobile_html`,`promotion_start_time`,`promotion_end_time`,`promotion_per_limit`,`promotion_type`,`brand_name`,`product_category_name`) values (1,49,7,0,0,'银色星芒刺绣网纱底裤','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,1,1,1,1,100,0,'100.00',NULL,0,100,NULL,'111','111','120.00',100,20,'件','1000.00',0,NULL,'银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤',NULL,'银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤',NULL,NULL,NULL,0,'七匹狼','外套'),(2,49,7,0,0,'银色星芒刺绣网纱底裤2','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86578',1,1,1,1,1,1,0,'100.00',NULL,0,100,NULL,'111','111','120.00',100,20,'件','1000.00',0,NULL,'银色星芒刺绣网纱底裤2','银色星芒刺绣网纱底裤',NULL,'银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','<p>银色星芒刺绣网纱底裤</p>','<p>银色星芒刺绣网纱底裤</p>',NULL,NULL,NULL,0,'七匹狼','外套'),(3,1,7,0,0,'银色星芒刺绣网纱底裤3','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86579',1,1,1,1,1,1,0,'100.00',NULL,0,100,NULL,'111','111','120.00',100,20,'件','1000.00',0,NULL,'银色星芒刺绣网纱底裤3','银色星芒刺绣网纱底裤',NULL,'银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤',NULL,NULL,NULL,0,'万和','外套'),(4,1,7,0,0,'银色星芒刺绣网纱底裤4','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86580',1,1,1,1,1,1,0,'100.00',NULL,0,100,NULL,'111','111','120.00',100,20,'件','1000.00',0,NULL,'银色星芒刺绣网纱底裤4','银色星芒刺绣网纱底裤',NULL,'银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤',NULL,NULL,NULL,0,'万和','外套'),(5,1,7,0,0,'银色星芒刺绣网纱底裤5','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86581',1,0,1,1,1,1,0,'100.00',NULL,0,100,NULL,'111','111','120.00',100,20,'件','1000.00',0,NULL,'银色星芒刺绣网纱底裤5','银色星芒刺绣网纱底裤',NULL,'银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤',NULL,NULL,NULL,0,'万和','外套'),(6,1,7,0,0,'银色星芒刺绣网纱底裤6','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86582',1,1,1,1,1,1,0,'100.00',NULL,0,100,NULL,'111','111','120.00',100,20,'件','1000.00',0,NULL,'银色星芒刺绣网纱底裤6','银色星芒刺绣网纱底裤',NULL,'银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤','银色星芒刺绣网纱底裤',NULL,NULL,NULL,0,'万和','外套'),(7,1,7,0,1,'女式超柔软拉毛运动开衫','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,0,0,0,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(8,1,7,0,1,'女式超柔软拉毛运动开衫1','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,0,0,0,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(9,1,7,0,1,'女式超柔软拉毛运动开衫1','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,0,0,0,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(10,1,7,0,1,'女式超柔软拉毛运动开衫1','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,0,0,0,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(11,1,7,0,1,'女式超柔软拉毛运动开衫1','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,1,0,1,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(12,1,7,0,1,'女式超柔软拉毛运动开衫2','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,1,0,1,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(13,1,7,0,1,'女式超柔软拉毛运动开衫3','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,1,0,1,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(14,1,7,0,1,'女式超柔软拉毛运动开衫3','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,0,0,1,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(18,1,7,0,1,'女式超柔软拉毛运动开衫3','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','No86577',1,0,0,1,0,0,0,'249.00','0.00',0,100,0,'匠心剪裁，垂感质地','匠心剪裁，垂感质地','299.00',100,0,'件','0.00',0,'string','女式超柔软拉毛运动开衫','string','string','string','string','string','string','2018-04-26 10:41:03','2018-04-26 10:41:03',0,0,'万和','外套'),(22,6,7,0,1,'test','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg','',1,1,0,0,0,0,0,'0.00',NULL,0,0,0,'test','','0.00',100,0,'','0.00',1,'1,2','','','','','','','',NULL,NULL,0,0,'小米','外套'),(23,6,19,0,1,'毛衫测试','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg','NO.1098',1,1,1,1,0,0,0,'99.00',NULL,99,99,1000,'毛衫测试11','xxx','109.00',100,0,'件','1000.00',1,'1,2,3','毛衫测试','毛衫测试','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg','毛衫测试','毛衫测试','<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>','',NULL,NULL,0,2,'小米','手机通讯'),(24,6,7,0,NULL,'xxx','','',1,0,0,0,0,0,0,'0.00',NULL,0,0,0,'xxx','','0.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'小米','外套'),(26,3,19,0,3,'华为 HUAWEI P20 ','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','6946605',0,1,1,1,0,100,0,'3788.00',NULL,3788,3788,0,'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待','','4288.00',1000,0,'件','0.00',1,'2,3,1','','','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg','','','<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>','',NULL,NULL,0,1,'华为','手机通讯'),(27,6,19,0,3,'小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','7437788',0,1,1,1,0,0,0,'2699.00',NULL,2699,2699,0,'骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购','小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待','2699.00',100,0,'','0.00',0,'','','','','','','<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>','',NULL,NULL,0,3,'小米','手机通讯'),(28,6,19,0,3,'小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','7437789',0,1,1,1,0,0,0,'649.00',NULL,649,649,0,'8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购','','649.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,4,'小米','手机通讯'),(29,51,19,0,3,'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','7437799',0,1,1,0,0,0,0,'5499.00',NULL,5499,5499,0,'【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。','','5499.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'苹果','手机通讯'),(30,50,8,0,1,'HLA海澜之家简约动物印花短袖T恤','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg','HNTBJ2E042A',0,1,1,1,0,0,0,'98.00',NULL,0,0,0,'2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖','','98.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'海澜之家','T恤'),(31,50,8,0,1,'HLA海澜之家蓝灰花纹圆领针织布短袖T恤','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg','HNTBJ2E080A',0,1,0,0,0,0,0,'98.00',NULL,0,0,0,'2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L','','98.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'海澜之家','T恤'),(32,50,8,0,NULL,'HLA海澜之家短袖T恤男基础款','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg','HNTBJ2E153A',0,1,0,0,0,0,0,'68.00',NULL,0,0,0,'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)','','68.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'海澜之家','T恤'),(33,6,35,0,NULL,'小米（MI）小米电视4A ','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg','4609652',0,1,0,0,0,0,0,'2499.00',NULL,0,0,0,'小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视','','2499.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'小米','手机数码'),(34,6,35,0,NULL,'小米（MI）小米电视4A 65英寸','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg','4609660',0,1,0,0,0,0,0,'3999.00',NULL,0,0,0,' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视','','3999.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'小米','手机数码'),(35,58,29,0,NULL,'耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg','6799342',0,1,0,0,0,0,0,'369.00',NULL,0,0,0,'耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码','','369.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'NIKE','男鞋'),(36,58,29,0,NULL,'耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','6799345',0,1,1,1,0,0,0,'499.00',NULL,0,0,0,'耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','','499.00',100,0,'','0.00',0,'','','','','','','','',NULL,NULL,0,0,'NIKE','男鞋');

/*Table structure for table `pms_product_attribute` */

DROP TABLE IF EXISTS `pms_product_attribute`;

CREATE TABLE `pms_product_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `select_type` int(1) DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='商品属性参数表';

/*Data for the table `pms_product_attribute` */

insert  into `pms_product_attribute`(`id`,`product_attribute_category_id`,`name`,`select_type`,`input_type`,`input_list`,`sort`,`filter_type`,`search_type`,`related_status`,`hand_add_status`,`type`) values (1,1,'尺寸',2,1,'M,X,XL,2XL,3XL,4XL',0,0,0,0,0,0),(7,1,'颜色',2,1,'黑色,红色,白色,粉色',100,0,0,0,1,0),(13,0,'上市年份',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(14,0,'上市年份1',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(15,0,'上市年份2',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(16,0,'上市年份3',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(17,0,'上市年份4',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(18,0,'上市年份5',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(19,0,'适用对象',1,1,'青年女性,中年女性',0,0,0,0,0,1),(20,0,'适用对象1',2,1,'青年女性,中年女性',0,0,0,0,0,1),(21,0,'适用对象3',2,1,'青年女性,中年女性',0,0,0,0,0,1),(24,1,'商品编号',1,0,'',0,0,0,0,0,1),(25,1,'适用季节',1,1,'春季,夏季,秋季,冬季',0,0,0,0,0,1),(32,2,'适用人群',0,1,'老年,青年,中年',0,0,0,0,0,1),(33,2,'风格',0,1,'嘻哈风格,基础大众,商务正装',0,0,0,0,0,1),(35,2,'颜色',0,0,'',100,0,0,0,1,0),(37,1,'适用人群',1,1,'儿童,青年,中年,老年',0,0,0,0,0,1),(38,1,'上市时间',1,1,'2017年秋,2017年冬,2018年春,2018年夏',0,0,0,0,0,1),(39,1,'袖长',1,1,'短袖,长袖,中袖',0,0,0,0,0,1),(40,2,'尺码',0,1,'29,30,31,32,33,34',0,0,0,0,0,0),(41,2,'适用场景',0,1,'居家,运动,正装',0,0,0,0,0,1),(42,2,'上市时间',0,1,'2018年春,2018年夏',0,0,0,0,0,1),(43,3,'颜色',0,0,'',100,0,0,0,1,0),(44,3,'容量',0,1,'16G,32G,64G,128G',0,0,0,0,0,0),(45,3,'屏幕尺寸',0,0,'',0,0,0,0,0,1),(46,3,'网络',0,1,'3G,4G',0,0,0,0,0,1),(47,3,'系统',0,1,'Android,IOS',0,0,0,0,0,1),(48,3,'电池容量',0,0,'',0,0,0,0,0,1);

/*Table structure for table `pms_product_attribute_category` */

DROP TABLE IF EXISTS `pms_product_attribute_category`;

CREATE TABLE `pms_product_attribute_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `attribute_count` int(11) DEFAULT '0' COMMENT '属性数量',
  `param_count` int(11) DEFAULT '0' COMMENT '参数数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品属性分类表';

/*Data for the table `pms_product_attribute_category` */

insert  into `pms_product_attribute_category`(`id`,`name`,`attribute_count`,`param_count`) values (1,'服装-T恤',2,5),(2,'服装-裤装',2,4),(3,'手机数码-手机通讯',2,4),(4,'配件',0,0),(5,'居家',0,0),(6,'洗护',0,0),(10,'测试分类',0,0);

/*Table structure for table `pms_product_attribute_value` */

DROP TABLE IF EXISTS `pms_product_attribute_value`;

CREATE TABLE `pms_product_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 COMMENT='存储产品参数信息的表';

/*Data for the table `pms_product_attribute_value` */

insert  into `pms_product_attribute_value`(`id`,`product_id`,`product_attribute_id`,`value`) values (1,9,1,'X'),(2,10,1,'X'),(3,11,1,'X'),(4,12,1,'X'),(5,13,1,'X'),(6,14,1,'X'),(7,18,1,'X'),(8,7,1,'X'),(9,7,1,'XL'),(10,7,1,'XXL'),(11,22,7,'x,xx'),(12,22,24,'no110'),(13,22,25,'春季'),(14,22,37,'青年'),(15,22,38,'2018年春'),(16,22,39,'长袖'),(124,23,7,'米白色,浅黄色'),(125,23,24,'no1098'),(126,23,25,'春季'),(127,23,37,'青年'),(128,23,38,'2018年春'),(129,23,39,'长袖'),(130,1,13,NULL),(131,1,14,NULL),(132,1,15,NULL),(133,1,16,NULL),(134,1,17,NULL),(135,1,18,NULL),(136,1,19,NULL),(137,1,20,NULL),(138,1,21,NULL),(139,2,13,NULL),(140,2,14,NULL),(141,2,15,NULL),(142,2,16,NULL),(143,2,17,NULL),(144,2,18,NULL),(145,2,19,NULL),(146,2,20,NULL),(147,2,21,NULL),(183,31,24,NULL),(184,31,25,'夏季'),(185,31,37,'青年'),(186,31,38,'2018年夏'),(187,31,39,'短袖'),(198,30,24,NULL),(199,30,25,'夏季'),(200,30,37,'青年'),(201,30,38,'2018年夏'),(202,30,39,'短袖'),(203,26,43,'金色,银色'),(204,26,45,'5.0'),(205,26,46,'4G'),(206,26,47,'Android'),(207,26,48,'3000'),(213,27,43,'黑色,蓝色'),(214,27,45,'5.8'),(215,27,46,'4G'),(216,27,47,'Android'),(217,27,48,'3000ml'),(218,28,43,'金色,银色'),(219,28,45,'5.0'),(220,28,46,'4G'),(221,28,47,'Android'),(222,28,48,'2800ml'),(223,29,43,'金色,银色'),(224,29,45,'4.7'),(225,29,46,'4G'),(226,29,47,'IOS'),(227,29,48,'1960ml');

/*Table structure for table `pms_product_category` */

DROP TABLE IF EXISTS `pms_product_category`;

CREATE TABLE `pms_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) DEFAULT NULL,
  `product_unit` varchar(64) DEFAULT NULL,
  `nav_status` int(1) DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL,
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='产品分类';

/*Data for the table `pms_product_category` */

insert  into `pms_product_category`(`id`,`parent_id`,`name`,`level`,`product_count`,`product_unit`,`nav_status`,`show_status`,`sort`,`icon`,`keywords`,`description`) values (1,0,'服装',0,100,'件',1,1,1,NULL,'服装','服装分类'),(2,0,'手机数码',0,100,'件',1,1,1,NULL,'手机数码','手机数码'),(3,0,'家用电器',0,100,'件',1,1,1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png','家用电器','家用电器'),(4,0,'家具家装',0,100,'件',1,1,1,NULL,'家具家装','家具家装'),(5,0,'汽车用品',0,100,'件',1,1,1,NULL,'汽车用品','汽车用品'),(7,1,'外套',1,100,'件',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png','外套','外套'),(8,1,'T恤',1,100,'件',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_tshirt.png','T恤','T恤'),(9,1,'休闲裤',1,100,'件',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xiuxianku.png','休闲裤','休闲裤'),(10,1,'牛仔裤',1,100,'件',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_niuzaiku.png','牛仔裤','牛仔裤'),(11,1,'衬衫',1,100,'件',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_chenshan.png','衬衫','衬衫分类'),(13,12,'家电子分类1',1,1,'string',0,1,0,'string','string','string'),(14,12,'家电子分类2',1,1,'string',0,1,0,'string','string','string'),(19,2,'手机通讯',1,0,'件',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png','手机通讯','手机通讯'),(29,1,'男鞋',1,0,'',0,0,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xie.png','',''),(30,2,'手机配件',1,0,'',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png','手机配件','手机配件'),(31,2,'摄影摄像',1,0,'',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_sheying.png','',''),(32,2,'影音娱乐',1,0,'',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png','',''),(33,2,'数码配件',1,0,'',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png','',''),(34,2,'智能设备',1,0,'',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_zhineng.png','',''),(35,3,'电视',1,0,'',1,1,0,'','',''),(36,3,'空调',1,0,'',1,1,0,'','',''),(37,3,'洗衣机',1,0,'',1,1,0,'','',''),(38,3,'冰箱',1,0,'',1,1,0,'','',''),(39,3,'厨卫大电',1,0,'',1,1,0,'','',''),(40,3,'厨房小电',1,0,'',0,0,0,'','',''),(41,3,'生活电器',1,0,'',0,0,0,'','',''),(42,3,'个护健康',1,0,'',0,0,0,'','',''),(43,4,'厨房卫浴',1,0,'',1,1,0,'','',''),(44,4,'灯饰照明',1,0,'',1,1,0,'','',''),(45,4,'五金工具',1,0,'',1,1,0,'','',''),(46,4,'卧室家具',1,0,'',1,1,0,'','',''),(47,4,'客厅家具',1,0,'',1,1,0,'','',''),(48,5,'全新整车',1,0,'',1,1,0,'','',''),(49,5,'车载电器',1,0,'',1,1,0,'','',''),(50,5,'维修保养',1,0,'',1,1,0,'','',''),(51,5,'汽车装饰',1,0,'',1,1,0,'','','');

/*Table structure for table `pms_product_category_attribute_relation` */

DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;

CREATE TABLE `pms_product_category_attribute_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';

/*Data for the table `pms_product_category_attribute_relation` */

insert  into `pms_product_category_attribute_relation`(`id`,`product_category_id`,`product_attribute_id`) values (1,24,24),(5,26,24),(7,28,24),(9,25,24),(10,25,25);

/*Table structure for table `pms_product_full_reduction` */

DROP TABLE IF EXISTS `pms_product_full_reduction`;

CREATE TABLE `pms_product_full_reduction` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `full_price` decimal(10,2) DEFAULT NULL,
  `reduce_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='产品满减表(只针对同商品)';

/*Data for the table `pms_product_full_reduction` */

insert  into `pms_product_full_reduction`(`id`,`product_id`,`full_price`,`reduce_price`) values (1,7,'100.00','20.00'),(2,8,'100.00','20.00'),(3,9,'100.00','20.00'),(4,10,'100.00','20.00'),(5,11,'100.00','20.00'),(6,12,'100.00','20.00'),(7,13,'100.00','20.00'),(8,14,'100.00','20.00'),(9,18,'100.00','20.00'),(10,7,'200.00','50.00'),(11,7,'300.00','100.00'),(14,22,'0.00','0.00'),(16,24,'0.00','0.00'),(34,23,'0.00','0.00'),(44,31,'0.00','0.00'),(46,32,'0.00','0.00'),(48,33,'0.00','0.00'),(53,36,'0.00','0.00'),(54,35,'0.00','0.00'),(55,34,'0.00','0.00'),(56,30,'0.00','0.00'),(57,26,'0.00','0.00'),(59,27,'0.00','0.00'),(60,28,'500.00','50.00'),(61,28,'1000.00','120.00'),(62,29,'0.00','0.00');

/*Table structure for table `pms_product_ladder` */

DROP TABLE IF EXISTS `pms_product_ladder`;

CREATE TABLE `pms_product_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='产品阶梯价格表(只针对同商品)';

/*Data for the table `pms_product_ladder` */

insert  into `pms_product_ladder`(`id`,`product_id`,`count`,`discount`,`price`) values (1,7,3,'0.70','0.00'),(2,8,3,'0.70','0.00'),(3,9,3,'0.70','0.00'),(4,10,3,'0.70','0.00'),(5,11,3,'0.70','0.00'),(6,12,3,'0.70','0.00'),(7,13,3,'0.70','0.00'),(8,14,3,'0.70','0.00'),(12,18,3,'0.70','0.00'),(14,7,4,'0.60','0.00'),(15,7,5,'0.50','0.00'),(18,22,0,'0.00','0.00'),(20,24,0,'0.00','0.00'),(38,23,0,'0.00','0.00'),(48,31,0,'0.00','0.00'),(50,32,0,'0.00','0.00'),(52,33,0,'0.00','0.00'),(57,36,0,'0.00','0.00'),(58,35,0,'0.00','0.00'),(59,34,0,'0.00','0.00'),(60,30,0,'0.00','0.00'),(61,26,0,'0.00','0.00'),(64,27,2,'0.80','0.00'),(65,27,3,'0.75','0.00'),(66,28,0,'0.00','0.00'),(67,29,0,'0.00','0.00');

/*Table structure for table `pms_product_operate_log` */

DROP TABLE IF EXISTS `pms_product_operate_log`;

CREATE TABLE `pms_product_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `price_new` decimal(10,2) DEFAULT NULL,
  `sale_price_old` decimal(10,2) DEFAULT NULL,
  `sale_price_new` decimal(10,2) DEFAULT NULL,
  `gift_point_old` int(11) DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(11) DEFAULT NULL,
  `use_point_limit_old` int(11) DEFAULT NULL,
  `use_point_limit_new` int(11) DEFAULT NULL,
  `operate_man` varchar(64) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pms_product_operate_log` */

/*Table structure for table `pms_product_vertify_record` */

DROP TABLE IF EXISTS `pms_product_vertify_record`;

CREATE TABLE `pms_product_vertify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `vertify_man` varchar(64) DEFAULT NULL COMMENT '审核人',
  `status` int(1) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品审核记录';

/*Data for the table `pms_product_vertify_record` */

insert  into `pms_product_vertify_record`(`id`,`product_id`,`create_time`,`vertify_man`,`status`,`detail`) values (1,1,'2018-04-27 16:36:41','test',1,'验证通过'),(2,2,'2018-04-27 16:36:41','test',1,'验证通过');

/*Table structure for table `pms_sku_stock` */

DROP TABLE IF EXISTS `pms_sku_stock`;

CREATE TABLE `pms_sku_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(64) NOT NULL COMMENT 'sku编码',
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '预警库存',
  `sp1` varchar(64) DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(64) DEFAULT NULL,
  `sp3` varchar(64) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(11) DEFAULT '0' COMMENT '锁定库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='sku的库存';

/*Data for the table `pms_sku_stock` */

insert  into `pms_sku_stock`(`id`,`product_id`,`sku_code`,`price`,`stock`,`low_stock`,`sp1`,`sp2`,`sp3`,`pic`,`sale`,`promotion_price`,`lock_stock`) values (1,7,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(2,8,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(3,9,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(4,10,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(5,11,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(6,12,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(7,13,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(8,14,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(9,18,'string','100.00',0,5,'string','string','string','string',0,NULL,0),(10,7,'string','0.00',0,0,'string','string','sp3','string',0,NULL,0),(11,7,'string','0.00',0,0,'string','string','sp33','string',0,NULL,0),(12,22,'111','99.00',0,NULL,'x','M',NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg',NULL,NULL,0),(13,22,'112','99.00',0,NULL,'xx','M',NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2018032614134591_20180326141345650 (4).png',NULL,NULL,0),(78,23,'201806070023001','99.00',0,NULL,'米白色','M',NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg',NULL,NULL,0),(79,23,'201806070023002','99.00',0,NULL,'米白色','X',NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg',NULL,NULL,0),(80,23,'201806070023003','99.00',0,NULL,'浅黄色','M',NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png',NULL,NULL,0),(81,23,'201806070023004','99.00',0,NULL,'浅黄色','X',NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png',NULL,NULL,0),(90,26,'201806070026001','3788.00',499,NULL,'金色','16G',NULL,NULL,NULL,'3588.00',-8),(91,26,'201806070026002','3999.00',500,NULL,'金色','32G',NULL,NULL,NULL,'3799.00',0),(92,26,'201806070026003','3788.00',500,NULL,'银色','16G',NULL,NULL,NULL,'3588.00',0),(93,26,'201806070026004','3999.00',500,NULL,'银色','32G',NULL,NULL,NULL,'3799.00',0),(98,27,'201808270027001','2699.00',97,NULL,'黑色','32G',NULL,NULL,NULL,NULL,-24),(99,27,'201808270027002','2999.00',100,NULL,'黑色','64G',NULL,NULL,NULL,NULL,0),(100,27,'201808270027003','2699.00',100,NULL,'蓝色','32G',NULL,NULL,NULL,NULL,0),(101,27,'201808270027004','2999.00',100,NULL,'蓝色','64G',NULL,NULL,NULL,NULL,0),(102,28,'201808270028001','649.00',99,NULL,'金色','16G',NULL,NULL,NULL,NULL,-8),(103,28,'201808270028002','699.00',99,NULL,'金色','32G',NULL,NULL,NULL,NULL,-8),(104,28,'201808270028003','649.00',100,NULL,'银色','16G',NULL,NULL,NULL,NULL,0),(105,28,'201808270028004','699.00',100,NULL,'银色','32G',NULL,NULL,NULL,NULL,0),(106,29,'201808270029001','5499.00',99,NULL,'金色','32G',NULL,NULL,NULL,NULL,-8),(107,29,'201808270029002','6299.00',100,NULL,'金色','64G',NULL,NULL,NULL,NULL,0),(108,29,'201808270029003','5499.00',100,NULL,'银色','32G',NULL,NULL,NULL,NULL,0),(109,29,'201808270029004','6299.00',100,NULL,'银色','64G',NULL,NULL,NULL,NULL,0);

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

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('RenrenScheduler','SC-2018112510341555575231660',1555576440134,15000);

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

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1555578000000,1555576200000,5,'WAITING','CRON',1550208677000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X���0xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0有参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),('RenrenScheduler','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1550210400000,-1,5,'PAUSED','CRON',1550208677000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X�w�`xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0无参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0x\0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

insert  into `schedule_job_log`(`log_id`,`job_id`,`bean_name`,`method_name`,`params`,`status`,`error`,`times`,`create_time`) values (1,1,'testTask','test','renren',0,NULL,1034,'2019-04-11 09:00:00'),(2,1,'testTask','test','renren',0,NULL,1039,'2019-04-12 09:30:00'),(3,1,'testTask','test','renren',0,NULL,1018,'2019-04-12 10:00:00'),(4,1,'testTask','test','renren',0,NULL,1033,'2019-04-12 11:00:00'),(5,1,'testTask','test','renren',0,NULL,1029,'2019-04-12 11:30:00'),(6,1,'testTask','test','renren',0,NULL,1025,'2019-04-12 12:00:00'),(7,1,'testTask','test','renren',0,NULL,1009,'2019-04-12 12:30:00'),(8,1,'testTask','test','renren',0,NULL,1022,'2019-04-12 13:00:00'),(9,1,'testTask','test','renren',0,NULL,1007,'2019-04-12 13:30:00'),(10,1,'testTask','test','renren',0,NULL,1008,'2019-04-12 14:00:00'),(11,1,'testTask','test','renren',0,NULL,1031,'2019-04-18 16:00:00'),(12,1,'testTask','test','renren',0,NULL,1101,'2019-04-18 16:30:00');

/*Table structure for table `shipping_info` */

DROP TABLE IF EXISTS `shipping_info`;

CREATE TABLE `shipping_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ship_name` varchar(20) DEFAULT NULL COMMENT '物流公司名称',
  `ship_contact` varchar(50) DEFAULT NULL COMMENT '物流公司联系人',
  `telephone` varchar(50) DEFAULT NULL COMMENT '物流公司联系电话',
  `price` decimal(8,2) DEFAULT NULL COMMENT '配送价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流公司信息表';

/*Data for the table `shipping_info` */

/*Table structure for table `sms_coupon` */

DROP TABLE IF EXISTS `sms_coupon`;

CREATE TABLE `sms_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL COMMENT '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) DEFAULT NULL,
  `platform` int(1) DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10,2) DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `use_type` int(1) DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) DEFAULT NULL COMMENT '优惠码',
  `member_level` int(1) DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='优惠卷表';

/*Data for the table `sms_coupon` */

insert  into `sms_coupon`(`id`,`type`,`name`,`platform`,`count`,`amount`,`per_limit`,`min_point`,`start_time`,`end_time`,`use_type`,`note`,`publish_count`,`use_count`,`receive_count`,`enable_time`,`code`,`member_level`) values (2,0,'全品类通用券',0,92,'10.00',1,'100.00','2018-08-27 16:40:47','2018-11-23 16:40:47',0,'满100减10',100,0,8,'2018-08-27 16:40:47',NULL,NULL),(3,0,'小米手机专用券',0,92,'50.00',1,'1000.00','2018-08-27 16:40:47','2018-11-16 16:40:47',2,'小米手机专用优惠券',100,0,8,'2018-08-27 16:40:47',NULL,NULL),(4,0,'手机品类专用券',0,92,'300.00',1,'2000.00','2018-08-27 16:40:47','2018-09-15 16:40:47',1,'手机分类专用优惠券',100,0,8,'2018-08-27 16:40:47',NULL,NULL),(7,0,'T恤分类专用优惠券',0,93,'50.00',1,'500.00','2018-08-27 16:40:47','2018-08-15 16:40:47',1,'满500减50',100,0,7,'2018-08-27 16:40:47',NULL,NULL),(8,0,'新优惠券',0,100,'100.00',1,'1000.00','2018-11-08 00:00:00','2018-11-27 00:00:00',0,'测试',100,0,1,NULL,NULL,NULL),(9,0,'全品类通用券',0,100,'5.00',1,'100.00','2018-11-08 00:00:00','2018-11-10 00:00:00',0,NULL,100,0,1,NULL,NULL,NULL),(10,0,'全品类通用券',0,100,'15.00',1,'200.00','2018-11-08 00:00:00','2018-11-10 00:00:00',0,NULL,100,0,1,NULL,NULL,NULL),(11,0,'全品类通用券',0,1000,'50.00',1,'1000.00','2018-11-08 00:00:00','2018-11-10 00:00:00',0,NULL,1000,0,0,NULL,NULL,NULL),(12,0,'移动端全品类通用券',1,1,'10.00',1,'100.00','2018-11-08 00:00:00','2018-11-10 00:00:00',0,NULL,100,0,0,NULL,NULL,NULL),(19,0,'手机分类专用',0,100,'100.00',1,'1000.00','2018-11-09 00:00:00','2018-11-17 00:00:00',1,'手机分类专用',100,0,0,NULL,NULL,NULL),(20,0,'小米手机专用',0,100,'200.00',1,'1000.00','2018-11-09 00:00:00','2018-11-24 00:00:00',2,'小米手机专用',100,0,0,NULL,NULL,NULL),(21,0,'xxx',0,100,'10.00',1,'100.00','2018-11-09 00:00:00','2018-11-30 00:00:00',2,NULL,100,0,0,NULL,NULL,NULL);

/*Table structure for table `sms_coupon_history` */

DROP TABLE IF EXISTS `sms_coupon_history`;

CREATE TABLE `sms_coupon_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(64) DEFAULT NULL,
  `member_nickname` varchar(64) DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(1) DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime DEFAULT NULL,
  `use_status` int(1) DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `idx_coupon_id` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='优惠券使用、领取历史表';

/*Data for the table `sms_coupon_history` */

insert  into `sms_coupon_history`(`id`,`coupon_id`,`member_id`,`coupon_code`,`member_nickname`,`get_type`,`create_time`,`use_status`,`use_time`,`order_id`,`order_sn`) values (2,2,1,'4931048380330002','windir',1,'2018-08-29 14:04:12',0,'2019-03-21 15:03:40',12,'201809150101000001'),(3,3,1,'4931048380330003','windir',1,'2018-08-29 14:04:29',0,NULL,NULL,NULL),(4,4,1,'4931048380330004','windir',1,'2018-08-29 14:04:32',0,NULL,NULL,NULL),(11,7,1,'4931048380330001','windir',1,'2018-09-04 16:21:50',0,NULL,NULL,NULL),(12,2,4,'0340981248320004','zhensan',1,'2018-11-12 14:16:50',0,NULL,NULL,NULL),(13,3,4,'0342977234360004','zhensan',1,'2018-11-12 14:17:10',0,NULL,NULL,NULL),(14,4,4,'0343342928830004','zhensan',1,'2018-11-12 14:17:13',0,NULL,NULL,NULL),(15,2,5,'0351883832180005','lisi',1,'2018-11-12 14:18:39',0,NULL,NULL,NULL),(16,3,5,'0352201672680005','lisi',1,'2018-11-12 14:18:42',0,NULL,NULL,NULL),(17,4,5,'0352505810180005','lisi',1,'2018-11-12 14:18:45',0,NULL,NULL,NULL),(18,2,6,'0356114588380006','wangwu',1,'2018-11-12 14:19:21',0,NULL,NULL,NULL),(19,3,6,'0356382856920006','wangwu',1,'2018-11-12 14:19:24',0,NULL,NULL,NULL),(20,4,6,'0356656798470006','wangwu',1,'2018-11-12 14:19:27',0,NULL,NULL,NULL),(21,2,3,'0363644984620003','windy',1,'2018-11-12 14:20:36',0,NULL,NULL,NULL),(22,3,3,'0363932820300003','windy',1,'2018-11-12 14:20:39',0,NULL,NULL,NULL),(23,4,3,'0364238275840003','windy',1,'2018-11-12 14:20:42',0,NULL,NULL,NULL),(24,2,7,'0385034833070007','lion',1,'2018-11-12 14:24:10',0,NULL,NULL,NULL),(25,3,7,'0385350208650007','lion',1,'2018-11-12 14:24:13',0,NULL,NULL,NULL),(26,4,7,'0385632733900007','lion',1,'2018-11-12 14:24:16',0,NULL,NULL,NULL),(27,2,8,'0388779132990008','shari',1,'2018-11-12 14:24:48',0,NULL,NULL,NULL),(28,3,8,'0388943658810008','shari',1,'2018-11-12 14:24:49',0,NULL,NULL,NULL),(29,4,8,'0389069398320008','shari',1,'2018-11-12 14:24:51',0,NULL,NULL,NULL),(30,2,9,'0390753935250009','aewen',1,'2018-11-12 14:25:08',0,NULL,NULL,NULL),(31,3,9,'0390882954470009','aewen',1,'2018-11-12 14:25:09',0,NULL,NULL,NULL),(32,4,9,'0391025542810009','aewen',1,'2018-11-12 14:25:10',0,NULL,NULL,NULL);

/*Table structure for table `sms_coupon_product_category_relation` */

DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;

CREATE TABLE `sms_coupon_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_category_name` varchar(200) DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优惠券和产品分类关系表';

/*Data for the table `sms_coupon_product_category_relation` */

insert  into `sms_coupon_product_category_relation`(`id`,`coupon_id`,`product_category_id`,`product_category_name`,`parent_category_name`) values (4,19,30,'手机配件','手机数码');

/*Table structure for table `sms_coupon_product_relation` */

DROP TABLE IF EXISTS `sms_coupon_product_relation`;

CREATE TABLE `sms_coupon_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='优惠券和产品的关系表';

/*Data for the table `sms_coupon_product_relation` */

insert  into `sms_coupon_product_relation`(`id`,`coupon_id`,`product_id`,`product_name`,`product_sn`) values (9,21,33,'小米（MI）小米电视4A ','4609652');

/*Table structure for table `sms_flash_promotion` */

DROP TABLE IF EXISTS `sms_flash_promotion`;

CREATE TABLE `sms_flash_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `status` int(1) DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='限时购表';

/*Data for the table `sms_flash_promotion` */

insert  into `sms_flash_promotion`(`id`,`title`,`start_date`,`end_date`,`status`,`create_time`) values (2,'春季家电家具疯狂秒杀1','2019-01-28','2019-01-15',0,'2018-11-16 11:12:13'),(3,'前端测试专用活动','2018-11-03','2019-02-28',1,'2018-11-16 11:11:31'),(4,'春季家电家具疯狂秒杀3','2018-11-24','2018-11-25',0,'2018-11-16 11:12:19'),(5,'春季家电家具疯狂秒杀4','2018-11-16','2018-11-16',0,'2018-11-16 11:12:24'),(6,'春季家电家具疯狂秒杀5','2018-11-16','2018-11-16',0,'2018-11-16 11:12:31'),(7,'春季家电家具疯狂秒杀6','2018-11-16','2018-11-16',0,'2018-11-16 11:12:35'),(8,'春季家电家具疯狂秒杀7','2018-11-16','2018-11-16',0,'2018-11-16 11:12:39'),(9,'春季家电家具疯狂秒杀8','2018-11-16','2018-11-16',0,'2018-11-16 11:12:42'),(13,'测试','2018-11-01','2018-11-30',0,'2018-11-19 10:34:24');

/*Table structure for table `sms_flash_promotion_log` */

DROP TABLE IF EXISTS `sms_flash_promotion_log`;

CREATE TABLE `sms_flash_promotion_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `member_phone` varchar(64) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `subscribe_time` datetime DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时购通知记录';

/*Data for the table `sms_flash_promotion_log` */

/*Table structure for table `sms_flash_promotion_product_relation` */

DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;

CREATE TABLE `sms_flash_promotion_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(20) DEFAULT NULL,
  `flash_promotion_session_id` bigint(20) DEFAULT NULL COMMENT '编号',
  `product_id` bigint(20) DEFAULT NULL,
  `flash_promotion_price` decimal(10,2) DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(11) DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(11) DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='商品限时购与商品关系表';

/*Data for the table `sms_flash_promotion_product_relation` */

insert  into `sms_flash_promotion_product_relation`(`id`,`flash_promotion_id`,`flash_promotion_session_id`,`product_id`,`flash_promotion_price`,`flash_promotion_count`,`flash_promotion_limit`,`sort`) values (1,2,1,26,'3000.00',10,1,0),(2,2,1,27,'2000.00',10,1,20),(3,2,1,28,'599.00',19,1,0),(4,2,1,29,'4999.00',10,1,100),(9,2,2,26,'2999.00',100,1,0),(10,2,2,27,NULL,NULL,NULL,NULL),(11,2,2,28,NULL,NULL,NULL,NULL),(12,2,2,29,NULL,NULL,NULL,NULL),(13,2,2,30,NULL,NULL,NULL,NULL),(14,2,3,31,NULL,NULL,NULL,NULL),(15,2,3,32,NULL,NULL,NULL,NULL),(16,2,4,33,NULL,NULL,NULL,NULL),(17,2,4,34,NULL,NULL,NULL,NULL),(18,2,5,36,NULL,NULL,NULL,NULL),(19,2,6,33,NULL,NULL,NULL,NULL),(20,2,6,34,NULL,NULL,NULL,NULL),(21,3,1,26,'3000.00',100,1,NULL),(22,3,1,27,'1999.00',10,1,NULL),(23,3,1,28,'599.00',10,1,NULL),(24,3,1,29,'4999.00',10,1,NULL),(25,3,2,31,'90.00',10,1,NULL),(26,3,2,32,'60.00',10,1,NULL),(27,3,2,33,'2299.00',10,1,NULL),(28,3,2,34,'3888.00',10,1,NULL),(29,3,3,36,NULL,NULL,NULL,NULL),(30,3,3,35,NULL,NULL,NULL,NULL),(31,3,3,31,NULL,NULL,NULL,NULL),(32,3,3,32,NULL,NULL,NULL,NULL),(33,3,4,26,NULL,NULL,NULL,NULL),(34,3,4,27,NULL,NULL,NULL,NULL),(35,3,4,28,NULL,NULL,NULL,NULL),(36,3,4,29,NULL,NULL,NULL,NULL),(37,3,5,26,'3688.00',100,1,NULL),(38,3,5,27,'2599.00',10,1,NULL),(39,3,5,28,'599.00',10,1,NULL),(40,3,5,29,'4999.00',10,1,NULL),(41,3,6,26,NULL,NULL,NULL,NULL),(42,3,6,27,NULL,NULL,NULL,NULL),(43,3,6,28,NULL,NULL,NULL,NULL),(44,3,6,29,NULL,NULL,NULL,NULL);

/*Table structure for table `sms_flash_promotion_session` */

DROP TABLE IF EXISTS `sms_flash_promotion_session`;

CREATE TABLE `sms_flash_promotion_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '场次名称',
  `start_time` time DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time DEFAULT NULL COMMENT '每日结束时间',
  `status` int(1) DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='限时购场次表';

/*Data for the table `sms_flash_promotion_session` */

insert  into `sms_flash_promotion_session`(`id`,`name`,`start_time`,`end_time`,`status`,`create_time`) values (1,'8:00','08:00:00','10:00:33',1,'2018-11-16 13:22:17'),(2,'10:00','10:00:00','12:00:00',1,'2018-11-16 13:22:34'),(3,'12:00','12:00:00','14:00:00',1,'2018-11-16 13:22:37'),(4,'14:00','14:00:00','16:00:00',1,'2018-11-16 13:22:41'),(5,'16:00','16:00:00','18:00:00',1,'2018-11-16 13:22:45'),(6,'18:00','18:00:00','20:00:00',1,'2018-11-16 13:21:34'),(7,'20:00','20:00:33','21:00:33',0,'2018-11-16 13:22:55');

/*Table structure for table `sms_home_advertise` */

DROP TABLE IF EXISTS `sms_home_advertise`;

CREATE TABLE `sms_home_advertise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='首页轮播广告表';

/*Data for the table `sms_home_advertise` */

insert  into `sms_home_advertise`(`id`,`name`,`type`,`pic`,`start_time`,`end_time`,`status`,`click_count`,`order_count`,`url`,`note`,`sort`) values (2,'夏季大热促销',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','2018-11-01 14:01:37','2018-11-15 14:01:37',0,0,0,NULL,'夏季大热促销',0),(3,'夏季大热促销1',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','2018-11-13 14:01:37','2018-11-13 14:01:37',0,0,0,NULL,'夏季大热促销1',0),(4,'夏季大热促销2',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','2018-11-13 14:01:37','2018-11-13 14:01:37',1,0,0,NULL,'夏季大热促销2',0),(9,'电影推荐广告',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg','2018-11-01 00:00:00','2018-11-24 00:00:00',1,0,0,'www.baidu.com','电影推荐广告',100),(10,'汽车促销广告',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg','2018-11-13 00:00:00','2018-11-24 00:00:00',1,0,0,'xxx',NULL,99),(11,'汽车推荐广告',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg','2018-11-13 00:00:00','2018-11-30 00:00:00',1,0,0,'xxx',NULL,98);

/*Table structure for table `sms_home_brand` */

DROP TABLE IF EXISTS `sms_home_brand`;

CREATE TABLE `sms_home_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `brand_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='首页推荐品牌表';

/*Data for the table `sms_home_brand` */

insert  into `sms_home_brand`(`id`,`brand_id`,`brand_name`,`recommend_status`,`sort`) values (1,1,'万和',1,200),(2,2,'三星',1,0),(6,6,'小米',1,300),(8,5,'方太',1,100),(32,50,'海澜之家',1,0),(33,51,'苹果',1,0),(35,3,'华为',1,0),(36,4,'格力',1,0),(37,5,'方太',1,0),(38,1,'万和',1,0),(39,21,'OPPO',1,0);

/*Table structure for table `sms_home_new_product` */

DROP TABLE IF EXISTS `sms_home_new_product`;

CREATE TABLE `sms_home_new_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='新鲜好物表';

/*Data for the table `sms_home_new_product` */

insert  into `sms_home_new_product`(`id`,`product_id`,`product_name`,`recommend_status`,`sort`) values (2,27,'小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待',1,200),(8,26,'华为 HUAWEI P20 ',1,0),(9,27,'小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待',1,0),(10,28,'小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待',1,0),(11,29,'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机',1,0),(12,30,'HLA海澜之家简约动物印花短袖T恤',1,0);

/*Table structure for table `sms_home_recommend_product` */

DROP TABLE IF EXISTS `sms_home_recommend_product`;

CREATE TABLE `sms_home_recommend_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='人气推荐商品表';

/*Data for the table `sms_home_recommend_product` */

insert  into `sms_home_recommend_product`(`id`,`product_id`,`product_name`,`recommend_status`,`sort`) values (3,26,'华为 HUAWEI P20 ',1,0),(4,27,'小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待',1,0),(5,28,'小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待',1,0),(6,29,'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机',1,0),(7,30,'HLA海澜之家简约动物印花短袖T恤',1,100);

/*Table structure for table `sms_home_recommend_subject` */

DROP TABLE IF EXISTS `sms_home_recommend_subject`;

CREATE TABLE `sms_home_recommend_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='首页推荐专题表';

/*Data for the table `sms_home_recommend_subject` */

insert  into `sms_home_recommend_subject`(`id`,`subject_id`,`subject_name`,`recommend_status`,`sort`) values (14,1,'polo衬衫的也时尚',1,0),(15,2,'大牌手机低价秒',1,0),(16,3,'晓龙845新品上市',1,0),(17,4,'夏天应该穿什么',1,0),(18,5,'夏季精选',1,100),(19,6,'品牌手机降价',1,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`username`,`operation`,`method`,`params`,`time`,`ip`,`create_date`) values (1,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','{\"menuId\":41,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"首页内容管理\",\"url\":\"/test\",\"type\":1,\"icon\":\"fa-eraser\",\"orderNum\":0}',9,'0:0:0:0:0:0:0:1','2019-04-11 09:07:48'),(2,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":41,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"首页内容管理\",\"url\":\"/test\",\"type\":0,\"icon\":\"fa fa-eraser\",\"orderNum\":0}',64,'0:0:0:0:0:0:0:1','2019-04-11 09:09:43'),(3,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','{\"menuId\":42,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"轮播图设置\",\"url\":\"/test\",\"type\":1,\"orderNum\":0}',29,'0:0:0:0:0:0:0:1','2019-04-11 09:11:35'),(4,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','{\"menuId\":43,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"nav导航设置\",\"url\":\"/test\",\"type\":1,\"orderNum\":0}',42,'0:0:0:0:0:0:0:1','2019-04-11 09:12:07'),(5,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','{\"menuId\":44,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"新闻设置\",\"url\":\"sys/news/list\",\"type\":1,\"orderNum\":0}',31,'0:0:0:0:0:0:0:1','2019-04-12 10:44:12'),(6,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":44,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"新闻设置\",\"url\":\"modules/tbsys/news\",\"type\":1,\"orderNum\":0}',77,'0:0:0:0:0:0:0:1','2019-04-12 10:46:30'),(7,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":44,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"新闻设置\",\"url\":\"modules/tbsys/news.html\",\"type\":1,\"orderNum\":0}',12,'0:0:0:0:0:0:0:1','2019-04-12 10:47:01'),(8,'admin','保存角色','io.renren.modules.sys.controller.SysRoleController.save()','{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"最高权限\",\"deptId\":1,\"deptName\":\"人人开源集团\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Apr 12, 2019 10:49:21 AM\"}',257,'0:0:0:0:0:0:0:1','2019-04-12 10:49:21'),(9,'admin','修改用户','io.renren.modules.sys.controller.SysUserController.update()','{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}',133,'0:0:0:0:0:0:0:1','2019-04-12 10:50:30'),(10,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":42,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"轮播图设置\",\"url\":\"modules/tbsys/nav.html\",\"type\":1,\"orderNum\":0}',16,'0:0:0:0:0:0:0:1','2019-04-12 11:05:48'),(11,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":42,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"轮播图设置\",\"url\":\"modules/tbsys/banner.html\",\"type\":1,\"orderNum\":0}',13,'0:0:0:0:0:0:0:1','2019-04-12 11:06:00'),(12,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":43,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"nav导航设置\",\"url\":\"modules/tbsys/nav.html\",\"type\":1,\"orderNum\":0}',23,'0:0:0:0:0:0:0:1','2019-04-12 11:06:11'),(13,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','{\"menuId\":45,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商品管理\",\"type\":0,\"orderNum\":0}',73,'0:0:0:0:0:0:0:1','2019-04-12 11:11:34'),(14,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":46,\"parentId\":45,\"parentName\":\"商品管理\",\"name\":\"商品管理\",\"url\":\"modules/goods/goods.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}',97,'0:0:0:0:0:0:0:1','2019-04-12 11:32:47'),(15,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":61,\"parentId\":45,\"parentName\":\"商品管理\",\"name\":\"商品属性值\",\"url\":\"modules/goods/goodspropsvalue.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}',35,'0:0:0:0:0:0:0:1','2019-04-12 11:33:08'),(16,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','71',91,'0:0:0:0:0:0:0:1','2019-04-12 11:36:50'),(17,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','44',15,'0:0:0:0:0:0:0:1','2019-04-12 11:40:47'),(18,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','43',56,'0:0:0:0:0:0:0:1','2019-04-12 11:49:16'),(19,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":81,\"parentId\":41,\"parentName\":\"首页内容管理\",\"name\":\"nav导航\",\"url\":\"modules/tbsys/nav.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}',19,'0:0:0:0:0:0:0:1','2019-04-12 11:49:33'),(20,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','{\"menuId\":86,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户管理\",\"type\":0,\"icon\":\"fa fa-user\",\"orderNum\":0}',28,'0:0:0:0:0:0:0:1','2019-04-18 15:47:52'),(21,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','{\"menuId\":87,\"parentId\":86,\"parentName\":\"用户管理\",\"name\":\"用户列表\",\"url\":\"/ttt\",\"type\":1,\"orderNum\":0}',64,'0:0:0:0:0:0:0:1','2019-04-18 15:49:51'),(22,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":45,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商品管理\",\"type\":0,\"icon\":\"fa fa-cubes\",\"orderNum\":0}',16,'0:0:0:0:0:0:0:1','2019-04-18 15:50:57'),(23,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','87',67,'0:0:0:0:0:0:0:1','2019-04-18 16:12:51'),(24,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','{\"menuId\":88,\"parentId\":86,\"parentName\":\"用户管理\",\"name\":\"用户列表\",\"url\":\"modules/member/user.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}',75,'0:0:0:0:0:0:0:1','2019-04-18 16:16:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values (1,0,'系统管理',NULL,NULL,0,'fa fa-cog',0),(2,1,'管理员管理','modules/sys/user.html',NULL,1,'fa fa-user',1),(3,1,'角色管理','modules/sys/role.html',NULL,1,'fa fa-user-secret',2),(4,1,'菜单管理','modules/sys/menu.html',NULL,1,'fa fa-th-list',3),(5,1,'SQL监控','druid/sql.html',NULL,1,'fa fa-bug',4),(6,1,'定时任务','modules/job/schedule.html',NULL,1,'fa fa-tasks',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:perms',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:perms',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','modules/sys/config.html','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'fa fa-sun-o',6),(29,1,'系统日志','modules/sys/log.html','sys:log:list',1,'fa fa-file-text-o',7),(30,1,'文件上传','modules/oss/oss.html','sys:oss:all',1,'fa fa-file-image-o',6),(31,1,'部门管理','modules/sys/dept.html',NULL,1,'fa fa-file-code-o',1),(32,31,'查看',NULL,'sys:dept:list,sys:dept:info',2,NULL,0),(33,31,'新增',NULL,'sys:dept:save,sys:dept:select',2,NULL,0),(34,31,'修改',NULL,'sys:dept:update,sys:dept:select',2,NULL,0),(35,31,'删除',NULL,'sys:dept:delete',2,NULL,0),(36,1,'字典管理','modules/sys/dict.html',NULL,1,'fa fa-bookmark-o',6),(37,36,'查看',NULL,'sys:dict:list,sys:dict:info',2,NULL,6),(38,36,'新增',NULL,'sys:dict:save',2,NULL,6),(39,36,'修改',NULL,'sys:dict:update',2,NULL,6),(40,36,'删除',NULL,'sys:dict:delete',2,NULL,6),(41,0,'首页内容管理','/test',NULL,0,'fa fa-eraser',0),(42,41,'轮播图设置','modules/tbsys/banner.html',NULL,1,NULL,0),(45,0,'商品管理',NULL,NULL,0,'fa fa-cubes',0),(46,45,'商品管理','modules/goods/goods.html',NULL,1,'fa fa-file-code-o',6),(47,46,'查看',NULL,'goods:goods:list,goods:goods:info',2,NULL,6),(48,46,'新增',NULL,'goods:goods:save',2,NULL,6),(49,46,'修改',NULL,'goods:goods:update',2,NULL,6),(50,46,'删除',NULL,'goods:goods:delete',2,NULL,6),(51,45,'打包品表','modules/goods/goodspackage.html',NULL,1,'fa fa-file-code-o',6),(52,45,'查看',NULL,'goods:goodspackage:list,goods:goodspackage:info',2,NULL,6),(53,45,'新增',NULL,'goods:goodspackage:save',2,NULL,6),(54,45,'修改',NULL,'goods:goodspackage:update',2,NULL,6),(55,45,'删除',NULL,'goods:goodspackage:delete',2,NULL,6),(56,45,'属性名','modules/goods/goodspropskey.html',NULL,1,'fa fa-file-code-o',6),(57,45,'查看',NULL,'goods:goodspropskey:list,goods:goodspropskey:info',2,NULL,6),(58,45,'新增',NULL,'goods:goodspropskey:save',2,NULL,6),(59,45,'修改',NULL,'goods:goodspropskey:update',2,NULL,6),(60,45,'删除',NULL,'goods:goodspropskey:delete',2,NULL,6),(61,45,'商品属性值','modules/goods/goodspropsvalue.html',NULL,1,'fa fa-file-code-o',6),(62,45,'查看',NULL,'goods:goodspropsvalue:list,goods:goodspropsvalue:info',2,NULL,6),(63,45,'新增',NULL,'goods:goodspropsvalue:save',2,NULL,6),(64,45,'修改',NULL,'goods:goodspropsvalue:update',2,NULL,6),(65,45,'删除',NULL,'goods:goodspropsvalue:delete',2,NULL,6),(66,45,'sku表','modules/goods/goodssku.html',NULL,1,'fa fa-file-code-o',6),(67,45,'查看',NULL,'goods:goodssku:list,goods:goodssku:info',2,NULL,6),(68,45,'新增',NULL,'goods:goodssku:save',2,NULL,6),(69,45,'修改',NULL,'goods:goodssku:update',2,NULL,6),(70,45,'删除',NULL,'goods:goodssku:delete',2,NULL,6),(72,41,'查看',NULL,'tbsys:banner:list,tbsys:banner:info',2,NULL,6),(73,41,'新增',NULL,'tbsys:banner:save',2,NULL,6),(74,41,'修改',NULL,'tbsys:banner:update',2,NULL,6),(75,41,'删除',NULL,'tbsys:banner:delete',2,NULL,6),(76,41,'淘宝新闻','modules/tbsys/news.html',NULL,1,'fa fa-file-code-o',6),(77,41,'查看',NULL,'tbsys:news:list,tbsys:news:info',2,NULL,6),(78,41,'新增',NULL,'tbsys:news:save',2,NULL,6),(79,41,'修改',NULL,'tbsys:news:update',2,NULL,6),(80,41,'删除',NULL,'tbsys:news:delete',2,NULL,6),(81,41,'nav导航','modules/tbsys/nav.html',NULL,1,'fa fa-file-code-o',6),(82,41,'查看',NULL,'tbsys:nav:list,tbsys:nav:info',2,NULL,6),(83,41,'新增',NULL,'tbsys:nav:save',2,NULL,6),(84,41,'修改',NULL,'tbsys:nav:update',2,NULL,6),(85,41,'删除',NULL,'tbsys:nav:delete',2,NULL,6),(86,0,'用户管理',NULL,NULL,0,'fa fa-user',0),(88,86,'用户列表','modules/member/user.html',NULL,1,'fa fa-file-code-o',6),(89,86,'查看',NULL,'member:user:list,member:user:info',2,NULL,6),(90,86,'新增',NULL,'member:user:save',2,NULL,6),(91,86,'修改',NULL,'member:user:update',2,NULL,6),(92,86,'删除',NULL,'member:user:delete',2,NULL,6);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`remark`,`dept_id`,`create_time`) values (1,'admin','最高权限',1,'2019-04-12 10:49:21');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`id`,`role_id`,`dept_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (1,1,1),(2,1,2),(3,1,15),(4,1,16),(5,1,17),(6,1,18),(7,1,3),(8,1,19),(9,1,20),(10,1,21),(11,1,22),(12,1,4),(13,1,23),(14,1,24),(15,1,25),(16,1,26),(17,1,5),(18,1,6),(19,1,7),(20,1,8),(21,1,9),(22,1,10),(23,1,11),(24,1,12),(25,1,13),(26,1,14),(27,1,27),(28,1,29),(29,1,30),(30,1,31),(31,1,32),(32,1,33),(33,1,34),(34,1,35),(35,1,36),(36,1,37),(37,1,38),(38,1,39),(39,1,40),(40,1,41),(41,1,42);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (1,1,1);

/*Table structure for table `tb_ads_category` */

DROP TABLE IF EXISTS `tb_ads_category`;

CREATE TABLE `tb_ads_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ads_title` varchar(100) DEFAULT NULL COMMENT '广告标题',
  `ads_img` varchar(255) DEFAULT NULL COMMENT '广告图片',
  `ads_url` varchar(255) DEFAULT NULL COMMENT '广告链接',
  `ads_desc` varchar(100) DEFAULT NULL COMMENT '广告描述',
  `order_num` int(11) DEFAULT '0' COMMENT '排序标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_ads_category` */

insert  into `tb_ads_category`(`id`,`ads_title`,`ads_img`,`ads_url`,`ads_desc`,`order_num`) values (1,'潮流酷玩','https://gw.alicdn.com/tfs/TB1dgbkQFXXXXaMaXXXXXXXXXXX-1125-87.png_.webp',NULL,'8月国内最火的手机，这几款值得一看！',0),(2,'买遍全球','https://gw.alicdn.com/tfs/TB1R07AQVXXXXcEXpXXXXXXXXXX-1125-87.png?getAvatar=1_.webp',NULL,'吃完必吮指的人气威化评测！',0),(3,'我淘我家','https://gw.alicdn.com/tfs/TB1EVHdQFXXXXbIaXXXXXXXXXXX-1125-87.png_.webp',NULL,'分娩前应该多吃的助产食物',0),(4,'时尚大咖','https://gw.alicdn.com/tfs/TB1Q6V8i22H8KJjy0FcXXaDlFXa-1125-87.png_.webp',NULL,'淘依时尚，收腰设计，显瘦效果',0);

/*Table structure for table `tb_ads_goods` */

DROP TABLE IF EXISTS `tb_ads_goods`;

CREATE TABLE `tb_ads_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `category_id` int(11) DEFAULT NULL COMMENT '广告类型Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_ads_goods` */

/*Table structure for table `tb_area` */

DROP TABLE IF EXISTS `tb_area`;

CREATE TABLE `tb_area` (
  `codeid` int(12) DEFAULT NULL,
  `parentid` int(12) DEFAULT NULL,
  `cityName` varchar(180) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区信息';

/*Data for the table `tb_area` */

insert  into `tb_area`(`codeid`,`parentid`,`cityName`) values (11,0,'北京'),(1101,11,'北京市辖'),(110101,1101,'东城区'),(110102,1101,'西城区'),(110103,1101,'崇文区'),(110104,1101,'宣武区'),(110105,1101,'朝阳区'),(110106,1101,'丰台区'),(110107,1101,'石景山区'),(110108,1101,'海淀区'),(110109,1101,'门头沟区'),(110111,1101,'房山区'),(110112,1101,'通州区'),(110113,1101,'顺义区'),(110114,1101,'昌平区'),(1102,11,'北京县辖'),(110224,1102,'大兴县'),(110226,1102,'平谷县'),(110227,1102,'怀柔县'),(110228,1102,'密云县'),(110229,1102,'延庆县'),(12,0,'天津'),(1201,12,'天津市辖'),(120101,1201,'和平区'),(120102,1201,'河东区'),(120103,1201,'河西区'),(120104,1201,'南开区'),(120105,1201,'河北区'),(120106,1201,'红桥区'),(120107,1201,'塘沽区'),(120108,1201,'汉沽区'),(120109,1201,'大港区'),(120110,1201,'东丽区'),(120111,1201,'西青区'),(120112,1201,'津南区'),(120113,1201,'北辰区'),(120114,1201,'武清区'),(1202,12,'天津县辖'),(120221,1202,'宁河县'),(120223,1202,'静海县'),(120224,1202,'宝坻县'),(120225,1202,'蓟  县'),(13,0,'河北'),(1301,13,'石家庄'),(130101,1301,'市辖区'),(130102,1301,'长安区'),(130103,1301,'桥东区'),(130104,1301,'桥西区'),(130105,1301,'新华区'),(130106,1301,'郊  区'),(130107,1301,'井陉矿区'),(130121,1301,'井陉县'),(130123,1301,'正定县'),(130124,1301,'栾城县'),(130125,1301,'行唐县'),(130126,1301,'灵寿县'),(130127,1301,'高邑县'),(130128,1301,'深泽县'),(130129,1301,'赞皇县'),(130130,1301,'无极县'),(130131,1301,'平山县'),(130132,1301,'元氏县'),(130133,1301,'赵  县'),(130181,1301,'辛集市'),(130182,1301,'藁城市'),(130183,1301,'晋州市'),(130184,1301,'新乐市'),(130185,1301,'鹿泉市'),(1302,13,'唐山'),(130201,1302,'市辖区'),(130202,1302,'路南区'),(130203,1302,'路北区'),(130204,1302,'古冶区'),(130205,1302,'开平区'),(130206,1302,'新  区'),(130221,1302,'丰润县'),(130223,1302,'滦  县'),(130224,1302,'滦南县'),(130225,1302,'乐亭县'),(130227,1302,'迁西县'),(130229,1302,'玉田县'),(130230,1302,'唐海县'),(130281,1302,'遵化市'),(130282,1302,'丰南市'),(130283,1302,'迁安市'),(1303,13,'秦皇岛'),(130301,1303,'市辖区'),(130302,1303,'海港区'),(130303,1303,'山海关区'),(130304,1303,'北戴河区'),(130321,1303,'青龙满族自治县'),(130322,1303,'昌黎县'),(130323,1303,'抚宁县'),(130324,1303,'卢龙县'),(1304,13,'邯郸'),(130401,1304,'市辖区'),(130402,1304,'邯山区'),(130403,1304,'丛台区'),(130404,1304,'复兴区'),(130406,1304,'峰峰矿区'),(130421,1304,'邯郸县'),(130423,1304,'临漳县'),(130424,1304,'成安县'),(130425,1304,'大名县'),(130426,1304,'涉  县'),(130427,1304,'磁  县'),(130428,1304,'肥乡县'),(130429,1304,'永年县'),(130430,1304,'邱  县'),(130431,1304,'鸡泽县'),(130432,1304,'广平县'),(130433,1304,'馆陶县'),(130434,1304,'魏  县'),(130435,1304,'曲周县'),(130481,1304,'武安市'),(1305,13,'邢台'),(130501,1305,'市辖区'),(130502,1305,'桥东区'),(130503,1305,'桥西区'),(130521,1305,'邢台县'),(130522,1305,'临城县'),(130523,1305,'内丘县'),(130524,1305,'柏乡县'),(130525,1305,'隆尧县'),(130526,1305,'任  县'),(130527,1305,'南和县'),(130528,1305,'宁晋县'),(130529,1305,'巨鹿县'),(130530,1305,'新河县'),(130531,1305,'广宗县'),(130532,1305,'平乡县'),(130533,1305,'威  县'),(130534,1305,'清河县'),(130535,1305,'临西县'),(130581,1305,'南宫市'),(130582,1305,'沙河市'),(1306,13,'保定'),(130601,1306,'市辖区'),(130602,1306,'新市区'),(130603,1306,'北市区'),(130604,1306,'南市区'),(130621,1306,'满城县'),(130622,1306,'清苑县'),(130623,1306,'涞水县'),(130624,1306,'阜平县'),(130625,1306,'徐水县'),(130626,1306,'定兴县'),(130627,1306,'唐  县'),(130628,1306,'高阳县'),(130629,1306,'容城县'),(130630,1306,'涞源县'),(130631,1306,'望都县'),(130632,1306,'安新县'),(130633,1306,'易  县'),(130634,1306,'曲阳县'),(130635,1306,'蠡  县'),(130636,1306,'顺平县'),(130637,1306,'博野县'),(130638,1306,'雄  县'),(130681,1306,'涿州市'),(130682,1306,'定州市'),(130683,1306,'安国市'),(130684,1306,'高碑店市'),(1307,13,'张家口'),(130701,1307,'市辖区'),(130702,1307,'桥东区'),(130703,1307,'桥西区'),(130705,1307,'宣化区'),(130706,1307,'下花园区'),(130721,1307,'宣化县'),(130722,1307,'张北县'),(130723,1307,'康保县'),(130724,1307,'沽源县'),(130725,1307,'尚义县'),(130726,1307,'蔚  县'),(130727,1307,'阳原县'),(130728,1307,'怀安县'),(130729,1307,'万全县'),(130730,1307,'怀来县'),(130731,1307,'涿鹿县'),(130732,1307,'赤城县'),(130733,1307,'崇礼县'),(1308,13,'承德'),(130801,1308,'市辖区'),(130802,1308,'双桥区'),(130803,1308,'双滦区'),(130804,1308,'鹰手营子矿区'),(130821,1308,'承德县'),(130822,1308,'兴隆县'),(130823,1308,'平泉县'),(130824,1308,'滦平县'),(130825,1308,'隆化县'),(130826,1308,'丰宁满族自治县'),(130827,1308,'宽城满族自治县'),(130828,1308,'围场满族蒙古族自治县'),(1309,13,'沧州'),(130901,1309,'市辖区'),(130902,1309,'新华区'),(130903,1309,'运河区'),(130921,1309,'沧  县'),(130922,1309,'青  县'),(130923,1309,'东光县'),(130924,1309,'海兴县'),(130925,1309,'盐山县'),(130926,1309,'肃宁县'),(130927,1309,'南皮县'),(130928,1309,'吴桥县'),(130929,1309,'献  县'),(130930,1309,'孟村回族自治县'),(130981,1309,'泊头市'),(130982,1309,'任丘市'),(130983,1309,'黄骅市'),(130984,1309,'河间市'),(1310,13,'廊坊'),(131001,1310,'市辖区'),(131002,1310,'安次区'),(131003,1310,'廊坊市广阳区'),(131022,1310,'固安县'),(131023,1310,'永清县'),(131024,1310,'香河县'),(131025,1310,'大城县'),(131026,1310,'文安县'),(131028,1310,'大厂回族自治县'),(131081,1310,'霸州市'),(131082,1310,'三河市'),(1311,13,'衡水'),(131101,1311,'市辖区'),(131102,1311,'桃城区'),(131121,1311,'枣强县'),(131122,1311,'武邑县'),(131123,1311,'武强县'),(131124,1311,'饶阳县'),(131125,1311,'安平县'),(131126,1311,'故城县'),(131127,1311,'景  县'),(131128,1311,'阜城县'),(131181,1311,'冀州市'),(131182,1311,'深州市'),(14,0,'山西'),(1401,14,'太原'),(140101,1401,'市辖区'),(140105,1401,'小店区'),(140106,1401,'迎泽区'),(140107,1401,'杏花岭区'),(140108,1401,'尖草坪区'),(140109,1401,'万柏林区'),(140110,1401,'晋源区'),(140121,1401,'清徐县'),(140122,1401,'阳曲县'),(140123,1401,'娄烦县'),(140181,1401,'古交市'),(1402,14,'大同'),(140201,1402,'市辖区'),(140202,1402,'城  区'),(140203,1402,'矿  区'),(140211,1402,'南郊区'),(140212,1402,'新荣区'),(140221,1402,'阳高县'),(140222,1402,'天镇县'),(140223,1402,'广灵县'),(140224,1402,'灵丘县'),(140225,1402,'浑源县'),(140226,1402,'左云县'),(140227,1402,'大同县'),(1403,14,'阳泉'),(140301,1403,'市辖区'),(140302,1403,'城  区'),(140303,1403,'矿  区'),(140311,1403,'郊  区'),(140321,1403,'平定县'),(140322,1403,'盂  县'),(1404,14,'长治'),(140401,1404,'市辖区'),(140402,1404,'城  区'),(140411,1404,'郊  区'),(140421,1404,'长治县'),(140423,1404,'襄垣县'),(140424,1404,'屯留县'),(140425,1404,'平顺县'),(140426,1404,'黎城县'),(140427,1404,'壶关县'),(140428,1404,'长子县'),(140429,1404,'武乡县'),(140430,1404,'沁  县'),(140431,1404,'沁源县'),(140481,1404,'潞城市'),(1405,14,'晋城'),(140501,1405,'市辖区'),(140502,1405,'城  区'),(140521,1405,'沁水县'),(140522,1405,'阳城县'),(140524,1405,'陵川县'),(140525,1405,'泽州县'),(140581,1405,'高平市'),(1406,14,'朔州'),(140601,1406,'市辖区'),(140602,1406,'朔城区'),(140603,1406,'平鲁区'),(140621,1406,'山阴县'),(140622,1406,'应  县'),(140623,1406,'右玉县'),(140624,1406,'怀仁县'),(1407,14,'晋中'),(140701,1407,'市辖区'),(140702,1407,'榆次区'),(140721,1407,'榆社县'),(140722,1407,'左权县'),(140723,1407,'和顺县'),(140724,1407,'昔阳县'),(140725,1407,'寿阳县'),(140726,1407,'太谷县'),(140727,1407,'祁  县'),(140728,1407,'平遥县'),(140729,1407,'灵石县'),(140781,1407,'介休市'),(1408,14,'运城'),(140801,1408,'市辖区'),(140802,1408,'盐湖区'),(140821,1408,'临猗县'),(140822,1408,'万荣县'),(140823,1408,'闻喜县'),(140824,1408,'稷山县'),(140825,1408,'新绛县'),(140826,1408,'绛  县'),(140827,1408,'垣曲县'),(140828,1408,'夏  县'),(140829,1408,'平陆县'),(140830,1408,'芮城县'),(140881,1408,'永济市'),(140882,1408,'河津市'),(1409,14,'忻州'),(140901,1409,'市辖区'),(140902,1409,'忻府区'),(140921,1409,'定襄县'),(140922,1409,'五台县'),(140923,1409,'代  县'),(140924,1409,'繁峙县'),(140925,1409,'宁武县'),(140926,1409,'静乐县'),(140927,1409,'神池县'),(140928,1409,'五寨县'),(140929,1409,'岢岚县'),(140930,1409,'河曲县'),(140931,1409,'保德县'),(140932,1409,'偏关县'),(140981,1409,'原平市'),(1410,14,'临汾'),(141001,1410,'市辖区'),(141002,1410,'尧都区'),(141021,1410,'曲沃县'),(141022,1410,'翼城县'),(141023,1410,'襄汾县'),(141024,1410,'洪洞县'),(141025,1410,'古  县'),(141026,1410,'安泽县'),(141027,1410,'浮山县'),(141028,1410,'吉  县'),(141029,1410,'乡宁县'),(141030,1410,'大宁县'),(141031,1410,'隰  县'),(141032,1410,'永和县'),(141033,1410,'蒲  县'),(141034,1410,'汾西县'),(141081,1410,'侯马市'),(141082,1410,'霍州市'),(1423,14,'吕梁地区'),(142301,1423,'孝义市'),(142302,1423,'离石市'),(142303,1423,'汾阳市'),(142322,1423,'文水县'),(142323,1423,'交城县'),(142325,1423,'兴  县'),(142326,1423,'临  县'),(142327,1423,'柳林县'),(142328,1423,'石楼县'),(142329,1423,'岚  县'),(142330,1423,'方山县'),(142332,1423,'中阳县'),(142333,1423,'交口县'),(15,0,'内蒙古'),(1501,15,'呼和浩特'),(150101,1501,'市辖区'),(150102,1501,'新城区'),(150103,1501,'回民区'),(150104,1501,'玉泉区'),(150105,1501,'赛罕区'),(150121,1501,'土默特左旗'),(150122,1501,'托克托县'),(150123,1501,'和林格尔县'),(150124,1501,'清水河县'),(150125,1501,'武川县'),(1502,15,'包头'),(150201,1502,'市辖区'),(150202,1502,'东河区'),(150203,1502,'昆都伦区'),(150204,1502,'青山区'),(150205,1502,'石拐区'),(150206,1502,'白云矿区'),(150207,1502,'九原区'),(150221,1502,'土默特右旗'),(150222,1502,'固阳县'),(150223,1502,'达尔罕茂明安联合旗'),(1503,15,'乌海'),(150301,1503,'市辖区'),(150302,1503,'海勃湾区'),(150303,1503,'海南区'),(150304,1503,'乌达区'),(1504,15,'赤峰'),(150401,1504,'市辖区'),(150402,1504,'红山区'),(150403,1504,'元宝山区'),(150404,1504,'松山区'),(150421,1504,'阿鲁科尔沁旗'),(150422,1504,'巴林左旗'),(150423,1504,'巴林右旗'),(150424,1504,'林西县'),(150425,1504,'克什克腾旗'),(150426,1504,'翁牛特旗'),(150428,1504,'喀喇沁旗'),(150429,1504,'宁城县'),(150430,1504,'敖汉旗'),(1505,15,'通辽'),(150501,1505,'市辖区'),(150502,1505,'科尔沁区'),(150521,1505,'科尔沁左翼中旗'),(150522,1505,'科尔沁左翼后旗'),(150523,1505,'开鲁县'),(150524,1505,'库伦旗'),(150525,1505,'奈曼旗'),(150526,1505,'扎鲁特旗'),(150581,1505,'霍林郭勒市'),(1521,15,'呼伦贝尔盟'),(152101,1521,'海拉尔市'),(152102,1521,'满洲里市'),(152103,1521,'扎兰屯市'),(152104,1521,'牙克石市'),(152105,1521,'根河市'),(152106,1521,'额尔古纳市'),(152122,1521,'阿荣旗'),(152123,1521,'莫力达瓦达斡尔族自治'),(152127,1521,'鄂伦春自治旗'),(152128,1521,'鄂温克族自治旗'),(152129,1521,'新巴尔虎右旗'),(152130,1521,'新巴尔虎左旗'),(152131,1521,'陈巴尔虎旗'),(1522,15,'兴安盟'),(152201,1522,'乌兰浩特市'),(152202,1522,'阿尔山市'),(152221,1522,'科尔沁右翼前旗'),(152222,1522,'科尔沁右翼中旗'),(152223,1522,'扎赉特旗'),(152224,1522,'突泉县'),(1525,15,'锡林郭勒盟'),(152501,1525,'二连浩特市'),(152502,1525,'锡林浩特市'),(152522,1525,'阿巴嘎旗'),(152523,1525,'苏尼特左旗'),(152524,1525,'苏尼特右旗'),(152525,1525,'东乌珠穆沁旗'),(152526,1525,'西乌珠穆沁旗'),(152527,1525,'太仆寺旗'),(152528,1525,'镶黄旗'),(152529,1525,'正镶白旗'),(152530,1525,'正蓝旗'),(152531,1525,'多伦县'),(1526,15,'乌兰察布盟'),(152601,1526,'集宁市'),(152602,1526,'丰镇市'),(152624,1526,'卓资县'),(152625,1526,'化德县'),(152626,1526,'商都县'),(152627,1526,'兴和县'),(152629,1526,'凉城县'),(152630,1526,'察哈尔右翼前旗'),(152631,1526,'察哈尔右翼中旗'),(152632,1526,'察哈尔右翼后旗'),(152634,1526,'四子王旗'),(1527,15,'伊克昭盟'),(152701,1527,'东胜市'),(152722,1527,'达拉特旗'),(152723,1527,'准格尔旗'),(152724,1527,'鄂托克前旗'),(152725,1527,'鄂托克旗'),(152726,1527,'杭锦旗'),(152727,1527,'乌审旗'),(152728,1527,'伊金霍洛旗'),(1528,15,'巴彦淖尔盟'),(152801,1528,'临河市'),(152822,1528,'五原县'),(152823,1528,'磴口县'),(152824,1528,'乌拉特前旗'),(152825,1528,'乌拉特中旗'),(152826,1528,'乌拉特后旗'),(152827,1528,'杭锦后旗'),(1529,15,'阿拉善盟'),(152921,1529,'阿拉善左旗'),(152922,1529,'阿拉善右旗'),(152923,1529,'额济纳旗'),(21,0,'辽宁'),(2101,21,'沈阳'),(210101,2101,'市辖区'),(210102,2101,'和平区'),(210103,2101,'沈河区'),(210104,2101,'大东区'),(210105,2101,'皇姑区'),(210106,2101,'铁西区'),(210111,2101,'苏家屯区'),(210112,2101,'东陵区'),(210113,2101,'新城子区'),(210114,2101,'于洪区'),(210122,2101,'辽中县'),(210123,2101,'康平县'),(210124,2101,'法库县'),(210181,2101,'新民市'),(2102,21,'大连'),(210201,2102,'市辖区'),(210202,2102,'中山区'),(210203,2102,'西岗区'),(210204,2102,'沙河口区'),(210211,2102,'甘井子区'),(210212,2102,'旅顺口区'),(210213,2102,'金州区'),(210224,2102,'长海县'),(210281,2102,'瓦房店市'),(210282,2102,'普兰店市'),(210283,2102,'庄河市'),(2103,21,'鞍山'),(210301,2103,'市辖区'),(210302,2103,'铁东区'),(210303,2103,'铁西区'),(210304,2103,'立山区'),(210311,2103,'千山区'),(210321,2103,'台安县'),(210323,2103,'岫岩满族自治县'),(210381,2103,'海城市'),(2104,21,'抚顺'),(210401,2104,'市辖区'),(210402,2104,'新抚区'),(210403,2104,'东洲区'),(210404,2104,'望花区'),(210411,2104,'顺城区'),(210421,2104,'抚顺县'),(210422,2104,'新宾满族自治县'),(210423,2104,'清原满族自治县'),(2105,21,'本溪'),(210501,2105,'市辖区'),(210502,2105,'平山区'),(210503,2105,'溪湖区'),(210504,2105,'明山区'),(210505,2105,'南芬区'),(210521,2105,'本溪满族自治县'),(210522,2105,'桓仁满族自治县'),(2106,21,'丹东'),(210601,2106,'市辖区'),(210602,2106,'元宝区'),(210603,2106,'振兴区'),(210604,2106,'振安区'),(210624,2106,'宽甸满族自治县'),(210681,2106,'东港市'),(210682,2106,'凤城市'),(2107,21,'锦州'),(210701,2107,'市辖区'),(210702,2107,'古塔区'),(210703,2107,'凌河区'),(210711,2107,'太和区'),(210726,2107,'黑山县'),(210727,2107,'义  县'),(210781,2107,'凌海市'),(210782,2107,'北宁市'),(2108,21,'营口'),(210801,2108,'市辖区'),(210802,2108,'站前区'),(210803,2108,'西市区'),(210804,2108,'鲅鱼圈区'),(210811,2108,'老边区'),(210881,2108,'盖州市'),(210882,2108,'大石桥市'),(2109,21,'阜新'),(210901,2109,'市辖区'),(210902,2109,'海州区'),(210903,2109,'新邱区'),(210904,2109,'太平区'),(210905,2109,'清河门区'),(210911,2109,'细河区'),(210921,2109,'阜新蒙古族自治县'),(210922,2109,'彰武县'),(2110,21,'辽阳'),(211001,2110,'市辖区'),(211002,2110,'白塔区'),(211003,2110,'文圣区'),(211004,2110,'宏伟区'),(211005,2110,'弓长岭区'),(211011,2110,'太子河区'),(211021,2110,'辽阳县'),(211081,2110,'灯塔市'),(2111,21,'盘锦'),(211101,2111,'市辖区'),(211102,2111,'双台子区'),(211103,2111,'兴隆台区'),(211121,2111,'大洼县'),(211122,2111,'盘山县'),(2112,21,'铁岭'),(211201,2112,'市辖区'),(211202,2112,'银州区'),(211204,2112,'清河区'),(211221,2112,'铁岭县'),(211223,2112,'西丰县'),(211224,2112,'昌图县'),(211281,2112,'铁法市'),(211282,2112,'开原市'),(2113,21,'朝阳'),(211301,2113,'市辖区'),(211302,2113,'双塔区'),(211303,2113,'龙城区'),(211321,2113,'朝阳县'),(211322,2113,'建平县'),(211324,2113,'喀喇沁左翼蒙古族自治'),(211381,2113,'北票市'),(211382,2113,'凌源市'),(2114,21,'葫芦岛'),(211401,2114,'市辖区'),(211402,2114,'连山区'),(211403,2114,'龙港区'),(211404,2114,'南票区'),(211421,2114,'绥中县'),(211422,2114,'建昌县'),(211481,2114,'兴城市'),(22,0,'吉林'),(2201,22,'长春'),(220101,2201,'市辖区'),(220102,2201,'南关区'),(220103,2201,'宽城区'),(220104,2201,'朝阳区'),(220105,2201,'二道区'),(220106,2201,'绿园区'),(220112,2201,'双阳区'),(220122,2201,'农安县'),(220181,2201,'九台市'),(220182,2201,'榆树市'),(220183,2201,'德惠市'),(2202,22,'吉林'),(220201,2202,'市辖区'),(220202,2202,'昌邑区'),(220203,2202,'龙潭区'),(220204,2202,'船营区'),(220211,2202,'丰满区'),(220221,2202,'永吉县'),(220281,2202,'蛟河市'),(220282,2202,'桦甸市'),(220283,2202,'舒兰市'),(220284,2202,'磐石市'),(2203,22,'四平'),(220301,2203,'市辖区'),(220302,2203,'铁西区'),(220303,2203,'铁东区'),(220322,2203,'梨树县'),(220323,2203,'伊通满族自治县'),(220381,2203,'公主岭市'),(220382,2203,'双辽市'),(2204,22,'辽源'),(220401,2204,'市辖区'),(220402,2204,'龙山区'),(220403,2204,'西安区'),(220421,2204,'东丰县'),(220422,2204,'东辽县'),(2205,22,'通化'),(220501,2205,'市辖区'),(220502,2205,'东昌区'),(220503,2205,'二道江区'),(220521,2205,'通化县'),(220523,2205,'辉南县'),(220524,2205,'柳河县'),(220581,2205,'梅河口市'),(220582,2205,'集安市'),(2206,22,'白山'),(220601,2206,'市辖区'),(220602,2206,'八道江区'),(220621,2206,'抚松县'),(220622,2206,'靖宇县'),(220623,2206,'长白朝鲜族自治县'),(220625,2206,'江源县'),(220681,2206,'临江市'),(2207,22,'松原'),(220701,2207,'市辖区'),(220702,2207,'宁江区'),(220721,2207,'前郭尔罗斯蒙古族自治'),(220722,2207,'长岭县'),(220723,2207,'乾安县'),(220724,2207,'扶余县'),(2208,22,'白城'),(220801,2208,'市辖区'),(220802,2208,'洮北区'),(220821,2208,'镇赉县'),(220822,2208,'通榆县'),(220881,2208,'洮南市'),(220882,2208,'大安市'),(2224,22,'延边朝鲜族自治州'),(222401,2224,'延吉市'),(222402,2224,'图们市'),(222403,2224,'敦化市'),(222404,2224,'珲春市'),(222405,2224,'龙井市'),(222406,2224,'和龙市'),(222424,2224,'汪清县'),(222426,2224,'安图县'),(23,0,'黑龙江'),(2301,23,'哈尔滨'),(230101,2301,'市辖区'),(230102,2301,'道里区'),(230103,2301,'南岗区'),(230104,2301,'道外区'),(230105,2301,'太平区'),(230106,2301,'香坊区'),(230107,2301,'动力区'),(230108,2301,'平房区'),(230121,2301,'呼兰县'),(230123,2301,'依兰县'),(230124,2301,'方正县'),(230125,2301,'宾  县'),(230126,2301,'巴彦县'),(230127,2301,'木兰县'),(230128,2301,'通河县'),(230129,2301,'延寿县'),(230181,2301,'阿城市'),(230182,2301,'双城市'),(230183,2301,'尚志市'),(230184,2301,'五常市'),(2302,23,'齐齐哈尔'),(230201,2302,'市辖区'),(230202,2302,'龙沙区'),(230203,2302,'建华区'),(230204,2302,'铁锋区'),(230205,2302,'昂昂溪区'),(230206,2302,'富拉尔基区'),(230207,2302,'碾子山区'),(230208,2302,'梅里斯达斡尔族区'),(230221,2302,'龙江县'),(230223,2302,'依安县'),(230224,2302,'泰来县'),(230225,2302,'甘南县'),(230227,2302,'富裕县'),(230229,2302,'克山县'),(230230,2302,'克东县'),(230231,2302,'拜泉县'),(230281,2302,'讷河市'),(2303,23,'鸡西'),(230301,2303,'市辖区'),(230302,2303,'鸡冠区'),(230303,2303,'恒山区'),(230304,2303,'滴道区'),(230305,2303,'梨树区'),(230306,2303,'城子河区'),(230307,2303,'麻山区'),(230321,2303,'鸡东县'),(230381,2303,'虎林市'),(230382,2303,'密山市'),(2304,23,'鹤岗'),(230401,2304,'市辖区'),(230402,2304,'向阳区'),(230403,2304,'工农区'),(230404,2304,'南山区'),(230405,2304,'兴安区'),(230406,2304,'东山区'),(230407,2304,'兴山区'),(230421,2304,'萝北县'),(230422,2304,'绥滨县'),(2305,23,'双鸭山'),(230501,2305,'市辖区'),(230502,2305,'尖山区'),(230503,2305,'岭东区'),(230505,2305,'四方台区'),(230506,2305,'宝山区'),(230521,2305,'集贤县'),(230522,2305,'友谊县'),(230523,2305,'宝清县'),(230524,2305,'饶河县'),(2306,23,'大庆'),(230601,2306,'市辖区'),(230602,2306,'萨尔图区'),(230603,2306,'龙凤区'),(230604,2306,'让胡路区'),(230605,2306,'红岗区'),(230606,2306,'大同区'),(230621,2306,'肇州县'),(230622,2306,'肇源县'),(230623,2306,'林甸县'),(230624,2306,'杜尔伯特蒙古族自治县'),(2307,23,'伊春'),(230701,2307,'市辖区'),(230702,2307,'伊春区'),(230703,2307,'南岔区'),(230704,2307,'友好区'),(230705,2307,'西林区'),(230706,2307,'翠峦区'),(230707,2307,'新青区'),(230708,2307,'美溪区'),(230709,2307,'金山屯区'),(230710,2307,'五营区'),(230711,2307,'乌马河区'),(230712,2307,'汤旺河区'),(230713,2307,'带岭区'),(230714,2307,'乌伊岭区'),(230715,2307,'红星区'),(230716,2307,'上甘岭区'),(230722,2307,'嘉荫县'),(230781,2307,'铁力市'),(2308,23,'佳木斯'),(230801,2308,'市辖区'),(230802,2308,'永红区'),(230803,2308,'向阳区'),(230804,2308,'前进区'),(230805,2308,'东风区'),(230811,2308,'郊  区'),(230822,2308,'桦南县'),(230826,2308,'桦川县'),(230828,2308,'汤原县'),(230833,2308,'抚远县'),(230881,2308,'同江市'),(230882,2308,'富锦市'),(2309,23,'七台河'),(230901,2309,'市辖区'),(230902,2309,'新兴区'),(230903,2309,'桃山区'),(230904,2309,'茄子河区'),(230921,2309,'勃利县'),(2310,23,'牡丹江'),(231001,2310,'市辖区'),(231002,2310,'东安区'),(231003,2310,'阳明区'),(231004,2310,'爱民区'),(231005,2310,'西安区'),(231024,2310,'东宁县'),(231025,2310,'林口县'),(231081,2310,'绥芬河市'),(231083,2310,'海林市'),(231084,2310,'宁安市'),(231085,2310,'穆棱市'),(2311,23,'黑河'),(231101,2311,'市辖区'),(231102,2311,'爱辉区'),(231121,2311,'嫩江县'),(231123,2311,'逊克县'),(231124,2311,'孙吴县'),(231181,2311,'北安市'),(231182,2311,'五大连池市'),(2312,23,'绥化'),(231201,2312,'市辖区'),(231202,2312,'北林区'),(231221,2312,'望奎县'),(231222,2312,'兰西县'),(231223,2312,'青冈县'),(231224,2312,'庆安县'),(231225,2312,'明水县'),(231226,2312,'绥棱县'),(231281,2312,'安达市'),(231282,2312,'肇东市'),(231283,2312,'海伦市'),(2327,23,'大兴安岭地区'),(232721,2327,'呼玛县'),(232722,2327,'塔河县'),(232723,2327,'漠河县'),(31,0,'上海'),(3101,31,'上海市辖'),(310101,3101,'黄浦区'),(310103,3101,'卢湾区'),(310104,3101,'徐汇区'),(310105,3101,'长宁区'),(310106,3101,'静安区'),(310107,3101,'普陀区'),(310108,3101,'闸北区'),(310109,3101,'虹口区'),(310110,3101,'杨浦区'),(310112,3101,'闵行区'),(310113,3101,'宝山区'),(310114,3101,'嘉定区'),(310115,3101,'浦东新区'),(310116,3101,'金山区'),(310117,3101,'松江区'),(310118,3101,'青浦区'),(3102,31,'上海县辖'),(310225,3102,'南汇县'),(310226,3102,'奉贤县'),(310230,3102,'崇明县'),(32,0,'江苏'),(3201,32,'南京'),(320101,3201,'市辖区'),(320102,3201,'玄武区'),(320103,3201,'白下区'),(320104,3201,'秦淮区'),(320105,3201,'建邺区'),(320106,3201,'鼓楼区'),(320107,3201,'下关区'),(320111,3201,'浦口区'),(320112,3201,'大厂区'),(320113,3201,'栖霞区'),(320114,3201,'雨花台区'),(320115,3201,'江宁区'),(320122,3201,'江浦县'),(320123,3201,'六合县'),(320124,3201,'溧水县'),(320125,3201,'高淳县'),(3202,32,'无锡'),(320201,3202,'市辖区'),(320202,3202,'崇安区'),(320203,3202,'南长区'),(320204,3202,'北塘区'),(320205,3202,'锡山区'),(320206,3202,'惠山区'),(320211,3202,'滨湖区'),(320281,3202,'江阴市'),(320282,3202,'宜兴市'),(3203,32,'徐州'),(320301,3203,'市辖区'),(320302,3203,'鼓楼区'),(320303,3203,'云龙区'),(320304,3203,'九里区'),(320305,3203,'贾汪区'),(320311,3203,'泉山区'),(320321,3203,'丰  县'),(320322,3203,'沛  县'),(320323,3203,'铜山县'),(320324,3203,'睢宁县'),(320381,3203,'新沂市'),(320382,3203,'邳州市'),(3204,32,'常州'),(320401,3204,'市辖区'),(320402,3204,'天宁区'),(320404,3204,'钟楼区'),(320405,3204,'戚墅堰区'),(320411,3204,'郊  区'),(320481,3204,'溧阳市'),(320482,3204,'金坛市'),(320483,3204,'武进市'),(3205,32,'苏州'),(320501,3205,'市辖区'),(320502,3205,'沧浪区'),(320503,3205,'平江区'),(320504,3205,'金阊区'),(320505,3205,'虎丘区'),(320506,3205,'吴中区'),(320507,3205,'相城区'),(320581,3205,'常熟市'),(320582,3205,'张家港市'),(320583,3205,'昆山市'),(320584,3205,'吴江市'),(320585,3205,'太仓市'),(3206,32,'南通'),(320601,3206,'市辖区'),(320602,3206,'崇川区'),(320611,3206,'港闸区'),(320621,3206,'海安县'),(320623,3206,'如东县'),(320681,3206,'启东市'),(320682,3206,'如皋市'),(320683,3206,'通州市'),(320684,3206,'海门市'),(3207,32,'连云港'),(320701,3207,'市辖区'),(320703,3207,'连云区'),(320704,3207,'云台区'),(320705,3207,'新浦区'),(320706,3207,'海州区'),(320721,3207,'赣榆县'),(320722,3207,'东海县'),(320723,3207,'灌云县'),(320724,3207,'灌南县'),(3208,32,'淮安'),(320801,3208,'市辖区'),(320802,3208,'清河区'),(320803,3208,'楚州区'),(320804,3208,'淮阴区'),(320811,3208,'清浦区'),(320826,3208,'涟水县'),(320829,3208,'洪泽县'),(320830,3208,'盱眙县'),(320831,3208,'金湖县'),(3209,32,'盐城'),(320901,3209,'市辖区'),(320902,3209,'城  区'),(320921,3209,'响水县'),(320922,3209,'滨海县'),(320923,3209,'阜宁县'),(320924,3209,'射阳县'),(320925,3209,'建湖县'),(320928,3209,'盐都县'),(320981,3209,'东台市'),(320982,3209,'大丰市'),(3210,32,'扬州'),(321001,3210,'市辖区'),(321002,3210,'广陵区'),(321003,3210,'邗江区'),(321011,3210,'郊  区'),(321023,3210,'宝应县'),(321081,3210,'仪征市'),(321084,3210,'高邮市'),(321088,3210,'江都市'),(3211,32,'镇江'),(321101,3211,'市辖区'),(321102,3211,'京口区'),(321111,3211,'润州区'),(321121,3211,'丹徒县'),(321181,3211,'丹阳市'),(321182,3211,'扬中市'),(321183,3211,'句容市'),(3212,32,'泰州'),(321201,3212,'市辖区'),(321202,3212,'海陵区'),(321203,3212,'高港区'),(321281,3212,'兴化市'),(321282,3212,'靖江市'),(321283,3212,'泰兴市'),(321284,3212,'姜堰市'),(3213,32,'宿迁'),(321301,3213,'市辖区'),(321302,3213,'宿城区'),(321321,3213,'宿豫县'),(321322,3213,'沭阳县'),(321323,3213,'泗阳县'),(321324,3213,'泗洪县'),(33,0,'浙江'),(3301,33,'杭州'),(330101,3301,'市辖区'),(330102,3301,'上城区'),(330103,3301,'下城区'),(330104,3301,'江干区'),(330105,3301,'拱墅区'),(330106,3301,'西湖区'),(330108,3301,'滨江区'),(330122,3301,'桐庐县'),(330127,3301,'淳安县'),(330181,3301,'萧山市'),(330182,3301,'建德市'),(330183,3301,'富阳市'),(330184,3301,'余杭市'),(330185,3301,'临安市'),(3302,33,'宁波'),(330201,3302,'市辖区'),(330203,3302,'海曙区'),(330204,3302,'江东区'),(330205,3302,'江北区'),(330206,3302,'北仑区'),(330211,3302,'镇海区'),(330225,3302,'象山县'),(330226,3302,'宁海县'),(330227,3302,'鄞  县'),(330281,3302,'余姚市'),(330282,3302,'慈溪市'),(330283,3302,'奉化市'),(3303,33,'温州'),(330301,3303,'市辖区'),(330302,3303,'鹿城区'),(330303,3303,'龙湾区'),(330304,3303,'瓯海区'),(330322,3303,'洞头县'),(330324,3303,'永嘉县'),(330326,3303,'平阳县'),(330327,3303,'苍南县'),(330328,3303,'文成县'),(330329,3303,'泰顺县'),(330381,3303,'瑞安市'),(330382,3303,'乐清市'),(3304,33,'嘉兴'),(330401,3304,'市辖区'),(330402,3304,'秀城区'),(330411,3304,'秀洲区'),(330421,3304,'嘉善县'),(330424,3304,'海盐县'),(330481,3304,'海宁市'),(330482,3304,'平湖市'),(330483,3304,'桐乡市'),(3305,33,'湖州'),(330501,3305,'市辖区'),(330521,3305,'德清县'),(330522,3305,'长兴县'),(330523,3305,'安吉县'),(3306,33,'绍兴'),(330601,3306,'市辖区'),(330602,3306,'越城区'),(330621,3306,'绍兴县'),(330624,3306,'新昌县'),(330681,3306,'诸暨市'),(330682,3306,'上虞市'),(330683,3306,'嵊州市'),(3307,33,'金华'),(330701,3307,'市辖区'),(330702,3307,'婺城区'),(330703,3307,'金东区'),(330723,3307,'武义县'),(330726,3307,'浦江县'),(330727,3307,'磐安县'),(330781,3307,'兰溪市'),(330782,3307,'义乌市'),(330783,3307,'东阳市'),(330784,3307,'永康市'),(3308,33,'衢州'),(330801,3308,'市辖区'),(330802,3308,'柯城区'),(330821,3308,'衢  县'),(330822,3308,'常山县'),(330824,3308,'开化县'),(330825,3308,'龙游县'),(330881,3308,'江山市'),(3309,33,'舟山'),(330901,3309,'市辖区'),(330902,3309,'定海区'),(330903,3309,'普陀区'),(330921,3309,'岱山县'),(330922,3309,'嵊泗县'),(3310,33,'台州'),(331001,3310,'市辖区'),(331002,3310,'椒江区'),(331003,3310,'黄岩区'),(331004,3310,'路桥区'),(331021,3310,'玉环县'),(331022,3310,'三门县'),(331023,3310,'天台县'),(331024,3310,'仙居县'),(331081,3310,'温岭市'),(331082,3310,'临海市'),(3311,33,'丽水'),(331101,3311,'市辖区'),(331102,3311,'莲都区'),(331121,3311,'青田县'),(331122,3311,'缙云县'),(331123,3311,'遂昌县'),(331124,3311,'松阳县'),(331125,3311,'云和县'),(331126,3311,'庆元县'),(331127,3311,'景宁畲族自治县'),(331181,3311,'龙泉市'),(34,0,'安徽'),(3401,34,'合肥'),(340101,3401,'市辖区'),(340102,3401,'东市区'),(340103,3401,'中市区'),(340104,3401,'西市区'),(340111,3401,'郊  区'),(340121,3401,'长丰县'),(340122,3401,'肥东县'),(340123,3401,'肥西县'),(3402,34,'芜湖'),(340201,3402,'市辖区'),(340202,3402,'镜湖区'),(340203,3402,'马塘区'),(340204,3402,'新芜区'),(340207,3402,'鸠江区'),(340221,3402,'芜湖县'),(340222,3402,'繁昌县'),(340223,3402,'南陵县'),(3403,34,'蚌埠'),(340301,3403,'市辖区'),(340302,3403,'东市区'),(340303,3403,'中市区'),(340304,3403,'西市区'),(340311,3403,'郊  区'),(340321,3403,'怀远县'),(340322,3403,'五河县'),(340323,3403,'固镇县'),(3404,34,'淮南'),(340401,3404,'市辖区'),(340402,3404,'大通区'),(340403,3404,'田家庵区'),(340404,3404,'谢家集区'),(340405,3404,'八公山区'),(340406,3404,'潘集区'),(340421,3404,'凤台县'),(3405,34,'马鞍山'),(340501,3405,'市辖区'),(340502,3405,'金家庄区'),(340503,3405,'花山区'),(340504,3405,'雨山区'),(340505,3405,'向山区'),(340521,3405,'当涂县'),(3406,34,'淮北'),(340601,3406,'市辖区'),(340602,3406,'杜集区'),(340603,3406,'相山区'),(340604,3406,'烈山区'),(340621,3406,'濉溪县'),(3407,34,'铜陵'),(340701,3407,'市辖区'),(340702,3407,'铜官山区'),(340703,3407,'狮子山区'),(340711,3407,'郊  区'),(340721,3407,'铜陵县'),(3408,34,'安庆'),(340801,3408,'市辖区'),(340802,3408,'迎江区'),(340803,3408,'大观区'),(340811,3408,'郊  区'),(340822,3408,'怀宁县'),(340823,3408,'枞阳县'),(340824,3408,'潜山县'),(340825,3408,'太湖县'),(340826,3408,'宿松县'),(340827,3408,'望江县'),(340828,3408,'岳西县'),(340881,3408,'桐城市'),(3410,34,'黄山'),(341001,3410,'市辖区'),(341002,3410,'屯溪区'),(341003,3410,'黄山区'),(341004,3410,'徽州区'),(341021,3410,'歙  县'),(341022,3410,'休宁县'),(341023,3410,'黟  县'),(341024,3410,'祁门县'),(3411,34,'滁州'),(341101,3411,'市辖区'),(341102,3411,'琅琊区'),(341103,3411,'南谯区'),(341122,3411,'来安县'),(341124,3411,'全椒县'),(341125,3411,'定远县'),(341126,3411,'凤阳县'),(341181,3411,'天长市'),(341182,3411,'明光市'),(3412,34,'阜阳'),(341201,3412,'市辖区'),(341202,3412,'颍州区'),(341203,3412,'颍东区'),(341204,3412,'颍泉区'),(341221,3412,'临泉县'),(341222,3412,'太和县'),(341225,3412,'阜南县'),(341226,3412,'颍上县'),(341282,3412,'界首市'),(3413,34,'宿州'),(341301,3413,'市辖区'),(341302,3413,'墉桥区'),(341321,3413,'砀山县'),(341322,3413,'萧  县'),(341323,3413,'灵璧县'),(341324,3413,'泗  县'),(3414,34,'巢湖'),(341401,3414,'市辖区'),(341402,3414,'居巢区'),(341421,3414,'庐江县'),(341422,3414,'无为县'),(341423,3414,'含山县'),(341424,3414,'和  县'),(3415,34,'六安'),(341501,3415,'市辖区'),(341502,3415,'金安区'),(341503,3415,'裕安区'),(341521,3415,'寿  县'),(341522,3415,'霍邱县'),(341523,3415,'舒城县'),(341524,3415,'金寨县'),(341525,3415,'霍山县'),(3416,34,'亳州'),(341601,3416,'市辖区'),(341602,3416,'谯城区'),(341621,3416,'涡阳县'),(341622,3416,'蒙城县'),(341623,3416,'利辛县'),(3417,34,'池州'),(341701,3417,'市辖区'),(341702,3417,'贵池区'),(341721,3417,'东至县'),(341722,3417,'石台县'),(341723,3417,'青阳县'),(3418,34,'宣城'),(341801,3418,'市辖区'),(341802,3418,'宣州区'),(341821,3418,'郎溪县'),(341822,3418,'广德县'),(341823,3418,'泾  县'),(341824,3418,'绩溪县'),(341825,3418,'旌德县'),(341881,3418,'宁国市'),(35,0,'福建'),(3501,35,'福州'),(350101,3501,'市辖区'),(350102,3501,'鼓楼区'),(350103,3501,'台江区'),(350104,3501,'仓山区'),(350105,3501,'马尾区'),(350111,3501,'晋安区'),(350121,3501,'闽侯县'),(350122,3501,'连江县'),(350123,3501,'罗源县'),(350124,3501,'闽清县'),(350125,3501,'永泰县'),(350128,3501,'平潭县'),(350181,3501,'福清市'),(350182,3501,'长乐市'),(3502,35,'厦门'),(350201,3502,'市辖区'),(350202,3502,'鼓浪屿区'),(350203,3502,'思明区'),(350204,3502,'开元区'),(350205,3502,'杏林区'),(350206,3502,'湖里区'),(350211,3502,'集美区'),(350212,3502,'同安区'),(3503,35,'莆田'),(350301,3503,'市辖区'),(350302,3503,'城厢区'),(350303,3503,'涵江区'),(350321,3503,'莆田县'),(350322,3503,'仙游县'),(3504,35,'三明'),(350401,3504,'市辖区'),(350402,3504,'梅列区'),(350403,3504,'三元区'),(350421,3504,'明溪县'),(350423,3504,'清流县'),(350424,3504,'宁化县'),(350425,3504,'大田县'),(350426,3504,'尤溪县'),(350427,3504,'沙  县'),(350428,3504,'将乐县'),(350429,3504,'泰宁县'),(350430,3504,'建宁县'),(350481,3504,'永安市'),(3505,35,'泉州'),(350501,3505,'市辖区'),(350502,3505,'鲤城区'),(350503,3505,'丰泽区'),(350504,3505,'洛江区'),(350505,3505,'泉港区'),(350521,3505,'惠安县'),(350524,3505,'安溪县'),(350525,3505,'永春县'),(350526,3505,'德化县'),(350527,3505,'金门县'),(350581,3505,'石狮市'),(350582,3505,'晋江市'),(350583,3505,'南安市'),(3506,35,'漳州'),(350601,3506,'市辖区'),(350602,3506,'芗城区'),(350603,3506,'龙文区'),(350622,3506,'云霄县'),(350623,3506,'漳浦县'),(350624,3506,'诏安县'),(350625,3506,'长泰县'),(350626,3506,'东山县'),(350627,3506,'南靖县'),(350628,3506,'平和县'),(350629,3506,'华安县'),(350681,3506,'龙海市'),(3507,35,'南平'),(350701,3507,'市辖区'),(350702,3507,'延平区'),(350721,3507,'顺昌县'),(350722,3507,'浦城县'),(350723,3507,'光泽县'),(350724,3507,'松溪县'),(350725,3507,'政和县'),(350781,3507,'邵武市'),(350782,3507,'武夷山市'),(350783,3507,'建瓯市'),(350784,3507,'建阳市'),(3508,35,'龙岩'),(350801,3508,'市辖区'),(350802,3508,'新罗区'),(350821,3508,'长汀县'),(350822,3508,'永定县'),(350823,3508,'上杭县'),(350824,3508,'武平县'),(350825,3508,'连城县'),(350881,3508,'漳平市'),(3509,35,'宁德'),(350901,3509,'市辖区'),(350902,3509,'蕉城区'),(350921,3509,'霞浦县'),(350922,3509,'古田县'),(350923,3509,'屏南县'),(350924,3509,'寿宁县'),(350925,3509,'周宁县'),(350926,3509,'柘荣县'),(350981,3509,'福安市'),(350982,3509,'福鼎市'),(36,0,'江西'),(3601,36,'南昌'),(360101,3601,'市辖区'),(360102,3601,'东湖区'),(360103,3601,'西湖区'),(360104,3601,'青云谱区'),(360105,3601,'湾里区'),(360111,3601,'郊  区'),(360121,3601,'南昌县'),(360122,3601,'新建县'),(360123,3601,'安义县'),(360124,3601,'进贤县'),(3602,36,'景德镇'),(360201,3602,'市辖区'),(360202,3602,'昌江区'),(360203,3602,'珠山区'),(360222,3602,'浮梁县'),(360281,3602,'乐平市'),(3603,36,'萍乡'),(360301,3603,'市辖区'),(360302,3603,'安源区'),(360313,3603,'湘东区'),(360321,3603,'莲花县'),(360322,3603,'上栗县'),(360323,3603,'芦溪县'),(3604,36,'九江'),(360401,3604,'市辖区'),(360402,3604,'庐山区'),(360403,3604,'浔阳区'),(360421,3604,'九江县'),(360423,3604,'武宁县'),(360424,3604,'修水县'),(360425,3604,'永修县'),(360426,3604,'德安县'),(360427,3604,'星子县'),(360428,3604,'都昌县'),(360429,3604,'湖口县'),(360430,3604,'彭泽县'),(360481,3604,'瑞昌市'),(3605,36,'新余'),(360501,3605,'市辖区'),(360502,3605,'渝水区'),(360521,3605,'分宜县'),(3606,36,'鹰潭'),(360601,3606,'市辖区'),(360602,3606,'月湖区'),(360622,3606,'余江县'),(360681,3606,'贵溪市'),(3607,36,'赣州'),(360701,3607,'市辖区'),(360702,3607,'章贡区'),(360721,3607,'赣  县'),(360722,3607,'信丰县'),(360723,3607,'大余县'),(360724,3607,'上犹县'),(360725,3607,'崇义县'),(360726,3607,'安远县'),(360727,3607,'龙南县'),(360728,3607,'定南县'),(360729,3607,'全南县'),(360730,3607,'宁都县'),(360731,3607,'于都县'),(360732,3607,'兴国县'),(360733,3607,'会昌县'),(360734,3607,'寻乌县'),(360735,3607,'石城县'),(360781,3607,'瑞金市'),(360782,3607,'南康市'),(3608,36,'吉安'),(360801,3608,'市辖区'),(360802,3608,'吉州区'),(360803,3608,'青原区'),(360821,3608,'吉安县'),(360822,3608,'吉水县'),(360823,3608,'峡江县'),(360824,3608,'新干县'),(360825,3608,'永丰县'),(360826,3608,'泰和县'),(360827,3608,'遂川县'),(360828,3608,'万安县'),(360829,3608,'安福县'),(360830,3608,'永新县'),(360881,3608,'井冈山市'),(3609,36,'宜春'),(360901,3609,'市辖区'),(360902,3609,'袁州区'),(360921,3609,'奉新县'),(360922,3609,'万载县'),(360923,3609,'上高县'),(360924,3609,'宜丰县'),(360925,3609,'靖安县'),(360926,3609,'铜鼓县'),(360981,3609,'丰城市'),(360982,3609,'樟树市'),(360983,3609,'高安市'),(3610,36,'抚州'),(361001,3610,'市辖区'),(361002,3610,'临川区'),(361021,3610,'南城县'),(361022,3610,'黎川县'),(361023,3610,'南丰县'),(361024,3610,'崇仁县'),(361025,3610,'乐安县'),(361026,3610,'宜黄县'),(361027,3610,'金溪县'),(361028,3610,'资溪县'),(361029,3610,'东乡县'),(361030,3610,'广昌县'),(3611,36,'上饶'),(361101,3611,'市辖区'),(361102,3611,'信州区'),(361121,3611,'上饶县'),(361122,3611,'广丰县'),(361123,3611,'玉山县'),(361124,3611,'铅山县'),(361125,3611,'横峰县'),(361126,3611,'弋阳县'),(361127,3611,'余干县'),(361128,3611,'波阳县'),(361129,3611,'万年县'),(361130,3611,'婺源县'),(361181,3611,'德兴市'),(37,0,'山东'),(3701,37,'济南'),(370101,3701,'市辖区'),(370102,3701,'历下区'),(370103,3701,'市中区'),(370104,3701,'槐荫区'),(370105,3701,'天桥区'),(370112,3701,'历城区'),(370123,3701,'长清县'),(370124,3701,'平阴县'),(370125,3701,'济阳县'),(370126,3701,'商河县'),(370181,3701,'章丘市'),(3702,37,'青岛'),(370201,3702,'市辖区'),(370202,3702,'市南区'),(370203,3702,'市北区'),(370205,3702,'四方区'),(370211,3702,'黄岛区'),(370212,3702,'崂山区'),(370213,3702,'李沧区'),(370214,3702,'城阳区'),(370281,3702,'胶州市'),(370282,3702,'即墨市'),(370283,3702,'平度市'),(370284,3702,'胶南市'),(370285,3702,'莱西市'),(3703,37,'淄博'),(370301,3703,'市辖区'),(370302,3703,'淄川区'),(370303,3703,'张店区'),(370304,3703,'博山区'),(370305,3703,'临淄区'),(370306,3703,'周村区'),(370321,3703,'桓台县'),(370322,3703,'高青县'),(370323,3703,'沂源县'),(3704,37,'枣庄'),(370401,3704,'市辖区'),(370402,3704,'市中区'),(370403,3704,'薛城区'),(370404,3704,'峄城区'),(370405,3704,'台儿庄区'),(370406,3704,'山亭区'),(370481,3704,'滕州市'),(3705,37,'东营'),(370501,3705,'市辖区'),(370502,3705,'东营区'),(370503,3705,'河口区'),(370521,3705,'垦利县'),(370522,3705,'利津县'),(370523,3705,'广饶县'),(3706,37,'烟台'),(370601,3706,'市辖区'),(370602,3706,'芝罘区'),(370611,3706,'福山区'),(370612,3706,'牟平区'),(370613,3706,'莱山区'),(370634,3706,'长岛县'),(370681,3706,'龙口市'),(370682,3706,'莱阳市'),(370683,3706,'莱州市'),(370684,3706,'蓬莱市'),(370685,3706,'招远市'),(370686,3706,'栖霞市'),(370687,3706,'海阳市'),(3707,37,'潍坊'),(370701,3707,'市辖区'),(370702,3707,'潍城区'),(370703,3707,'寒亭区'),(370704,3707,'坊子区'),(370705,3707,'奎文区'),(370724,3707,'临朐县'),(370725,3707,'昌乐县'),(370781,3707,'青州市'),(370782,3707,'诸城市'),(370783,3707,'寿光市'),(370784,3707,'安丘市'),(370785,3707,'高密市'),(370786,3707,'昌邑市'),(3708,37,'济宁'),(370801,3708,'市辖区'),(370802,3708,'市中区'),(370811,3708,'任城区'),(370826,3708,'微山县'),(370827,3708,'鱼台县'),(370828,3708,'金乡县'),(370829,3708,'嘉祥县'),(370830,3708,'汶上县'),(370831,3708,'泗水县'),(370832,3708,'梁山县'),(370881,3708,'曲阜市'),(370882,3708,'兖州市'),(370883,3708,'邹城市'),(3709,37,'泰安'),(370901,3709,'市辖区'),(370902,3709,'泰山区'),(370903,3709,'岱岳区'),(370921,3709,'宁阳县'),(370923,3709,'东平县'),(370982,3709,'新泰市'),(370983,3709,'肥城市'),(3710,37,'威海'),(371001,3710,'市辖区'),(371002,3710,'环翠区'),(371081,3710,'文登市'),(371082,3710,'荣成市'),(371083,3710,'乳山市'),(3711,37,'日照'),(371101,3711,'市辖区'),(371102,3711,'东港区'),(371121,3711,'五莲县'),(371122,3711,'莒  县'),(3712,37,'莱芜'),(371201,3712,'市辖区'),(371202,3712,'莱城区'),(371203,3712,'钢城区'),(3713,37,'临沂'),(371301,3713,'市辖区'),(371302,3713,'兰山区'),(371311,3713,'罗庄区'),(371312,3713,'河东区'),(371321,3713,'沂南县'),(371322,3713,'郯城县'),(371323,3713,'沂水县'),(371324,3713,'苍山县'),(371325,3713,'费  县'),(371326,3713,'平邑县'),(371327,3713,'莒南县'),(371328,3713,'蒙阴县'),(371329,3713,'临沭县'),(3714,37,'德州'),(371401,3714,'市辖区'),(371402,3714,'德城区'),(371421,3714,'陵  县'),(371422,3714,'宁津县'),(371423,3714,'庆云县'),(371424,3714,'临邑县'),(371425,3714,'齐河县'),(371426,3714,'平原县'),(371427,3714,'夏津县'),(371428,3714,'武城县'),(371481,3714,'乐陵市'),(371482,3714,'禹城市'),(3715,37,'聊城'),(371501,3715,'市辖区'),(371502,3715,'东昌府区'),(371521,3715,'阳谷县'),(371522,3715,'莘  县'),(371523,3715,'茌平县'),(371524,3715,'东阿县'),(371525,3715,'冠  县'),(371526,3715,'高唐县'),(371581,3715,'临清市'),(3716,37,'滨州'),(371601,3716,'市辖区'),(371603,3716,'滨城区'),(371621,3716,'惠民县'),(371622,3716,'阳信县'),(371623,3716,'无棣县'),(371624,3716,'沾化县'),(371625,3716,'博兴县'),(371626,3716,'邹平县'),(3717,37,'菏泽'),(371701,3717,'市辖区'),(371702,3717,'牡丹区'),(371721,3717,'曹  县'),(371722,3717,'单  县'),(371723,3717,'成武县'),(371724,3717,'巨野县'),(371725,3717,'郓城县'),(371726,3717,'鄄城县'),(371727,3717,'定陶县'),(371728,3717,'东明县'),(41,0,'河南'),(4101,41,'郑州'),(410101,4101,'市辖区'),(410102,4101,'中原区'),(410103,4101,'二七区'),(410104,4101,'管城回族区'),(410105,4101,'金水区'),(410106,4101,'上街区'),(410108,4101,'邙山区'),(410122,4101,'中牟县'),(410181,4101,'巩义市'),(410182,4101,'荥阳市'),(410183,4101,'新密市'),(410184,4101,'新郑市'),(410185,4101,'登封市'),(4102,41,'开封'),(410201,4102,'市辖区'),(410202,4102,'龙亭区'),(410203,4102,'顺河回族区'),(410204,4102,'鼓楼区'),(410205,4102,'南关区'),(410211,4102,'郊  区'),(410221,4102,'杞  县'),(410222,4102,'通许县'),(410223,4102,'尉氏县'),(410224,4102,'开封县'),(410225,4102,'兰考县'),(4103,41,'洛阳'),(410301,4103,'市辖区'),(410302,4103,'老城区'),(410303,4103,'西工区'),(410304,4103,'廛河回族区'),(410305,4103,'涧西区'),(410306,4103,'吉利区'),(410307,4103,'洛龙区'),(410322,4103,'孟津县'),(410323,4103,'新安县'),(410324,4103,'栾川县'),(410325,4103,'嵩  县'),(410326,4103,'汝阳县'),(410327,4103,'宜阳县'),(410328,4103,'洛宁县'),(410329,4103,'伊川县'),(410381,4103,'偃师市'),(4104,41,'平顶山'),(410401,4104,'市辖区'),(410402,4104,'新华区'),(410403,4104,'卫东区'),(410404,4104,'石龙区'),(410411,4104,'湛河区'),(410421,4104,'宝丰县'),(410422,4104,'叶  县'),(410423,4104,'鲁山县'),(410425,4104,'郏  县'),(410481,4104,'舞钢市'),(410482,4104,'汝州市'),(4105,41,'安阳'),(410501,4105,'市辖区'),(410502,4105,'文峰区'),(410503,4105,'北关区'),(410504,4105,'铁西区'),(410511,4105,'郊  区'),(410522,4105,'安阳县'),(410523,4105,'汤阴县'),(410526,4105,'滑  县'),(410527,4105,'内黄县'),(410581,4105,'林州市'),(4106,41,'鹤壁'),(410601,4106,'市辖区'),(410602,4106,'鹤山区'),(410603,4106,'山城区'),(410611,4106,'郊  区'),(410621,4106,'浚  县'),(410622,4106,'淇  县'),(4107,41,'新乡'),(410701,4107,'市辖区'),(410702,4107,'红旗区'),(410703,4107,'新华区'),(410704,4107,'北站区'),(410711,4107,'郊  区'),(410721,4107,'新乡县'),(410724,4107,'获嘉县'),(410725,4107,'原阳县'),(410726,4107,'延津县'),(410727,4107,'封丘县'),(410728,4107,'长垣县'),(410781,4107,'卫辉市'),(410782,4107,'辉县市'),(4108,41,'焦作'),(410801,4108,'市辖区'),(410802,4108,'解放区'),(410803,4108,'中站区'),(410804,4108,'马村区'),(410811,4108,'山阳区'),(410821,4108,'修武县'),(410822,4108,'博爱县'),(410823,4108,'武陟县'),(410825,4108,'温  县'),(410881,4108,'济源市'),(410882,4108,'沁阳市'),(410883,4108,'孟州市'),(4109,41,'濮阳'),(410901,4109,'市辖区'),(410902,4109,'市  区'),(410922,4109,'清丰县'),(410923,4109,'南乐县'),(410926,4109,'范  县'),(410927,4109,'台前县'),(410928,4109,'濮阳县'),(4110,41,'许昌'),(411001,4110,'市辖区'),(411002,4110,'魏都区'),(411023,4110,'许昌县'),(411024,4110,'鄢陵县'),(411025,4110,'襄城县'),(411081,4110,'禹州市'),(411082,4110,'长葛市'),(4111,41,'漯河'),(411101,4111,'市辖区'),(411102,4111,'源汇区'),(411121,4111,'舞阳县'),(411122,4111,'临颍县'),(411123,4111,'郾城县'),(4112,41,'三门峡'),(411201,4112,'市辖区'),(411202,4112,'湖滨区'),(411221,4112,'渑池县'),(411222,4112,'陕  县'),(411224,4112,'卢氏县'),(411281,4112,'义马市'),(411282,4112,'灵宝市'),(4113,41,'南阳'),(411301,4113,'市辖区'),(411302,4113,'宛城区'),(411303,4113,'卧龙区'),(411321,4113,'南召县'),(411322,4113,'方城县'),(411323,4113,'西峡县'),(411324,4113,'镇平县'),(411325,4113,'内乡县'),(411326,4113,'淅川县'),(411327,4113,'社旗县'),(411328,4113,'唐河县'),(411329,4113,'新野县'),(411330,4113,'桐柏县'),(411381,4113,'邓州市'),(4114,41,'商丘'),(411401,4114,'市辖区'),(411402,4114,'梁园区'),(411403,4114,'睢阳区'),(411421,4114,'民权县'),(411422,4114,'睢  县'),(411423,4114,'宁陵县'),(411424,4114,'柘城县'),(411425,4114,'虞城县'),(411426,4114,'夏邑县'),(411481,4114,'永城市'),(4115,41,'信阳'),(411501,4115,'市辖区'),(411502,4115,'师河区'),(411503,4115,'平桥区'),(411521,4115,'罗山县'),(411522,4115,'光山县'),(411523,4115,'新  县'),(411524,4115,'商城县'),(411525,4115,'固始县'),(411526,4115,'潢川县'),(411527,4115,'淮滨县'),(411528,4115,'息  县'),(4116,41,'周口'),(411601,4116,'市辖区'),(411602,4116,'川汇区'),(411621,4116,'扶沟县'),(411622,4116,'西华县'),(411623,4116,'商水县'),(411624,4116,'沈丘县'),(411625,4116,'郸城县'),(411626,4116,'淮阳县'),(411627,4116,'太康县'),(411628,4116,'鹿邑县'),(411681,4116,'项城市'),(4117,41,'驻马店'),(411701,4117,'市辖区'),(411702,4117,'驿城区'),(411721,4117,'西平县'),(411722,4117,'上蔡县'),(411723,4117,'平舆县'),(411724,4117,'正阳县'),(411725,4117,'确山县'),(411726,4117,'泌阳县'),(411727,4117,'汝南县'),(411728,4117,'遂平县'),(411729,4117,'新蔡县'),(42,0,'湖北'),(4201,42,'武汉'),(420101,4201,'市辖区'),(420102,4201,'江岸区'),(420103,4201,'江汉区'),(420104,4201,'乔口区'),(420105,4201,'汉阳区'),(420106,4201,'武昌区'),(420107,4201,'青山区'),(420111,4201,'洪山区'),(420112,4201,'东西湖区'),(420113,4201,'汉南区'),(420114,4201,'蔡甸区'),(420115,4201,'江夏区'),(420116,4201,'黄陂区'),(420117,4201,'新洲区'),(4202,42,'黄石'),(420201,4202,'市辖区'),(420202,4202,'黄石港区'),(420203,4202,'石灰窑区'),(420204,4202,'下陆区'),(420205,4202,'铁山区'),(420222,4202,'阳新县'),(420281,4202,'大冶市'),(4203,42,'十堰'),(420301,4203,'市辖区'),(420302,4203,'茅箭区'),(420303,4203,'张湾区'),(420321,4203,'郧  县'),(420322,4203,'郧西县'),(420323,4203,'竹山县'),(420324,4203,'竹溪县'),(420325,4203,'房  县'),(420381,4203,'丹江口市'),(4205,42,'宜昌'),(420501,4205,'市辖区'),(420502,4205,'西陵区'),(420503,4205,'伍家岗区'),(420504,4205,'点军区'),(420505,4205,'虎亭区'),(420521,4205,'宜昌县'),(420525,4205,'远安县'),(420526,4205,'兴山县'),(420527,4205,'秭归县'),(420528,4205,'长阳土家族自治县'),(420529,4205,'五峰土家族自治县'),(420581,4205,'宜都市'),(420582,4205,'当阳市'),(420583,4205,'枝江市'),(4206,42,'襄樊'),(420601,4206,'市辖区'),(420602,4206,'襄城区'),(420606,4206,'樊城区'),(420621,4206,'襄阳县'),(420624,4206,'南漳县'),(420625,4206,'谷城县'),(420626,4206,'保康县'),(420682,4206,'老河口市'),(420683,4206,'枣阳市'),(420684,4206,'宜城市'),(4207,42,'鄂州'),(420701,4207,'市辖区'),(420702,4207,'梁子湖区'),(420703,4207,'华容区'),(420704,4207,'鄂城区'),(4208,42,'荆门'),(420801,4208,'市辖区'),(420802,4208,'东宝区'),(420821,4208,'京山县'),(420822,4208,'沙洋县'),(420881,4208,'钟祥市'),(4209,42,'孝感'),(420901,4209,'市辖区'),(420902,4209,'孝南区'),(420921,4209,'孝昌县'),(420922,4209,'大悟县'),(420923,4209,'云梦县'),(420981,4209,'应城市'),(420982,4209,'安陆市'),(420984,4209,'汉川市'),(4210,42,'荆州'),(421001,4210,'市辖区'),(421002,4210,'沙市区'),(421003,4210,'荆州区'),(421022,4210,'公安县'),(421023,4210,'监利县'),(421024,4210,'江陵县'),(421081,4210,'石首市'),(421083,4210,'洪湖市'),(421087,4210,'松滋市'),(4211,42,'黄冈'),(421101,4211,'市辖区'),(421102,4211,'黄州区'),(421121,4211,'团风县'),(421122,4211,'红安县'),(421123,4211,'罗田县'),(421124,4211,'英山县'),(421125,4211,'浠水县'),(421126,4211,'蕲春县'),(421127,4211,'黄梅县'),(421181,4211,'麻城市'),(421182,4211,'武穴市'),(4212,42,'咸宁'),(421201,4212,'市辖区'),(421202,4212,'咸安区'),(421221,4212,'嘉鱼县'),(421222,4212,'通城县'),(421223,4212,'崇阳县'),(421224,4212,'通山县'),(421281,4212,'赤壁市'),(4213,42,'随州'),(421301,4213,'市辖区'),(421302,4213,'曾都区'),(421381,4213,'广水市'),(4228,42,'恩施土家族苗族自治州'),(422801,4228,'恩施市'),(422802,4228,'利川市'),(422822,4228,'建始县'),(422823,4228,'巴东县'),(422825,4228,'宣恩县'),(422826,4228,'咸丰县'),(422827,4228,'来凤县'),(422828,4228,'鹤峰县'),(4290,42,'省直辖行政单位'),(429004,4290,'仙桃市'),(429005,4290,'潜江市'),(429006,4290,'天门市'),(429021,4290,'神农架林区'),(43,0,'湖南'),(4301,43,'长沙'),(430101,4301,'市辖区'),(430102,4301,'芙蓉区'),(430103,4301,'天心区'),(430104,4301,'岳麓区'),(430105,4301,'开福区'),(430111,4301,'雨花区'),(430121,4301,'长沙县'),(430122,4301,'望城县'),(430124,4301,'宁乡县'),(430181,4301,'浏阳市'),(4302,43,'株洲'),(430201,4302,'市辖区'),(430202,4302,'荷塘区'),(430203,4302,'芦淞区'),(430204,4302,'石峰区'),(430211,4302,'天元区'),(430221,4302,'株洲县'),(430223,4302,'攸  县'),(430224,4302,'茶陵县'),(430225,4302,'炎陵县'),(430281,4302,'醴陵市'),(4303,43,'湘潭'),(430301,4303,'市辖区'),(430302,4303,'雨湖区'),(430304,4303,'岳塘区'),(430321,4303,'湘潭县'),(430381,4303,'湘乡市'),(430382,4303,'韶山市'),(4304,43,'衡阳'),(430401,4304,'市辖区'),(430402,4304,'江东区'),(430403,4304,'城南区'),(430404,4304,'城北区'),(430411,4304,'郊   区'),(430412,4304,'南岳区'),(430421,4304,'衡阳县'),(430422,4304,'衡南县'),(430423,4304,'衡山县'),(430424,4304,'衡东县'),(430426,4304,'祁东县'),(430481,4304,'耒阳市'),(430482,4304,'常宁市'),(4305,43,'邵阳'),(430501,4305,'市辖区'),(430502,4305,'双清区'),(430503,4305,'大祥区'),(430511,4305,'北塔区'),(430521,4305,'邵东县'),(430522,4305,'新邵县'),(430523,4305,'邵阳县'),(430524,4305,'隆回县'),(430525,4305,'洞口县'),(430527,4305,'绥宁县'),(430528,4305,'新宁县'),(430529,4305,'城步苗族自治县'),(430581,4305,'武冈市'),(4306,43,'岳阳'),(430601,4306,'市辖区'),(430602,4306,'岳阳楼区'),(430603,4306,'云溪区'),(430611,4306,'君山区'),(430621,4306,'岳阳县'),(430623,4306,'华容县'),(430624,4306,'湘阴县'),(430626,4306,'平江县'),(430681,4306,'汨罗市'),(430682,4306,'临湘市'),(4307,43,'常德'),(430701,4307,'市辖区'),(430702,4307,'武陵区'),(430703,4307,'鼎城区'),(430721,4307,'安乡县'),(430722,4307,'汉寿县'),(430723,4307,'澧  县'),(430724,4307,'临澧县'),(430725,4307,'桃源县'),(430726,4307,'石门县'),(430781,4307,'津市市'),(4308,43,'张家界'),(430801,4308,'市辖区'),(430802,4308,'永定区'),(430811,4308,'武陵源区'),(430821,4308,'慈利县'),(430822,4308,'桑植县'),(4309,43,'益阳'),(430901,4309,'市辖区'),(430902,4309,'资阳区'),(430903,4309,'赫山区'),(430921,4309,'南  县'),(430922,4309,'桃江县'),(430923,4309,'安化县'),(430981,4309,'沅江市'),(4310,43,'郴州'),(431001,4310,'市辖区'),(431002,4310,'北湖区'),(431003,4310,'苏仙区'),(431021,4310,'桂阳县'),(431022,4310,'宜章县'),(431023,4310,'永兴县'),(431024,4310,'嘉禾县'),(431025,4310,'临武县'),(431026,4310,'汝城县'),(431027,4310,'桂东县'),(431028,4310,'安仁县'),(431081,4310,'资兴市'),(4311,43,'永州'),(431101,4311,'市辖区'),(431102,4311,'芝山区'),(431103,4311,'冷水滩区'),(431121,4311,'祁阳县'),(431122,4311,'东安县'),(431123,4311,'双牌县'),(431124,4311,'道  县'),(431125,4311,'江永县'),(431126,4311,'宁远县'),(431127,4311,'蓝山县'),(431128,4311,'新田县'),(431129,4311,'江华瑶族自治县'),(4312,43,'怀化'),(431201,4312,'市辖区'),(431202,4312,'鹤城区'),(431221,4312,'中方县'),(431222,4312,'沅陵县'),(431223,4312,'辰溪县'),(431224,4312,'溆浦县'),(431225,4312,'会同县'),(431226,4312,'麻阳苗族自治县'),(431227,4312,'新晃侗族自治县'),(431228,4312,'芷江侗族自治县'),(431229,4312,'靖州苗族侗族自治县'),(431230,4312,'通道侗族自治县'),(431281,4312,'洪江市'),(4313,43,'娄底'),(431301,4313,'市辖区'),(431302,4313,'娄星区'),(431321,4313,'双峰县'),(431322,4313,'新化县'),(431381,4313,'冷水江市'),(431382,4313,'涟源市'),(4331,43,'湘西土家族苗族自治州'),(433101,4331,'吉首市'),(433122,4331,'泸溪县'),(433123,4331,'凤凰县'),(433124,4331,'花垣县'),(433125,4331,'保靖县'),(433126,4331,'古丈县'),(433127,4331,'永顺县'),(433130,4331,'龙山县'),(44,0,'广东'),(4401,44,'广州'),(440101,4401,'市辖区'),(440102,4401,'东山区'),(440103,4401,'荔湾区'),(440104,4401,'越秀区'),(440105,4401,'海珠区'),(440106,4401,'天河区'),(440107,4401,'芳村区'),(440111,4401,'白云区'),(440112,4401,'黄埔区'),(440113,4401,'番禺区'),(440114,4401,'花都区'),(440183,4401,'增城市'),(440184,4401,'从化市'),(4402,44,'韶关'),(440201,4402,'市辖区'),(440202,4402,'北江区'),(440203,4402,'武江区'),(440204,4402,'浈江区'),(440221,4402,'曲江县'),(440222,4402,'始兴县'),(440224,4402,'仁化县'),(440229,4402,'翁源县'),(440232,4402,'乳源瑶族自治县'),(440233,4402,'新丰县'),(440281,4402,'乐昌市'),(440282,4402,'南雄市'),(4403,44,'深圳'),(440301,4403,'市辖区'),(440303,4403,'罗湖区'),(440304,4403,'福田区'),(440305,4403,'南山区'),(440306,4403,'宝安区'),(440307,4403,'龙岗区'),(440308,4403,'盐田区'),(4404,44,'珠海'),(440401,4404,'市辖区'),(440402,4404,'香洲区'),(440421,4404,'斗门县'),(4405,44,'汕头'),(440501,4405,'市辖区'),(440506,4405,'达濠区'),(440507,4405,'龙湖区'),(440508,4405,'金园区'),(440509,4405,'升平区'),(440510,4405,'河浦区'),(440523,4405,'南澳县'),(440582,4405,'潮阳市'),(440583,4405,'澄海市'),(4406,44,'佛山'),(440601,4406,'市辖区'),(440602,4406,'城  区'),(440603,4406,'石湾区'),(440681,4406,'顺德市'),(440682,4406,'南海市'),(440683,4406,'三水市'),(440684,4406,'高明市'),(4407,44,'江门'),(440701,4407,'市辖区'),(440703,4407,'蓬江区'),(440704,4407,'江海区'),(440781,4407,'台山市'),(440782,4407,'新会市'),(440783,4407,'开平市'),(440784,4407,'鹤山市'),(440785,4407,'恩平市'),(4408,44,'湛江'),(440801,4408,'市辖区'),(440802,4408,'赤坎区'),(440803,4408,'霞山区'),(440804,4408,'坡头区'),(440811,4408,'麻章区'),(440823,4408,'遂溪县'),(440825,4408,'徐闻县'),(440881,4408,'廉江市'),(440882,4408,'雷州市'),(440883,4408,'吴川市'),(4409,44,'茂名'),(440901,4409,'市辖区'),(440902,4409,'茂南区'),(440923,4409,'电白县'),(440981,4409,'高州市'),(440982,4409,'化州市'),(440983,4409,'信宜市'),(4412,44,'肇庆'),(441201,4412,'市辖区'),(441202,4412,'端州区'),(441203,4412,'鼎湖区'),(441223,4412,'广宁县'),(441224,4412,'怀集县'),(441225,4412,'封开县'),(441226,4412,'德庆县'),(441283,4412,'高要市'),(441284,4412,'四会市'),(4413,44,'惠州'),(441301,4413,'市辖区'),(441302,4413,'惠城区'),(441322,4413,'博罗县'),(441323,4413,'惠东县'),(441324,4413,'龙门县'),(441381,4413,'惠阳市'),(4414,44,'梅州'),(441401,4414,'市辖区'),(441402,4414,'梅江区'),(441421,4414,'梅  县'),(441422,4414,'大埔县'),(441423,4414,'丰顺县'),(441424,4414,'五华县'),(441426,4414,'平远县'),(441427,4414,'蕉岭县'),(441481,4414,'兴宁市'),(4415,44,'汕尾'),(441501,4415,'市辖区'),(441502,4415,'城  区'),(441521,4415,'海丰县'),(441523,4415,'陆河县'),(441581,4415,'陆丰市'),(4416,44,'河源'),(441601,4416,'市辖区'),(441602,4416,'源城区'),(441621,4416,'紫金县'),(441622,4416,'龙川县'),(441623,4416,'连平县'),(441624,4416,'和平县'),(441625,4416,'东源县'),(4417,44,'阳江'),(441701,4417,'市辖区'),(441702,4417,'江城区'),(441721,4417,'阳西县'),(441723,4417,'阳东县'),(441781,4417,'阳春市'),(4418,44,'清远'),(441801,4418,'市辖区'),(441802,4418,'清城区'),(441821,4418,'佛冈县'),(441823,4418,'阳山县'),(441825,4418,'连山壮族瑶族自治县'),(441826,4418,'连南瑶族自治县'),(441827,4418,'清新县'),(441881,4418,'英德市'),(441882,4418,'连州市'),(4419,44,'东莞'),(441901,4419,'莞城区'),(441902,4419,'东城区'),(441903,4419,'南城区'),(441904,4419,'万江区'),(4420,44,'中山'),(442001,4420,'石岐区'),(442002,4420,'东区'),(442003,4420,'西区'),(442004,4420,'南区'),(442005,4420,'五桂山'),(4451,44,'潮州'),(445101,4451,'市辖区'),(445102,4451,'湘桥区'),(445121,4451,'潮安县'),(445122,4451,'饶平县'),(4452,44,'揭阳'),(445201,4452,'市辖区'),(445202,4452,'榕城区'),(445221,4452,'揭东县'),(445222,4452,'揭西县'),(445224,4452,'惠来县'),(445281,4452,'普宁市'),(4453,44,'云浮'),(445301,4453,'市辖区'),(445302,4453,'云城区'),(445321,4453,'新兴县'),(445322,4453,'郁南县'),(445323,4453,'云安县'),(445381,4453,'罗定市'),(45,0,'广西'),(4501,45,'南宁'),(450101,4501,'市辖区'),(450102,4501,'兴宁区'),(450103,4501,'新城区'),(450104,4501,'城北区'),(450105,4501,'江南区'),(450106,4501,'永新区'),(450111,4501,'市郊区'),(450121,4501,'邕宁县'),(450122,4501,'武鸣县'),(4502,45,'柳州'),(450201,4502,'市辖区'),(450202,4502,'城中区'),(450203,4502,'鱼峰区'),(450204,4502,'柳南区'),(450205,4502,'柳北区'),(450211,4502,'市郊区'),(450221,4502,'柳江县'),(450222,4502,'柳城县'),(4503,45,'桂林'),(450301,4503,'市辖区'),(450302,4503,'秀峰区'),(450303,4503,'叠彩区'),(450304,4503,'象山区'),(450305,4503,'七星区'),(450311,4503,'雁山区'),(450321,4503,'阳朔县'),(450322,4503,'临桂县'),(450323,4503,'灵川县'),(450324,4503,'全州县'),(450325,4503,'兴安县'),(450326,4503,'永福县'),(450327,4503,'灌阳县'),(450328,4503,'龙胜各县自治区'),(450329,4503,'资源县'),(450330,4503,'平乐县'),(450331,4503,'荔蒲县'),(450332,4503,'恭城瑶族自治县'),(4504,45,'梧州'),(450401,4504,'市辖区'),(450403,4504,'万秀区'),(450404,4504,'蝶山区'),(450411,4504,'市郊区'),(450421,4504,'苍梧县'),(450422,4504,'藤  县'),(450423,4504,'蒙山县'),(450481,4504,'岑溪市'),(4505,45,'北海'),(450501,4505,'市辖区'),(450502,4505,'海城区'),(450503,4505,'银海区'),(450512,4505,'铁山港区'),(450521,4505,'合浦县'),(4506,45,'防城港'),(450601,4506,'市辖区'),(450602,4506,'港口区'),(450603,4506,'防城区'),(450621,4506,'上思县'),(450681,4506,'东兴市'),(4507,45,'钦州'),(450701,4507,'市辖区'),(450702,4507,'钦南区'),(450703,4507,'钦北区'),(450721,4507,'浦北县'),(450722,4507,'灵山县'),(4508,45,'贵港'),(450801,4508,'市辖区'),(450802,4508,'港北区'),(450803,4508,'港南区'),(450821,4508,'平南县'),(450881,4508,'桂平市'),(4509,45,'玉林'),(450901,4509,'市辖区'),(450902,4509,'玉州区'),(450921,4509,'容  县'),(450922,4509,'陆川县'),(450923,4509,'博白县'),(450924,4509,'兴业县'),(450981,4509,'北流市'),(4521,45,'南宁地区'),(452101,4521,'凭祥市'),(452122,4521,'横  县'),(452123,4521,'宾阳县'),(452124,4521,'上林县'),(452126,4521,'隆安县'),(452127,4521,'马山县'),(452128,4521,'扶绥县'),(452129,4521,'崇左县'),(452130,4521,'大新县'),(452131,4521,'天等县'),(452132,4521,'宁明县'),(452133,4521,'龙州县'),(4522,45,'柳州地区'),(452201,4522,'合山市'),(452223,4522,'鹿寨县'),(452224,4522,'象州县'),(452225,4522,'武宣县'),(452226,4522,'来宾县'),(452227,4522,'融安县'),(452228,4522,'三江侗族自治县'),(452229,4522,'融水苗族自治县'),(452230,4522,'金秀瑶族自治县'),(452231,4522,'忻城县'),(4524,45,'贺州地区'),(452402,4524,'贺州市'),(452424,4524,'昭平县'),(452427,4524,'钟山县'),(452428,4524,'富川瑶族自治县'),(4526,45,'百色地区'),(452601,4526,'百色市'),(452622,4526,'田阳县'),(452623,4526,'田东县'),(452624,4526,'平果县'),(452625,4526,'德保县'),(452626,4526,'靖西县'),(452627,4526,'那坡县'),(452628,4526,'凌云县'),(452629,4526,'乐业县'),(452630,4526,'田林县'),(452631,4526,'隆林各族自治县'),(452632,4526,'西林县'),(4527,45,'河池地区'),(452701,4527,'河池市'),(452702,4527,'宜州市'),(452723,4527,'罗城仫佬族自治县'),(452724,4527,'环江毛南族自治县'),(452725,4527,'南丹县'),(452726,4527,'天峨县'),(452727,4527,'凤山县'),(452728,4527,'东兰县'),(452729,4527,'巴马瑶族自治县'),(452730,4527,'都安瑶族自治县'),(452731,4527,'大化瑶族自治县'),(46,0,'海南'),(4601,46,'海南'),(460101,4601,'通什市'),(460102,4601,'琼海市'),(460103,4601,'儋州市'),(460104,4601,'琼山市'),(460105,4601,'文昌市'),(460106,4601,'万宁市'),(460107,4601,'东方市'),(460125,4601,'定安县'),(460126,4601,'屯昌县'),(460127,4601,'澄迈县'),(460128,4601,'临高县'),(460130,4601,'白沙黎族自治县'),(460131,4601,'昌江黎族自治县'),(460133,4601,'乐东黎族自治县'),(460134,4601,'陵水黎族自治县'),(460135,4601,'保亭黎族苗族自治县'),(460136,4601,'琼中黎族苗族自治县'),(460137,4601,'西沙群岛'),(460138,4601,'南沙群岛'),(460139,4601,'中沙群岛的岛礁及其海'),(4602,46,'海口'),(460201,4602,'市辖区'),(460202,4602,'振东区'),(460203,4602,'新华区'),(460204,4602,'秀英区'),(4603,46,'三亚'),(460301,4603,'市辖区'),(50,0,'重庆'),(5001,50,'重庆市辖'),(500101,5001,'万州区'),(500102,5001,'涪陵区'),(500103,5001,'渝中区'),(500104,5001,'大渡口区'),(500105,5001,'江北区'),(500106,5001,'沙坪坝区'),(500107,5001,'九龙坡区'),(500108,5001,'南岸区'),(500109,5001,'北碚区'),(500110,5001,'万盛区'),(500111,5001,'双桥区'),(500112,5001,'渝北区'),(500113,5001,'巴南区'),(500114,5001,'黔江区'),(5002,50,'重庆县辖'),(500221,5002,'长寿县'),(500222,5002,'綦江县'),(500223,5002,'潼南县'),(500224,5002,'铜梁县'),(500225,5002,'大足县'),(500226,5002,'荣昌县'),(500227,5002,'璧山县'),(500228,5002,'梁平县'),(500229,5002,'城口县'),(500230,5002,'丰都县'),(500231,5002,'垫江县'),(500232,5002,'武隆县'),(500233,5002,'忠  县'),(500234,5002,'开  县'),(500235,5002,'云阳县'),(500236,5002,'奉节县'),(500237,5002,'巫山县'),(500238,5002,'巫溪县'),(500240,5002,'石柱土家族自治县'),(500241,5002,'秀山土家族苗族自治县'),(500242,5002,'酉阳土家族苗族自治县'),(500243,5002,'彭水苗族土家族自治县'),(5003,50,'重庆县级'),(500381,5003,'江津市'),(500382,5003,'合川市'),(500383,5003,'永川市'),(500384,5003,'南川市'),(51,0,'四川'),(5101,51,'成都'),(510101,5101,'市辖区'),(510103,5101,'高新区'),(510104,5101,'锦江区'),(510105,5101,'青羊区'),(510106,5101,'金牛区'),(510107,5101,'武侯区'),(510108,5101,'成华区'),(510112,5101,'龙泉驿区'),(510113,5101,'青白江区'),(510121,5101,'金堂县'),(510122,5101,'双流县'),(510123,5101,'温江县'),(510124,5101,'郫  县'),(510125,5101,'新都县'),(510129,5101,'大邑县'),(510131,5101,'蒲江县'),(510132,5101,'新津县'),(510181,5101,'都江堰市'),(510182,5101,'彭州市'),(510183,5101,'邛崃市'),(510184,5101,'崇州市'),(5103,51,'自贡'),(510301,5103,'市辖区'),(510302,5103,'自流井区'),(510303,5103,'贡井区'),(510304,5103,'大安区'),(510311,5103,'沿滩区'),(510321,5103,'荣  县'),(510322,5103,'富顺县'),(5104,51,'攀枝花'),(510401,5104,'市辖区'),(510402,5104,'东  区'),(510403,5104,'西  区'),(510411,5104,'仁和区'),(510421,5104,'米易县'),(510422,5104,'盐边县'),(5105,51,'泸州'),(510501,5105,'市辖区'),(510502,5105,'江阳区'),(510503,5105,'纳溪区'),(510504,5105,'龙马潭区'),(510521,5105,'泸  县'),(510522,5105,'合江县'),(510524,5105,'叙永县'),(510525,5105,'古蔺县'),(5106,51,'德阳'),(510601,5106,'市辖区'),(510603,5106,'旌阳区'),(510623,5106,'中江县'),(510626,5106,'罗江县'),(510681,5106,'广汉市'),(510682,5106,'什邡市'),(510683,5106,'绵竹市'),(5107,51,'绵阳'),(510701,5107,'市辖区'),(510703,5107,'涪城区'),(510704,5107,'游仙区'),(510710,5107,'科学城区'),(510722,5107,'三台县'),(510723,5107,'盐亭县'),(510724,5107,'安  县'),(510725,5107,'梓潼县'),(510726,5107,'北川县'),(510727,5107,'平武县'),(510781,5107,'江油市'),(5108,51,'广元'),(510801,5108,'市辖区'),(510802,5108,'市中区'),(510811,5108,'元坝区'),(510812,5108,'朝天区'),(510821,5108,'旺苍县'),(510822,5108,'青川县'),(510823,5108,'剑阁县'),(510824,5108,'苍溪县'),(5109,51,'遂宁'),(510901,5109,'市辖区'),(510902,5109,'市中区'),(510921,5109,'蓬溪县'),(510922,5109,'射洪县'),(510923,5109,'大英县'),(5110,51,'内江'),(511001,5110,'市辖区'),(511002,5110,'市中区'),(511011,5110,'东兴区'),(511024,5110,'威远县'),(511025,5110,'资中县'),(511028,5110,'隆昌县'),(5111,51,'乐山'),(511101,5111,'市辖区'),(511102,5111,'市中区'),(511111,5111,'沙湾区'),(511112,5111,'五通桥区'),(511113,5111,'金口河区'),(511123,5111,'犍为县'),(511124,5111,'井研县'),(511126,5111,'夹江县'),(511129,5111,'沐川县'),(511132,5111,'峨边彝族自治县'),(511133,5111,'马边彝族自治县'),(511181,5111,'峨眉山市'),(5113,51,'南充'),(511301,5113,'市辖区'),(511302,5113,'顺庆区'),(511303,5113,'高坪区'),(511304,5113,'嘉陵区'),(511321,5113,'南部县'),(511322,5113,'营山县'),(511323,5113,'蓬安县'),(511324,5113,'仪陇县'),(511325,5113,'西充县'),(511381,5113,'阆中市'),(5114,51,'眉山'),(511401,5114,'市辖区'),(511402,5114,'东坡区'),(511421,5114,'仁寿县'),(511422,5114,'彭山县'),(511423,5114,'洪雅县'),(511424,5114,'丹棱县'),(511425,5114,'青神县'),(5115,51,'宜宾'),(511501,5115,'市辖区'),(511502,5115,'翠屏区'),(511521,5115,'宜宾县'),(511522,5115,'南溪县'),(511523,5115,'江安县'),(511524,5115,'长宁县'),(511525,5115,'高  县'),(511526,5115,'珙  县'),(511527,5115,'筠连县'),(511528,5115,'兴文县'),(511529,5115,'屏山县'),(5116,51,'广安'),(511601,5116,'市辖区'),(511602,5116,'广安区'),(511621,5116,'岳池县'),(511622,5116,'武胜县'),(511623,5116,'邻水县'),(511681,5116,'华蓥市'),(5117,51,'达州'),(511701,5117,'市辖区'),(511702,5117,'通川区'),(511721,5117,'达  县'),(511722,5117,'宣汉县'),(511723,5117,'开江县'),(511724,5117,'大竹县'),(511725,5117,'渠  县'),(511781,5117,'万源市'),(5118,51,'雅安'),(511801,5118,'市辖区'),(511802,5118,'雨城区'),(511821,5118,'名山县'),(511822,5118,'荥经县'),(511823,5118,'汉源县'),(511824,5118,'石棉县'),(511825,5118,'天全县'),(511826,5118,'芦山县'),(511827,5118,'宝兴县'),(5119,51,'巴中'),(511901,5119,'市辖区'),(511902,5119,'巴州区'),(511921,5119,'通江县'),(511922,5119,'南江县'),(511923,5119,'平昌县'),(5120,51,'资阳'),(512001,5120,'市辖区'),(512002,5120,'雁江区'),(512021,5120,'安岳县'),(512022,5120,'乐至县'),(512081,5120,'简阳市'),(5132,51,'阿坝藏族羌族自治州'),(513221,5132,'汶川县'),(513222,5132,'理  县'),(513223,5132,'茂  县'),(513224,5132,'松潘县'),(513225,5132,'九寨沟县'),(513226,5132,'金川县'),(513227,5132,'小金县'),(513228,5132,'黑水县'),(513229,5132,'马尔康县'),(513230,5132,'壤塘县'),(513231,5132,'阿坝县'),(513232,5132,'若尔盖县'),(513233,5132,'红原县'),(5133,51,'甘孜藏族自治州'),(513321,5133,'康定县'),(513322,5133,'泸定县'),(513323,5133,'丹巴县'),(513324,5133,'九龙县'),(513325,5133,'雅江县'),(513326,5133,'道孚县'),(513327,5133,'炉霍县'),(513328,5133,'甘孜县'),(513329,5133,'新龙县'),(513330,5133,'德格县'),(513331,5133,'白玉县'),(513332,5133,'石渠县'),(513333,5133,'色达县'),(513334,5133,'理塘县'),(513335,5133,'巴塘县'),(513336,5133,'乡城县'),(513337,5133,'稻城县'),(513338,5133,'得荣县'),(5134,51,'凉山彝族自治州'),(513401,5134,'西昌市'),(513422,5134,'木里藏族自治县'),(513423,5134,'盐源县'),(513424,5134,'德昌县'),(513425,5134,'会理县'),(513426,5134,'会东县'),(513427,5134,'宁南县'),(513428,5134,'普格县'),(513429,5134,'布拖县'),(513430,5134,'金阳县'),(513431,5134,'昭觉县'),(513432,5134,'喜德县'),(513433,5134,'冕宁县'),(513434,5134,'越西县'),(513435,5134,'甘洛县'),(513436,5134,'美姑县'),(513437,5134,'雷波县'),(52,0,'贵州'),(5201,52,'贵阳'),(520101,5201,'市辖区'),(520102,5201,'南明区'),(520103,5201,'云岩区'),(520111,5201,'花溪区'),(520112,5201,'乌当区'),(520113,5201,'白云区'),(520114,5201,'小河区'),(520121,5201,'开阳县'),(520122,5201,'息烽县'),(520123,5201,'修文县'),(520181,5201,'清镇市'),(5202,52,'六盘水'),(520201,5202,'钟山区'),(520203,5202,'六枝特区'),(520221,5202,'水城县'),(520222,5202,'盘  县'),(5203,52,'遵义'),(520301,5203,'市辖区'),(520302,5203,'红花岗区'),(520321,5203,'遵义县'),(520322,5203,'桐梓县'),(520323,5203,'绥阳县'),(520324,5203,'正安县'),(520325,5203,'道真仡佬族苗族自治县'),(520326,5203,'务川仡佬族苗族自治县'),(520327,5203,'凤冈县'),(520328,5203,'湄潭县'),(520329,5203,'余庆县'),(520330,5203,'习水县'),(520381,5203,'赤水市'),(520382,5203,'仁怀市'),(5204,52,'安顺'),(520401,5204,'市辖区'),(520402,5204,'西秀区'),(520421,5204,'平坝县'),(520422,5204,'普定县'),(520423,5204,'镇宁布依族苗族自治县'),(520424,5204,'关岭布依族苗族自治县'),(520425,5204,'紫云苗族布依族自治县'),(5222,52,'铜仁地区'),(522201,5222,'铜仁市'),(522222,5222,'江口县'),(522223,5222,'玉屏侗族自治县'),(522224,5222,'石阡县'),(522225,5222,'思南县'),(522226,5222,'印江土家族苗族自治县'),(522227,5222,'德江县'),(522228,5222,'沿河土家族自治县'),(522229,5222,'松桃苗族自治县'),(522230,5222,'万山特区'),(5223,52,'黔西南布依族苗族自治'),(522301,5223,'兴义市'),(522322,5223,'兴仁县'),(522323,5223,'普安县'),(522324,5223,'晴隆县'),(522325,5223,'贞丰县'),(522326,5223,'望谟县'),(522327,5223,'册亨县'),(522328,5223,'安龙县'),(5224,52,'毕节地区'),(522401,5224,'毕节市'),(522422,5224,'大方县'),(522423,5224,'黔西县'),(522424,5224,'金沙县'),(522425,5224,'织金县'),(522426,5224,'纳雍县'),(522427,5224,'威宁彝族回族苗族自治'),(522428,5224,'赫章县'),(5226,52,'黔东南苗族侗族自治州'),(522601,5226,'凯里市'),(522622,5226,'黄平县'),(522623,5226,'施秉县'),(522624,5226,'三穗县'),(522625,5226,'镇远县'),(522626,5226,'岑巩县'),(522627,5226,'天柱县'),(522628,5226,'锦屏县'),(522629,5226,'剑河县'),(522630,5226,'台江县'),(522631,5226,'黎平县'),(522632,5226,'榕江县'),(522633,5226,'从江县'),(522634,5226,'雷山县'),(522635,5226,'麻江县'),(522636,5226,'丹寨县'),(5227,52,'黔南布依族苗族自治州'),(522701,5227,'都匀市'),(522702,5227,'福泉市'),(522722,5227,'荔波县'),(522723,5227,'贵定县'),(522725,5227,'瓮安县'),(522726,5227,'独山县'),(522727,5227,'平塘县'),(522728,5227,'罗甸县'),(522729,5227,'长顺县'),(522730,5227,'龙里县'),(522731,5227,'惠水县'),(522732,5227,'三都水族自治县'),(53,0,'云南'),(5301,53,'昆明'),(530101,5301,'市辖区'),(530102,5301,'五华区'),(530103,5301,'盘龙区'),(530111,5301,'官渡区'),(530112,5301,'西山区'),(530113,5301,'东川区'),(530121,5301,'呈贡县'),(530122,5301,'晋宁县'),(530124,5301,'富民县'),(530125,5301,'宜良县'),(530126,5301,'石林彝族自治县'),(530127,5301,'嵩明县'),(530128,5301,'禄劝彝族苗族自治县'),(530129,5301,'寻甸回族彝族自治县'),(530181,5301,'安宁市'),(5303,53,'曲靖'),(530301,5303,'市辖区'),(530302,5303,'麒麟区'),(530321,5303,'马龙县'),(530322,5303,'陆良县'),(530323,5303,'师宗县'),(530324,5303,'罗平县'),(530325,5303,'富源县'),(530326,5303,'会泽县'),(530328,5303,'沾益县'),(530381,5303,'宣威市'),(5304,53,'玉溪'),(530401,5304,'市辖区'),(530402,5304,'红塔区'),(530421,5304,'江川县'),(530422,5304,'澄江县'),(530423,5304,'通海县'),(530424,5304,'华宁县'),(530425,5304,'易门县'),(530426,5304,'峨山彝族自治县'),(530427,5304,'新平彝族傣族自治县'),(530428,5304,'元江哈尼族彝族傣族自'),(5305,53,'保山'),(530501,5305,'市辖区'),(530502,5305,'隆阳区'),(530521,5305,'施甸县'),(530522,5305,'腾冲县'),(530523,5305,'龙陵县'),(530524,5305,'昌宁县'),(5321,53,'昭通地区'),(532101,5321,'昭通市'),(532122,5321,'鲁甸县'),(532123,5321,'巧家县'),(532124,5321,'盐津县'),(532125,5321,'大关县'),(532126,5321,'永善县'),(532127,5321,'绥江县'),(532128,5321,'镇雄县'),(532129,5321,'彝良县'),(532130,5321,'威信县'),(532131,5321,'水富县'),(5323,53,'楚雄彝族自治州'),(532301,5323,'楚雄市'),(532322,5323,'双柏县'),(532323,5323,'牟定县'),(532324,5323,'南华县'),(532325,5323,'姚安县'),(532326,5323,'大姚县'),(532327,5323,'永仁县'),(532328,5323,'元谋县'),(532329,5323,'武定县'),(532331,5323,'禄丰县'),(5325,53,'红河哈尼族彝族自治州'),(532501,5325,'个旧市'),(532502,5325,'开远市'),(532522,5325,'蒙自县'),(532523,5325,'屏边苗族自治县'),(532524,5325,'建水县'),(532525,5325,'石屏县'),(532526,5325,'弥勒县'),(532527,5325,'泸西县'),(532528,5325,'元阳县'),(532529,5325,'红河县'),(532530,5325,'金平苗族瑶族傣族自治'),(532531,5325,'绿春县'),(532532,5325,'河口瑶族自治县'),(5326,53,'文山壮族苗族自治州'),(532621,5326,'文山县'),(532622,5326,'砚山县'),(532623,5326,'西畴县'),(532624,5326,'麻栗坡县'),(532625,5326,'马关县'),(532626,5326,'丘北县'),(532627,5326,'广南县'),(532628,5326,'富宁县'),(5327,53,'思茅地区'),(532701,5327,'思茅市'),(532722,5327,'普洱哈尼族彝族自治县'),(532723,5327,'墨江哈尼族自治县'),(532724,5327,'景东彝族自治县'),(532725,5327,'景谷傣族彝族自治县'),(532726,5327,'镇沅彝族哈尼族拉祜族'),(532727,5327,'江城哈尼族彝族自治县'),(532728,5327,'孟连傣族拉祜族佤族自'),(532729,5327,'澜沧拉祜族自治县'),(532730,5327,'西盟佤族自治县'),(5328,53,'西双版纳傣族自治州'),(532801,5328,'景洪市'),(532822,5328,'勐海县'),(532823,5328,'勐腊县'),(5329,53,'大理白族自治州'),(532901,5329,'大理市'),(532922,5329,'漾濞彝族自治县'),(532923,5329,'祥云县'),(532924,5329,'宾川县'),(532925,5329,'弥渡县'),(532926,5329,'南涧彝族自治县'),(532927,5329,'巍山彝族回族自治县'),(532928,5329,'永平县'),(532929,5329,'云龙县'),(532930,5329,'洱源县'),(532931,5329,'剑川县'),(532932,5329,'鹤庆县'),(5331,53,'德宏傣族景颇族自治州'),(533102,5331,'瑞丽市'),(533103,5331,'潞西市'),(533122,5331,'梁河县'),(533123,5331,'盈江县'),(533124,5331,'陇川县'),(5332,53,'丽江地区'),(533221,5332,'丽江纳西族自治县'),(533222,5332,'永胜县'),(533223,5332,'华坪县'),(533224,5332,'宁蒗彝族自治县'),(5333,53,'怒江傈僳族自治州'),(533321,5333,'泸水县'),(533323,5333,'福贡县'),(533324,5333,'贡山独龙族怒族自治县'),(533325,5333,'兰坪白族普米族自治县'),(5334,53,'迪庆藏族自治州'),(533421,5334,'中甸县'),(533422,5334,'德钦县'),(533423,5334,'维西傈僳族自治县'),(5335,53,'临沧地区'),(533521,5335,'临沧县'),(533522,5335,'凤庆县'),(533523,5335,'云  县'),(533524,5335,'永德县'),(533525,5335,'镇康县'),(533526,5335,'双江拉祜族佤族布朗族'),(533527,5335,'耿马傣族佤族自治县'),(533528,5335,'沧源佤族自治县'),(54,0,'西藏'),(5401,54,'拉萨'),(540101,5401,'市辖区'),(540102,5401,'城关区'),(540121,5401,'林周县'),(540122,5401,'当雄县'),(540123,5401,'尼木县'),(540124,5401,'曲水县'),(540125,5401,'堆龙德庆县'),(540126,5401,'达孜县'),(540127,5401,'墨竹工卡县'),(5421,54,'昌都地区'),(542121,5421,'昌都县'),(542122,5421,'江达县'),(542123,5421,'贡觉县'),(542124,5421,'类乌齐县'),(542125,5421,'丁青县'),(542126,5421,'察雅县'),(542127,5421,'八宿县'),(542128,5421,'左贡县'),(542129,5421,'芒康县'),(542132,5421,'洛隆县'),(542133,5421,'边坝县'),(5422,54,'山南地区'),(542221,5422,'乃东县'),(542222,5422,'扎囊县'),(542223,5422,'贡嘎县'),(542224,5422,'桑日县'),(542225,5422,'琼结县'),(542226,5422,'曲松县'),(542227,5422,'措美县'),(542228,5422,'洛扎县'),(542229,5422,'加查县'),(542231,5422,'隆子县'),(542232,5422,'错那县'),(542233,5422,'浪卡子县'),(5423,54,'日喀则地区'),(542301,5423,'日喀则市'),(542322,5423,'南木林县'),(542323,5423,'江孜县'),(542324,5423,'定日县'),(542325,5423,'萨迦县'),(542326,5423,'拉孜县'),(542327,5423,'昂仁县'),(542328,5423,'谢通门县'),(542329,5423,'白朗县'),(542330,5423,'仁布县'),(542331,5423,'康马县'),(542332,5423,'定结县'),(542333,5423,'仲巴县'),(542334,5423,'亚东县'),(542335,5423,'吉隆县'),(542336,5423,'聂拉木县'),(542337,5423,'萨嘎县'),(542338,5423,'岗巴县'),(5424,54,'那曲地区'),(542421,5424,'那曲县'),(542422,5424,'嘉黎县'),(542423,5424,'比如县'),(542424,5424,'聂荣县'),(542425,5424,'安多县'),(542426,5424,'申扎县'),(542427,5424,'索  县'),(542428,5424,'班戈县'),(542429,5424,'巴青县'),(542430,5424,'尼玛县'),(5425,54,'阿里地区'),(542521,5425,'普兰县'),(542522,5425,'札达县'),(542523,5425,'噶尔县'),(542524,5425,'日土县'),(542525,5425,'革吉县'),(542526,5425,'改则县'),(542527,5425,'措勤县'),(5426,54,'林芝地区'),(542621,5426,'林芝县'),(542622,5426,'工布江达县'),(542623,5426,'米林县'),(542624,5426,'墨脱县'),(542625,5426,'波密县'),(542626,5426,'察隅县'),(542627,5426,'朗  县'),(61,0,'陕西'),(6101,61,'西安'),(610101,6101,'市辖区'),(610102,6101,'新城区'),(610103,6101,'碑林区'),(610104,6101,'莲湖区'),(610111,6101,'灞桥区'),(610112,6101,'未央区'),(610113,6101,'雁塔区'),(610114,6101,'阎良区'),(610115,6101,'临潼区'),(610121,6101,'长安县'),(610122,6101,'蓝田县'),(610124,6101,'周至县'),(610125,6101,'户  县'),(610126,6101,'高陵县'),(6102,61,'铜川'),(610201,6102,'市辖区'),(610202,6102,'王益区'),(610203,6102,'印台区'),(610221,6102,'耀  县'),(610222,6102,'宜君县'),(6103,61,'宝鸡'),(610301,6103,'市辖区'),(610302,6103,'渭滨区'),(610303,6103,'金台区'),(610321,6103,'宝鸡县'),(610322,6103,'凤翔县'),(610323,6103,'岐山县'),(610324,6103,'扶风县'),(610326,6103,'眉  县'),(610327,6103,'陇  县'),(610328,6103,'千阳县'),(610329,6103,'麟游县'),(610330,6103,'凤  县'),(610331,6103,'太白县'),(6104,61,'咸阳'),(610401,6104,'市辖区'),(610402,6104,'秦都区'),(610403,6104,'杨陵区'),(610404,6104,'渭城区'),(610422,6104,'三原县'),(610423,6104,'泾阳县'),(610424,6104,'乾  县'),(610425,6104,'礼泉县'),(610426,6104,'永寿县'),(610427,6104,'彬  县'),(610428,6104,'长武县'),(610429,6104,'旬邑县'),(610430,6104,'淳化县'),(610431,6104,'武功县'),(610481,6104,'兴平市'),(6105,61,'渭南'),(610501,6105,'市辖区'),(610502,6105,'临渭区'),(610521,6105,'华  县'),(610522,6105,'潼关县'),(610523,6105,'大荔县'),(610524,6105,'合阳县'),(610525,6105,'澄城县'),(610526,6105,'蒲城县'),(610527,6105,'白水县'),(610528,6105,'富平县'),(610581,6105,'韩城市'),(610582,6105,'华阴市'),(6106,61,'延安'),(610601,6106,'市辖区'),(610602,6106,'宝塔区'),(610621,6106,'延长县'),(610622,6106,'延川县'),(610623,6106,'子长县'),(610624,6106,'安塞县'),(610625,6106,'志丹县'),(610626,6106,'吴旗县'),(610627,6106,'甘泉县'),(610628,6106,'富  县'),(610629,6106,'洛川县'),(610630,6106,'宜川县'),(610631,6106,'黄龙县'),(610632,6106,'黄陵县'),(6107,61,'汉中'),(610701,6107,'市辖区'),(610702,6107,'汉台区'),(610721,6107,'南郑县'),(610722,6107,'城固县'),(610723,6107,'洋  县'),(610724,6107,'西乡县'),(610725,6107,'勉  县'),(610726,6107,'宁强县'),(610727,6107,'略阳县'),(610728,6107,'镇巴县'),(610729,6107,'留坝县'),(610730,6107,'佛坪县'),(6108,61,'榆林'),(610801,6108,'市辖区'),(610802,6108,'榆阳区'),(610821,6108,'神木县'),(610822,6108,'府谷县'),(610823,6108,'横山县'),(610824,6108,'靖边县'),(610825,6108,'定边县'),(610826,6108,'绥德县'),(610827,6108,'米脂县'),(610828,6108,'佳  县'),(610829,6108,'吴堡县'),(610830,6108,'清涧县'),(610831,6108,'子洲县'),(6109,61,'安康'),(610901,6109,'市辖区'),(610902,6109,'汉滨区'),(610921,6109,'汉阴县'),(610922,6109,'石泉县'),(610923,6109,'宁陕县'),(610924,6109,'紫阳县'),(610925,6109,'岚皋县'),(610926,6109,'平利县'),(610927,6109,'镇坪县'),(610928,6109,'旬阳县'),(610929,6109,'白河县'),(6125,61,'商洛地区'),(612501,6125,'商州市'),(612522,6125,'洛南县'),(612523,6125,'丹凤县'),(612524,6125,'商南县'),(612525,6125,'山阳县'),(612526,6125,'镇安县'),(612527,6125,'柞水县'),(62,0,'甘肃'),(6201,62,'兰州'),(620101,6201,'市辖区'),(620102,6201,'城关区'),(620103,6201,'七里河区'),(620104,6201,'西固区'),(620105,6201,'安宁区'),(620111,6201,'红古区'),(620121,6201,'永登县'),(620122,6201,'皋兰县'),(620123,6201,'榆中县'),(6202,62,'嘉峪关'),(620201,6202,'市辖区'),(6203,62,'金昌'),(620301,6203,'市辖区'),(620302,6203,'金川区'),(620321,6203,'永昌县'),(6204,62,'白银'),(620401,6204,'市辖区'),(620402,6204,'白银区'),(620403,6204,'平川区'),(620421,6204,'靖远县'),(620422,6204,'会宁县'),(620423,6204,'景泰县'),(6205,62,'天水'),(620501,6205,'市辖区'),(620502,6205,'秦城区'),(620503,6205,'北道区'),(620521,6205,'清水县'),(620522,6205,'秦安县'),(620523,6205,'甘谷县'),(620524,6205,'武山县'),(620525,6205,'张家川回族自治县'),(6221,62,'酒泉地区'),(622101,6221,'玉门市'),(622102,6221,'酒泉市'),(622103,6221,'敦煌市'),(622123,6221,'金塔县'),(622124,6221,'肃北蒙古族自治县'),(622125,6221,'阿克塞哈萨克族自治县'),(622126,6221,'安西县'),(6222,62,'张掖地区'),(622201,6222,'张掖市'),(622222,6222,'肃南裕固族自治县'),(622223,6222,'民乐县'),(622224,6222,'临泽县'),(622225,6222,'高台县'),(622226,6222,'山丹县'),(6223,62,'武威地区'),(622301,6223,'武威市'),(622322,6223,'民勤县'),(622323,6223,'古浪县'),(622326,6223,'天祝藏族自治县'),(6224,62,'定西地区'),(622421,6224,'定西县'),(622424,6224,'通渭县'),(622425,6224,'陇西县'),(622426,6224,'渭源县'),(622427,6224,'临洮县'),(622428,6224,'漳  县'),(622429,6224,'岷  县'),(6226,62,'陇南地区'),(622621,6226,'武都县'),(622623,6226,'宕昌县'),(622624,6226,'成  县'),(622625,6226,'康  县'),(622626,6226,'文  县'),(622627,6226,'西和县'),(622628,6226,'礼  县'),(622629,6226,'两当县'),(622630,6226,'徽  县'),(6227,62,'平凉地区'),(622701,6227,'平凉市'),(622722,6227,'泾川县'),(622723,6227,'灵台县'),(622724,6227,'崇信县'),(622725,6227,'华亭县'),(622726,6227,'庄浪县'),(622727,6227,'静宁县'),(6228,62,'庆阳地区'),(622801,6228,'西峰市'),(622821,6228,'庆阳县'),(622822,6228,'环  县'),(622823,6228,'华池县'),(622824,6228,'合水县'),(622825,6228,'正宁县'),(622826,6228,'宁  县'),(622827,6228,'镇原县'),(6229,62,'临夏回族自治州'),(622901,6229,'临夏市'),(622921,6229,'临夏县'),(622922,6229,'康乐县'),(622923,6229,'永靖县'),(622924,6229,'广河县'),(622925,6229,'和政县'),(622926,6229,'东乡族自治县'),(622927,6229,'积石山保安族东乡族撒'),(6230,62,'甘南藏族自治州'),(623001,6230,'合作市'),(623021,6230,'临潭县'),(623022,6230,'卓尼县'),(623023,6230,'舟曲县'),(623024,6230,'迭部县'),(623025,6230,'玛曲县'),(623026,6230,'碌曲县'),(623027,6230,'夏河县'),(63,0,'青海'),(6301,63,'西宁'),(630101,6301,'市辖区'),(630102,6301,'城东区'),(630103,6301,'城中区'),(630104,6301,'城西区'),(630105,6301,'城北区'),(630121,6301,'大通回族土族自治县'),(630122,6301,'湟中县'),(630123,6301,'湟源县'),(6321,63,'海东地区'),(632121,6321,'平安县'),(632122,6321,'民和回族土族自治县'),(632123,6321,'乐都县'),(632126,6321,'互助土族自治县'),(632127,6321,'化隆回族自治县'),(632128,6321,'循化撒拉族自治县'),(6322,63,'海北藏族自治州'),(632221,6322,'门源回族自治县'),(632222,6322,'祁连县'),(632223,6322,'海晏县'),(632224,6322,'刚察县'),(6323,63,'黄南藏族自治州'),(632321,6323,'同仁县'),(632322,6323,'尖扎县'),(632323,6323,'泽库县'),(632324,6323,'河南蒙古族自治县'),(6325,63,'海南藏族自治州'),(632521,6325,'共和县'),(632522,6325,'同德县'),(632523,6325,'贵德县'),(632524,6325,'兴海县'),(632525,6325,'贵南县'),(6326,63,'果洛藏族自治州'),(632621,6326,'玛沁县'),(632622,6326,'班玛县'),(632623,6326,'甘德县'),(632624,6326,'达日县'),(632625,6326,'久治县'),(632626,6326,'玛多县'),(6327,63,'玉树藏族自治州'),(632721,6327,'玉树县'),(632722,6327,'杂多县'),(632723,6327,'称多县'),(632724,6327,'治多县'),(632725,6327,'囊谦县'),(632726,6327,'曲麻莱县'),(6328,63,'海西蒙古族藏族自治州'),(632801,6328,'格尔木市'),(632802,6328,'德令哈市'),(632821,6328,'乌兰县'),(632822,6328,'都兰县'),(632823,6328,'天峻县'),(64,0,'宁夏回族自治区'),(6401,64,'银川'),(640101,6401,'市辖区'),(640102,6401,'城  区'),(640103,6401,'新城区'),(640111,6401,'郊  区'),(640121,6401,'永宁县'),(640122,6401,'贺兰县'),(6402,64,'石嘴山'),(640201,6402,'市辖区'),(640202,6402,'大武口区'),(640203,6402,'石嘴山区'),(640204,6402,'石炭井区'),(640221,6402,'平罗县'),(640222,6402,'陶乐县'),(640223,6402,'惠农县'),(6403,64,'吴忠'),(640301,6403,'市辖区'),(640302,6403,'利通区'),(640321,6403,'中卫县'),(640322,6403,'中宁县'),(640323,6403,'盐池县'),(640324,6403,'同心县'),(640381,6403,'青铜峡市'),(640382,6403,'灵武市'),(6422,64,'固原地区'),(642221,6422,'固原县'),(642222,6422,'海原县'),(642223,6422,'西吉县'),(642224,6422,'隆德县'),(642225,6422,'泾源县'),(642226,6422,'彭阳县'),(65,0,'新疆维吾尔自治区'),(6501,65,'乌鲁木齐'),(650101,6501,'市辖区'),(650102,6501,'天山区'),(650103,6501,'沙依巴克区'),(650104,6501,'新市区'),(650105,6501,'水磨沟区'),(650106,6501,'头屯河区'),(650107,6501,'南泉区'),(650108,6501,'东山区'),(650121,6501,'乌鲁木齐县'),(6502,65,'克拉玛依'),(650201,6502,'市辖区'),(650202,6502,'独山子区'),(650203,6502,'克拉玛依区'),(650204,6502,'白碱滩区'),(650205,6502,'乌尔禾区'),(6521,65,'吐鲁番地区'),(652101,6521,'吐鲁番市'),(652122,6521,'鄯善县'),(652123,6521,'托克逊县'),(6522,65,'哈密地区'),(652201,6522,'哈密市'),(652222,6522,'巴里坤哈萨克自治县'),(652223,6522,'伊吾县'),(6523,65,'昌吉回族自治州'),(652301,6523,'昌吉市'),(652302,6523,'阜康市'),(652303,6523,'米泉市'),(652323,6523,'呼图壁县'),(652324,6523,'玛纳斯县'),(652325,6523,'奇台县'),(652327,6523,'吉木萨尔县'),(652328,6523,'木垒哈萨克自治县'),(6527,65,'博尔塔拉蒙古自治州'),(652701,6527,'博乐市'),(652722,6527,'精河县'),(652723,6527,'温泉县'),(6528,65,'巴音郭楞蒙古自治州'),(652801,6528,'库尔勒市'),(652822,6528,'轮台县'),(652823,6528,'尉犁县'),(652824,6528,'若羌县'),(652825,6528,'且末县'),(652826,6528,'焉耆回族自治县'),(652827,6528,'和静县'),(652828,6528,'和硕县'),(652829,6528,'博湖县'),(6529,65,'阿克苏地区'),(652901,6529,'阿克苏市'),(652922,6529,'温宿县'),(652923,6529,'库车县'),(652924,6529,'沙雅县'),(652925,6529,'新和县'),(652926,6529,'拜城县'),(652927,6529,'乌什县'),(652928,6529,'阿瓦提县'),(652929,6529,'柯坪县'),(6530,65,'克孜勒苏柯尔克孜自治'),(653001,6530,'阿图什市'),(653022,6530,'阿克陶县'),(653023,6530,'阿合奇县'),(653024,6530,'乌恰县'),(6531,65,'喀什地区'),(653101,6531,'喀什市'),(653121,6531,'疏附县'),(653122,6531,'疏勒县'),(653123,6531,'英吉沙县'),(653124,6531,'泽普县'),(653125,6531,'莎车县'),(653126,6531,'叶城县'),(653127,6531,'麦盖提县'),(653128,6531,'岳普湖县'),(653129,6531,'伽师县'),(653130,6531,'巴楚县'),(653131,6531,'塔什库尔干塔吉克自治'),(6532,65,'和田地区'),(653201,6532,'和田市'),(653221,6532,'和田县'),(653222,6532,'墨玉县'),(653223,6532,'皮山县'),(653224,6532,'洛浦县'),(653225,6532,'策勒县'),(653226,6532,'于田县'),(653227,6532,'民丰县'),(6540,65,'伊犁哈萨克自治州'),(654001,6540,'奎屯市'),(6541,65,'伊犁地区'),(654101,6541,'伊宁市'),(654121,6541,'伊宁县'),(654122,6541,'察布查尔锡伯自治县'),(654123,6541,'霍城县'),(654124,6541,'巩留县'),(654125,6541,'新源县'),(654126,6541,'昭苏县'),(654127,6541,'特克斯县'),(654128,6541,'尼勒克县'),(6542,65,'塔城地区'),(654201,6542,'塔城市'),(654202,6542,'乌苏市'),(654221,6542,'额敏县'),(654223,6542,'沙湾县'),(654224,6542,'托里县'),(654225,6542,'裕民县'),(654226,6542,'和布克赛尔蒙古自治县'),(6543,65,'阿勒泰地区'),(654301,6543,'阿勒泰市'),(654321,6543,'布尔津县'),(654322,6543,'富蕴县'),(654323,6543,'福海县'),(654324,6543,'哈巴河县'),(654325,6543,'青河县'),(654326,6543,'吉木乃县'),(6590,65,'省直辖行政单位'),(659001,6590,'石河子市'),(71,0,'台湾'),(7101,71,'台湾市辖'),(710101,7101,'请选择'),(710102,7101,'市辖区'),(710103,7101,'台湾省'),(81,0,'香港'),(8101,81,'香港特区'),(810101,8101,'请选择'),(810102,8101,'市辖区'),(810103,8101,'香港特区'),(91,0,'澳门'),(9101,91,'澳门特区'),(910101,9101,'请选择'),(910102,9101,'市辖区'),(910103,9101,'澳门特区');

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

insert  into `tb_banner`(`id`,`img_url`,`link_url`,`order_num`) values (1,'https://img.alicdn.com/imgextra/i3/37/O1CN010hzfb61C8zAbx9SuA_!!37-0-luban.jpg',NULL,1),(2,'https://gw.alicdn.com/imgextra/i4/163/O1CN01YDyrgb1D4h4gu6aWk_!!163-0-lubanu.jpg',NULL,2),(3,'https://aecpm.alicdn.com/simba/img/TB14ab1KpXXXXclXFXXSutbFXXX.jpg_q50.jpg',NULL,3),(4,'https://gw.alicdn.com/imgextra/i3/190/O1CN01MuOogz1DH3l2SC4v0_!!190-0-lubanu.jpg',NULL,4),(5,'https://gw.alicdn.com/imgextra/i4/99/O1CN015czayt1CbNi8wfAGE_!!99-0-lubanu.jpg',NULL,5),(6,'https://img.alicdn.com/tps/i4/TB1_I0aIY2pK1RjSZFsSuuNlXXa.jpg',NULL,6),(7,'https://gw.alicdn.com/imgextra/i3/159/O1CN01MUsmqT1D2rTWpO4cO_!!159-0-lubanu.jpg',NULL,7),(8,'https://gw.alicdn.com/imgextra/i4/89/O1CN01h7lp731CWnks8nKH6_!!89-0-lubanu.jpg',NULL,8);

/*Table structure for table `tb_brand_info` */

DROP TABLE IF EXISTS `tb_brand_info`;

CREATE TABLE `tb_brand_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `brand_web` varchar(255) DEFAULT NULL COMMENT '品牌网络',
  `brand_logo` varchar(255) DEFAULT NULL COMMENT '品牌logo URL',
  `brand_desc` text COMMENT '品牌描述',
  `brand_status` tinyint(4) DEFAULT '1' COMMENT '品牌状态,0禁用,1启用',
  `brand_order` tinyint(4) DEFAULT '0' COMMENT '排序',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `category_id` int(11) DEFAULT NULL COMMENT '所属分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='品牌信息';

/*Data for the table `tb_brand_info` */

insert  into `tb_brand_info`(`id`,`brand_name`,`telephone`,`brand_web`,`brand_logo`,`brand_desc`,`brand_status`,`brand_order`,`modified_time`,`category_id`) values (1,'耐克','13588888888','http://www.nike.com','http://store.nike.com/cn/zh_cn/?cp=cnns_sz_071516_a_ALNUL_bz02&utm_source=Bd&utm_medium=Pcbz&utm_content=logo','NIKE公司总部位于美国俄勒冈州波特兰市。公司生产的体育用品包罗万象，例如服装，鞋类，运动器材等。NIKE是全球著名的体育运动品牌，英文原意指希腊胜利女神，中文译为耐克。耐克商标图案是个小钩子。耐克一直将激励全世界的每一位运动员并为其献上最好的产品视为光荣的任务。',1,0,'2019-03-30 10:14:50',2),(2,'志高','13588888888','http://www.china-chigo.com/','https://baike.baidu.com/pic/%E5%BF%97%E9%AB%98%E7%A9%BA%E8%B0%83/5947603/0/9e3df8dcd100baa10b0985cd4010b912c8fc2e9b?fr=lemma&ct=single','广东志高空调有限公司创建于1994年 [1]  ，总部位于珠江三角洲工业重镇佛山市南海区，是一家以家用和商用空调生产、销售为主的大型现代化企业集团。\r\n经过十余年的不断发展与壮大，现公司占地面积近300万平方米，年产能达1000万套，名列南海工业经济综合实力百强榜首。总部拥有两大工业园，并在泰国、越南、博茨瓦纳、尼日利亚等国家设有多家合作工厂，市场营销网络遍布全球100多个国家和地区，是目前中国最大的民营空调生产基地和出口创汇企业之一。',1,0,'2019-03-30 20:43:33',1412),(3,'海尔','13588888888','https://www.haier.com/cn','https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/4409aa8aa057a032b726672e1f44be31_121_121.jpg','海尔智慧家庭是利用物联网、人工智能、大数据，通过U+开放物联平台，把传统电器变为智慧网器，通过场景商务结合生态服务，为用户提供软硬件全套解决方案，实现最佳的智慧生活体验。4大物理空间，7大全屋解决方案。打造智慧家庭，定制用户美好生活， 实现生活X.0。',1,0,'2019-03-30 21:03:13',1412);

/*Table structure for table `tb_buyer_level` */

DROP TABLE IF EXISTS `tb_buyer_level`;

CREATE TABLE `tb_buyer_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(10) DEFAULT NULL COMMENT '级别名称',
  `min_score` int(10) unsigned DEFAULT NULL COMMENT '该等级最少积分',
  `max_score` int(11) DEFAULT NULL COMMENT '该等级最多积分',
  `level_img` varchar(255) DEFAULT NULL COMMENT '等级图片标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='买家等级';

/*Data for the table `tb_buyer_level` */

insert  into `tb_buyer_level`(`id`,`level_name`,`min_score`,`max_score`,`level_img`) values (1,'一心',4,10,'https://img.alicdn.com/newrank/b_red_1.gif'),(2,'二心',11,40,'https://img.alicdn.com/newrank/b_red_2.gif'),(3,'三心',41,90,'https://img.alicdn.com/newrank/b_red_3.gif'),(4,'四心',91,150,'https://img.alicdn.com/newrank/b_red_4.gif'),(5,'五心',151,250,'https://img.alicdn.com/newrank/b_red_5.gif'),(6,'一钻',251,500,'https://img.alicdn.com/newrank/b_blue_1.gif'),(7,'二钻',501,1000,'https://img.alicdn.com/newrank/b_blue_2.gif'),(8,'三钻',1001,2000,'https://img.alicdn.com/newrank/b_blue_3.gif'),(9,'四钻',2001,5000,'https://img.alicdn.com/newrank/b_blue_4.gif'),(10,'五钻',5001,10000,'https://img.alicdn.com/newrank/b_blue_5.gif'),(11,'一皇冠',10001,20000,'https://gtms03.alicdn.com/tps/i4/TB17JRyFVXXXXXhXpXXxPfUFXXX-16-16.gif'),(12,'二皇冠',20001,50000,NULL),(13,'三皇冠',50001,100000,NULL),(14,'四皇冠',100001,200000,NULL),(15,'五皇冠',200001,500000,NULL),(16,'一金冠',500001,1000000,'https://gtms04.alicdn.com/tps/i2/TB188JyFVXXXXcoXXXXxPfUFXXX-16-16.gif'),(17,'二金冠',1000001,2000000,NULL),(18,'三金冠',2000001,5000000,NULL),(19,'四金冠',5000001,10000000,NULL),(20,'五金冠',10000001,NULL,NULL);

/*Table structure for table `tb_login_log` */

DROP TABLE IF EXISTS `tb_login_log`;

CREATE TABLE `tb_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户登陆时间',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '登录ip',
  `login_type` tinyint(4) DEFAULT NULL COMMENT '登录方式 1web 2安卓 3ios',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='登录日志';

/*Data for the table `tb_login_log` */

insert  into `tb_login_log`(`id`,`user_id`,`login_time`,`login_ip`,`login_type`) values (1,4,'2019-03-31 19:37:08','0:0:0:0:0:0:0:1',1),(2,4,'2019-04-04 16:00:40','0:0:0:0:0:0:0:1',1),(3,4,'2019-04-08 10:19:37','0:0:0:0:0:0:0:1',1),(4,4,'2019-04-08 10:58:41','0:0:0:0:0:0:0:1',1),(5,4,'2019-04-08 11:16:41','0:0:0:0:0:0:0:1',1),(6,4,'2019-04-08 11:17:29','0:0:0:0:0:0:0:1',1),(7,4,'2019-04-08 11:18:06','0:0:0:0:0:0:0:1',1),(8,4,'2019-04-08 11:18:35','0:0:0:0:0:0:0:1',1),(9,4,'2019-04-08 11:18:46','0:0:0:0:0:0:0:1',1),(10,4,'2019-04-08 11:22:01','0:0:0:0:0:0:0:1',1),(11,4,'2019-04-09 13:40:04','0:0:0:0:0:0:0:1',1),(12,4,'2019-04-09 13:40:40','0:0:0:0:0:0:0:1',1),(13,4,'2019-04-10 20:57:42','0:0:0:0:0:0:0:1',1),(14,4,'2019-04-11 09:17:54','0:0:0:0:0:0:0:1',1),(15,4,'2019-04-12 15:19:25','0:0:0:0:0:0:0:1',1),(16,4,'2019-04-18 15:25:40','0:0:0:0:0:0:0:1',1),(17,4,'2019-04-18 15:28:13','0:0:0:0:0:0:0:1',1);

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

/*Table structure for table `tb_news` */

DROP TABLE IF EXISTS `tb_news`;

CREATE TABLE `tb_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_name` varchar(255) DEFAULT NULL COMMENT '新闻名称',
  `news_content` text COMMENT '新闻内容',
  `news_url` varchar(255) DEFAULT NULL COMMENT '点击跳转url,可不带',
  `order_num` int(11) DEFAULT NULL COMMENT '排序标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='淘宝新闻';

/*Data for the table `tb_news` */

insert  into `tb_news`(`id`,`news_name`,`news_content`,`news_url`,`order_num`) values (1,'苹果大招来了？iPhone新品或将来袭',NULL,NULL,1),(2,'苹果iphone se2于3月发布？',NULL,NULL,2),(3,'即将发布的6款新机，有你喜欢的么?',NULL,NULL,3),(4,'汽车届的“小米”！上市即爆红，仅10万',NULL,NULL,4),(5,'猫砂多久换一次，你这个主人靠谱吗？',NULL,NULL,5),(6,'iPhone上架千元机，为清仓做准备！',NULL,NULL,6);

/*Table structure for table `tb_receive_addr` */

DROP TABLE IF EXISTS `tb_receive_addr`;

CREATE TABLE `tb_receive_addr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `receive_people_name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `receive_mobile` varchar(50) DEFAULT NULL COMMENT '收货人手机号',
  `receive_province` int(11) DEFAULT NULL COMMENT '省',
  `receive_city` int(11) DEFAULT NULL COMMENT '市',
  `receive_area` int(11) DEFAULT NULL COMMENT '区',
  `receive_street` varchar(11) DEFAULT NULL COMMENT '街道',
  `receive_addr` varchar(50) DEFAULT NULL COMMENT '详细地址',
  `receive_code` varchar(10) DEFAULT NULL COMMENT '邮编',
  `addr_label` varchar(50) DEFAULT NULL COMMENT '地址标签 家 公司 学校',
  `default_flag` tinyint(4) DEFAULT '0' COMMENT '是否是默认地址 1是',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址';

/*Data for the table `tb_receive_addr` */

/*Table structure for table `tb_seller` */

DROP TABLE IF EXISTS `tb_seller`;

CREATE TABLE `tb_seller` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(50) DEFAULT NULL COMMENT '卖家店铺名称',
  `seller_level` int(11) DEFAULT NULL COMMENT '卖家等级',
  `aptitude_yuan` int(11) DEFAULT NULL COMMENT '卖家保证金资质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='卖家';

/*Data for the table `tb_seller` */

insert  into `tb_seller`(`id`,`seller_name`,`seller_level`,`aptitude_yuan`) values (1,'天猫精灵智能生活',12,5000),(2,'小米官方旗舰店',12,5000),(3,'海信电视官方旗舰店',5,5000),(4,'keg韩电电视工厂店',12,5000),(5,'海尔官方旗舰店',12,5000),(6,'智惠电器专营店',2,5000),(7,'苏宁易购官方旗舰店',12,5000),(8,'创维官方旗舰店',1,5000),(9,'康佳官方旗舰店',12,5000),(10,'tcl电视官方旗舰店',12,5000),(11,'酷开官方旗舰店',12,5000),(12,'tcl亿淘专卖店',12,5000),(13,'牧腾旗舰店',12,5000),(14,'创维智购专卖店',12,5000),(15,'长虹官方旗舰店',12,5000),(16,'konka康佳易清新专卖店',12,5000),(17,'夏普官方旗舰店',12,5000),(18,'小米新七天专卖店',12,5000),(19,'东芝电视官方旗舰店',12,5000),(20,'一统电器专营店',12,5000),(21,'俊熙电器专营店',12,5000),(22,'王牌星世纪直销店',12,5000),(23,'朗laec',12,5000),(24,'夏新电视工厂店',12,5000),(25,'广州寰球科技有限公司1987',12,5000),(26,'小米乐迷会专卖店',12,5000),(27,'贝壳电器',12,5000);

/*Table structure for table `tb_seller_level` */

DROP TABLE IF EXISTS `tb_seller_level`;

CREATE TABLE `tb_seller_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(50) DEFAULT NULL COMMENT '级别名称',
  `min_score` int(10) DEFAULT NULL COMMENT '该等级最少积分',
  `max_score` int(11) DEFAULT NULL COMMENT '该等级最多积分',
  `level_img` varchar(255) DEFAULT NULL COMMENT '等级图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='卖家等级';

/*Data for the table `tb_seller_level` */

insert  into `tb_seller_level`(`id`,`level_name`,`min_score`,`max_score`,`level_img`) values (1,'一心',4,10,'https://img.alicdn.com/newrank/s_red_1.gif'),(2,'二心',11,40,'https://img.alicdn.com/newrank/s_red_2.gif'),(3,'三心',41,90,'https://img.alicdn.com/newrank/s_red_3.gif'),(4,'四心',91,150,'https://img.alicdn.com/newrank/s_red_4.gif'),(5,'五心',151,250,'https://img.alicdn.com/newrank/s_red_5.gif'),(6,'一钻',251,500,'https://img.alicdn.com/newrank/s_blue_1.gif'),(7,'二钻',501,1000,'https://img.alicdn.com/newrank/s_blue_2.gif'),(8,'三钻',1001,2000,'https://img.alicdn.com/newrank/s_blue_3.gif'),(9,'四钻',2001,5000,'https://img.alicdn.com/newrank/s_blue_4.gif'),(10,'五钻',5001,10000,'https://img.alicdn.com/newrank/s_blue_5.gif'),(11,'一皇冠',10001,20000,'https://gtms03.alicdn.com/tps/i4/TB17JRyFVXXXXXhXpXXxPfUFXXX-16-16.gif'),(12,'二皇冠',20001,50000,NULL),(13,'三皇冠',50001,100000,NULL),(14,'四皇冠',100001,200000,NULL),(15,'五皇冠',200001,500000,NULL),(16,'一金冠',500001,1000000,'https://gtms04.alicdn.com/tps/i2/TB188JyFVXXXXcoXXXXxPfUFXXX-16-16.gif'),(17,'二金冠',1000001,2000000,NULL),(18,'三金冠',2000001,5000000,NULL),(19,'四金冠',5000001,10000000,NULL),(20,'五金冠',10000001,NULL,NULL);

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

insert  into `tb_token`(`user_id`,`token`,`expire_time`,`update_time`) values (2,'5ca17a5077ba47048dc8c0274296dc64','2019-02-25 04:28:21','2019-02-24 16:28:21'),(3,'986ccf64e75346b39bb5728bb01c23a8','2019-03-17 01:24:18','2019-03-16 13:24:18'),(4,'2a0f2871f9aa4b17869f76db404c0275','2019-04-19 03:28:13','2019-04-18 15:28:13');

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
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `birthday` datetime DEFAULT NULL COMMENT '会员生日',
  `user_level` int(5) DEFAULT '0' COMMENT '用户等级',
  `gender` tinyint(4) DEFAULT '1' COMMENT '用户性别 0女 1男',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `user_head` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `nick_name` varchar(30) DEFAULT NULL COMMENT '用户昵称',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`mobile`,`password`,`create_time`,`ip`,`login_time`,`email`,`birthday`,`user_level`,`gender`,`real_name`,`user_head`,`nick_name`) values (1,'mark','13612345678','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','2017-03-23 22:37:41',NULL,NULL,NULL,NULL,11,1,NULL,NULL,NULL),(2,'admin','13562959695','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL),(3,'18865392565','18865392565','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','2019-02-25 14:17:16','0:0:0:0:0:0:0:1','2019-03-16 13:24:18',NULL,NULL,6,1,NULL,NULL,NULL),(4,'18888888888','18888888888','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','2019-03-19 10:45:30',NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL);

/*Table structure for table `ums_admin` */

DROP TABLE IF EXISTS `ums_admin`;

CREATE TABLE `ums_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

/*Data for the table `ums_admin` */

insert  into `ums_admin`(`id`,`username`,`password`,`icon`,`email`,`nick_name`,`note`,`create_time`,`login_time`,`status`) values (1,'test','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg',NULL,'测试账号',NULL,'2018-09-29 13:55:30','2018-09-29 13:55:39',1),(3,'admin','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/170157_yIl3_1767531.jpg','admin@163.com','系统管理员','系统管理员','2018-10-08 13:32:47','2019-03-20 15:38:50',1);

/*Table structure for table `ums_admin_login_log` */

DROP TABLE IF EXISTS `ums_admin_login_log`;

CREATE TABLE `ums_admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='后台用户登录日志表';

/*Data for the table `ums_admin_login_log` */

insert  into `ums_admin_login_log`(`id`,`admin_id`,`create_time`,`ip`,`address`,`user_agent`) values (5,3,'2018-12-06 13:59:12','0:0:0:0:0:0:0:1',NULL,NULL),(6,3,'2018-12-17 13:23:20','0:0:0:0:0:0:0:1',NULL,NULL),(7,3,'2018-12-18 13:51:42','0:0:0:0:0:0:0:1',NULL,NULL),(8,3,'2018-12-18 13:51:51','0:0:0:0:0:0:0:1',NULL,NULL),(9,3,'2019-01-28 16:20:41','0:0:0:0:0:0:0:1',NULL,NULL),(10,3,'2019-01-29 09:16:25','0:0:0:0:0:0:0:1',NULL,NULL),(11,3,'2019-01-29 10:10:51','0:0:0:0:0:0:0:1',NULL,NULL),(12,3,'2019-02-18 11:03:06','0:0:0:0:0:0:0:1',NULL,NULL),(13,3,'2019-03-12 10:03:55','0:0:0:0:0:0:0:1',NULL,NULL),(14,3,'2019-03-12 10:06:19','0:0:0:0:0:0:0:1',NULL,NULL),(15,3,'2019-03-12 10:15:22','0:0:0:0:0:0:0:1',NULL,NULL),(16,3,'2019-03-20 15:35:33','0:0:0:0:0:0:0:1',NULL,NULL),(17,3,'2019-03-20 15:38:50','0:0:0:0:0:0:0:1',NULL,NULL);

/*Table structure for table `ums_admin_permission_relation` */

DROP TABLE IF EXISTS `ums_admin_permission_relation`;

CREATE TABLE `ums_admin_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户和权限关系表(除角色中定义的权限以外的加减权限)';

/*Data for the table `ums_admin_permission_relation` */

/*Table structure for table `ums_admin_role_relation` */

DROP TABLE IF EXISTS `ums_admin_role_relation`;

CREATE TABLE `ums_admin_role_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='后台用户和角色关系表';

/*Data for the table `ums_admin_role_relation` */

insert  into `ums_admin_role_relation`(`id`,`admin_id`,`role_id`) values (13,3,1),(15,3,2),(16,3,4);

/*Table structure for table `ums_growth_change_history` */

DROP TABLE IF EXISTS `ums_growth_change_history`;

CREATE TABLE `ums_growth_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='成长值变化历史记录表';

/*Data for the table `ums_growth_change_history` */

insert  into `ums_growth_change_history`(`id`,`member_id`,`create_time`,`change_type`,`change_count`,`operate_man`,`operate_note`,`source_type`) values (1,1,'2018-08-29 17:16:35',0,1000,'test','测试使用',1);

/*Table structure for table `ums_integration_change_history` */

DROP TABLE IF EXISTS `ums_integration_change_history`;

CREATE TABLE `ums_integration_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分变化历史记录表';

/*Data for the table `ums_integration_change_history` */

/*Table structure for table `ums_integration_consume_setting` */

DROP TABLE IF EXISTS `ums_integration_consume_setting`;

CREATE TABLE `ums_integration_consume_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(11) DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(11) DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(1) DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='积分消费设置';

/*Data for the table `ums_integration_consume_setting` */

insert  into `ums_integration_consume_setting`(`id`,`deduction_per_amount`,`max_percent_per_order`,`use_unit`,`coupon_status`) values (1,100,50,100,1);

/*Table structure for table `ums_member` */

DROP TABLE IF EXISTS `ums_member`;

CREATE TABLE `ums_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号码',
  `status` int(1) DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `gender` int(1) DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city` varchar(64) DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) DEFAULT NULL COMMENT '积分',
  `growth` int(11) DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `idx_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='会员表';

/*Data for the table `ums_member` */

insert  into `ums_member`(`id`,`member_level_id`,`username`,`password`,`nickname`,`phone`,`status`,`create_time`,`icon`,`gender`,`birthday`,`city`,`job`,`personalized_signature`,`source_type`,`integration`,`growth`,`luckey_count`,`history_integration`) values (1,4,'test','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','windir','18061581849',1,'2018-08-02 10:35:44',NULL,1,'2009-06-01','上海','学生','test',NULL,5000,NULL,NULL,NULL),(3,4,'windy','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','windy','18061581848',1,'2018-08-03 16:46:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,'zhengsan','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','zhengsan','18061581847',1,'2018-11-12 14:12:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,4,'lisi','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','lisi','18061581841',1,'2018-11-12 14:12:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,4,'wangwu','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','wangwu','18061581842',1,'2018-11-12 14:13:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,4,'lion','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','lion','18061581845',1,'2018-11-12 14:21:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,4,'shari','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','shari','18061581844',1,'2018-11-12 14:22:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,4,'aewen','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','aewen','18061581843',1,'2018-11-12 14:22:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `ums_member_level` */

DROP TABLE IF EXISTS `ums_member_level`;

CREATE TABLE `ums_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth_point` int(11) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10,2) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员等级表';

/*Data for the table `ums_member_level` */

insert  into `ums_member_level`(`id`,`name`,`growth_point`,`default_status`,`free_freight_point`,`comment_growth_point`,`priviledge_free_freight`,`priviledge_sign_in`,`priviledge_comment`,`priviledge_promotion`,`priviledge_member_price`,`priviledge_birthday`,`note`) values (1,'黄金会员',1000,0,'199.00',5,1,1,1,1,1,1,NULL),(2,'白金会员',5000,0,'99.00',10,1,1,1,1,1,1,NULL),(3,'钻石会员',15000,0,'69.00',15,1,1,1,1,1,1,NULL),(4,'普通会员',1,1,'199.00',20,1,1,1,1,0,0,NULL);

/*Table structure for table `ums_member_login_log` */

DROP TABLE IF EXISTS `ums_member_login_log`;

CREATE TABLE `ums_member_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `login_type` int(1) DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员登录记录';

/*Data for the table `ums_member_login_log` */

/*Table structure for table `ums_member_member_tag_relation` */

DROP TABLE IF EXISTS `ums_member_member_tag_relation`;

CREATE TABLE `ums_member_member_tag_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和标签关系表';

/*Data for the table `ums_member_member_tag_relation` */

/*Table structure for table `ums_member_product_category_relation` */

DROP TABLE IF EXISTS `ums_member_product_category_relation`;

CREATE TABLE `ums_member_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员与产品分类关系表（用户喜欢的分类）';

/*Data for the table `ums_member_product_category_relation` */

/*Table structure for table `ums_member_receive_address` */

DROP TABLE IF EXISTS `ums_member_receive_address`;

CREATE TABLE `ums_member_receive_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员收货地址表';

/*Data for the table `ums_member_receive_address` */

insert  into `ums_member_receive_address`(`id`,`member_id`,`name`,`phone_number`,`default_status`,`post_code`,`province`,`city`,`region`,`detail_address`) values (1,1,'大梨','18033441849',0,'518000','广东省','深圳市','南山区','科兴科学园'),(3,1,'大梨','18033441849',0,'518000','广东省','深圳市','福田区','清水河街道'),(4,1,'大梨','18033441849',1,'518000','广东省','深圳市','福田区','东晓街道');

/*Table structure for table `ums_member_rule_setting` */

DROP TABLE IF EXISTS `ums_member_rule_setting`;

CREATE TABLE `ums_member_rule_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(11) DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10,2) DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10,2) DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(11) DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(1) DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分成长规则表';

/*Data for the table `ums_member_rule_setting` */

/*Table structure for table `ums_member_statistics_info` */

DROP TABLE IF EXISTS `ums_member_statistics_info`;

CREATE TABLE `ums_member_statistics_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `consume_amount` decimal(10,2) DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(11) DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) DEFAULT NULL,
  `collect_subject_count` int(11) DEFAULT NULL,
  `collect_topic_count` int(11) DEFAULT NULL,
  `collect_comment_count` int(11) DEFAULT NULL,
  `invite_friend_count` int(11) DEFAULT NULL,
  `recent_order_time` datetime DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员统计信息';

/*Data for the table `ums_member_statistics_info` */

/*Table structure for table `ums_member_tag` */

DROP TABLE IF EXISTS `ums_member_tag`;

CREATE TABLE `ums_member_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `finish_order_count` int(11) DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10,2) DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户标签表';

/*Data for the table `ums_member_tag` */

/*Table structure for table `ums_member_task` */

DROP TABLE IF EXISTS `ums_member_task`;

CREATE TABLE `ums_member_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth` int(11) DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(11) DEFAULT NULL COMMENT '赠送积分',
  `type` int(1) DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员任务表';

/*Data for the table `ums_member_task` */

/*Table structure for table `ums_permission` */

DROP TABLE IF EXISTS `ums_permission`;

CREATE TABLE `ums_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(200) DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) DEFAULT NULL COMMENT '图标',
  `type` int(1) DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台用户权限表';

/*Data for the table `ums_permission` */

insert  into `ums_permission`(`id`,`pid`,`name`,`value`,`icon`,`type`,`uri`,`status`,`create_time`,`sort`) values (1,0,'商品',NULL,NULL,0,NULL,1,'2018-09-29 16:15:14',0),(2,1,'商品列表','pms:product:read',NULL,1,'/pms/product/index',1,'2018-09-29 16:17:01',0),(3,1,'添加商品','pms:product:create',NULL,1,'/pms/product/add',1,'2018-09-29 16:18:51',0),(4,1,'商品分类','pms:productCategory:read',NULL,1,'/pms/productCate/index',1,'2018-09-29 16:23:07',0),(5,1,'商品类型','pms:productAttribute:read',NULL,1,'/pms/productAttr/index',1,'2018-09-29 16:24:43',0),(6,1,'品牌管理','pms:brand:read',NULL,1,'/pms/brand/index',1,'2018-09-29 16:25:45',0),(7,2,'编辑商品','pms:product:update',NULL,2,'/pms/product/updateProduct',1,'2018-09-29 16:34:23',0),(8,2,'删除商品','pms:product:delete',NULL,2,'/pms/product/delete',1,'2018-09-29 16:38:33',0),(9,4,'添加商品分类','pms:productCategory:create',NULL,2,'/pms/productCate/create',1,'2018-09-29 16:43:23',0),(10,4,'修改商品分类','pms:productCategory:update',NULL,2,'/pms/productCate/update',1,'2018-09-29 16:43:55',0),(11,4,'删除商品分类','pms:productCategory:delete',NULL,2,'/pms/productAttr/delete',1,'2018-09-29 16:44:38',0),(12,5,'添加商品类型','pms:productAttribute:create',NULL,2,'/pms/productAttr/create',1,'2018-09-29 16:45:25',0),(13,5,'修改商品类型','pms:productAttribute:update',NULL,2,'/pms/productAttr/update',1,'2018-09-29 16:48:08',0),(14,5,'删除商品类型','pms:productAttribute:delete',NULL,2,'/pms/productAttr/delete',1,'2018-09-29 16:48:44',0),(15,6,'添加品牌','pms:brand:create',NULL,2,'/pms/brand/add',1,'2018-09-29 16:49:34',0),(16,6,'修改品牌','pms:brand:update',NULL,2,'/pms/brand/update',1,'2018-09-29 16:50:55',0),(17,6,'删除品牌','pms:brand:delete',NULL,2,'/pms/brand/delete',1,'2018-09-29 16:50:59',0),(18,0,'首页',NULL,NULL,0,NULL,1,'2018-09-29 16:51:57',0);

/*Table structure for table `ums_role` */

DROP TABLE IF EXISTS `ums_role`;

CREATE TABLE `ums_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台用户角色表';

/*Data for the table `ums_role` */

insert  into `ums_role`(`id`,`name`,`description`,`admin_count`,`create_time`,`status`,`sort`) values (1,'商品管理员','商品管理员',0,'2018-09-30 15:46:11',1,0),(2,'商品分类管理员','商品分类管理员',0,'2018-09-30 15:53:45',1,0),(3,'商品类型管理员','商品类型管理员',0,'2018-09-30 15:53:56',1,0),(4,'品牌管理员','品牌管理员',0,'2018-09-30 15:54:12',1,0);

/*Table structure for table `ums_role_permission_relation` */

DROP TABLE IF EXISTS `ums_role_permission_relation`;

CREATE TABLE `ums_role_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='后台用户角色和权限关系表';

/*Data for the table `ums_role_permission_relation` */

insert  into `ums_role_permission_relation`(`id`,`role_id`,`permission_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,7),(5,1,8),(6,2,4),(7,2,9),(8,2,10),(9,2,11),(10,3,5),(11,3,12),(12,3,13),(13,3,14),(14,4,6),(15,4,15),(16,4,16),(17,4,17);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
