/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.148.156
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 47.101.148.156:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 10/03/2020 13:16:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `account` char(16) NOT NULL,
  `password` char(16) NULL DEFAULT NULL,
  `name` char(16) NULL DEFAULT NULL,
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB ;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin', '管理员');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NULL DEFAULT NULL COMMENT '医生id',
  `dname` char(16) NULL DEFAULT NULL,
  `wid` int(11) NULL DEFAULT NULL,
  `reason` char(32) NULL DEFAULT NULL COMMENT '原因',
  `applytime` datetime(0) NULL DEFAULT NULL COMMENT '医生这天上午或下午的号源数',
  `request` char(8) NULL DEFAULT NULL COMMENT '状态：申请出诊，申请停诊',
  `state` char(8) NULL DEFAULT NULL COMMENT '状态：等待处理，同意，拒绝',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `wid`(`wid`) USING BTREE,
  INDEX `did`(`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 ;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES (1, 9, '徐玉秀', 121, '', '2019-01-16 10:40:56', '申请停诊', '取消');
INSERT INTO `apply` VALUES (2, 9, '徐玉秀', 123, '', '2019-01-16 10:41:44', '申请停诊', '取消');
INSERT INTO `apply` VALUES (3, 1, '王坤根', 9, '', '2019-01-16 10:57:56', '申请出诊', '同意');
INSERT INTO `apply` VALUES (4, 1, '王坤根', 8, '钱钱钱', '2019-05-14 16:15:08', '申请停诊', '等待处理');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `account` char(16) NULL DEFAULT NULL,
  `password` char(16) NULL DEFAULT NULL,
  `dname` char(16) NULL DEFAULT NULL,
  `fee` int(11) NULL DEFAULT NULL COMMENT '医生出诊费',
  `gender` char(2) NULL DEFAULT NULL,
  `age` tinyint(4) NULL DEFAULT NULL,
  `office` char(16) NULL DEFAULT NULL,
  `room` char(16) NULL DEFAULT NULL,
  `career` char(8) NULL DEFAULT NULL,
  `description` varchar(255) NULL DEFAULT NULL,
  `picpath` varchar(64) NULL DEFAULT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 ;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '00001', '123456', '王坤根', 50, '男', 35, '中内科', '中内科诊室1', '主任中医师', '历任浙江省中医管理局局长，浙江中医学院副院长、中医系主任，浙江中医学院附属第一医院（浙江省中医院）院长、书记。现任浙江省中医学会顾问。', '/hospital/images/docpic/1.png');
INSERT INTO `doctor` VALUES (2, '00002', '123456', '骆英', 100, '女', 31, '中内科', '中内科诊室1', '科主任', '教授、主任医师 中华口腔医学会正畸专委会委员, 浙江省口腔医学会正畸专委会委员, 浙江省口腔正畸指导中心专家委员会委员, 浙江省医学会鉴定专家库成员, 浙江省特色学科带头人。《中华口腔正畸学杂志》通讯编委，省级刊物《健康研究》审稿专家。', '/hospital/images/docpic/2.png');
INSERT INTO `doctor` VALUES (3, '00003', '123456', '吴生元', 150, '男', 65, '中内科', '中内科诊室2', '中医内科专家', '中国中医药学会理事、云南中医药学会副会长兼内科专业委员会主任委员、云南省新药评委会副主任', '/hospital/images/docpic/3.png');
INSERT INTO `doctor` VALUES (4, '00004', '123456', '钟南山', 150, '男', 51, '中内科', '中内科诊室2', '中医内科专家', '中国工程院院士，著名呼吸病学专家，中国抗击非典型肺炎的领军人物，曾任广州医学院院长、党委书记，广州市呼吸疾病研究所所长、广州呼吸疾病国家重点实验室主任、广州医科大学附属第一医院国家呼吸系统疾病临床医学研究中心主任、广东省老科学技术工作者协会会长', '/hospital/images/docpic/4.png');
INSERT INTO `doctor` VALUES (5, '00005', '123456', '纪立农', 100, '男', 45, '内分泌科', '内分泌科诊室1', '内分泌科主任', '现任北京人民医院内分泌科主任、主任医师、博士生导师、兼任中华医学会糖尿病学会现任主任委员、北京糖尿病防治协会副理事长。《中国糖尿病教育与管理杂志》名誉主编、《中华内分泌代谢杂志》、《中华糖尿病杂志》、《临床药物治疗》等杂志编委。发表科研论文60余篇，参编医学专著11部。获卫生部优秀中青年临床医学奖', '/hospital/images/docpic/5.png');
INSERT INTO `doctor` VALUES (6, '00006', '123456', '邢小平', 100, '女', 45, '内分泌科', '内分泌科诊室1', '内分泌科专家', '现任北京协和医院内分泌科主任，中国医师协会内分泌代谢科医师分会副会长,中华医学会内分泌学分会委员兼学术秘书，中华医学会北京分会骨质疏松专业委员会委员兼学术秘书', '/hospital/images/docpic/6.png');
INSERT INTO `doctor` VALUES (7, '00007', '123456', '杨宗于', 150, '女', 40, '内分泌科', '内分泌科诊室2', '内分泌科副主任', '现任副主任医师、教授、曾任核医学科主任。现获政府特殊津贴。 重点研究甲状腺疾病、糖尿病及核医学体外放射配体结合分析临床应用等，单独及协作发表论文10余篇', '/hospital/images/docpic/7.png');
INSERT INTO `doctor` VALUES (8, '00008', '123456', '吴问汉', 150, '男', 35, '外科', '外科诊室1', '外科主任', '师从我国著名外科专家黄延庭教授，专门从事肝胆膜肿瘤、肝硬化等肝脏疾病的治疗和器官移植细胞免疫基础的研究。最早开始在北京大学第一医院开始肝脏移植工作。曾于2000年和2001年先后赴美国和香港学习肝脏移植和肝胆膜外科手术技术', '/hospital/images/docpic/8.png');
INSERT INTO `doctor` VALUES (9, '00009', '123456', '徐玉秀', 150, '女', 45, '外科', '外科诊室1', '外科专家', '教授，从事普通外科临床工作40余年，擅长乳腺、甲状腺良恶性疾病的诊治', '/hospital/images/docpic/9.png');
INSERT INTO `doctor` VALUES (10, '00010', '123456', '史继荣', 150, '男', 30, '外科', '外科诊室2', '主治医师', '在北京大学第一医院普通外科工作至今，历任住院医师、总住院医师、主治医师，2010年7月获医学博士学位。主要临床工作及研究方向为肝胆外科疾病、肿瘤外科疾病的诊断和治疗，包括肝脏疾病的外科治疗、胆道良恶性疾病的外科治疗', '/hospital/images/docpic/10.png');
INSERT INTO `doctor` VALUES (11, '00011', '123456', '周正飞', 150, '男', 33, '外科', '外科诊室2', '主治医师', '曾在德国Ulm大学外科医院访问学习一年余。擅长普通外科肝胆、胰腺良恶性疾病的诊治', '/hospital/images/docpic/11.png');
INSERT INTO `doctor` VALUES (12, '00012', '123456', '李洁', 150, '女', 31, '新生儿科', '新生儿科诊室1', '主治医师', '擅长新生儿相关疾病、小儿血液病，小儿感冒，发烧，腹泻，咳嗽，以及婴幼儿喂养，生长发育辅导及小儿常见病、多发病的诊断及治疗，同时作为一个小女娃的妈妈，支持科学育儿，希望和宝妈们分享更科学的育儿方法。', '/hospital/images/docpic/12.png');
INSERT INTO `doctor` VALUES (13, '00013', '123456', '温春玲', 150, '女', 34, '新生儿科', '新生儿科诊室1', '副主任医师', '从事儿科临床、教学、科研工作20余年。在新生儿及婴幼儿常见病，如发热，急性呼吸道感染，急/慢性咳嗽，鼻炎，呕吐，腹泻，肠绞痛，尿布疹，湿疹等方面积累了丰富的经验。同时，在新生儿及婴幼儿保健，如疾病预防，营养评估及补充，早期干预训练，智力开发等方面同样经验丰富', '/hospital/images/docpic/13.png');
INSERT INTO `doctor` VALUES (14, '00014', '123456', '沈天阳', 100, '男', 31, '新生儿科', '新生儿科诊室2', '主治医师', '擅长各类儿科疾病，尤其是呼吸道相关疾病，消化道疾病，比如发热、咳嗽、腹泻、呕吐等。新生儿肠绞痛，蛋白过敏，新生儿肺炎', '/hospital/images/docpic/14.png');
INSERT INTO `doctor` VALUES (15, '00015', '123456', '贾炜', 100, '男', 28, '新生儿科', '新生儿科诊室2', '主任医师', '儿内科各种常见疾病的诊治。尤其擅长新生儿包括早产儿、新生儿的各种问题如黄疸、感染、肠绞痛、营养以及脑发育，常见儿童的发热、感冒、咳嗽、消化不良、拉肚子（腹泻）、哮喘等疾病诊断和治疗', '/hospital/images/docpic/15.png');
INSERT INTO `doctor` VALUES (16, '00016', '123456', '刘若卓', 150, '男', 31, '神经内科', '神经内科诊室1', '主治医师', '各种神经内科常见疾病，尤其是:1.头面痛（偏头痛、紧张型头痛、丛集性头痛、药物性头痛等）和失眠，痴呆，帕金森病，重症肌无力、吉兰巴雷综合征、脱髓鞘病（多发性硬化，视神经脊髓炎）的诊治', '/hospital/images/docpic/16.png');
INSERT INTO `doctor` VALUES (17, '00017', '123456', '国红', 150, '女', 35, '神经内科', '神经内科诊室2', '主治医师', ' 脑血管病、头痛、头晕、睡眠障碍、高血压病、高脂血症、痴呆、帕金森病、焦虑抑郁状态、重症肌无力、吉兰巴雷综合症、多发性硬化、视神经脊髓炎谱系疾病、癫痫、脑炎、运动神经元病、肌病、昏迷', '/hospital/images/docpic/17.png');
INSERT INTO `doctor` VALUES (18, '00018', '123456', '胡洋', 150, '男', 31, '呼吸内科', '呼吸内科诊室1', '主治医师', ' 间质性肺病，胸内结节病，弥漫性泛细支气管炎，慢性支气管炎，慢性阻塞性肺病，支气管扩张，肺部结节，哮喘，肺癌，长期慢性不明原因咳嗽等肺部疾病', '/hospital/images/docpic/18.png');
INSERT INTO `doctor` VALUES (19, '00019', '123456', '顾海彤', 150, '女', 41, '呼吸内科', '呼吸内科诊室1', '主治医师', ' 间质性肺病，胸内结节病，弥漫性泛细支气管炎，慢性支气管炎，慢性阻塞性肺病，支气管扩张，肺部结节，哮喘，肺癌，长期慢性不明原因咳嗽等肺部疾病', '/hospital/images/docpic/19.png');
INSERT INTO `doctor` VALUES (20, '00020', '123456', '钟文', 150, '男', 35, '呼吸内科', '呼吸内科诊室2', '主任医师', '呼吸系统疾病及糖尿病，肺癌的诊断及治疗，肿瘤的靶向治疗，糖尿病常见并发症的诊断及治疗', '/hospital/images/docpic/20.png');
INSERT INTO `doctor` VALUES (21, '00021', '123456', '许亚宁', 150, '男', 25, '心血管内科', '心血管内科诊室1', '主治医师', '长期工作在部队医疗一线，积累了丰富的临床工作经验，擅长高血压，冠心病，心力衰竭，房颤等疾病的诊断与治疗', '/hospital/images/docpic/21.png');
INSERT INTO `doctor` VALUES (22, '00022', '123456', '孙大龙', 150, '男', 35, '心血管内科', '心血管内科诊室1', '主治医师', '擅长冠心病，心衰，心律失常，高血压，糖尿病，脂代谢异常、胃肠道疾病，肝胆疾病，胰腺疾病及消化内镜下早癌诊断及治疗。特别是老年多系统慢性病个体化治疗、精准治疗及长期管理', '/hospital/images/docpic/22.png');
INSERT INTO `doctor` VALUES (23, '00026', '123456', '张冲林', 100, '男', 39, '儿童哮喘专科', '儿童哮喘专科诊室1', '儿童哮喘专科主任', '徐州医学院兼职讲师，省医学会儿科呼吸学组委员、徐州市医学会儿科专业委员会委员。1987年毕业于徐州医学院医学系，一直从事儿内科临床、教学工作', '/hospital/images/docpic/26.png');
INSERT INTO `doctor` VALUES (24, '00028', '123456', '李振华', 100, '女', 38, '儿童康复专科', '儿童康复专科诊室1', '儿童康复专科主任', '擅长儿童康复相关疾病治疗。', '/hospital/images/docpic/28.png');
INSERT INTO `doctor` VALUES (25, '1111', '123456', '涨五', 12, '男', 18, '外科', '外科诊室1', '主任医师', '111111', '/hospital/images/docpic/default.jpg');
INSERT INTO `doctor` VALUES (26, '123456', '111', '11111', 11, '男', 11, '内分泌科', '内分泌诊室1', '主任医师', '111', '/hospital/images/docpic/default.jpg');

-- ----------------------------
-- Table structure for integrity
-- ----------------------------
DROP TABLE IF EXISTS `integrity`;
CREATE TABLE `integrity`  (
  `integrityid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '病人id',
  `dname` char(16) NULL DEFAULT NULL COMMENT '医生名字',
  `office` char(16) NULL DEFAULT NULL COMMENT '科室名字',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '诚信记录的时间',
  `reason` char(32) NULL DEFAULT NULL COMMENT '原因',
  `score` tinyint(4) NULL DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`integrityid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 ;

-- ----------------------------
-- Records of integrity
-- ----------------------------
INSERT INTO `integrity` VALUES (1, 1, '徐玉秀', '外科', '2019-01-15 22:16:10', '完成预约', 10);
INSERT INTO `integrity` VALUES (2, 1, '史继荣', '外科', '2019-01-16 13:50:23', '爽约', -10);
INSERT INTO `integrity` VALUES (3, 4, '钟文', '呼吸内科', '2019-01-16 13:54:24', '爽约', -10);

-- ----------------------------
-- Table structure for office
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office`  (
  `officename` char(16) NOT NULL,
  `description` varchar(255) NULL DEFAULT NULL,
  `doctornum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`officename`) USING BTREE
) ENGINE = InnoDB ;

-- ----------------------------
-- Records of office
-- ----------------------------
INSERT INTO `office` VALUES ('不孕不育科', '不孕不育作为医院的重点科室，率先引进世界高成功率技术！', 0);
INSERT INTO `office` VALUES ('中内科', '暂无描述', 4);
INSERT INTO `office` VALUES ('中医妇科', ' 汇集全城妇科专家，帮您解决疑难杂症！', 0);
INSERT INTO `office` VALUES ('儿科泌尿专科', '暂无描述', 0);
INSERT INTO `office` VALUES ('儿科神经内科', '暂无描述', 0);
INSERT INTO `office` VALUES ('内分泌科', '暂无描述', 4);
INSERT INTO `office` VALUES ('口腔科', '种植中心、正畸中心、修复等是特色专科。', 0);
INSERT INTO `office` VALUES ('呼吸内科', '暂无描述', 3);
INSERT INTO `office` VALUES ('外科', '暂无描述', 5);
INSERT INTO `office` VALUES ('心血管内科', '暂无描述', 2);
INSERT INTO `office` VALUES ('新生儿科', '暂无描述', 4);
INSERT INTO `office` VALUES ('眼科', '专业眼科，帮助您更好的恢复视力，有一双明亮的眼！', 0);
INSERT INTO `office` VALUES ('神经内科', '暂无描述', 2);
INSERT INTO `office` VALUES ('骨外科', '暂无描述', 0);

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `account` char(16) NULL DEFAULT NULL,
  `email` char(32) NULL DEFAULT NULL,
  `password` char(32) NULL DEFAULT NULL,
  `name` char(16) NULL DEFAULT NULL,
  `integrity` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 ;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (1, '123456', '208094973@qq.com', '111', '123456', 100);
INSERT INTO `patient` VALUES (2, '1234567', '208094973@qq.com', '123456', '123456', 100);
INSERT INTO `patient` VALUES (3, '12345', '208094973@qq.com', '123456', '123456', 100);
INSERT INTO `patient` VALUES (4, '1', '208094973@qq.com', '1', '患者1', 90);

-- ----------------------------
-- Table structure for recode
-- ----------------------------
DROP TABLE IF EXISTS `recode`;
CREATE TABLE `recode`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '病人id',
  `wid` int(11) NULL DEFAULT NULL COMMENT '工作日id',
  `did` int(11) NULL DEFAULT NULL COMMENT '医生id',
  `serialnumber` int(11) NULL DEFAULT NULL COMMENT '就诊序号',
  `visitdate` date NULL DEFAULT NULL COMMENT '就诊日期',
  `visitnoon` char(4) NULL DEFAULT NULL COMMENT '就诊上午或下午',
  `visittime` time(0) NULL DEFAULT NULL COMMENT '就诊时间',
  `ordertime` datetime(0) NULL DEFAULT NULL COMMENT '预约记录的时间',
  `state` char(8) NULL DEFAULT NULL COMMENT '预约状态：成功，取消，完成，爽约',
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `did`(`did`) USING BTREE,
  INDEX `wid`(`wid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 ;

-- ----------------------------
-- Records of recode
-- ----------------------------
INSERT INTO `recode` VALUES (1, 1, 119, 9, 5, '2019-01-16', '上午', '10:06:00', '2019-01-15 11:27:13', '完成');
INSERT INTO `recode` VALUES (2, 1, 135, 10, 7, '2019-01-17', '上午', '10:54:00', '2019-01-15 11:27:33', '爽约');
INSERT INTO `recode` VALUES (3, 1, 119, 9, 7, '2019-01-16', '上午', '10:54:00', '2019-01-15 16:28:59', '完成');
INSERT INTO `recode` VALUES (4, 1, 77, 6, 5, '2019-01-16', '上午', '10:06:00', '2019-01-15 20:30:51', '取消');
INSERT INTO `recode` VALUES (5, 4, 217, 16, 7, '2019-01-16', '上午', '10:54:00', '2019-01-15 20:40:20', '成功');
INSERT INTO `recode` VALUES (6, 4, 301, 22, 8, '2019-01-16', '上午', '11:18:00', '2019-01-15 20:40:43', '成功');
INSERT INTO `recode` VALUES (7, 4, 263, 19, 8, '2019-01-18', '上午', '11:18:00', '2019-01-15 20:41:14', '成功');
INSERT INTO `recode` VALUES (8, 4, 267, 20, 9, '2019-01-20', '上午', '11:42:00', '2019-01-15 20:50:48', '成功');
INSERT INTO `recode` VALUES (9, 4, 277, 20, 5, '2019-01-18', '上午', '10:06:00', '2019-01-15 20:51:03', '爽约');
INSERT INTO `recode` VALUES (10, 4, 217, 16, 6, '2019-01-16', '上午', '10:30:00', '2019-01-15 20:58:26', '成功');
INSERT INTO `recode` VALUES (11, 4, 177, 13, 10, '2019-01-17', '上午', '12:06:00', '2019-01-15 20:58:52', '成功');
INSERT INTO `recode` VALUES (12, 4, 73, 6, 5, '2019-01-21', '上午', '10:06:00', '2019-01-15 20:59:24', '成功');
INSERT INTO `recode` VALUES (13, 4, 125, 9, 10, '2019-01-19', '上午', '12:06:00', '2019-01-15 21:00:46', '爽约');
INSERT INTO `recode` VALUES (14, 4, 153, 11, 8, '2019-01-19', '上午', '11:18:00', '2019-01-15 21:04:59', '成功');
INSERT INTO `recode` VALUES (15, 1, 75, 6, 8, '2019-01-22', '上午', '11:18:00', '2019-01-16 13:47:41', '取消');
INSERT INTO `recode` VALUES (16, 1, 9, 1, 6, '2019-01-17', '上午', '10:30:00', '2019-01-16 15:20:39', '取消');
INSERT INTO `recode` VALUES (17, 1, 21, 2, 8, '2019-01-23', '上午', '11:18:00', '2019-01-17 20:52:04', '取消');
INSERT INTO `recode` VALUES (18, 1, 7, 1, 10, '2019-05-15', '上午', '12:06:00', '2019-05-14 10:59:13', '成功');
INSERT INTO `recode` VALUES (19, 1, 107, 8, 8, '2019-05-16', '上午', '11:18:00', '2019-05-14 12:08:31', '成功');
INSERT INTO `recode` VALUES (20, 1, 7, 1, 2, '2019-05-15', '上午', '08:54:00', '2019-05-14 16:13:49', '成功');
INSERT INTO `recode` VALUES (21, 1, 3, 1, 7, '2019-05-20', '上午', '10:54:00', '2019-05-19 14:58:26', '成功');
INSERT INTO `recode` VALUES (22, 1, 23, 2, 8, '2019-09-12', '上午', '11:18:00', '2019-09-11 16:40:13', '成功');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officename` char(16) NULL DEFAULT NULL,
  `roomname` char(16) NULL DEFAULT NULL,
  `doctornum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `officename`(`officename`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 ;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '中内科', '中内科诊室1', 2);
INSERT INTO `room` VALUES (2, '中内科', '中内科诊室2', 2);
INSERT INTO `room` VALUES (3, '内分泌科', '内分泌诊室1', 1);
INSERT INTO `room` VALUES (4, '内分泌科', '内分泌诊室2', 0);
INSERT INTO `room` VALUES (5, '外科', '外科诊室1', 3);
INSERT INTO `room` VALUES (6, '外科', '外科诊室2', 2);
INSERT INTO `room` VALUES (7, '新生儿科', '新生儿科诊室1', 2);
INSERT INTO `room` VALUES (8, '新生儿科', '新生儿科诊室2', 2);
INSERT INTO `room` VALUES (9, '神经内科', '神经内科诊室1', 1);
INSERT INTO `room` VALUES (10, '神经内科', '神经科诊室2', 0);
INSERT INTO `room` VALUES (11, '呼吸内科', '呼吸内科诊室1', 2);
INSERT INTO `room` VALUES (12, '呼吸内科', '呼吸内科诊室2', 1);
INSERT INTO `room` VALUES (13, '心血管内科', '心血管内科诊室1', 2);
INSERT INTO `room` VALUES (14, '不孕不育科', '不孕不育科诊室1', 0);

-- ----------------------------
-- Table structure for workday
-- ----------------------------
DROP TABLE IF EXISTS `workday`;
CREATE TABLE `workday`  (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NULL DEFAULT NULL COMMENT '医生id',
  `worktime` char(4) NULL DEFAULT NULL COMMENT '医生工作日，星期几',
  `ampm` char(4) NULL DEFAULT NULL COMMENT '医生工作日的上午或下午',
  `nsnum` int(11) NULL DEFAULT NULL COMMENT '医生这天上午或下午的号源数',
  `state` char(8) NULL DEFAULT NULL COMMENT '状态：已满，预约，停诊',
  PRIMARY KEY (`wid`) USING BTREE,
  INDEX `did`(`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 365 ;

-- ----------------------------
-- Records of workday
-- ----------------------------
INSERT INTO `workday` VALUES (1, 1, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (2, 1, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (3, 1, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (4, 1, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (5, 1, '2', '上午', 0, '停诊');
INSERT INTO `workday` VALUES (6, 1, '2', '下午', 11, '预约');
INSERT INTO `workday` VALUES (7, 1, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (8, 1, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (9, 1, '4', '上午', 14, '预约');
INSERT INTO `workday` VALUES (10, 1, '4', '下午', 7, '预约');
INSERT INTO `workday` VALUES (11, 1, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (12, 1, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (13, 1, '6', '上午', 0, '停诊');
INSERT INTO `workday` VALUES (14, 1, '6', '下午', 12, '预约');
INSERT INTO `workday` VALUES (15, 2, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (16, 2, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (17, 2, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (18, 2, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (19, 2, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (20, 2, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (21, 2, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (22, 2, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (23, 2, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (24, 2, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (25, 2, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (26, 2, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (27, 2, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (28, 2, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (29, 3, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (30, 3, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (31, 3, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (32, 3, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (33, 3, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (34, 3, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (35, 3, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (36, 3, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (37, 3, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (38, 3, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (39, 3, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (40, 3, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (41, 3, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (42, 3, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (43, 4, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (44, 4, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (45, 4, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (46, 4, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (47, 4, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (48, 4, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (49, 4, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (50, 4, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (51, 4, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (52, 4, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (53, 4, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (54, 4, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (55, 4, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (56, 4, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (57, 5, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (58, 5, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (59, 5, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (60, 5, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (61, 5, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (62, 5, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (63, 5, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (64, 5, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (65, 5, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (66, 5, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (67, 5, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (68, 5, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (69, 5, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (70, 5, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (71, 6, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (72, 6, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (73, 6, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (74, 6, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (75, 6, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (76, 6, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (77, 6, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (78, 6, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (79, 6, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (80, 6, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (81, 6, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (82, 6, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (83, 6, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (84, 6, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (85, 7, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (86, 7, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (87, 7, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (88, 7, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (89, 7, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (90, 7, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (91, 7, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (92, 7, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (93, 7, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (94, 7, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (95, 7, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (96, 7, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (97, 7, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (98, 7, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (99, 8, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (100, 8, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (101, 8, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (102, 8, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (103, 8, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (104, 8, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (105, 8, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (106, 8, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (107, 8, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (108, 8, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (109, 8, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (110, 8, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (111, 8, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (112, 8, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (113, 9, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (114, 9, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (115, 9, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (116, 9, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (117, 9, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (118, 9, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (119, 9, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (120, 9, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (121, 9, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (122, 9, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (123, 9, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (124, 9, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (125, 9, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (126, 9, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (127, 10, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (128, 10, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (129, 10, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (130, 10, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (131, 10, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (132, 10, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (133, 10, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (134, 10, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (135, 10, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (136, 10, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (137, 10, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (138, 10, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (139, 10, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (140, 10, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (141, 11, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (142, 11, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (143, 11, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (144, 11, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (145, 11, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (146, 11, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (147, 11, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (148, 11, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (149, 11, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (150, 11, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (151, 11, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (152, 11, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (153, 11, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (154, 11, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (155, 12, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (156, 12, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (157, 12, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (158, 12, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (159, 12, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (160, 12, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (161, 12, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (162, 12, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (163, 12, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (164, 12, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (165, 12, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (166, 12, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (167, 12, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (168, 12, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (169, 13, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (170, 13, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (171, 13, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (172, 13, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (173, 13, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (174, 13, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (175, 13, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (176, 13, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (177, 13, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (178, 13, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (179, 13, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (180, 13, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (181, 13, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (182, 13, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (183, 14, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (184, 14, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (185, 14, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (186, 14, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (187, 14, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (188, 14, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (189, 14, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (190, 14, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (191, 14, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (192, 14, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (193, 14, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (194, 14, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (195, 14, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (196, 14, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (197, 15, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (198, 15, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (199, 15, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (200, 15, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (201, 15, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (202, 15, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (203, 15, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (204, 15, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (205, 15, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (206, 15, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (207, 15, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (208, 15, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (209, 15, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (210, 15, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (211, 16, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (212, 16, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (213, 16, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (214, 16, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (215, 16, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (216, 16, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (217, 16, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (218, 16, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (219, 16, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (220, 16, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (221, 16, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (222, 16, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (223, 16, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (224, 16, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (225, 17, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (226, 17, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (227, 17, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (228, 17, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (229, 17, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (230, 17, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (231, 17, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (232, 17, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (233, 17, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (234, 17, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (235, 17, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (236, 17, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (237, 17, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (238, 17, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (239, 18, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (240, 18, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (241, 18, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (242, 18, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (243, 18, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (244, 18, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (245, 18, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (246, 18, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (247, 18, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (248, 18, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (249, 18, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (250, 18, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (251, 18, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (252, 18, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (253, 19, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (254, 19, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (255, 19, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (256, 19, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (257, 19, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (258, 19, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (259, 19, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (260, 19, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (261, 19, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (262, 19, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (263, 19, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (264, 19, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (265, 19, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (266, 19, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (267, 20, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (268, 20, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (269, 20, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (270, 20, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (271, 20, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (272, 20, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (273, 20, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (274, 20, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (275, 20, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (276, 20, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (277, 20, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (278, 20, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (279, 20, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (280, 20, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (281, 21, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (282, 21, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (283, 21, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (284, 21, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (285, 21, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (286, 21, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (287, 21, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (288, 21, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (289, 21, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (290, 21, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (291, 21, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (292, 21, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (293, 21, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (294, 21, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (295, 22, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (296, 22, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (297, 22, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (298, 22, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (299, 22, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (300, 22, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (301, 22, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (302, 22, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (303, 22, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (304, 22, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (305, 22, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (306, 22, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (307, 22, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (308, 22, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (309, 23, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (310, 23, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (311, 23, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (312, 23, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (313, 23, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (314, 23, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (315, 23, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (316, 23, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (317, 23, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (318, 23, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (319, 23, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (320, 23, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (321, 23, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (322, 23, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (323, 24, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (324, 24, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (325, 24, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (326, 24, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (327, 24, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (328, 24, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (329, 24, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (330, 24, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (331, 24, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (332, 24, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (333, 24, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (334, 24, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (335, 24, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (336, 24, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (337, 25, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (338, 25, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (339, 25, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (340, 25, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (341, 25, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (342, 25, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (343, 25, '3', '上午', 0, '停诊');
INSERT INTO `workday` VALUES (344, 25, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (345, 25, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (346, 25, '4', '下午', 11, '预约');
INSERT INTO `workday` VALUES (347, 25, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (348, 25, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (349, 25, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (350, 25, '6', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (351, 26, '0', '上午', 10, '预约');
INSERT INTO `workday` VALUES (352, 26, '0', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (353, 26, '1', '上午', 10, '预约');
INSERT INTO `workday` VALUES (354, 26, '1', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (355, 26, '2', '上午', 10, '预约');
INSERT INTO `workday` VALUES (356, 26, '2', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (357, 26, '3', '上午', 10, '预约');
INSERT INTO `workday` VALUES (358, 26, '3', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (359, 26, '4', '上午', 10, '预约');
INSERT INTO `workday` VALUES (360, 26, '4', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (361, 26, '5', '上午', 10, '预约');
INSERT INTO `workday` VALUES (362, 26, '5', '下午', 0, '停诊');
INSERT INTO `workday` VALUES (363, 26, '6', '上午', 10, '预约');
INSERT INTO `workday` VALUES (364, 26, '6', '下午', 0, '停诊');

-- ----------------------------
-- Procedure structure for agreeApply
-- ----------------------------
DROP PROCEDURE IF EXISTS `agreeApply`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agreeApply`(in s int,in aid1 int)
BEGIN
      declare s1 char(32);
      declare wid1 int;
      set s1 = (select request from apply where aid=aid1);
      set wid1 = (select wid from apply where aid=aid1);
      if '申请出诊'=s1 then
        update workday set state='预约',nsnum=s where wid=wid1;
      end if;
      if '申请停诊'=s1 then
        update workday set state='停诊',nsnum=0 where wid=wid1;
      end if;
      update apply set state='同意' where aid=aid1;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for orderList
-- ----------------------------
DROP PROCEDURE IF EXISTS `orderList`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `orderList`(in pid int)
BEGIN
      select recode.rid,recode.pid,recode.wid,recode.did,recode.serialnumber,recode.visitdate,recode.visitnoon,recode.visittime,recode.ordertime,recode.state,
      doctor.dname,doctor.office,doctor.room,doctor.picpath,doctor.fee
      from recode,doctor
      where recode.pid=pid  and doctor.did=recode.did
      order by recode.ordertime desc;
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
