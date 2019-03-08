-- 用户表
CREATE TABLE `tb_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) COMMENT '密码',
  `create_time` datetime COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- 用户Token表
CREATE TABLE `tb_token` (
  `user_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime COMMENT '过期时间',
  `update_time` datetime COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- 账号：13612345678  密码：admin
INSERT INTO `tb_user` (`username`, `mobile`, `password`, `create_time`) VALUES ('mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');


-- banner 导航
CREATE TABLE `tb_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(255) DEFAULT NULL COMMENT '点击图片后，跳转的地址',
  `order_num` int(10) unsigned DEFAULT NULL COMMENT '排序标识 数字越小 越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


insert  into `tb_banner`(`id`,`img_url`,`link_url`,`order_num`) values (1,'https://gw.alicdn.com/imgextra/i1/30/O1CN01DhqgMd1C5mNrbOUun_!!30-0-lubanu.jpg',NULL,1),(2,'https://aecpm.alicdn.com/simba/img/TB1CWf9KpXXXXbuXpXXSutbFXXX.jpg_q50.jpg',NULL,2),(3,'https://aecpm.alicdn.com/simba/img/TB14ab1KpXXXXclXFXXSutbFXXX.jpg_q50.jpg',NULL,3),(4,'https://gw.alicdn.com/imgextra/i3/185/O1CN01FPoKQF1DElm14hUQp_!!185-0-lubanu.jpg',NULL,4),(5,'https://gw.alicdn.com/imgextra/i4/99/O1CN015czayt1CbNi8wfAGE_!!99-0-lubanu.jpg',NULL,5),(6,'https://img.alicdn.com/tps/i4/TB1_I0aIY2pK1RjSZFsSuuNlXXa.jpg',NULL,6),(7,'https://gw.alicdn.com/imgextra/i3/159/O1CN01MUsmqT1D2rTWpO4cO_!!159-0-lubanu.jpg',NULL,7);


-- nav 导航
CREATE TABLE `tb_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `order_num` int(10) unsigned DEFAULT NULL COMMENT '排序标识 越小越靠前',
  `nav_name` varchar(10) DEFAULT NULL COMMENT '导航名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


insert  into `tb_nav`(`id`,`img_url`,`link_url`,`order_num`,`nav_name`) values (1,'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',NULL,1,'天猫'),(2,'https://img.alicdn.com/tfs/TB10UHQaNjaK1RjSZKzXXXVwXXa-183-144.png?getAvatar=1_.webp',NULL,2,'聚划算'),(3,'https://gw.alicdn.com/tfs/TB11rTqtj7nBKNjSZLeXXbxCFXa-183-144.png?getAvatar=1_.webp',NULL,3,'天猫国际'),(4,'https://gw.alicdn.com/tps/TB1eXc7PFXXXXb4XpXXXXXXXXXX-183-144.png?getAvatar=1_.webp',NULL,4,'外卖'),(5,'https://gw.alicdn.com/tfs/TB1IKqDtpooBKNjSZFPXXXa2XXa-183-144.png_.webp',NULL,5,'天猫超市'),(6,'https://gw.alicdn.com/tfs/TB1o0FLtyMnBKNjSZFoXXbOSFXa-183-144.png_.webp',NULL,6,'充值中心'),(7,'https://gw.alicdn.com/tfs/TB1ydXzhCzqK1RjSZPcXXbTepXa-183-144.png?getAvatar=1_.webp',NULL,7,'飞猪旅行'),(8,'https://gw.alicdn.com/tfs/TB1BqystrZnBKNjSZFrXXaRLFXa-183-144.png?getAvatar=1_.webp',NULL,8,'领金币'),(9,'https://gw.alicdn.com/tfs/TB1CMf4tlnTBKNjSZPfXXbf1XXa-183-144.png?getAvatar=1_.webp',NULL,9,'拍卖'),(10,'https://gw.alicdn.com/tfs/TB18P98tyQnBKNjSZFmXXcApVXa-183-144.png?getAvatar=1_.webp',NULL,10,'分类');
