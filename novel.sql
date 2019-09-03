/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : novel

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-07-18 17:47:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(10) NOT NULL,
  `adminPwd` char(32) NOT NULL,
  `adminGender` int(11) NOT NULL DEFAULT '1',
  `adminPhone` bigint(20) NOT NULL DEFAULT '0',
  `adminStatus` int(11) NOT NULL,
  `adminType` int(11) NOT NULL DEFAULT '1',
  `adminAddTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminName` (`adminName`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '96E7921896DD5A3301125EB72C92A549', '2', '18227135618', '1', '2', '2019-07-11 17:33:41');
INSERT INTO `admin` VALUES ('17', 'marry', '96E7921896DD5A3301125EB72C92A549', '2', '15269874563', '2', '2', '2019-07-12 00:40:55');
INSERT INTO `admin` VALUES ('18', 'spider', '96E7921896DD5A3301125EB72C92A549', '1', '18920365478', '1', '2', '2019-07-12 00:50:23');
INSERT INTO `admin` VALUES ('19', 'poddy', '96E7921896DD5A3301125EB72C92A549', '1', '15982911569', '1', '2', '2019-07-12 00:52:40');
INSERT INTO `admin` VALUES ('20', 'yuguoa', '96E7921896DD5A3301125EB72C92A549', '1', '15598756235', '3', '2', '2019-07-12 00:53:49');
INSERT INTO `admin` VALUES ('21', 'chouguo', '96E7921896DD5A3301125EB72C92A549', '1', '18227135618', '3', '2', '2019-07-12 00:54:21');
INSERT INTO `admin` VALUES ('22', 'abcd', '7FA8282AD911C93B308A3047A4D6FE61', '1', '15636578598', '1', '2', '2019-07-12 14:09:14');

