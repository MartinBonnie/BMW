/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : bmw

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2013-01-29 16:33:46
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bmw_admin`
-- ----------------------------
DROP TABLE IF EXISTS `bmw_admin`;
CREATE TABLE `bmw_admin` (
  `admin_id` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmw_admin
-- ----------------------------
INSERT INTO `bmw_admin` VALUES ('1', 'jad', '5eac284f20692089267f44452e2f5f4d');

-- ----------------------------
-- Table structure for `bmw_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `bmw_attachment`;
CREATE TABLE `bmw_attachment` (
  `att_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `belong_type` varchar(2) DEFAULT NULL,
  `belong_id` varchar(32) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `store_type` varchar(2) DEFAULT NULL,
  `server_ip` varchar(100) DEFAULT NULL,
  `server_path` varchar(400) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filedesc` varchar(200) DEFAULT NULL,
  `content` text,
  `upload_time` datetime DEFAULT NULL,
  `file_size` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`att_id`),
  KEY `att_fk_1` (`user_id`) USING BTREE,
  CONSTRAINT `bmw_attachment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `bmw_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmw_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `bmw_syscode`
-- ----------------------------
DROP TABLE IF EXISTS `bmw_syscode`;
CREATE TABLE `bmw_syscode` (
  `syscode_id` varchar(32) NOT NULL,
  `type` varchar(2) DEFAULT NULL,
  `class` varchar(2) DEFAULT NULL,
  `fatherdict` varchar(32) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `sdesc` varchar(400) DEFAULT NULL,
  `sign` varchar(50) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`syscode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmw_syscode
-- ----------------------------
INSERT INTO `bmw_syscode` VALUES ('1', '01', '', '', '北京', '', 'beijing', '01', '');
INSERT INTO `bmw_syscode` VALUES ('10', '01', '', '', '山西', '', 'shanxi', '01', '');
INSERT INTO `bmw_syscode` VALUES ('100', '02', '', '10', '大同市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('101', '02', '', '10', '阳泉市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('102', '02', '', '10', '长治市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('103', '02', '', '10', '晋城市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('104', '02', '', '10', '朔州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('105', '02', '', '10', '晋中市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('106', '02', '', '10', '运城市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('107', '02', '', '10', '忻州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('108', '02', '', '10', '临汾市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('109', '02', '', '10', '吕梁地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('11', '01', '', '', '安徽', '', 'anhui', '01', '');
INSERT INTO `bmw_syscode` VALUES ('110', '02', '', '11', '合肥市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('111', '02', '', '11', '芜湖市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('112', '02', '', '11', '蚌埠市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('113', '02', '', '11', '淮南市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('114', '02', '', '11', '马鞍山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('115', '02', '', '11', '淮北市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('116', '02', '', '11', '铜陵市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('117', '02', '', '11', '安庆市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('118', '02', '', '11', '黄山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('119', '02', '', '11', '滁州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('12', '01', '', '', '浙江', '', 'zhejiang', '01', '');
INSERT INTO `bmw_syscode` VALUES ('120', '02', '', '11', '阜阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('121', '02', '', '11', '宿州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('122', '02', '', '11', '巢湖市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('123', '02', '', '11', '六安市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('124', '02', '', '11', '亳州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('125', '02', '', '11', '池州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('126', '02', '', '11', '宣城市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('127', '02', '', '12', '杭州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('128', '02', '', '12', '宁波市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('129', '02', '', '12', '温州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('13', '01', '', '', '江苏', '', 'jiangsu', '01', '');
INSERT INTO `bmw_syscode` VALUES ('130', '02', '', '12', '嘉兴市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('131', '02', '', '12', '湖州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('132', '02', '', '12', '绍兴市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('133', '02', '', '12', '金华市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('134', '02', '', '12', '衢州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('135', '02', '', '12', '舟山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('136', '02', '', '12', '台州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('137', '02', '', '12', '丽水市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('138', '02', '', '13', '南京市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('139', '02', '', '13', '徐州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('14', '01', '', '', '江西', '', 'jiangxi', '01', '');
INSERT INTO `bmw_syscode` VALUES ('140', '02', '', '13', '连云港市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('141', '02', '', '13', '淮安市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('142', '02', '', '13', '宿迁市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('143', '02', '', '13', '盐城市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('144', '02', '', '13', '扬州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('145', '02', '', '13', '泰州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('146', '02', '', '13', '南通市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('147', '02', '', '13', '镇江市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('148', '02', '', '13', '常州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('149', '02', '', '13', '无锡市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('15', '01', '', '', '广东', '', 'guangdong', '01', '');
INSERT INTO `bmw_syscode` VALUES ('150', '02', '', '13', '苏州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('151', '02', '', '14', '南昌市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('152', '02', '', '14', '景德镇市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('153', '02', '', '14', '萍乡市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('154', '02', '', '14', '九江市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('155', '02', '', '14', '新余市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('156', '02', '', '14', '鹰潭市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('157', '02', '', '14', '赣州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('158', '02', '', '14', '吉安市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('159', '02', '', '14', '宜春市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('16', '01', '', '', '福建', '', 'fujian', '01', '');
INSERT INTO `bmw_syscode` VALUES ('160', '02', '', '14', '抚州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('161', '02', '', '14', '上饶市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('162', '02', '', '15', '广州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('163', '02', '', '15', '深圳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('164', '02', '', '15', '珠海市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('165', '02', '', '15', '汕头市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('166', '02', '', '15', '韶关市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('167', '02', '', '15', '惠州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('168', '02', '', '15', '河源市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('169', '02', '', '15', '梅州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('17', '01', '', '', '海南', '', 'hainan', '01', '');
INSERT INTO `bmw_syscode` VALUES ('170', '02', '', '15', '汕尾市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('171', '02', '', '15', '东莞市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('172', '02', '', '15', '中山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('173', '02', '', '15', '江门市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('174', '02', '', '15', '佛山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('175', '02', '', '15', '阳江市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('176', '02', '', '15', '湛江市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('177', '02', '', '15', '茂名市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('178', '02', '', '15', '肇庆市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('179', '02', '', '15', '清远市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('18', '01', '', '', '河南', '', 'henan', '01', '');
INSERT INTO `bmw_syscode` VALUES ('180', '02', '', '15', '潮州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('181', '02', '', '15', '揭阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('182', '02', '', '15', '云浮市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('183', '02', '', '16', '福州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('184', '02', '', '16', '厦门市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('185', '02', '', '16', '三明市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('186', '02', '', '16', '莆田市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('187', '02', '', '16', '泉州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('188', '02', '', '16', '漳州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('189', '02', '', '16', '南平市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('19', '01', '', '', '湖北', '', 'hubei', '01', '');
INSERT INTO `bmw_syscode` VALUES ('190', '02', '', '16', '龙岩市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('191', '02', '', '16', '宁德市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('192', '02', '', '17', '海口市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('193', '02', '', '17', '三亚市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('194', '02', '', '17', '琼山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('195', '02', '', '17', '文昌市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('196', '02', '', '17', '琼海市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('197', '02', '', '17', '万宁市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('198', '02', '', '17', '五指山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('199', '02', '', '17', '东方市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('2', '01', '', '', '天津', '', 'tianjin', '01', '');
INSERT INTO `bmw_syscode` VALUES ('20', '01', '', '', '湖南', '', 'hunan', '01', '');
INSERT INTO `bmw_syscode` VALUES ('200', '02', '', '17', '儋州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('201', '02', '', '17', '临高县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('202', '02', '', '17', '澄迈县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('203', '02', '', '17', '定安县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('204', '02', '', '17', '屯昌县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('205', '02', '', '17', '昌江县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('206', '02', '', '17', '白沙县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('207', '02', '', '17', '琼中县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('208', '02', '', '17', '陵水县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('209', '02', '', '17', '保亭县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('21', '01', '', '', '四川', '', 'sichuan', '01', '');
INSERT INTO `bmw_syscode` VALUES ('210', '02', '', '17', '乐东县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('211', '02', '', '18', '郑州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('212', '02', '', '18', '开封市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('213', '02', '', '18', '洛阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('214', '02', '', '18', '平顶山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('215', '02', '', '18', '焦作市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('216', '02', '', '18', '鹤壁市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('217', '02', '', '18', '新乡市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('218', '02', '', '18', '安阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('219', '02', '', '18', '濮阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('22', '01', '', '', '云南', '', 'yunnan', '01', '');
INSERT INTO `bmw_syscode` VALUES ('220', '02', '', '18', '许昌市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('221', '02', '', '18', '漯河市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('222', '02', '', '18', '三门峡市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('223', '02', '', '18', '南阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('224', '02', '', '18', '商丘市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('225', '02', '', '18', '信阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('226', '02', '', '18', '周口市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('227', '02', '', '18', '驻马店市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('228', '02', '', '18', '济源市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('229', '02', '', '19', '武汉市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('23', '01', '', '', '贵州', '', 'guizhou', '01', '');
INSERT INTO `bmw_syscode` VALUES ('230', '02', '', '19', '黄石市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('231', '02', '', '19', '襄樊市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('232', '02', '', '19', '十堰市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('233', '02', '', '19', '荆州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('234', '02', '', '19', '宜昌市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('235', '02', '', '19', '荆门市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('236', '02', '', '19', '鄂州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('237', '02', '', '19', '孝感市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('238', '02', '', '19', '黄冈市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('239', '02', '', '19', '咸宁市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('24', '01', '', '', '陕西', '', 'shanxi', '01', '');
INSERT INTO `bmw_syscode` VALUES ('240', '02', '', '19', '随州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('241', '02', '', '19', '恩施州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('242', '02', '', '19', '仙桃市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('243', '02', '', '19', '天门市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('244', '02', '', '19', '潜江市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('245', '02', '', '19', '神农架林区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('246', '02', '', '20', '长沙市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('247', '02', '', '20', '株洲市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('248', '02', '', '20', '湘潭市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('249', '02', '', '20', '衡阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('25', '01', '', '', '甘肃', '', 'gansu', '01', '');
INSERT INTO `bmw_syscode` VALUES ('250', '02', '', '20', '邵阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('251', '02', '', '20', '岳阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('252', '02', '', '20', '常德市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('253', '02', '', '20', '张家界市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('254', '02', '', '20', '益阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('255', '02', '', '20', '郴州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('256', '02', '', '20', '永州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('257', '02', '', '20', '怀化市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('258', '02', '', '20', '娄底市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('259', '02', '', '20', '湘西州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('26', '01', '', '', '青海', '', 'qinghai', '01', '');
INSERT INTO `bmw_syscode` VALUES ('260', '02', '', '21', '成都市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('261', '02', '', '21', '自贡市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('262', '02', '', '21', '攀枝花市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('263', '02', '', '21', '泸州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('264', '02', '', '21', '德阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('265', '02', '', '21', '绵阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('266', '02', '', '21', '广元市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('267', '02', '', '21', '遂宁市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('268', '02', '', '21', '内江市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('269', '02', '', '21', '乐山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('27', '01', '', '', '宁夏', '', 'ningxia', '01', '');
INSERT INTO `bmw_syscode` VALUES ('270', '02', '', '21', '南充市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('271', '02', '', '21', '宜宾市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('272', '02', '', '21', '广安市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('273', '02', '', '21', '达州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('274', '02', '', '21', '眉山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('275', '02', '', '21', '雅安市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('276', '02', '', '21', '巴中市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('277', '02', '', '21', '资阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('278', '02', '', '21', '阿坝州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('279', '02', '', '21', '甘孜州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('28', '01', '', '', '内蒙古', '', 'neimenggu', '01', '');
INSERT INTO `bmw_syscode` VALUES ('280', '02', '', '21', '凉山州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('281', '02', '', '22', '昆明市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('282', '02', '', '22', '曲靖市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('283', '02', '', '22', '玉溪市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('284', '02', '', '22', '保山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('285', '02', '', '22', '昭通市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('286', '02', '', '22', '思茅地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('287', '02', '', '22', '临沧地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('288', '02', '', '22', '丽江地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('289', '02', '', '22', '文山州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('29', '01', '', '', '广西', '', 'guangxi', '01', '');
INSERT INTO `bmw_syscode` VALUES ('290', '02', '', '22', '红河州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('291', '02', '', '22', '西双版纳州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('292', '02', '', '22', '楚雄州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('293', '02', '', '22', '大理州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('294', '02', '', '22', '德宏州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('295', '02', '', '22', '怒江州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('296', '02', '', '22', '迪庆州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('297', '02', '', '23', '贵阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('298', '02', '', '23', '六盘水市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('299', '02', '', '23', '遵义市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('3', '01', '', '', '上海', '', 'shanghai', '01', '');
INSERT INTO `bmw_syscode` VALUES ('30', '01', '', '', '西藏', '', 'xizang', '01', '');
INSERT INTO `bmw_syscode` VALUES ('300', '02', '', '23', '安顺市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('301', '02', '', '23', '铜仁地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('302', '02', '', '23', '毕节地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('303', '02', '', '23', '黔西南州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('304', '02', '', '23', '黔东南州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('305', '02', '', '23', '黔南州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('306', '02', '', '24', '西安市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('307', '02', '', '24', '铜川市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('308', '02', '', '24', '宝鸡市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('309', '02', '', '24', '咸阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('31', '01', '', '', '新疆', '', 'xinjiang', '01', '');
INSERT INTO `bmw_syscode` VALUES ('310', '02', '', '24', '渭南市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('311', '02', '', '24', '延安市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('312', '02', '', '24', '汉中市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('313', '02', '', '24', '榆林市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('314', '02', '', '24', '安康市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('315', '02', '', '24', '商洛市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('316', '02', '', '25', '兰州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('317', '02', '', '25', '金昌市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('318', '02', '', '25', '白银市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('319', '02', '', '25', '天水市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('32', '01', '', '', '香港', '', 'xianggang', '01', '');
INSERT INTO `bmw_syscode` VALUES ('320', '02', '', '25', '嘉峪关市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('321', '02', '', '25', '武威市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('322', '02', '', '25', '张掖市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('323', '02', '', '25', '平凉市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('324', '02', '', '25', '酒泉市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('325', '02', '', '25', '庆阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('326', '02', '', '25', '定西地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('327', '02', '', '25', '陇南地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('328', '02', '', '25', '甘南州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('329', '02', '', '25', '临夏回族自治州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('33', '01', '', '', '澳门', '', 'aomen', '01', '');
INSERT INTO `bmw_syscode` VALUES ('330', '02', '', '26', '西宁市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('331', '02', '', '26', '海东地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('332', '02', '', '26', '海北州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('333', '02', '', '26', '海南州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('334', '02', '', '26', '果洛州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('335', '02', '', '26', '玉树州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('336', '02', '', '26', '海西州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('337', '02', '', '27', '银川市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('338', '02', '', '27', '石嘴山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('339', '02', '', '27', '吴忠市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('34', '01', '', '', '台湾', '', 'taiwan', '01', '');
INSERT INTO `bmw_syscode` VALUES ('340', '02', '', '27', '固原市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('341', '02', '', '28', '呼和浩特市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('342', '02', '', '28', '包头市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('343', '02', '', '28', '乌海市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('344', '02', '', '28', '赤峰市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('345', '02', '', '28', '通辽市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('346', '02', '', '28', '鄂尔多斯市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('347', '02', '', '28', '呼伦贝尔市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('348', '02', '', '28', '乌兰察布盟', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('349', '02', '', '28', '锡林郭勒盟', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('35', '02', '', '1', '北京市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('350', '02', '', '28', '巴彦淖尔盟', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('351', '02', '', '28', '阿拉善盟', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('352', '02', '', '28', '兴安盟', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('353', '02', '', '29', '南宁市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('354', '02', '', '29', '柳州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('355', '02', '', '29', '桂林市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('356', '02', '', '29', '梧州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('357', '02', '', '29', '北海市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('358', '02', '', '29', '防城港市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('359', '02', '', '29', '钦州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('36', '02', '', '2', '天津市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('360', '02', '', '29', '贵港市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('361', '02', '', '29', '玉林市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('362', '02', '', '29', '百色市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('363', '02', '', '29', '贺州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('364', '02', '', '29', '河池市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('365', '02', '', '29', '来宾市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('366', '02', '', '29', '崇左市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('367', '02', '', '30', '拉萨市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('368', '02', '', '30', '那曲地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('369', '02', '', '30', '昌都地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('37', '02', '', '3', '上海市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('370', '02', '', '30', '山南地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('371', '02', '', '30', '日喀则地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('372', '02', '', '30', '阿里地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('373', '02', '', '30', '林芝地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('374', '02', '', '31', '乌鲁木齐市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('375', '02', '', '31', '克拉玛依市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('376', '02', '', '31', '石河子市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('377', '02', '', '31', '阿拉尔市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('378', '02', '', '31', '图木舒克市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('379', '02', '', '31', '五家渠市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('38', '02', '', '4', '重庆市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('380', '02', '', '31', '吐鲁番地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('381', '02', '', '31', '哈密地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('382', '02', '', '31', '和田地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('383', '02', '', '31', '阿克苏地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('384', '02', '', '31', '喀什地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('385', '02', '', '31', '克孜勒苏州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('386', '02', '', '31', '巴音郭楞州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('387', '02', '', '31', '昌吉州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('388', '02', '', '31', '博尔塔拉州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('389', '02', '', '31', '伊犁州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('39', '02', '', '5', '石家庄市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('390', '02', '', '31', '塔城地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('391', '02', '', '31', '阿勒泰州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('392', '02', '', '32', '九龙城区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('393', '02', '', '32', '观塘区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('394', '02', '', '32', '深水', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('395', '02', '', '32', '黄大仙区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('396', '02', '', '32', '湾仔区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('397', '02', '', '32', '油尖旺区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('398', '02', '', '32', '离岛区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('399', '02', '', '32', '葵青区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('4', '01', '', '', '重庆', '', 'chongqing', '01', '');
INSERT INTO `bmw_syscode` VALUES ('40', '02', '', '5', '唐山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('400', '02', '', '32', '西贡区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('401', '02', '', '32', '沙田区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('402', '02', '', '32', '屯门区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('4028816a319a20d401319a2ce9c10003', '99', '00', null, '商城首页-热销产品', '商城首页-热销产品', 'ad_bestSell', '01', null);
INSERT INTO `bmw_syscode` VALUES ('4028816a319a20d401319a2d15f50004', '99', '00', null, '商城首页-促销产品', '商城首页-促销产品', 'ad_onSale', '01', null);
INSERT INTO `bmw_syscode` VALUES ('4028816a319a20d401319a2d5c280005', '99', '00', null, '商城首页-最新产品', '商城首页-最新产品', 'ad_newest', '01', null);
INSERT INTO `bmw_syscode` VALUES ('4028816a319a20d401319a2dbb3a0006', '99', '00', null, '商城首页-销量排行', '商城首页-销量排行', 'ad_sellMost', '01', null);
INSERT INTO `bmw_syscode` VALUES ('4028816a319a20d401319a2df2a40007', '99', '00', null, '商城首页-中央广告', '商城首页-中央广告', 'ad_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('4028816a319a20d401319a2df2a40008', '99', '00', null, '商城首页-在线软件', '商城首页-在线软件', 'online_software', '01', null);
INSERT INTO `bmw_syscode` VALUES ('40288187321541860132155803650002', '99', '00', null, '会员首页-促销产品', '会员首页-促销产品', 'ad_userhome_promote', '01', null);
INSERT INTO `bmw_syscode` VALUES ('4028818732154186013215584a7d0003', '99', '00', null, '会员首页-图片广告', '会员首页-图片广告', 'ad_userhome_img', '01', null);
INSERT INTO `bmw_syscode` VALUES ('402881eb302729c3013027310f030001', '40', null, null, '屏蔽字', null, null, null, 'banned');
INSERT INTO `bmw_syscode` VALUES ('403', '02', '', '32', '大埔区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('404', '02', '', '32', '荃湾区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('405', '02', '', '32', '元朗区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('406', '02', '', '33', '澳门', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('407', '02', '', '34', '台北市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('408', '02', '', '34', '高雄市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('409', '02', '', '34', '基隆市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('41', '02', '', '5', '秦皇岛市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('410', '02', '', '34', '台中市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('411', '02', '', '34', '台南市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('412', '02', '', '34', '新竹市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('413', '02', '', '34', '嘉义市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('414', '02', '', '34', '台北县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('415', '02', '', '34', '板桥市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('416', '02', '', '34', '宜兰县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('417', '02', '', '34', '宜兰市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('418', '02', '', '34', '桃园县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('419', '02', '', '34', '桃园市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('42', '02', '', '5', '邯郸市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('420', '02', '', '34', '新竹县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('421', '02', '', '34', '竹北市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('422', '02', '', '34', '苗栗县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('423', '02', '', '34', '苗栗市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('424', '02', '', '34', '台中县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('425', '02', '', '34', '丰原市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('426', '02', '', '34', '彰化县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('427', '02', '', '34', '彰化市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('428', '02', '', '34', '南投县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('429', '02', '', '34', '南投市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('43', '02', '', '5', '邢台市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('430', '02', '', '34', '云林县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('431', '02', '', '34', '斗六市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('432', '02', '', '34', '嘉义县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('433', '02', '', '34', '太保市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('434', '02', '', '34', '台南县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('435', '02', '', '34', '新营市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('436', '02', '', '34', '高雄县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('437', '02', '', '34', '凤山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('438', '02', '', '34', '屏东县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('439', '02', '', '34', '屏东市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('44', '02', '', '5', '保定市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('440', '02', '', '34', '澎湖县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('441', '02', '', '34', '马东市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('442', '02', '', '34', '台东县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('443', '02', '', '34', '台东市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('444', '02', '', '34', '花莲县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('445', '02', '', '34', '花莲市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('446', '02', '', '34', '金门县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('447', '02', '', '34', '连江县', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('45', '02', '', '5', '张家口市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('46', '02', '', '5', '承德市廊坊市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('47', '02', '', '5', '衡水市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('48', '02', '', '5', '沧州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('49', '02', '', '6', '沈阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('4adb649031e5e91a0131e5fed8de0003', '99', null, null, '企业-推荐企业', '企业-推荐企业', 'ent_recom', '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649031e5e91a0131e5fed8de0004', '99', null, null, '产品-明星企业推荐', '产品-明星企业推荐', 'ent_star', '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490329aa2010132add36a7b016e', '60', '01', '4adb649032ddab890132e2a45b6e000d', '窗口服务', '窗口服务', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649032ddab890132e2a45b6e000d', '60', '00', null, '商业服务', '商业服务', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649032ddab890132e2a69725000e', '60', '01', '4adb649032ddab890132e2a45b6e000d', '窗口服务', '窗口服务', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649032ddab890132e2a6ebfc000f', '60', '01', '4adb649032ddab890132e2a45b6e000d', '非窗口服务', '非窗口服务', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649032ddab890132fb5045ef003a', '60', '01', '4adb649032ddab890132e2a45b6e000d', '软件服务', '软件类产品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb64903344950601336322e1500013', '60', '00', null, '后勤饮食', '企业后勤饮食', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490334495060133632320ca0014', '60', '00', null, '生产材料', '企业生产', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033449506013363236bae0015', '60', '00', null, '办公用品', '企业办公', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490334495060133632391470016', '60', '00', null, '员工福利', '企业福利', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033449506013363240dab0017', '60', '01', '4adb64903344950601336322e1500013', '特色农产品', '特色农产品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490334495060133632675060018', '60', '00', null, '团体活动', '企业活动', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490336339140133633ab0390002', '60', '01', '4adb6490334495060133632675060018', '组团旅游', '组团旅游', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490336339140133633b8f3f0003', '60', '01', '4adb649033449506013363236bae0015', '电脑配件', '电脑用品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490336339140133633bc4490004', '60', '01', '4adb649033449506013363236bae0015', '财务用品', '财务用品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490336339140133633c03c30005', '60', '01', '4adb649033449506013363236bae0015', '文具事务用品', '文具事务用品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133633c65e80002', '60', '01', '4adb649033449506013363236bae0015', '办公打印机', '办公打印机', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133633c65e80003', '60', '01', '4adb649033449506013363236bae0015', '办公耗材', '办公耗材', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635342ef0004', '60', '01', '4adb6490334495060133632675060018', '组团KTV', '组团KTV', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c37013363538ecd0005', '60', '01', '4adb6490334495060133632675060018', '组团聚餐', '组团聚餐', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c3701336353e8280006', '60', '01', '4adb6490334495060133632675060018', '组团结婚', '组团结婚', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635809390007', '60', '01', '4adb6490334495060133632391470016', '元宵节', '元宵节', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c3701336358eee60008', '60', '01', '4adb6490334495060133632391470016', '端午节', '端午节', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c37013363596e190009', '60', '01', '4adb6490334495060133632391470016', '中秋节', '中秋节', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c3701336359999d000a', '60', '01', '4adb6490334495060133632391470016', '教师节', '教师节', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c3701336359f395000b', '60', '01', '4adb6490334495060133632391470016', '国庆节', '国庆节', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635a1e00000c', '60', '01', '4adb6490334495060133632391470016', '春节', '春节', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635a8872000d', '60', '01', '4adb649033449506013363236bae0015', '办公家具', '办公家具', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635bf224000e', '60', '01', '4adb6490334495060133632320ca0014', '农林牧渔', '农林牧渔', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635c3509000f', '60', '01', '4adb6490334495060133632320ca0014', '医药卫生', '医药卫生', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635c7c910010', '60', '01', '4adb6490334495060133632320ca0014', '建筑建材', '建筑建材', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635cce5b0011', '60', '01', '4adb6490334495060133632320ca0014', '冶金矿产', '冶金矿产', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635d08470012', '60', '01', '4adb6490334495060133632320ca0014', '石油化工', '石油化工', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635d5cdf0013', '60', '01', '4adb6490334495060133632320ca0014', '水利水电', '水利水电', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635d9e6c0014', '60', '01', '4adb6490334495060133632320ca0014', '信息产业', '信息产业', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635dfff50015', '60', '01', '4adb6490334495060133632320ca0014', '交通运输', '交通运输', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635e621a0016', '60', '01', '4adb6490334495060133632320ca0014', '机械机电', '机械机电', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635ebbc30017', '60', '01', '4adb6490334495060133632320ca0014', '轻工食品', '轻工食品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635ef7940018', '60', '01', '4adb6490334495060133632320ca0014', '服装纺织', '服装纺织', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635f63db0019', '60', '01', '4adb6490334495060133632320ca0014', '家居用品', '家居用品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133635fa50a001a', '60', '01', '4adb6490334495060133632320ca0014', '包装用品', '包装用品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c3701336360fc1e001b', '60', '01', '4adb64903344950601336322e1500013', '肉制品', '肉制品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c37013363612bf8001c', '60', '01', '4adb64903344950601336322e1500013', '饮料', '饮料', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c37013363615ab9001d', '60', '01', '4adb64903344950601336322e1500013', '食用油、油脂及其制品', '食用油、油脂及其制品', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c37013363619503001e', '60', '01', '4adb64903344950601336322e1500013', '调味品', '调味品', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c3701336361cdb6001f', '60', '01', '4adb64903344950601336322e1500013', '乳制品', '乳制品', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033633c370133636231330020', '60', '01', '4adb64903344950601336322e1500013', '粮食加工品', '粮食加工品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033639bd9013363a930bd0002', '60', '01', '4adb64903344950601336322e1500013', '糖果制品', '糖果制品', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033639bd9013363a9742e0003', '60', '01', '4adb64903344950601336322e1500013', '酒类', '酒类', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033639bd9013363a9ae1a0004', '60', '01', '4adb64903344950601336322e1500013', '茶叶及其相关制品', '茶叶及其相关制品', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033639bd9013363a9eeae0005', '60', '01', '4adb64903344950601336322e1500013', '蔬菜制品', '蔬菜制品', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033639bd9013363aa28e80006', '60', '01', '4adb64903344950601336322e1500013', '水果制品', '水果制品', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb649033639bd9013363aa69aa0007', '60', '01', '4adb64903344950601336322e1500013', '蛋制品', '蛋制品', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb64903541d57f013546c86d8f0015', '42', null, null, '1', '第一级', null, '01', '0-100');
INSERT INTO `bmw_syscode` VALUES ('4adb6490355ccb1c01357af0283e005e', '41', null, null, '10', '0-100元按照0.1比例换', null, '01', '0-100');
INSERT INTO `bmw_syscode` VALUES ('4adb6490355ccb1c01357af09d2f005f', '41', null, null, '8', '100-300按照0.08比例得积分', null, '01', '100-300');
INSERT INTO `bmw_syscode` VALUES ('4adb6490366cd2dc0136867fc36c02bc', '60', '00', null, '协会特供', '协会特供', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490366cd2dc01368680a3ab02be', '60', '01', '4adb6490366cd2dc0136867fc36c02bc', '红酒', '协会酒', null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490370bcd93013710ce9df20077', '60', '00', null, '服饰', '', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('4adb6490370bcd93013711127dae007b', '60', '01', '4adb6490370bcd93013710ce9df20077', '丝袜', '', null, '03', null);
INSERT INTO `bmw_syscode` VALUES ('5', '01', '', '', '河北', '', 'hebei', '03', '');
INSERT INTO `bmw_syscode` VALUES ('50', '02', '', '6', '大连市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('51', '02', '', '6', '鞍山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('52', '02', '', '6', '抚顺市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('53', '02', '', '6', '本溪市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('54', '02', '', '6', '丹东市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('55', '02', '', '6', '锦州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('56', '02', '', '6', '葫芦岛市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('57', '02', '', '6', '营口市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('58', '02', '', '6', '盘锦市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('59', '02', '', '6', '阜新市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('6', '01', '', '', '辽宁', '', 'liaoning', '01', '');
INSERT INTO `bmw_syscode` VALUES ('60', '02', '', '6', '辽阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('61', '02', '', '6', '铁岭市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('62', '02', '', '6', '朝阳市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('63', '02', '', '7', '哈尔滨市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('64', '02', '', '7', '齐齐哈尔市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('65', '02', '', '7', '鹤岗市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('66', '02', '', '7', '双鸭山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('67', '02', '', '7', '鸡西市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('68', '02', '', '7', '大庆市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('69', '02', '', '7', '伊春市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('7', '01', '', '', '黑龙江', '', 'heilongjiang', '01', '');
INSERT INTO `bmw_syscode` VALUES ('70', '02', '', '7', '牡丹江市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('71', '02', '', '7', '佳木斯市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('72', '02', '', '7', '七台河市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('73', '02', '', '7', '黑河市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('74', '02', '', '7', '绥化市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('75', '02', '', '7', '大兴安岭地区', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('76', '02', '', '8', '长春市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('77', '02', '', '8', '吉林市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('78', '02', '', '8', '四平市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('79', '02', '', '8', '辽源市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('8', '01', '', '', '吉林', '', 'jilin', '01', '');
INSERT INTO `bmw_syscode` VALUES ('80', '02', '', '8', '通化市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('81', '02', '', '8', '白山市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('82', '02', '', '8', '延边州', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('83', '02', '', '8', '白城市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('84', '02', '', '8', '松原市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('85', '02', '', '9', '济南市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('86', '02', '', '9', '青岛市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('87', '02', '', '9', '淄博市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('88', '02', '', '9', '枣庄市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('89', '02', '', '9', '东营市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('9', '01', '', '', '山东 ', '', 'shandong', '01', '');
INSERT INTO `bmw_syscode` VALUES ('90', '02', '', '9', '潍坊市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('91', '02', '', '9', '烟台市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('92', '02', '', '9', '威海市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('93', '02', '', '9', '济宁市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('94', '02', '', '9', '泰安市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('95', '02', '', '9', '日照市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('96', '02', '', '9', '莱芜市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('97', '02', '', '9', '临沂市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('98', '02', '', '9', '德州市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('99', '02', '', '10', '太原市', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ad_floor1_right', '99', '00', null, '第一楼右侧竖型广告', '第一楼右侧竖型广告', 'ad_floor1_right_pai', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_floor2_right', '99', '00', null, '第二楼右侧竖型广告', '第二楼右侧竖型广告', 'ad_floor2_right_pai', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_floor3_right', '99', '00', null, '第三楼右侧竖型广告', '第三楼右侧竖型广告', 'ad_floor3_right_pai', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_floor4_right', '99', '00', null, '第四楼右侧竖型广告', '第四楼右侧竖型广告', 'ad_floor4_right_pai', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_floor5_right', '99', '00', null, '第五楼右侧竖型广告', '第五楼右侧竖型广告', 'ad_floor5_right_pai', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_floor6_right', '99', '00', null, '第六楼右侧竖型广告', '第六楼右侧竖型广告', 'ad_floor6_right_pai', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_top_left_1', '99', '00', null, '商城首页-中央广告左大', '商城首页-中央广告左边大广告', 'ad_top_left_1', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_top_right_1', '99', '00', null, '商城首页-中央广告右上', '商城首页-中央广告右上广告', 'ad_top_right_1', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_top_right_2', '99', '00', null, '商城首页-中央广告右中', '商城首页-中央广告右中光噶', 'ad_top_right_2', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_top_right_3', '99', '00', null, '商城首页-中央广告右下', '商城首页-中央广告右下广告', 'ad_top_right_3', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_zhuanti_left', '99', '00', null, '专题左广告', '专题左广告', 'ad_zhuanti_left', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_zhuanti_right', '99', '00', null, '专题右广告', '专题右广告', 'ad_zhuanti_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ad_zhuanti_top', '99', '00', null, '专题上广告', '专题上广告', 'ad_zhuanti_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('audit_1', '11', null, null, '资讯审核', null, 'news_audit', null, '00');
INSERT INTO `bmw_syscode` VALUES ('audit_2', '11', null, null, '产品审核', null, 'product_audit', null, '00');
INSERT INTO `bmw_syscode` VALUES ('dly_001', '81', null, null, 'EMS快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_002', '81', null, null, '申通快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_003', '81', null, null, '圆通快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_004', '81', null, null, '韵达快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_005', '81', null, null, '中通快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_006', '81', null, null, '邮政包裹', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_007', '81', null, null, '顺丰快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_008', '81', null, null, '宅急送', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_009', '81', null, null, '天天快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_010', '81', null, null, '鑫飞鸿快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_011', '81', null, null, '能达快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_012', '81', null, null, '广州邮政', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_013', '81', null, null, '汇通快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_014', '81', null, null, '速尔快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_015', '81', null, null, '平邮/挂号信', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_016', '81', null, null, '大田快运', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_017', '81', null, null, '希伊艾斯（中诚）', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_018', '81', null, null, '全一快运', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_019', '81', null, null, '联邮速递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_020', '81', null, null, '龙邦快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_021', '81', null, null, '华宇物流', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_022', '81', null, null, '佳吉快运', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_023', '81', null, null, '中外运', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_024', '81', null, null, '信丰物流', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_025', '81', null, null, '中邮物流', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_026', '81', null, null, '中铁快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_027', '81', null, null, '越丰物流', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_028', '81', null, null, '联昊通', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_029', '81', null, null, '新邦物流', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_030', '81', null, null, '一邦速递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_031', '81', null, null, '中铁物流', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_032', '81', null, null, '优速物流', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_033', '81', null, null, '元智捷诚', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_034', '81', null, null, '驱达国际', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_035', '81', null, null, '京广快件', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_036', '81', null, null, 'USE（宇翔）', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_037', '81', null, null, '1980快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_038', '81', null, null, '安信达', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_039', '81', null, null, '飞康达', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_040', '81', null, null, 'ZMS（威鹏达）', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_041', '81', null, null, '广深速递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_042', '81', null, null, '东辉速递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_043', '81', null, null, '凤凰', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_044', '81', null, null, '华运物流', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_045', '81', null, null, '源伟丰', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_046', '81', null, null, '京广速递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_047', '81', null, null, '长城', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_048', '81', null, null, '宅急便', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_049', '81', null, null, '全日通', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_050', '81', null, null, '环球', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('dly_051', '81', null, null, '其它', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('first_four_1', '99', '00', null, '商城首页-新品上架', '首页新品上架广告位', 'first_four_new', '01', null);
INSERT INTO `bmw_syscode` VALUES ('first_four_2', '99', '00', null, '商城首页-限时抢购', '首页限时抢购广告位', 'first_four_time', '01', null);
INSERT INTO `bmw_syscode` VALUES ('first_four_3', '99', '00', null, '品牌直销', '首页品牌直销广告位', 'first_four_brand', '01', null);
INSERT INTO `bmw_syscode` VALUES ('first_four_4', '99', '00', null, '商城首页-特价商品', '首页特价商品广告位', 'first_four_price', '01', null);
INSERT INTO `bmw_syscode` VALUES ('first_left_float', '99', '00', null, '商城首页-左浮动广告', '首页左浮动广告位', 'first_left_float', '01', null);
INSERT INTO `bmw_syscode` VALUES ('first_right_float', '99', '00', null, '右浮动广告', '首页右浮动广告位', 'first_right_float', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor1_left_down', '99', '00', null, '第一楼左下广告', '第一楼左下广告', 'ad_floor1_left_down', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor1_left_up', '99', '00', null, '第一楼左上广告', '第一楼左上广告', 'ad_floor1_left_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor1_middle_down_left', '99', '00', null, '第一楼中下左广告', '第一楼中下右广告', 'ad_floor1_middle_down_left', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor1_middle_down_right', '99', '00', null, '第一楼中下右广告', '第一楼中下右广告', 'ad_floor1_middle_down_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor1_middle_up', '99', '00', null, '第一楼中上广告', '第一楼中上广告', 'ad_floor1_middle_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor1_right', '99', '00', null, '第一楼右广告', '第一楼右广告', 'ad_floor1_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor1_top', '99', '00', null, '第一楼上广告', '第一楼上广告', 'ad_floor1_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor2_left_down', '99', '00', null, '第二楼左下广告', '第二楼左下广告', 'ad_floor2_left_down', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor2_left_up', '99', '00', null, '第二楼左上广告', '第二楼左上广告', 'ad_floor2_left_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor2_middle_down_left', '99', '00', null, '第二楼中下左广告', '第二楼中下右广告', 'ad_floor2_middle_down_left', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor2_middle_down_right', '99', '00', null, '第二楼中下右广告', '第二楼中下右广告', 'ad_floor2_middle_down_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor2_middle_up', '99', '00', null, '第二楼中上广告', '第二楼中上广告', 'ad_floor2_middle_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor2_right', '99', '00', null, '第二楼右广告', '第二楼右广告', 'ad_floor2_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor2_top', '99', '00', null, '第二楼上广告', '第二楼上广告', 'ad_floor2_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor3_left_down', '99', '00', null, '第三楼左下广告', '第三楼左下广告', 'ad_floor3_left_down', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor3_left_up', '99', '00', null, '第三楼左上广告', '第三楼左上广告', 'ad_floor3_left_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor3_middle_down_left', '99', '00', null, '第三楼中下左广告', '第三楼中下右广告', 'ad_floor3_middle_down_left', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor3_middle_down_right', '99', '00', null, '第三楼中下右广告', '第三楼中下右广告', 'ad_floor3_middle_down_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor3_middle_up', '99', '00', null, '第三楼中上广告', '第三楼中上广告', 'ad_floor3_middle_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor3_right', '99', '00', null, '第三楼右广告', '第三楼右广告', 'ad_floor3_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor3_top', '99', '00', null, '第三楼上广告', '第三楼上广告', 'ad_floor3_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor4_left_down', '99', '00', null, '第四楼左下广告', '第四楼左下广告', 'ad_floor4_left_down', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor4_left_up', '99', '00', null, '第四楼左上广告', '第四楼左上广告', 'ad_floor4_left_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor4_middle_down_left', '99', '00', null, '第四楼中下左广告', '第四楼中下右广告', 'ad_floor4_middle_down_left', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor4_middle_down_right', '99', '00', null, '第四楼中下右广告', '第四楼中下右广告', 'ad_floor4_middle_down_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor4_middle_up', '99', '00', null, '第四楼中上广告', '第四楼中上广告', 'ad_floor4_middle_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor4_right', '99', '00', null, '第四楼右广告', '第四楼右广告', 'ad_floor4_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor4_top', '99', '00', null, '第四楼上广告', '第四楼上广告', 'ad_floor4_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor5_left_down', '99', '00', null, '第五楼左下广告', '第五楼左下广告', 'ad_floor5_left_down', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor5_left_up', '99', '00', null, '第五楼左上广告', '第五楼左上广告', 'ad_floor5_left_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor5_middle_down_left', '99', '00', null, '第五楼中下左广告', '第五楼中下右广告', 'ad_floor5_middle_down_left', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor5_middle_down_right', '99', '00', null, '第五楼中下右广告', '第五楼中下右广告', 'ad_floor5_middle_down_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor5_middle_up', '99', '00', null, '第五楼中上广告', '第五楼中上广告', 'ad_floor5_middle_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor5_right', '99', '00', null, '第五楼右广告', '第五楼右广告', 'ad_floor5_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor5_top', '99', '00', null, '第五楼上广告', '第五楼上广告', 'ad_floor5_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor6_left_down', '99', '00', null, '第六楼左下广告', '第六楼左下广告', 'ad_floor6_left_down', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor6_left_up', '99', '00', null, '第六楼左上广告', '第六楼左上广告', 'ad_floor6_left_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor6_middle_down_left', '99', '00', null, '第六楼中下左广告', '第六楼中下右广告', 'ad_floor6_middle_down_left', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor6_middle_down_right', '99', '00', null, '第六楼中下右广告', '第六楼中下右广告', 'ad_floor6_middle_down_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor6_middle_up', '99', '00', null, '第六楼中上广告', '第六楼中上广告', 'ad_floor6_middle_up', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor6_right', '99', '00', null, '第六楼右广告', '第六楼右广告', 'ad_floor6_right', '01', null);
INSERT INTO `bmw_syscode` VALUES ('floor6_top', '99', '00', null, '第六楼上广告', '第六楼上广告', 'ad_floor6_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('ins_001', '20', '', '', '安全、防护', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_002', '20', '', '', '办公、文教', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_003', '20', '', '', '包装', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_004', '20', '', '', '传媒、广电', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_005', '20', '', '', '代理', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_006', '20', '', '', '电工电气', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_007', '20', '', '', '电子元器件', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_008', '20', '', '', '二手设备转让', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_009', '20', '', '', '纺织、皮革', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_010', '20', '', '', '服饰', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_011', '20', '', '', '服装', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_012', '20', '', '', '化工', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_013', '20', '', '', '环保', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_014', '20', '', '', '机械及行业设备', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_015', '20', '', '', '加工', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_016', '20', '', '', '家居用品', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_017', '20', '', '', '家用电器', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_018', '20', '', '', '建筑、建材', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_019', '20', '', '', '交通运输', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_020', '20', '', '', '精细化学品', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_021', '20', '', '', '库存积压', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_022', '20', '', '', '礼品、工艺品、饰品', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_023', '20', '', '', '能源', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_024', '20', '', '', '农业', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_025', '20', '', '', '汽摩及配件', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_026', '20', '', '', '商务服务', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_027', '20', '', '', '食品、饮料', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_028', '20', '', '', '数码、电脑', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_029', '20', '', '', '通信产品', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_030', '20', '', '', '玩具', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_031', '20', '', '', '五金、工具', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_032', '20', '', '', '项目合作', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_033', '20', '', '', '橡塑', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_034', '20', '', '', '冶金矿产', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_035', '20', '', '', '医药、保养', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_036', '20', '', '', '仪器仪表', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_037', '20', '', '', '印刷', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_038', '20', '', '', '运动、休闲', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_039', '20', '', '', '照明工业', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('ins_040', '20', '', '', '纸业', '', '', '01', '');
INSERT INTO `bmw_syscode` VALUES ('mobile_001', '99', '00', null, '移动接口-热销产品', '移动接口-热销产品', 'mobile_ad_bestSell', '01', null);
INSERT INTO `bmw_syscode` VALUES ('mobile_002', '99', '00', null, '移动接口-促销产品', '移动接口-促销产品', 'mobile_ad_onSale', '01', null);
INSERT INTO `bmw_syscode` VALUES ('mobile_003', '99', '00', null, '移动接口-最新产品', '移动接口-最新产品', 'mobile_ad_newest', '01', null);
INSERT INTO `bmw_syscode` VALUES ('mobile_004', '99', '00', null, '移动接口-销量排行', '移动接口-销量排行', 'mobile_ad_sell_most', '01', null);
INSERT INTO `bmw_syscode` VALUES ('mobile_005', '99', '00', null, '移动接口-中央广告', '移动接口-中央广告', 'mobile_ad_top', '01', null);
INSERT INTO `bmw_syscode` VALUES ('send_01', '80', null, null, '快递', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('send_02', '80', null, null, '邮政包裹', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('send_03', '80', null, null, '客户自取', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('send_04', '80', null, null, '门店自提', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('send_05', '80', null, null, '虚拟交易', null, null, '01', null);
INSERT INTO `bmw_syscode` VALUES ('send_06', '80', null, null, '其它', null, null, '03', null);

-- ----------------------------
-- Table structure for `bmw_user`
-- ----------------------------
DROP TABLE IF EXISTS `bmw_user`;
CREATE TABLE `bmw_user` (
  `user_id` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmw_user
-- ----------------------------
INSERT INTO `bmw_user` VALUES ('40288c833c66e305013c66e558f10000', 'user001', '111111');