-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `authorId` int(32) NOT NULL AUTO_INCREMENT COMMENT '作者编号',
  `authorName` varchar(64) NOT NULL COMMENT '作者姓名',
  `authorSex` int(2) NOT NULL COMMENT '作者性别',
  `authorPhone` bigint(11) DEFAULT NULL COMMENT '作者电话',
  `authorLogo` varchar(64) NOT NULL COMMENT '作者标签',
  `authorHobby` varchar(64) NOT NULL COMMENT '作者爱好',
  `authorFeature` varchar(64) NOT NULL COMMENT '作者特点',
  `authorAddTime` datetime DEFAULT NULL COMMENT '作者添加时间：1.长期发表作者  2.很久没发表作品的作者',
  `authorStatus` int(2) NOT NULL COMMENT '作者状态',
  `authorPwd` varchar(64) ,
  PRIMARY KEY (`authorId`) USING BTREE,
  UNIQUE KEY `authorName` (`authorName`) USING BTREE,
  UNIQUE KEY `authorPhone` (`authorPhone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', '公子鸽', '1', '15982581234', 'a', '篮球', '拥有xxx等优秀作品', '2019-07-11 01:33:11', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('2', '孤胆蚂蚁', '1', '14725896301', '有个性', '足球', '擅长写推理小说', '2019-07-18 01:33:16', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('3', '幻动', '2', '12301477522', 'a', '逛街', '爱写作', '2019-07-17 01:33:20', '0', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('4', '凤炅', '2', '12689536965', 'b', 'b1', 'b2', '2019-07-03 01:33:25', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('5', '锦绣', '2', '12354789654', 'a', '3', '3', '2019-06-18 13:38:25', '0', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('6', '江雪落', '2', '15369785494', 'a', 'sda', 'ad', '2017-10-01 13:39:50', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('7', '数学之父', '1', '16578945632', 'adaD', 'sadasd', 'asdaS', '2019-05-21 13:40:42', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('8', '玖月', '2', '14796324881', 'qwer', 'basketbal;', '暂无', '2019-07-12 02:10:57', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('9', '顾西霸', '1', '13698574250', '未知', '未知', '未知', '2019-07-12 02:11:50', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('10', '华罗庚', '2', null, '000', '0', '04', '2019-07-12 02:18:07', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('11', 'yuguoguo', '2', '15983691771', 'a', 'a', 'a', '2019-07-12 14:18:20', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('12', '唐雷', '2', '15255698741', 'sd', 'aa', 'vv', '2019-07-12 02:00:12', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('13', '轩轩', '1', '19543156412', 'a', 'asdasd', 'ssadasd', '2019-01-01 15:26:32', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('14', '红红', '1', null, 'sdad', 'asdasd', 'sadas', '2016-02-01 15:28:05', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('15', '江东大汉', '2', null, 'sadad', 'sadsasd', 'asdad', '2018-02-01 15:28:27', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('16', '火树', '1', '16543258794', 'asdas', 'sadd', 'asdad', '2018-01-14 15:29:34', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('17', '黎明', '1', null, 'asdas', 'sadsa', 'asdasd', '2019-02-01 15:30:22', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('18', '陈亮', '2', null, 'sdad', '21312', '12312', '2018-06-14 15:30:48', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('19', '顾小五', '1', '15647894466', 'wqeqwe', '231', 'wqea1', '2019-04-24 15:32:03', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('20', '黑瞎子', '2', '14657895422', '0000', '00000', '0000', '2019-05-09 15:32:57', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('21', '南派三叔', '1', '13675469842', 'asd', 'asd', 'asd', '2015-02-14 15:34:05', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('22', 'kk', '1', '14532569874', 'dasda', 'sada2', 'sd', '2014-10-04 15:34:47', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('23', '小星星', '1', null, 'dasd', 'asdas', 'asdasd', '2019-06-04 15:35:36', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('24', '天空', '2', '15325956458', '213', 'weqqe', 'wqe4', '2019-06-22 15:36:10', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('25', '爱静', '1', null, 'asdasd', 'qweqw', 'wqe', '2019-01-10 15:36:45', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('26', '仙人掌', '1', '15657893123', '213', '213', '12', '2017-01-19 15:37:07', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('27', '凌晨', '1', '15657895435', 'sadsa', 'ggh', 'dfs', '2019-07-13 15:38:16', '2', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('28', '人生几度', '2', '15335896286', 'asdsad', 'gerq', 'qwe', '2019-05-15 15:39:06', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('29', '316', '2', '14369567895', 'asdas', 'dfg', 'sad', '2014-07-17 15:39:54', '1', '96E7921896DD5A3301125EB72C92A549');
INSERT INTO `author` VALUES ('30', '法师', '1', '15643584564', 'asdas', 'gfg', 'dg', '2019-07-17 15:41:01', '1', '96E7921896DD5A3301125EB72C92A549');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(20) NOT NULL,
  `bookType` int(11) NOT NULL DEFAULT '3' COMMENT '1.免费2.玄幻仙侠3.古轻小说4.古代5.现言6.完本7.青春',
  `author` varchar(20) NOT NULL,
  `authorId` int(11) NOT NULL,
  `bookPrice` double(255,0) NOT NULL,
  `releaseTime` datetime NOT NULL,
  `updateSection` varchar(20) NOT NULL,
  `chapterNumber` varchar(5) NOT NULL,
  `condition` int(11) NOT NULL DEFAULT '1' COMMENT '1.已完结，2.连载中，3.异常',
  `score` int(11) NOT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '暖阳初晴', '1', '公子鸽', '1', '19', '2019-01-07 14:23:44', '700', '700', '1', '3');
INSERT INTO `book` VALUES ('2', '龙魂天地', '1', '孤胆蚂蚁', '2', '20', '2019-05-03 14:02:02', '50', '1000', '1', '4');
INSERT INTO `book` VALUES ('3', '文以载道', '7', '幻动', '3', '23', '2018-11-12 08:06:44', '790', '790', '1', '4');
INSERT INTO `book` VALUES ('4', '我在古代开医馆', '1', '凤炅', '4', '31', '2018-08-21 00:14:37', '101', '100', '2', '5');
INSERT INTO `book` VALUES ('5', '狐香', '6', '锦绣', '5', '20', '2019-05-16 18:18:31', '39', '1000', '2', '4');
INSERT INTO `book` VALUES ('6', '心照日月', '1', '江雪落', '6', '30', '2019-07-10 21:51:26', '100', '900', '1', '4');
INSERT INTO `book` VALUES ('7', '帝王阁', '2', '数学之父', '7', '27', '2019-07-10 21:55:10', '100', '900', '2', '4');
INSERT INTO `book` VALUES ('8', '山河昭彰', '2', '玖月', '8', '27', '2019-07-10 22:09:02', '700', '700', '1', '4');
INSERT INTO `book` VALUES ('9', '缘来斐浅', '2', '顾西爵', '9', '29', '2019-07-10 22:31:36', '50', '60', '2', '3');
INSERT INTO `book` VALUES ('10', '相亲何太急', '6', '华罗庚', '10', '15', '2019-07-10 23:10:28', '200', '900', '2', '4');
INSERT INTO `book` VALUES ('11', '暗示', '2', '萱萱', '11', '29', '2019-07-11 22:32:16', '700', '900', '1', '3');
INSERT INTO `book` VALUES ('12', '盛开的米兰花', '2', '轩轩', '12', '85', '2018-02-01 13:02:49', '100', '100', '1', '5');
INSERT INTO `book` VALUES ('13', '年画里的故事', '6', '红红', '13', '40', '2019-06-17 13:04:48', '105', '15', '1', '2');
INSERT INTO `book` VALUES ('14', '山水蛟龙', '4', '江东大汉', '14', '34', '2019-07-04 13:06:39', '11', '15', '1', '5');
INSERT INTO `book` VALUES ('15', '广漂', '4', '韩泉', '15', '16', '2019-06-10 13:07:55', '16', '110', '1', '4');
INSERT INTO `book` VALUES ('16', '红旗飘扬', '7', '火树', '16', '45', '2019-05-21 13:09:22', '13', '47', '1', '3');
INSERT INTO `book` VALUES ('17', '小家大爱', '4', '黎明', '17', '85', '2015-05-30 13:11:12', '100', '100', '1', '4');
INSERT INTO `book` VALUES ('18', '旷世烟火', '4', '陈亮', '18', '20', '2017-02-25 13:12:20', '85', '544', '1', '4');
INSERT INTO `book` VALUES ('19', '回到地球当神棍', '6', '顾小五', '19', '50', '2018-03-14 13:14:07', '77', '660', '1', '3');
INSERT INTO `book` VALUES ('20', '神枪惊世', '5', '黑瞎子', '20', '35', '2019-07-01 13:15:39', '33', '74', '1', '1');
INSERT INTO `book` VALUES ('21', '盗墓笔记', '5', '南派三叔', '21', '60', '2019-06-11 13:18:03', '44', '920', '1', '1');
INSERT INTO `book` VALUES ('22', '最后的师范生', '6', 'kk', '22', '80', '2019-06-19 13:19:23', '10', '450', '1', '1');
INSERT INTO `book` VALUES ('23', '传国工匠', '5', '小星星', '23', '46', '2019-06-11 13:21:05', '103', '500', '1', '5');
INSERT INTO `book` VALUES ('24', '星星的孩子', '5', '天空', '25', '98', '2019-05-13 13:24:04', '65', '165', '1', '3');
INSERT INTO `book` VALUES ('25', '心里治愈师', '3', '爱静', '65', '25', '2019-06-18 13:26:00', '10', '155', '1', '5');
INSERT INTO `book` VALUES ('26', '女王的法官', '3', '仙人掌', '26', '55', '2018-02-01 13:28:45', '45', '540', '1', '2');
INSERT INTO `book` VALUES ('27', '第二次初婚', '7', '凌晨', '27', '78', '2019-05-14 13:29:34', '10', '222', '1', '2');
INSERT INTO `book` VALUES ('28', '功夫医圣', '3', '人生几度', '28', '40', '2019-06-12 13:31:29', '15', '300', '1', '4');
INSERT INTO `book` VALUES ('29', '酒匠', '3', '316', '29', '45', '2019-05-15 13:32:50', '66', '55', '1', '5');
INSERT INTO `book` VALUES ('30', '仙尊破魔', '3', '法师', '30', '75', '2019-01-31 13:33:37', '99', '159', '1', '4');
INSERT INTO `book` VALUES ('31', 'asef', '3', 'asdq', '32', '23', '2019-07-18 17:30:30', '25', '224', '3', '5');

-- ----------------------------
-- Table structure for `bookdetails`
-- ----------------------------
DROP TABLE IF EXISTS `bookdetails`;
CREATE TABLE `bookdetails` (
  `picid` int(11) NOT NULL,
  `picAddress` varchar(60) DEFAULT NULL,
  `bookId` int(11) NOT NULL,
  `bookBref` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookdetails
-- ----------------------------
INSERT INTO `bookdetails` VALUES ('20', '/static/images/19.jpg', '1', '在得知自己还有一年多的生命后，秦雯没有任何犹豫，毅然决然的坚持着支教，将自己的一生都奉献给那些贫苦山区的孩子们。也许是上天的恩赐，她在生命的最后一段时间，竟然遇到了这么一群可爱的小家伙，还有，那个人……');
INSERT INTO `bookdetails` VALUES ('21', '/static/images/21.jpg', '2', '上界少帝重生下界，丹器双绝，天赋如妖。\r\n你有绝世丹经，未来丹王？对不起，那是我曾经丢的垃圾。\r\n你是器皇之徒，名满天下？不好意思，器皇曾经是我徒孙。');
INSERT INTO `bookdetails` VALUES ('22', '/static/images/22.jpg', '3', '大学毕业的凌安为了帮助家里还债，放弃了自己多年的文学梦想，独自一人来到金陵一家酒水销售公司工作。\r\n然而，历经无数挫折后，即将放弃的凌安却因亲眼得见在网文界前辈们的努力下，国家加大了打击抄袭的力度，并且规范支持网络文学创作，终于使得他再次坚定了创作梦想，哪怕家人的误解与阻拦，也没能将他打退。');
INSERT INTO `bookdetails` VALUES ('23', '/static/images/23.jpg', '4', '吴良穿越到古代去，想要开医馆？没门！想要治病救人？没门！幸好他有矿，有技术有钱！干啥不行？于是，有了资本，他在那大山深处，开矿修路，开荒种茶，什么活儿赚钱，他就做什么！赚他个一亿两白银，再将医馆开到每一个地方去，然后，治病救人！这大概是史上最富有的医生了……说是开医馆，其实不然，五花八门的事情吴良都在做，但最终的目标，都是为了开连锁医馆……');
INSERT INTO `bookdetails` VALUES ('24', '/static/images/24.jpg', '5', '那年大雪天，山上的狼下山叼走了村子里的孩子，我的“狐狸”妈跟狼厮杀救了我，她浑身都是鲜血，叔叔赶走了她，二十年之后，她又回来了，我亲手杀了她……');
INSERT INTO `bookdetails` VALUES ('25', '/static/images/25.jpg', '6', '这是一部反映我国基层法院法官办案生活的长篇小说。本书以朴素的语言，讲述了一群基层法官的喜怒哀乐酸甜苦辣。面对压力，他们用正气战胜妥协；面对诱惑，他们用淡定抵御冲动；面对恐吓，他们用凛然涤荡怯懦。他们用热血、智慧，甚至生命，展示了基层法官的理想、信念、责任、担当。');
INSERT INTO `bookdetails` VALUES ('26', '/static/images/26.jpg', '7', '天地为牢，岁月为锁，大道路艰，吾心所向，破四海八荒，驭万物生灵。');
INSERT INTO `bookdetails` VALUES ('27', '/static/images/27.jpg', '8', '山河漫漫，长夜无尽，此路荆刺遍布，豺狼满地，角落藏满龌龊，风雨飘散血腥。明知如此，你是否仍将怀揣一点星火，手持一把白刃，攀越江流大川，登上神圣法庭，将那星火献与你灵魂深处的信仰？\r\n她以命宣誓作答：此生不渝。');
INSERT INTO `bookdetails` VALUES ('28', '/static/images/28.jpg', '9', '平静的生活被打破，面对重重迷惑，她决定去寻求真相…本以为遇到了此生挚爱，谁料成了过眼云烟，当决定绝情绝爱时，却被一个‘疯子’‘绑住’!袁央勤：遇到你，是我这一生幸会的感动!');
INSERT INTO `bookdetails` VALUES ('29', '/static/images/29.jpg', '10', '向卿做了这辈子最叛逆的事情——假结婚。女人到三十岁嫁不出去就会贬值，成为没人要的剩女，被街坊领居、七大姑八大姨嘲笑，父母恨不得你揪住一个男的就马上结婚，打卡生仔，走上妇女巅峰。\r\n没想到毒舌的老公何太鲫居然藏着一个秘密，阴差阳错的两人历经前任出没、父母作妖、工作波折，最后磕磕碰碰在一起。');
INSERT INTO `bookdetails` VALUES ('30', '/static/images/29.jpg', '11', '她十岁跟随姐姐入了深宫，二十岁目睹姐姐惨死，借助皇后爬上龙床。亲眼目睹姐姐被活埋，为复仇巧施计谋扳倒林彩霞，凶手却另有其人，一步步追查，一个惊天大秘密浮出水面……\r\n武王妃看皇帝被冷清颜问的哑口无言，清冷的眸子暗潮涌动，柔柔弱弱的说道：“陛下，您莫要误会了贵妃娘娘，妾身觉得这事情不可能是贵妃娘娘做的。”');
INSERT INTO `bookdetails` VALUES ('1', '/static/images/1.jpg', '12', '刚从大学毕业的米兰进入了朝阳初级中学当起了代课教师，满怀信心的想成为一名优秀的教育工作者，可现实遇到了种种困难，她这朵刚刚绽放的米兰花，能否抵抗得住风吹雨打？能否抵御住尘世的各种诱惑和侵蚀？是否实现自己的理想？');
INSERT INTO `bookdetails` VALUES ('2', '/static/images/2.jpg', '13', '年画是传统年节必须品，每刚从大学毕业的米兰进入了朝阳初级中学当起了代课教师，满怀信心的想成为一名优秀的教育工作者，可现实遇到了种种困难，她这朵刚刚绽放的米兰花，能否抵抗得住风吹雨打？能否抵御住尘世的各种诱惑和侵蚀？是否实现自己的理想？\r\n一幅年画都有一个故事。 ');
INSERT INTO `bookdetails` VALUES ('3', '/static/images/3.jpg', '14', '他本是一个穷苦农家的一个俊朗青年，从小在虚云法师的教导下，文武双全。北大毕业后，为了爱情，为了照顾多病的母亲，回到家乡做了一名大学生村官。机缘巧合，得知自己的亲生父母身居高位，他该何去何从？父母能给他的仕途之路助一臂之力吗？在村官的岗位上，他是如何凭借自己的聪明才智，带领群众脱贫致富？……请看都市励志小说《山水蛟龙》！');
INSERT INTO `bookdetails` VALUES ('4', '/static/images/4.jpg', '15', '出生农村的我没文化、没背景、没资金...三无产品的我，为了活下去，走出大山来到广东澄海，通过邻居姐姐的介绍进入工厂。我一步一个脚印踩在通往成功的这条坎坷崎岖道路上，咬牙承受各种白眼与嘲讽，埋头奋斗的同时不断自我学习，充实自己的知识与眼界。半年后我开办了自己的工厂，娶到了雨燕，我们相知相爱，一路相互扶持，克服重重困难，创造更美好的生活。');
INSERT INTO `bookdetails` VALUES ('5', '/static/images/5.jpg', '16', '看着满目疮痍，尸横遍野的战场，那里躺着自己的兄弟、亲人、爱人……李立龙把砍卷了的大刀往地上一插，沧然泪下！ \r\n他不明白战争，但他知道一点：当无可避之时，就要勇敢面对！付出一切，在所不惜！ ');
INSERT INTO `bookdetails` VALUES ('6', '/static/images/6.jpg', '17', '以男女主为中心的90年代家庭，展开一系列的当代背景下父子，父女，兄弟姐妹之间的家庭故事，父母对子女从不言说的爱，兄弟之间的手足情，以及妯娌姐妹之间的立场不同，所做出的选择也不能让每个人满意，剖析展现出每个家庭的道德，底线，和人性最终的选择，人的善与恶，从来都不是靠一面来评判的，但不管发生了什么，都始终是一家人的大爱和互相包容的正能量生活。');
INSERT INTO `bookdetails` VALUES ('7', '/static/images/7.jpg', '18', '故事从1949年开始，以中国东南300里楠溪江流域第一大财主家新寡的徐大小姐为主人公，通过这位文弱女子大起大落的生活为背景，描写与她相关的各个历史背景下各个阶层的家族和社会人物， 展现一幅从新中国成立到“改革开放40年”共70年期间，中国东南大地——瓯江两岸的社会形象的历史画卷，由徐大小姐的生活线为脉络，史诗般展现温州这块神奇土地上各个社会阶层各种人物在各个特殊历史阶段的政治、经济、人文、风土和情感历程。');
INSERT INTO `bookdetails` VALUES ('8', '/static/images/8.jpg', '19', '他，曾经失踪八年。可没有人想到，他是穿越到了异界，并且修炼了八千年！ \r\n他，拐跑了豪门千金。可没有人想到，他在拐跑千金的同时，顺便灭了人家的无良未婚夫。 \r\n他，在寻找妹妹。可没有人想到，他在找妹妹的过程中，同时干翻了地球上的所有大势力。 \r\n他能炼丹，会打架，若是有人惹了他……');
INSERT INTO `bookdetails` VALUES ('9', '/static/images/9.jpg', '20', '原振衣自幼习武，在一次与日本忍者的比武中，受修真人暗算，险些丧命，为治愈受伤的经络，他遍访名山，寻找高人。偶然间被龙陵派收为记名弟子，揭开了现代修真的一幕，在寻常的饮食男女背后，是普通人从没见过的光怪陆离……');
INSERT INTO `bookdetails` VALUES ('10', '/static/images/10.jpg', '21', '50年前由长沙土夫子（盗墓贼）出土的战国帛书，记载了一个奇特战国古墓的位置，50年后，其中一个土夫子的孙子在他的笔记中发现这个秘密，纠集了一批经验丰富的盗墓贼前去寻宝，谁也没有想到，这个古墓竟然有着这么多诡异的事情：七星疑棺，青眼狐尸，九头蛇柏。这神秘的墓主人到底是谁，他们到底能不能找到真正的棺椁？故事悬念重重，情节跌荡，值得一看。原振衣自幼习武，在一次与日本忍者的比武中，受修真人暗算，险些丧命，为治愈受伤的经络，他遍访名山，');
INSERT INTO `bookdetails` VALUES ('11', '/static/images/11.jpg', '22', '那一年，全国的中师教育陆续取消，师范校消失了，而师范生却成为了永远的师范生。\r\n凌冬——一个大山深处的小村庄里的农家小丫头，高考那年，她以静水县第十六名的成绩考取了清江师范学校。');
INSERT INTO `bookdetails` VALUES ('12', '/static/images/12.jpg', '23', '中国东南沿海瓯江流域，为了一个七十年前不同寻常的盟约，五家顶级瓯派（温州）匠工的传人在寻找秘笈《瓯宝图》过程中，与境外正邪两大力量之间发生殊死冲突及各派瓯越匠人之间颇有历史渊源的爱恨情仇的传奇。');
INSERT INTO `bookdetails` VALUES ('13', '/static/images/13.jpg', '24', '辞职，是向阳一生中最冲动的决定。她并没有想好之后的路该怎么走，可命运的牵引，却让她逐渐找到了人生的方向。她不是一个圣人，然而她却充满了勇气。沈铭远优越的条件，并没有令她产生留念。可当幼小的沈杰屈膝缩在墙角的时候，她却义无反顾的踏入了自闭症的荆棘中，向他伸出了温暖的手。');
INSERT INTO `bookdetails` VALUES ('14', '/static/images/14.jpg', '25', '苏木原以为她的人生永远不会和危险扯上关系。\r\n当那个穿着黑色斗篷的男人出现在她面前时，周遭的一切都变得分外陌生，好像从前活着的那些年不过做了一场虚假梦境。');
INSERT INTO `bookdetails` VALUES ('15', '/static/images/15.jpg', '26', '精明能干的女律师与潜伏其身边别有所图的助理之间解决各种诉讼案件，期间两人经历了一次又一次人性与良知的考验，在一次次的选择中明白了公平正义的真谛，与律师行业存在的真正意义，也更加坚定了人生的目标，共同成长为名副其实的大律师的故事。');
INSERT INTO `bookdetails` VALUES ('16', '/static/images/16.jpg', '27', '她是最底层的试睡师，一个被误解的新兴行业，可她缔造了管理学上最强悍的传奇。二十年如一日的坚持，她终于以中国人的身份在国际舞台上站稳脚跟。平凡的岗位，绽放着最可爱的守护，缔结出纯洁美好的守望。');
INSERT INTO `bookdetails` VALUES ('17', '/static/images/17.jpg', '28', '小医病，大医人，重医天下！ \r\n一次偶然，乡村少年杨飞为了完成爷爷的心愿走入了繁华的都市。 \r\n在金钱的诱惑，情感的纠葛，生命的威胁之中， \r\n以古老的医术，自身的智慧，败敌破局，打破种种的阴谋和陈规。 \r\n最终登临绝顶，活在传说之中！');
INSERT INTO `bookdetails` VALUES ('18', '/static/images/18.jpg', '29', '社会发展迅速，老一辈的手工酿酒技艺逐渐被机械代替，茂云云家族的传统茅台酿造法到这一代只有她一个人继承。\r\n小酒种推陈出新，新酿酒技术高产，曾经红极一时的几大名酒销声匿迹，市场上，假的假乱的乱。\r\n拍卖会上，茂云云因为拒拍父亲亲手酿造的茅台酒认识陈栋，违约而和他签订劳务合同。');
INSERT INTO `bookdetails` VALUES ('19', '/static/images/19.jpg', '30', '神秘的少年从山中走出，没有记忆的他被陌生家庭接纳，天生的神力，惊现的神术，逆天的修行资质，随着少年慢慢地成长，一个个秘密也是接踵而来，属于他的使命，终将要他来完成。\r\n20. 在得知自己还有一年多的生命后，秦雯没有任何犹豫，毅然决然的坚持着支教，将自己的一生都奉献给那些贫苦山区的孩子们。也许是上天的恩赐，她在生命的最后一段时间，竟然遇到了这么一群可爱的小家伙，还有，那个人……');

-- ----------------------------
-- Table structure for `bookorder`
-- ----------------------------
DROP TABLE IF EXISTS `bookorder`;
CREATE TABLE `bookorder` (
  `orderid` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `orderPrice` int(20) NOT NULL COMMENT '订单价格',
  `orderDate` datetime NOT NULL COMMENT '订单时间',
  `readerId` int(20) NOT NULL COMMENT '用户id',
  `bookId` int(40) NOT NULL DEFAULT '11' COMMENT '书籍id',
  `bookName` varchar(40) DEFAULT NULL,
  `discountId` int(20) NOT NULL DEFAULT '1' COMMENT '1.限时免费2.9折3.5折',
  `orderStatus` int(11) NOT NULL DEFAULT '2' COMMENT '状态：1.待确定 2.已完成 3.已取消',
  `payStatus` int(10) NOT NULL DEFAULT '2' COMMENT '状态：1.待支付 2.已支付',
  `payWay` varchar(32) NOT NULL DEFAULT '1' COMMENT '1.支付宝2.微信3.银行卡',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of bookorder
-- ----------------------------
INSERT INTO `bookorder` VALUES ('1', '24', '2019-07-10 10:35:47', '11', '1', '', '1', '1', '2', '微信');
INSERT INTO `bookorder` VALUES ('2', '34', '2019-07-17 10:36:16', '1', '1', '', '2', '1', '1', '支付宝');
INSERT INTO `bookorder` VALUES ('3', '10', '2019-07-10 13:51:41', '2', '1', '', '2', '1', '2', '支付宝');
INSERT INTO `bookorder` VALUES ('4', '23', '2019-07-10 15:44:53', '5', '1', '', '2', '2', '2', '支付宝');
INSERT INTO `bookorder` VALUES ('5', '13', '2019-07-10 15:46:13', '8', '1', '', '2', '3', '2', '支付宝');
INSERT INTO `bookorder` VALUES ('6', '454', '2019-07-10 17:57:50', '9', '1', '', '2', '1', '2', '微信');
INSERT INTO `bookorder` VALUES ('7', '44', '2019-07-10 20:11:26', '4', '1', '', '2', '3', '2', '银行卡');
INSERT INTO `bookorder` VALUES ('8', '4', '2019-07-11 00:10:27', '1', '1', '', '1', '3', '2', '银行卡');
INSERT INTO `bookorder` VALUES ('9', '123', '2019-07-11 00:22:32', '3', '1', '', '1', '3', '2', '银行卡');
INSERT INTO `bookorder` VALUES ('10', '34', '2019-07-12 14:30:45', '5', '1', '', '2', '2', '2', '微信');
INSERT INTO `bookorder` VALUES ('11', '23', '2019-07-12 14:33:50', '6', '1', '', '100', '2', '2', '微信');
INSERT INTO `bookorder` VALUES ('12', '20', '2019-07-15 21:05:57', '1', '2', null, '1', '1', '1', '支付方式');
INSERT INTO `bookorder` VALUES ('13', '20', '2019-07-15 21:07:50', '1', '2', null, '1', '1', '1', '支付方式');
INSERT INTO `bookorder` VALUES ('14', '19', '2019-07-16 19:54:52', '1', '1', null, '1', '1', '1', '支付宝');
INSERT INTO `bookorder` VALUES ('15', '19', '2019-07-16 19:55:29', '1', '1', null, '1', '1', '1', '微信');
INSERT INTO `bookorder` VALUES ('16', '19', '2019-07-16 19:55:58', '1', '1', null, '1', '1', '1', '支付方式');
INSERT INTO `bookorder` VALUES ('17', '35', '2019-07-17 18:21:37', '1', '20', null, '1', '1', '1', '支付宝');
INSERT INTO `bookorder` VALUES ('18', '35', '2019-07-17 18:24:11', '1', '20', null, '1', '1', '1', '支付方式');
INSERT INTO `bookorder` VALUES ('19', '35', '2019-07-17 18:32:15', '1', '20', null, '1', '1', '1', '支付方式');
INSERT INTO `bookorder` VALUES ('20', '35', '2019-07-17 18:38:38', '1', '20', null, '1', '1', '1', '支付宝');
INSERT INTO `bookorder` VALUES ('21', '35', '2019-07-17 18:39:36', '1', '20', null, '1', '1', '1', '支付方式');
INSERT INTO `bookorder` VALUES ('22', '35', '2019-07-17 18:42:23', '1', '20', null, '1', '1', '1', '支付方式');

-- ----------------------------
-- Table structure for `chapter`
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `chapterId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `chapterName` varchar(20) NOT NULL,
  `chapterContent` varchar(1000) NOT NULL,
  `chapterWordNumber` int(11) NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`chapterId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter
-- ----------------------------
INSERT INTO `chapter` VALUES ('1', '1', '第一章 梦仙', '在得知自己还有一年多的生命后，秦雯没有任何犹豫，毅然决然的坚持着支教，将自己的一生都奉献给那些贫苦山区的孩子们。也许是上天的恩赐，她在生命的最后一段时间，竟然遇到了这么一群可爱的小家伙，还有，那个人……', '1000', '2019-05-02 10:58:30');
INSERT INTO `chapter` VALUES ('2', '2', '第一章 重回', '你是器皇之徒，名满天下？不好意思，器皇曾经是我徒孙。', '900', '2019-07-03 11:01:16');
INSERT INTO `chapter` VALUES ('3', '3', '第一章 梦仙', '大学毕业的凌安为了帮助家里还债，放弃了自己多年的文学梦想，独自一人来到金陵一家酒水销售公司工作。\r\n然而，历经无数挫折后，即将放弃的凌安却因亲眼得见在网文界前辈们的努力下，国家加大了打击抄袭的力度，并且规范支持网络文学创作，终于使得他再次坚定了创作梦想，哪怕家人的误解与阻拦，也没能将他打退。', '800', '2019-07-11 17:45:49');
INSERT INTO `chapter` VALUES ('4', '4', '第三章 回归', '吴良穿越到古代去，想要开医馆？没门！想要治病救人？没门！幸好他有矿，有技术有钱！干啥不行？于是，有了资本，他在那大山深处，开矿修路，开荒种茶，什么活儿赚钱，他就做什么！赚他个一亿两白银，再将医馆开到每一个地方去，然后，治病救人！这大概是史上最富有的医生了……说是开医馆，其实不然，五花八门的事情吴良都在做，但最终的目标，都是为了开连锁医馆……', '1200', '2019-07-11 22:34:50');
INSERT INTO `chapter` VALUES ('5', '5', '第四章 出现', '那年大雪天，山上的狼下山叼走了村子里的孩子，我的“狐狸”妈跟狼厮杀救了我，她浑身都是鲜血，叔叔赶走了她，二十年之后，她又回来了，我亲手杀了她……', '1000', '2019-07-11 22:43:16');
INSERT INTO `chapter` VALUES ('6', '6', '第一章 梦仙', '这是一部反映我国基层法院法官办案生活的长篇小说。本书以朴素的语言，讲述了一群基层法官的喜怒哀乐酸甜苦辣。面对压力，他们用正气战胜妥协；面对诱惑，他们用淡定抵御冲动；面对恐吓，他们用凛然涤荡怯懦。他们用热血、智慧，甚至生命，展示了基层法官的理想、信念、责任、担当。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('7', '7', '第一章 梦仙', '天地为牢，岁月为锁，大道路艰，吾心所向，破四海八荒，驭万物生灵。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('8', '8', '第一章 梦仙', '山河漫漫，长夜无尽，此路荆刺遍布，豺狼满地，角落藏满龌龊，风雨飘散血腥。明知如此，你是否仍将怀揣一点星火，手持一把白刃，攀越江流大川，登上神圣法庭，将那星火献与你灵魂深处的信仰？\r\n她以命宣誓作答：此生不渝。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('9', '9', '第一章 梦仙', '平静的生活被打破，面对重重迷惑，她决定去寻求真相…本以为遇到了此生挚爱，谁料成了过眼云烟，当决定绝情绝爱时，却被一个‘疯子’‘绑住’!袁央勤：遇到你，是我这一生幸会的感动!', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('10', '10', '第一章 梦仙', '向卿做了这辈子最叛逆的事情——假结婚。女人到三十岁嫁不出去就会贬值，成为没人要的剩女，被街坊领居、七大姑八大姨嘲笑，父母恨不得你揪住一个男的就马上结婚，打卡生仔，走上妇女巅峰。\r\n没想到毒舌的老公何太鲫居然藏着一个秘密，阴差阳错的两人历经前任出没、父母作妖、工作波折，最后磕磕碰碰在一起。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('11', '11', '第一章 梦仙', '她十岁跟随姐姐入了深宫，二十岁目睹姐姐惨死，借助皇后爬上龙床。亲眼目睹姐姐被活埋，为复仇巧施计谋扳倒林彩霞，凶手却另有其人，一步步追查，一个惊天大秘密浮出水面……\r\n武王妃看皇帝被冷清颜问的哑口无言，清冷的眸子暗潮涌动，柔柔弱弱的说道：“陛下，您莫要误会了贵妃娘娘，妾身觉得这事情不可能是贵妃娘娘做的。”', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('12', '12', '第一章 梦仙', '刚从大学毕业的米兰进入了朝阳初级中学当起了代课教师，满怀信心的想成为一名优秀的教育工作者，可现实遇到了种种困难，她这朵刚刚绽放的米兰花，能否抵抗得住风吹雨打？能否抵御住尘世的各种诱惑和侵蚀？是否实现自己的理想？', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('13', '13', '第一章 梦仙', '年画是传统年节必须品，每刚从大学毕业的米兰进入了朝阳初级中学当起了代课教师，满怀信心的想成为一名优秀的教育工作者，可现实遇到了种种困难，她这朵刚刚绽放的米兰花，能否抵抗得住风吹雨打？能否抵御住尘世的各种诱惑和侵蚀？是否实现自己的理想？\r\n一幅年画都有一个故事。 ', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('14', '14', '第一章 梦仙', '他本是一个穷苦农家的一个俊朗青年，从小在虚云法师的教导下，文武双全。北大毕业后，为了爱情，为了照顾多病的母亲，回到家乡做了一名大学生村官。机缘巧合，得知自己的亲生父母身居高位，他该何去何从？父母能给他的仕途之路助一臂之力吗？在村官的岗位上，他是如何凭借自己的聪明才智，带领群众脱贫致富？……请看都市励志小说《山水蛟龙》！', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('15', '15', '第一章 梦仙', '出生农村的我没文化、没背景、没资金...三无产品的我，为了活下去，走出大山来到广东澄海，通过邻居姐姐的介绍进入工厂。我一步一个脚印踩在通往成功的这条坎坷崎岖道路上，咬牙承受各种白眼与嘲讽，埋头奋斗的同时不断自我学习，充实自己的知识与眼界。半年后我开办了自己的工厂，娶到了雨燕，我们相知相爱，一路相互扶持，克服重重困难，创造更美好的生活。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('16', '16', '第一章 梦仙', '看着满目疮痍，尸横遍野的战场，那里躺着自己的兄弟、亲人、爱人……李立龙把砍卷了的大刀往地上一插，沧然泪下！ \r\n他不明白战争，但他知道一点：当无可避之时，就要勇敢面对！付出一切，在所不惜！ ', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('17', '17', '第一章 梦仙', '以男女主为中心的90年代家庭，展开一系列的当代背景下父子，父女，兄弟姐妹之间的家庭故事，父母对子女从不言说的爱，兄弟之间的手足情，以及妯娌姐妹之间的立场不同，所做出的选择也不能让每个人满意，剖析展现出每个家庭的道德，底线，和人性最终的选择，人的善与恶，从来都不是靠一面来评判的，但不管发生了什么，都始终是一家人的大爱和互相包容的正能量生活。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('18', '18', '第一章 梦仙', '故事从1949年开始，以中国东南300里楠溪江流域第一大财主家新寡的徐大小姐为主人公，通过这位文弱女子大起大落的生活为背景，描写与她相关的各个历史背景下各个阶层的家族和社会人物， 展现一幅从新中国成立到“改革开放40年”共70年期间，中国东南大地——瓯江两岸的社会形象的历史画卷，由徐大小姐的生活线为脉络，史诗般展现温州这块神奇土地上各个社会阶层各种人物在各个特殊历史阶段的政治、经济、人文、风土和情感历程。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('19', '19', '第一章 梦仙', '他，曾经失踪八年。可没有人想到，他是穿越到了异界，并且修炼了八千年！ \r\n他，拐跑了豪门千金。可没有人想到，他在拐跑千金的同时，顺便灭了人家的无良未婚夫。 \r\n他，在寻找妹妹。可没有人想到，他在找妹妹的过程中，同时干翻了地球上的所有大势力。 \r\n他能炼丹，会打架，若是有人惹了他……', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('20', '20', '第一章 梦仙', '原振衣自幼习武，在一次与日本忍者的比武中，受修真人暗算，险些丧命，为治愈受伤的经络，他遍访名山，寻找高人。偶然间被龙陵派收为记名弟子，揭开了现代修真的一幕，在寻常的饮食男女背后，是普通人从没见过的光怪陆离……', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('21', '21', '第一章 梦仙', '50年前由长沙土夫子（盗墓贼）出土的战国帛书，记载了一个奇特战国古墓的位置，50年后，其中一个土夫子的孙子在他的笔记中发现这个秘密，纠集了一批经验丰富的盗墓贼前去寻宝，谁也没有想到，这个古墓竟然有着这么多诡异的事情：七星疑棺，青眼狐尸，九头蛇柏。这神秘的墓主人到底是谁，他们到底能不能找到真正的棺椁？故事悬念重重，情节跌荡，值得一看。原振衣自幼习武，在一次与日本忍者的比武中，受修真人暗算，险些丧命，为治愈受伤的经络，他遍访名山，寻找高人。偶然间被龙陵派收为记名弟子，揭开了现代修真的一幕，在寻常的饮食男女背后，是普通人从没见过的光怪陆离……', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('22', '22', '第一章 梦仙', '那一年，全国的中师教育陆续取消，师范校消失了，而师范生却成为了永远的师范生。\r\n凌冬——一个大山深处的小村庄里的农家小丫头，高考那年，她以静水县第十六名的成绩考取了清江师范学校。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('23', '23', '第一章 梦仙', '中国东南沿海瓯江流域，为了一个七十年前不同寻常的盟约，五家顶级瓯派（温州）匠工的传人在寻找秘笈《瓯宝图》过程中，与境外正邪两大力量之间发生殊死冲突及各派瓯越匠人之间颇有历史渊源的爱恨情仇的传奇。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('24', '24', '第一章 梦仙', '辞职，是向阳一生中最冲动的决定。她并没有想好之后的路该怎么走，可命运的牵引，却让她逐渐找到了人生的方向。她不是一个圣人，然而她却充满了勇气。沈铭远优越的条件，并没有令她产生留念。可当幼小的沈杰屈膝缩在墙角的时候，她却义无反顾的踏入了自闭症的荆棘中，向他伸出了温暖的手。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('25', '25', '第一章 梦仙', '苏木原以为她的人生永远不会和危险扯上关系。\r\n当那个穿着黑色斗篷的男人出现在她面前时，周遭的一切都变得分外陌生，好像从前活着的那些年不过做了一场虚假梦境。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('26', '26', '第一章 梦仙', '精明能干的女律师与潜伏其身边别有所图的助理之间解决各种诉讼案件，期间两人经历了一次又一次人性与良知的考验，在一次次的选择中明白了公平正义的真谛，与律师行业存在的真正意义，也更加坚定了人生的目标，共同成长为名副其实的大律师的故事。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('27', '27', '第一章 梦仙', '她是最底层的试睡师，一个被误解的新兴行业，可她缔造了管理学上最强悍的传奇。二十年如一日的坚持，她终于以中国人的身份在国际舞台上站稳脚跟。平凡的岗位，绽放着最可爱的守护，缔结出纯洁美好的守望。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('28', '28', '第一章 梦仙', '小医病，大医人，重医天下！ \r\n一次偶然，乡村少年杨飞为了完成爷爷的心愿走入了繁华的都市。 \r\n在金钱的诱惑，情感的纠葛，生命的威胁之中， \r\n以古老的医术，自身的智慧，败敌破局，打破种种的阴谋和陈规。 \r\n最终登临绝顶，活在传说之中！', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('29', '29', '第一章 梦仙', '社会发展迅速，老一辈的手工酿酒技艺逐渐被机械代替，茂云云家族的传统茅台酿造法到这一代只有她一个人继承。\r\n小酒种推陈出新，新酿酒技术高产，曾经红极一时的几大名酒销声匿迹，市场上，假的假乱的乱。\r\n拍卖会上，茂云云因为拒拍父亲亲手酿造的茅台酒认识陈栋，违约而和他签订劳务合同。', '556', '2019-05-14 16:35:44');
INSERT INTO `chapter` VALUES ('30', '30', '第一章 梦仙', '神秘的少年从山中走出，没有记忆的他被陌生家庭接纳，天生的神力，惊现的神术，逆天的修行资质，随着少年慢慢地成长，一个个秘密也是接踵而来，属于他的使命，终将要他来完成。\r\n20. 在得知自己还有一年多的生命后，秦雯没有任何犹豫，毅然决然的坚持着支教，将自己的一生都奉献给那些贫苦山区的孩子们。也许是上天的恩赐，她在生命的最后一段时间，竟然遇到了这么一群可爱的小家伙，还有，那个人……', '556', '2019-05-14 16:35:44');

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collectId` int(11) NOT NULL AUTO_INCREMENT,
  `readerName` varchar(32) NOT NULL,
  `bookName` varchar(32) NOT NULL,
  `collectDate` datetime NOT NULL,
  PRIMARY KEY (`collectId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('1', '韩梅梅', '小时代', '2019-07-10 10:21:41');
INSERT INTO `collect` VALUES ('2', 'Davis', '天衣凤九', '2019-07-16 10:23:11');
INSERT INTO `collect` VALUES ('3', 'antony', '奥数', '2019-07-02 10:23:46');
INSERT INTO `collect` VALUES ('4', 'cc', '仙侣尘劫', '2019-06-19 10:40:09');
INSERT INTO `collect` VALUES ('5', 'james', '何所冬暖', '2018-06-13 10:42:10');
INSERT INTO `collect` VALUES ('6', '李华', '药门仙衣', '2019-06-18 10:51:20');
INSERT INTO `collect` VALUES ('7', 'huimaj', '奥数', '2019-05-15 10:51:50');
INSERT INTO `collect` VALUES ('8', '张三', '科技图书馆', '2019-05-22 10:52:31');

-- ----------------------------
-- Table structure for `discount`
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `actId` int(20) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `actName` varchar(30) NOT NULL COMMENT '活动名字',
  `startDate` datetime NOT NULL COMMENT '开始时间',
  `endDate` datetime NOT NULL COMMENT '结束时间',
  `actStatus` int(30) NOT NULL DEFAULT '1' COMMENT '活动状态：1.进行中2.未进行3.已过期',
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES ('1', '限时全免', '2019-07-01 17:40:20', '2019-09-19 17:40:26', '1');
INSERT INTO `discount` VALUES ('2', '9折优惠', '2019-07-16 17:41:13', '2019-08-23 17:41:18', '1');
INSERT INTO `discount` VALUES ('3', '7折优惠', '2019-08-14 17:41:37', '2020-01-23 17:41:41', '2');
INSERT INTO `discount` VALUES ('4', '8折', '2019-07-11 19:10:52', '2019-07-11 19:10:52', '2');
INSERT INTO `discount` VALUES ('5', '八折优惠', '2019-07-12 14:31:27', '2019-07-12 16:44:47', '1');

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `readerName` varchar(20) NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `bookType` int(11) NOT NULL COMMENT '3.古代，4.科幻，5.幻想，6.言情',
  `historyTime` datetime NOT NULL,
  PRIMARY KEY (`historyId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1', '张三', '末日轮盘', '4', '2019-07-11 13:40:45');
INSERT INTO `history` VALUES ('4', '赵蓉蓉', '何所冬暖', '6', '2019-07-11 14:57:33');
INSERT INTO `history` VALUES ('5', '邓灯', '少年锦时', '5', '2019-07-11 22:44:58');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `messageContent` varchar(64) NOT NULL COMMENT '留言内容',
  `messageDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间',
  `readerId` int(11) DEFAULT NULL,
  `bookId` int(11) NOT NULL COMMENT '小说ID',
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'hjbhjghjghg', '2019-07-14 19:09:38', '1', '7');
INSERT INTO `message` VALUES ('2', 'asdasdasdasd', '2019-07-24 23:54:06', '2', '2');
INSERT INTO `message` VALUES ('3', 'hjbhjghjghg', '2019-07-14 19:09:40', '3', '7');
INSERT INTO `message` VALUES ('4', 'today is a nice day', '2019-07-09 19:53:08', '4', '1');
INSERT INTO `message` VALUES ('5', 'hahahaha', '2019-07-09 19:53:21', '5', '9');
INSERT INTO `message` VALUES ('8', '你从来不是一个人', '2019-07-14 19:09:41', '6', '7');
INSERT INTO `message` VALUES ('11', 'frehth', '2019-07-09 21:48:50', '9', '5');
INSERT INTO `message` VALUES ('13', 'if you want to do sth,tell me', '2019-07-10 11:49:48', '7', '20');
INSERT INTO `message` VALUES ('14', '末日轮盘', '2019-07-14 19:09:42', '8', '7');
INSERT INTO `message` VALUES ('15', '嘿嘿额', '2019-07-11 19:42:32', '9', '3');
INSERT INTO `message` VALUES ('16', 'today is a nice day', '2019-07-14 19:09:43', '10', '7');
INSERT INTO `message` VALUES ('17', '这部小说真的是超级好看了，我要熬通宵！！', '2019-07-11 20:12:46', '11', '15');
INSERT INTO `message` VALUES ('18', '这部小说真的是超级好看了，我要熬通宵！！', '2019-07-14 19:17:20', '2', '7');
INSERT INTO `message` VALUES ('19', '这部小说真的是超级好看了', '2019-07-14 19:20:45', '2', '7');
INSERT INTO `message` VALUES ('20', '这部小说真的是超级好看了', '2019-07-14 19:21:32', '2', '7');
INSERT INTO `message` VALUES ('21', '；来来来', '2019-07-14 19:21:45', '2', '7');
INSERT INTO `message` VALUES ('22', '44444', '2019-07-14 19:21:57', '2', '7');
INSERT INTO `message` VALUES ('23', '这部小说真的是超级好看了', '2019-07-14 19:24:27', '2', '7');
INSERT INTO `message` VALUES ('24', '111111', '2019-07-15 15:17:01', '2', '5');
INSERT INTO `message` VALUES ('25', '阿达萨达', '2019-07-15 21:55:00', '2', '1');
INSERT INTO `message` VALUES ('26', '1111', '2019-07-18 17:33:51', '2', '1');

-- ----------------------------
-- Table structure for `reader`
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `readerId` int(11) NOT NULL AUTO_INCREMENT,
  `readerName` varchar(32) NOT NULL,
  `readerPhone` bigint(20) NOT NULL DEFAULT '28' COMMENT '电话',
  `readerEmail` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(64) NOT NULL COMMENT '读者密码',
  `readerAge` char(5) DEFAULT NULL,
  `readerSex` int(11) DEFAULT '1' COMMENT '性别：1.男 2.女',
  `balance` double DEFAULT '0' COMMENT '用户余额',
  `readerAddTime` datetime DEFAULT NULL COMMENT '注册时间',
  `readerStatus` int(11) DEFAULT '1' COMMENT '状态：1.在线 2.已删除 3.注销',
  PRIMARY KEY (`readerId`),
  UNIQUE KEY `reader_name` (`readerName`),
  UNIQUE KEY `readerPhone` (`readerPhone`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('1', 'jerry', '28', null, '96E7921896DD5A3301125EB72C92A549', '20', '1', '0', null, '1');
INSERT INTO `reader` VALUES ('2', '张三', '13654822568', '148722885@qq.com', '96E7921896DD5A3301125EB72C92A549', '18', '1', '0', null, '1');
INSERT INTO `reader` VALUES ('3', 'asdad', '1516545', null, '112366', '30', '1', '0', null, '1');
INSERT INTO `reader` VALUES ('4', 'sadsd', '13353198624', null, '112233', '17', '1', '0', null, '1');
INSERT INTO `reader` VALUES ('5', 'james', '18111158838', '1357126302@qq.com', '123154', '20', '1', '0', '2019-07-08 16:20:36', '1');
INSERT INTO `reader` VALUES ('7', '李华', '18115425774', '8771569155@qq.com', '231123', '26', '1', '0', '2019-07-08 16:33:52', '1');
INSERT INTO `reader` VALUES ('8', '韩梅梅', '15183674687', '4557665155@qq.com', '', '22', '1', '0', '2019-07-08 16:35:43', '1');
INSERT INTO `reader` VALUES ('9', 'cc', '18115925774', '45123665155@qq.com', '', '25', '2', '0', '2019-07-09 22:54:41', '1');
INSERT INTO `reader` VALUES ('10', 'huimaj', '19623674687', '318289155@qq.com', '', '22', '2', '0', '2019-07-09 23:14:12', '2');
INSERT INTO `reader` VALUES ('11', 'antony', '15635925774', '299298455@qq.com', '', '24', '1', '0', '2019-07-09 23:15:11', '1');
INSERT INTO `reader` VALUES ('12', 'lllll', '16783674687', '2347665155@qq.com', '', '34', '1', '0', '2019-07-12 10:04:13', '1');
INSERT INTO `reader` VALUES ('13', '888643', '18115933474', '434534555@qq.com', '', '22', '2', '0', '2019-07-12 10:04:36', '1');
INSERT INTO `reader` VALUES ('15', '55156', '18554152774', '455131445@qq.com', '', '41', '2', '0', '2019-07-12 10:05:56', '3');
INSERT INTO `reader` VALUES ('16', 'dsadaasd', '15183151687', '4556565155@qq.com', 'asdasdas', null, '1', '0', '2019-07-17 20:03:29', '1');
INSERT INTO `reader` VALUES ('18', 'sadasdasd', '15156486687', '4557665155@qq.com', 'asdadasd', null, '1', '0', '2019-07-17 20:07:20', '1');
INSERT INTO `reader` VALUES ('19', 'asdsadas', '15612325774', '4551235155@qq.com', 'sadasdasd', null, '1', '0', '2019-07-17 20:08:59', '1');
INSERT INTO `reader` VALUES ('20', 'zhzzzz', '15183615364', '4551235465@qq.com', '123456', null, '1', '0', '2019-07-17 20:12:23', '1');
INSERT INTO `reader` VALUES ('21', 'asdasda', '15183615236', '455761561@qq.com', 'asdasasd', null, '1', '0', '2019-07-17 20:14:48', '1');
INSERT INTO `reader` VALUES ('24', 'sfggfhfghfgh', '15183569687', '4557665155@qq.com', 'sadasdas', null, '1', '0', '2019-07-17 20:26:06', '1');
INSERT INTO `reader` VALUES ('25', '1111111', '111', '', '', null, '1', '0', '2019-07-18 12:59:10', '1');
INSERT INTO `reader` VALUES ('27', 'aaa', '15865942356', '', '', null, '1', '0', '2019-07-18 15:50:13', '1');

-- ----------------------------
-- Table structure for `rechargeorder`
-- ----------------------------
DROP TABLE IF EXISTS `rechargeorder`;
CREATE TABLE `rechargeorder` (
  `rechargeId` int(30) NOT NULL AUTO_INCREMENT COMMENT '充值订单编号',
  `readerId` int(20) NOT NULL COMMENT '用户id',
  `rechargeMoney` int(30) NOT NULL COMMENT '充值金额',
  `rechargeDate` datetime NOT NULL COMMENT '充值时间',
  `rechargeStatus` int(10) NOT NULL COMMENT '状态：1.已完成 2.待支付 3.已取消',
  `rechargeWay` varchar(30) NOT NULL DEFAULT '3' COMMENT '充值方式：1.支付宝2.微信 3.银行卡',
  PRIMARY KEY (`rechargeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rechargeorder
-- ----------------------------
INSERT INTO `rechargeorder` VALUES ('1', '1', '26', '2019-07-25 12:26:05', '2', '2');
INSERT INTO `rechargeorder` VALUES ('2', '3', '54', '2019-07-05 12:26:40', '1', '1');
INSERT INTO `rechargeorder` VALUES ('3', '5', '13', '2019-07-24 12:27:19', '2', '2');
INSERT INTO `rechargeorder` VALUES ('4', '2', '32', '2019-07-11 16:54:14', '2', '支付宝');
INSERT INTO `rechargeorder` VALUES ('5', '6', '22', '2019-07-11 16:56:22', '2', '微信');
INSERT INTO `rechargeorder` VALUES ('6', '10', '23', '2019-07-11 16:56:51', '3', '微信');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `replyId` int(10) NOT NULL COMMENT '回复ID',
  `bookId` int(10) NOT NULL COMMENT '小说ID',
  `readerId` int(10) DEFAULT NULL COMMENT '读者ID',
  `replyContent` varchar(30) DEFAULT NULL COMMENT '回复内容',
  `replyDate` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`replyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
