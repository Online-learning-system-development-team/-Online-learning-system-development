/*
 Navicat Premium Data Transfer

 Source Server         : 王振鹏的MySql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 82.157.6.147:2222
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 04/09/2022 00:07:18
*/


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam_label
-- ----------------------------
DROP TABLE IF EXISTS `exam_label`;
CREATE TABLE `exam_label`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标签名称',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_label
-- ----------------------------
INSERT INTO `exam_label` VALUES (4, '面试', NULL, NULL, NULL, NULL);
INSERT INTO `exam_label` VALUES (6, '题库1', NULL, '2022-02-21 16:37:55', NULL, NULL);

-- ----------------------------
-- Table structure for exam_label_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_label_questions`;
CREATE TABLE `exam_label_questions`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `examination_questions_id` int NOT NULL COMMENT '试题id',
  `label_id` int NOT NULL COMMENT '标签id',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_12`(`examination_questions_id`) USING BTREE,
  INDEX `FK_Reference_13`(`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 337 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试题与标签的关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_label_questions
-- ----------------------------
INSERT INTO `exam_label_questions` VALUES (1, 149, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (4, 152, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (151, 1, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (152, 2, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (153, 3, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (154, 4, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (155, 5, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (156, 6, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (157, 7, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (158, 8, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (159, 9, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (160, 10, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (161, 11, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (162, 12, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (163, 13, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (164, 14, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (165, 15, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (166, 16, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (167, 17, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (168, 18, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (169, 19, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (170, 20, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (171, 21, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (172, 22, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (173, 23, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (174, 24, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (175, 25, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (176, 26, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (177, 27, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (178, 28, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (179, 29, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (180, 30, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (181, 31, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (182, 32, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (183, 33, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (184, 34, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (185, 35, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (186, 36, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (187, 37, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (188, 38, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (189, 39, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (190, 40, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (191, 41, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (192, 42, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (193, 43, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (194, 44, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (195, 45, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (196, 46, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (197, 47, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (198, 48, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (199, 49, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (200, 50, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (201, 51, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (202, 52, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (203, 53, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (204, 54, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (205, 55, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (206, 56, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (207, 57, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (208, 58, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (209, 59, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (210, 60, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (211, 61, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (212, 62, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (213, 63, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (214, 64, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (215, 65, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (216, 66, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (217, 67, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (218, 68, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (219, 69, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (220, 70, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (221, 71, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (222, 72, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (223, 73, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (224, 74, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (225, 75, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (226, 76, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (227, 77, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (228, 78, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (229, 79, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (230, 80, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (231, 81, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (232, 82, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (233, 83, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (234, 84, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (235, 85, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (236, 86, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (237, 87, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (238, 88, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (239, 89, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (240, 90, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (241, 91, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (242, 92, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (243, 93, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (244, 94, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (245, 95, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (246, 96, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (247, 97, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (248, 98, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (249, 99, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (250, 100, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (251, 101, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (252, 102, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (253, 103, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (254, 104, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (255, 105, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (256, 106, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (257, 107, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (258, 108, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (259, 109, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (260, 110, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (261, 111, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (262, 112, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (263, 113, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (264, 114, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (265, 115, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (266, 116, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (267, 117, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (268, 118, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (269, 119, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (270, 120, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (271, 121, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (272, 122, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (273, 123, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (274, 124, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (275, 125, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (276, 126, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (277, 127, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (278, 128, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (279, 129, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (280, 130, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (281, 131, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (282, 132, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (283, 133, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (284, 134, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (285, 135, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (286, 136, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (287, 137, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (288, 138, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (289, 139, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (290, 140, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (291, 141, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (292, 142, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (293, 143, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (294, 144, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (295, 145, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (296, 146, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (297, 149, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (298, 152, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (299, 153, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (300, 154, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (301, 155, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (302, 157, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (303, 158, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (304, 159, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (305, 160, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (306, 161, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (307, 162, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (308, 163, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (309, 164, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (310, 165, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (312, 167, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (313, 168, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (314, 169, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (315, 170, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (316, 171, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (320, 178, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (321, 179, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (322, 180, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (323, 181, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (324, 182, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (325, 183, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (326, 184, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (327, 185, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (328, 186, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (329, 187, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (330, 188, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (333, 191, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (336, 198, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_label_questions` VALUES (337, 199, 6, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for exam_option
-- ----------------------------
DROP TABLE IF EXISTS `exam_option`;
CREATE TABLE `exam_option`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `option_id` int NOT NULL COMMENT '题目表的Id',
  `option_content` varchar(9999) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '选项内容',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_3`(`option_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 634 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试题选项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_option
-- ----------------------------
INSERT INTO `exam_option` VALUES (1, 1111, '<p>11111</p>', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (2, 1, '测试数据使用独立的测试库。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (3, 1, '自动回滚单元测试产生的脏数据。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (4, 1, '无须区别，统一在业务代码中进行判断和识别。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (5, 2, '线程资源必须通过线程池提供，不允许在应用中自行显式创建线程。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (6, 2, '同步处理时，能锁部分代码区块的情况下不要锁整个方法；高并发时，同步调 用应该考虑到性能损耗。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (7, 2, '创建线程或线程池时，推荐给线程指定一个有意义的名称，方便出错时回溯。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (8, 2, '推荐使用Executors.newFixedThreadPool（intx）生成指定大小的线程池。（线 程池不允许使用Executors去创建，而是通过ThreadPoolExecutor的方式）', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (9, 3, '对于”明确停止使用的代码和配置”，如方法、变量、美、配置文件、动态配 置属性等要坚决从程序中清理出去，避免造成过多垃圾。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (10, 3, '永久弃用的代码段注释掉即可，即不用加任何注释。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (31, 8, 'POJO类的seiidlVersiunUID不一致会编译出错。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (32, 8, 'POJO类的serialVersionUID不一致会抛出序列化运行时异常。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (33, 9, '在接口美中的方法和属性使用public修饰符。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (34, 9, '对于Service美，内部的实现类加Impl的后缀与接口区别。例如： Productservice Im pl 实现 Productservice 接口。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (35, 9, '对于Service美，基于SOA的理念，是以接口方式暴露服务。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (36, 9, '尽量不在接口里定义变量，如果一定要定义变量，肯定是与接□方法相关，而 且是整个应用的基础常量。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (37, 10, '在foreach循环里进行元素的remove操作。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (38, 10, '使用Iterator方式，如果有并发，需要对Iterator对象加锁。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (39, 10, 'Iterator进行元素的删除操作，绝对是线程安全的。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (40, 10, 'Java无法实现在遍历时，进行删除元義操作。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (41, 11, '所有的POJO美属性必须使用包装数君类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (42, 11, 'RPC方法的返回值和参数必须使用包装数据类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (43, 11, '因为JAVA的自动装箱与拆箱机制，不需要根据场景来区分数据类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (44, 11, '所有的局部变量推荐使用基本数据类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (45, 12, '对varchar类型的字段建立索引，必须指定索引长度。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (46, 12, '对varchar类型的字段建立索引，不需要指定索引长度，这样索引区分度最好。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (47, 12, '业务上具有唯一特性的字E殳（合组合字E殳），必须指走唯一家引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (48, 12, '建冥合索引时，一般选择区分度高的字段放在最左列。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (49, 13, '版本号命名格式：主版本号.次版本号.修订号。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (50, 13, '主版本号:产品方向改变，或者大规模API不兼容，或者架构不兼容升级。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (51, 13, '次版本号:保持相对兼容性，瑁加主要功能特性，影响范围极小的API不兼容修 改。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (52, 13, '修订号:保持完全兼容性，修冥BUG、新瑁次要功能特性等。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (53, 14, '查询语句 WHERE a + 1 = 5可以利用a索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (54, 14, '查询语句 WHERE date_format（gmt_create, \'%Y-%m-%d\'） = ‘2016-11-11’ 无法利用gmt create索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (55, 14, '当c列类型为char时，查询语句WHERE c = 5无法利用c索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (56, 14, '索引字段使用时不能进行函数运算。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (57, 15, '异常信息应该包括两类信息：室发现场信息和异常堆栈信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (58, 15, '日志文件推荐至少保存15天，因为有些异常具备以\"周\"为频次发生的特点。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (59, 15, '避免重冥打印日志，浪斐磁盘空间，务必在Iog4j.xml中设置additivity=falseo', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (60, 15, '错误曰志和业务日志尽量分开存放。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (61, 16, '特殊注释标记，请注明标记人与标记时间。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (62, 16, '待办事宜（TODO）:（［标记人，标记时间，［预计处理时间］）', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (63, 16, '在注释中用FIXME标记某代码虽然实现了功能，但是实现的方法有待商榷，希 空将来能改进', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (64, 16, '在注释中用FIXME标记某代码是错误的，而且不能工作，需要及时纠正的情 况', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (65, 17, '主键查询优先于二级索引查询。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (66, 17, '表连接有一定的代价，故表连接数量越少越好。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (67, 17, '一般情况下，二级索引扫插优先于全表扫插。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (68, 17, '可以使用通过索引避免排序代价。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (69, 18, '若查询条件中不包含索引的最左列，则无法使用索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (70, 18, '对于范围查询，只能利用索引的最左列。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (71, 18, '对于0rder by A或group by A语句，在A上建立索引，可以避免排序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (72, 18, '对于多列排序，需要所有所有列排序方向一致，才能利用索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (73, 19, '抽象类命名使用Abstract或Base开头。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (74, 19, '异常类命名使用Exception结尾。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (75, 19, '测试类命名以它要测试的美的名称开始，以Test结尾。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (76, 19, '如果使用到了设计模式，建议在类名中体现出具体模式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (77, 20, '绝对禁止左模糊。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (78, 20, '绝对禁止全模糊。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (79, 20, '绝对禁止右模糊。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (80, 20, '全模糊或左模糊查询需求，优先使用熒索引擎。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (81, 21, '所有的抽象方法（包括接口中的方法］必须要用javadoc注释。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (82, 21, '所有的方法，包括私有方法，最好都塔加注释，有总比没有强。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (83, 21, '过多过滥的注释，代码的逻辑一旦修次，修改注释是相当大的负担。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (84, 21, '我的命名和代码结构非常好，可以减少注释的内容。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (85, 22, '继承 java.lang.Error 的类属于 checked exception„', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (86, 22, 'checked 异常继承 java.lang.Exception 类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (87, 22, 'unchecked 异常继承 java.lang. Run time Exception 类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (88, 22, 'NullPointerException , lllegalArgumentException 属于 unchecked exception0关注公众号：搜云库技术团队：回复：面试题，即可得', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (89, 23, ' Map类型的实现类都同时实现了 Iterator接口。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (90, 23, '使用foreach进行遍历。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (91, 23, '推荐使用keyset进行遍历。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (92, 23, '推荐使用entrySet进行遍历。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (93, 24, 'POJO美中的任何布尔类型的变量，都不要加is,因为部分框架解析时有可能 会出现序列化错误。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (94, 24, '包名统一使用单数形式，如：com.alibaba.mpp.utiL', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (95, 24, '中括号是数组类型的一部分，数组定义如下：String。args;不要误写为String args[];', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (96, 24, 'Service/DAO B方法命名可以参考规约，例如：删除的方法推荐使用remove 或delete做前缀。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (97, 25, '不允许出现任何魔法值(即未经预先定义的常量)直接出现在代码中。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (98, 25, '魔法值是指程序中随意定义并赋值的变量值，如果代码编写者明白变量值意义是可以任意使用的，例如在代码中写if(status == 3) return error;符合规范。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (99, 25, '如果变量值仅在一个范围内变化推荐用Enum美。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (100, 25, '在程序中，一律禁止使用枚举美型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (101, 26, '的依赖会默认传递给子项目。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (102, 26, '的依赖绝对不会传递给亍项曰。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (103, 26, '在中指定版本号。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (104, 26, '避免在不同的子项目，声明同一个二方库的不同版本号。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (105, 27, '升级二方库只是改个版本号，不需要关联功能的回归。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (106, 27, '升级二方库需要比对仲裁结果的差异，谨慎评估。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (107, 27, '升级二方库，绝对不会影响到其它二方库的版本号。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (108, 27, '只要此二方库负责人保证说不会有任珂影响，即可大胆升级，直接发布上线。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (109, 28, '表字段注释，如果修改字段含义或对字段表示的状态追加时，需要及时更新。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (110, 28, '合适的字符存储长度，不但节约数据庫表空间、节约索引存储，更重要的是提 升检索速度。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (111, 28, '针对表的每个字段都瑁加索引，加快查询速度。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (112, 28, '字段的区分度越高，索引的查找速度越快。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (113, 29, '路径覆盖是最强覆盖，符合路径覆盖且测试全部通过，程序绝对没有问题。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (114, 29, '语句覆盖度是最弱的覆盖度量方式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (115, 29, '分支覆盖与条件覆盖其实是一回事。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (116, 29, '判定条件覆盖与路径覆盖其实是一回事。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (117, 30, 'Hashtable的KV都不可以为null.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (118, 30, 'HashMap 的 KV 都可以为 null。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (119, 30, 'HashMap的K不可以为null, V可以为null。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (120, 30, 'ConcurrentHashMap 的 KV 都不可以为 nullo', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (121, 31, '数据库库名和表名没有规定，可任意取名，只要方便记忆即可。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (122, 31, '库名应该尽量与应用名称保持一致，表的命名最好是业务名称—表名的方式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (123, 31, '无论是库名还是表名都禁用保留字，如desc、match、range等。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (124, 31, '表名、字段名必须使用小写字母或数字。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (125, 32, '为防止obj对象本身空指针异常，书写代码时应该注意加异常捕获处理，例如:try { obj.method() } catch(NullPointerException e){	}	o', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (126, 32, '方法签名中，抛给调用者的关键字为throws', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (127, 32, '方法内部，抛出异常实例对象为throws', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (128, 32, '自定义异常要做到\"认知对等\",即抛出者和接收者要保持对自定义异常的 认知统一，接收方需要知道这种异常的含义和对应的处理方奏。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (129, 33, '数组元素的修改，会影响到转化过来的宾合。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (130, 33, '数组元素的修改，不会影响到转化过来的集合。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (131, 33, '对于转换过来的集合，它的add/remove/clear方法会抛出：UnsupportedOperationExce ption o', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (132, 33, 'Arrays.asList体现的是适配器模式，只是转换接口，后台的数据仍是数组。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (133, 34, 'IDE 的 text file encoding 设置为 GBK 格式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (134, 34, 'IDE 的 text file encoding 设置为 UTF-8 格式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (135, 34, 'IDE中文件的换行符使用unix格式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (136, 34, 'IDE中文件的换行符使用windows格式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (137, 35, '对于是与否概念的列名，必须使用can_abc来表示。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (138, 35, '对于是与否概念的列名，必须使用is_abc来表示。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (139, 35, '数据类型是varchar(1) ( Y表示是，N表示否)。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (140, 35, '数据类型是unsigned tiny int. ( 1表示是，0表示否)。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (141, 36, '代码块缩进4个空格，如果使用tab縮进，请设置成1个tab为4个空格；', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (142, 36, '代码块缩进5个空格，如果使用tab濡进，请设置成1个tab为5个空格。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (143, 36, '为了保持代码美观，《手册》强烈推琴瑁加若干空格，使某一行的变量与相邻 对应位置的变量对齐。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (144, 36, '方法体内的执行语句组、变量的定义语句组、不同的业务逻辑之间或者不同的 语义之间推荐插入一个空行；相同业务逻辑和语义之间不需要插入空行。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (145, 37, '返回的集合B没有实现Serializable接口，不能被序列化，所以不能应用于RPC 场景。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (146, 37, '在B集合中添加某个元素，那么A集合也会添加进去此元素。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (147, 37, '集合A中元素的修改不会影响到集合B的任何操作。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (148, 37, '对A元素个数的修改，会导致集合B的遍历产生ConcurrentModificationException 异常。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (149, 38, '如果需要捕获不同类型异常，为了方便处理，可以使用catch(Exception e){...}°', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (150, 38, '不要捕获异常后不处理，丟弃异常信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (151, 38, '捕获异常与抛异常，必须是完全匹配.或者捕获异常是抛异常的父类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (152, 38, '异常走义时区分unchecked / checked异常，避免直接使用 RuntimeException 抛出。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (153, 39, 'SimpleDateFormat是线程不安全的美。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (154, 39, 'SimpleDateFormat是线程安全的美.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (155, 39, '—般不要定义SimpleDateFormat的static变量，如果定义为static,必须保 证线程安全。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (156, 39, '推荐使用Apache封装好的DateUtils和DateFormatUtils工具类，来处理时 间曰期转换问题。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (157, 40, '构造方法中做的事情过多。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (158, 40, '存在过多的全局变量和静态方法。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (159, 40, '存在过多的外部依赖。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (160, 40, '存在过多的条件语句。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (161, 41, '推荐if-else的方式可以改写成卫语句的形式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (162, 41, '尽量减少try-catch块内的逻辑，定义对象、变量、获取数据库连接等操作可 以移到try-catch块外处理', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (163, 41, 'if ( condition) statements;单行语匂不需要使用大括号。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (164, 41, '在一个switch块内，都必须包含一个default语句并且放在最后，即使它什么 代码也没有。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (165, 42, '防止page size过大导致内存溢出。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (166, 42, '防止正则输入源串拒绝服务ReDOS。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (167, 42, '防止任意重定向。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (168, 42, '预防SQL注入。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (169, 43, 'Long a = 2L; 〃大写的 L', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (170, 43, 'Long a = 2l; //小写的 I', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (171, 43, '常量只定义一次，不再赋值，所以不需要命名规范。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (172, 43, '不要使用一^、常星类维护所有常星，应该技常星功能进行归类，分开维护。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (173, 44, 'String类型的默认值设定为空字符审。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (174, 44, 'Date类型的默认值设定为new Date()o', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (175, 44, '集合类型的默认值设定为Collections.EMPTY_LIST0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (176, 44, '不要设定任何属性默认值。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (177, 45, 'mvn dependency:resolve打印出已仲裁依赖的列表。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (178, 45, 'mvn dependency:tree打印工程整个的依赖树结构。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (179, 45, 'mvn dependency:tree -Dverbose -Di ncludes=commons-la ng 打印出与 commons-lang相关的详细依赖。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (180, 45, 'mvn clean install打印工程整个的依赖树结构，并部署到本地仓库中。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (181, 46, 'TreeMap 的 key 不可以为 null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (182, 46, 'TreeMap 的 key 可以为 null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (183, 46, 'ConcurrentHashMap 的 key 可以为 null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (184, 46, 'ConcurrentHashMap 的 value 可以为 null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (185, 47, '表名、字段名禁止出现数字开头，禁上两个下划线中间只出现数字。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (186, 47, '表名不使用复数名词。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (187, 47, '表必备三字段命名：id, gmt create, gmt_modify0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (188, 47, '表必备三字段命名：id, gmt create, gmt_modified0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (189, 48, '推荐使用Timer方式处理。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (190, 48, ' 1.关于多线程并行处理定时任务的情况，下列哪些说法符合《阿里巴巴Java 开发手册》:BCDA.推荐使用Timer方式处理。B.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (191, 48, '1.关于多线程并行处理定时任务的情况，下列哪些说法符合《阿里巴巴Java 开发手册》:BCDA.推荐使用Timer方式处理。B.推荐使用 ScheduledExecutorService 方式处理。 c. Timer运行多个TimeTask时，只要其中之一没有捕获抛出的异常，其它任务 便会自动终止运行。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (192, 48, ' ScheduledExecutorService并发运行多个定时任务时，其中某线程抛出异常， 不会影响到其它线程的继续运行。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (193, 49, '禁止将URL、文件名、系统参数、数矣岸连接地址、业务规则的可变参数，硬 编码在工程中。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (194, 49, 'long或者Long初始赋值时，必须是大写的L,不能小写。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (195, 49, '当一个类有多个构造方法，或是多个同名方法，这些方法应该按顺序放置在一 起，便于阅读。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (196, 49, '相同参数类型，同等业务含义，才可以使用Java的可变参数，参数的类型尽 量避免使用Object。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (197, 50, '主键索引(primary key),字段类型为unsigned bigint、单表时推荐自瑁、步 长为1。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (198, 50, '主键索引(primary key),字段类型为unsigned bigint、单表时推荐自瑁、步 长为2。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (199, 50, '唯一索引(unique key),命名规则为uk_字段名(如果多个字段继续下划线)。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (200, 50, '晋通索引(normal index),标记成idx_字段名(如果多个继续下划线)。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (201, 51, '推荐使用Timer方式处理。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (202, 51, '推荐使用 ScheduledExecutorService 方式处理。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (203, 51, 'Timer运行多个TimeTask时，只要其中之一没有捕获抛出的异常，其它任务 便会自动终止运行。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (204, 51, ' ScheduledExecutorService并发运行多个定时任务时，其中某线程抛出异常， 不会影响到其它线程的继续运行。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (205, 52, 'TreeMap 的 key 不可以为 null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (206, 52, 'TreeMap 的 key 可以为 null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (207, 52, 'ConcurrentHashMap 的 key 可以为 null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (208, 52, 'ConcurrentHashMap 的 value 可以为 null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (209, 53, 'Hashtable的KV都不可以为null.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (210, 53, 'HashMap 的 KV 都可以为 null。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (211, 53, 'HashMap的K不可以为null, V可以为null.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (212, 53, 'ConcurrentHashMap 的 KV 都不可以为 null.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (213, 54, '强制包名统一使用小写，点分隔符之间有且仅有一个自然语义的英语单词，并 且使用复数形式，例如：应用工具类包名为com.alibaba.mpp.utils', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (214, 54, '强制类名使用UpperCamelCase,必须道从驼峰形式，但以下情形例外：（领 域模型的相关命名）DO / DTO / VO / DAO等。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (215, 54, '强制抽象类命名使用Abstract或Base开头；异常类命名使用Exception结尾； 测试类命名以它要测试的美的名称开始，以Test结尾。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (216, 54, '强制枚举类名建议帝上Enum后缀，枚举成员名称需要全大写，单词间用下划 线隔开。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (217, 54, '如果使用到了设计模式，建汶在类名中体现出具体模式。例如代理模 式的美命名：LoginProxy;观察者模式命名：Resourceobserver。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (218, 55, '所有的覆写方法，必须是强制加©Override.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (219, 55, 'setter方法中，参数名称与美成员变量名称一致，this.成员名=参数名。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (220, 55, '在getter方法中，尽量不要瑁加逻辑判断，因为添加了逻辑判断后，会増加排 查问题难度。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (221, 55, '避免用BeanUtil进行属性的copy。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (222, 56, '使用volatile关键字。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (223, 56, '使用synchronized关键字给对象的读写操作加锁。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (224, 56, '如果是基本类型，推荐使用java.util.concurrent.atomic包下面提供的线程安 全的基本类型包装类，例如Atomiclnteger0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (225, 56, '如果是集合，推荐使用java.util.concurrent提供的并发集合美，例如：ConcurrentHashMap0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (226, 57, '换行时相对上一行缩进2个空格。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (227, 57, '运算符与下文一起换行，方法调用的京符号与下文一起换行o .appendO', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (228, 57, '在多个参数超长，逗号后进行换行。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (229, 57, '在括号前不要换行。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (230, 58, 'SQL性能优化的目标：至少要达到range级别，要求是ref级别，如果可以 是consts最好。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (231, 58, 'index级别走的是扫插索引，所以速度会比ref快。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (232, 58, 'range级别是指对表进行范围索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (233, 58, 'ref级别是指使用主键或者唯一索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (234, 59, '日志尽量记录奏发现场信息和异常堆栈信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (235, 59, '如果日志中输出POJ。美，POJO类需要重写toString方法，避免只输出 hdshCudeo', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (236, 59, '不建议输出任何日志，因为曰志记录消耗性能。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (237, 59, '捕获异常后，一律抛给调用者去处理.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (238, 60, '数据库中，表达是与否概念的字段，必须使用is_xxx的方式命名。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (239, 60, '推荐使用 iBATIS 自帝的 queryForList(String statementName,int startjnt size)进行分页查询。(不推荐)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (240, 60, '为避免写resultMap,可以直接拿HashMap与HashTable作为查询结果集的 输出。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (241, 60, '不要用resultclass当返回参数，即使所有美属性名与数据座字段一一对应， 也需要定义。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (242, 61, '方法头定义签名上的注释可以使用〃〔双划线)简单说明，不必要道守javadoc 规范。(/** */)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (243, 61, '美定义开始部分，一般都用Javadoc注释程序的总体插述以及作者信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (244, 61, '方法头定义签名上的注释必须道守javadoc规范，使用/**回车来生成，不得 在方法定义上方使用〃(双划线)简单说明。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (245, 61, '方法头定义签名上的注释，可以使用//XXX的形式', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (246, 62, '常量命名应该全部大写，单词间用下划线隔开。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (247, 62, '常量的定义要力求语义表达完整清楚，让别人能从常量名称上大致了解含义， 例如：MAX STOCK COUNT.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (248, 62, '常量命名，可以使用拼音与英文的混合方式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (249, 62, '在使用缩写时要注意：杜绝不规范的濡写。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (250, 63, '二方库里可以定义。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (251, 63, '二方库里接口的入参可以使用枚举类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (252, 63, ' 1.关于二方库使用枚举类型，下列哪些说法符合《阿里巴巴Java开发手册》:ABDA.二方库里可以定义。B.二方库里接口的入参可以使用枚举类型。C.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (253, 63, '1.关于二方库使用枚举类型，下列哪些说法符合《阿里巴巴Java开发手册》:ABDA.二方库里可以定义。B.二方库里接口的入参可以使用枚举类型。C.二方库里接口的返回值不能使用枚举类型，但可以包含枚举类型。D,二方库里接口的返回值是枚举类型或旬含枚举美型时，当二方库的枚举值升级（瑁加枚举值）时，可能会导致接口调用时出现枚举对象序列化异常。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (254, 64, 'hashcode 是 Class 的方法，equals 是 Object 的方法。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (255, 64, 'hashcode决定（如：HashMap）存储位置；equals决定是否需要覆盖（同一 hash下）集合元素。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (256, 64, '美重写hashcode,必须重写equals.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (257, 64, '两者是否需要重写，没有必然联系。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (258, 65, 'tcp链接主动关闭的一方，在完成四次挥手协议后，即会立即关闭并释放 socket0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (259, 65, '处于time_wait状态的socket,其实是已经关闭状态，当需要新建连接时，可 以被马上复用。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (260, 65, '当大量socket处于time_wait状态时，会导致可用socket资源稀缺，从而导 致服务器并发能力下降。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (261, 65, '通过修改/etc/sysctl.conf配置文件，减小time_wait的超时时间，可以降低 time_wait状态的socket数量，从而提升服务器并发能力。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (262, 66, '所有的覆写方法，必须是强制加©Override.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (263, 66, 'setter方法中，参数名称与美成员变量名称一致，this.成员名=参数名。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (264, 66, '在getter方法中，尽量不要瑁加逻辑判断，因为添加了逻辑判断后，会瑁加排 查问题难度。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (265, 66, '避免用BeanUtil进行属性的copy0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (266, 67, '推荐用try-catch来做流程控制、条件控制。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (267, 67, '捕获异常与抛异常，必须是完全匹配，或者捕获异常是抛异常的父类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (268, 67, '对大段代码进行try-catch,利用Throwable来捕捉，万无一失。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (269, 67, '对大段代码进行try-catch,这是不负责任的表现，分清稳定代码和非稳定代 码，对非稳定的代码做对应的异常处理。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (270, 68, '可以只锁代码区块的情况下，就不要锁整个方法体。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (271, 68, '高并发的业务场景下，要考虑加锁及同步处理带来的性能损耗，能用无锁数据 结构，就不要用锁。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (272, 68, '能用对象锁的情况下，就不要用美锁。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (273, 68, '加锁时需要保持一致的加锁顺序，否则可能会造成死锁。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (274, 69, '表单、AJAX提交不需要进行CSRF安全过滤。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (275, 69, '表单、AJAX提交必须执行CSRF安全过滤。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (276, 69, 'URL外部重定向传入的目标地址必须执行白名单过滤。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (277, 69, '用户输入的SQL参数严格使用参数绑定或者METADATA字段值限定，防止 SQL注入，禁止字符串拼接SQL访问数括库。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (278, 70, '对外提供一个大而全的接口进行POJO的update更新，这样比较省事，省代 码。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (279, 70, '使用事务回滚的地方需要考虑各方面的回滚方奏，包括缓存回滚、搜索引擎回 滾、消息补偿、统计修正等。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (280, 70, '应用服务器与数据库之间是短连接。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (281, 70, '应用服务器与数据库之间是长连接。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (282, 71, '依赖于一个二方库群时，必须定义一个统一版本斐量，避免各子二方库版本号 不一致。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (283, 71, '可以允许子项目的pom依赖中出现相同的Groupld,相同的Artifactld,但是 不同的Version。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (284, 71, '所有pom文件中的依赖声明放在语句块中，所有版本仲裁放在语句块中。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (285, 71, '线上应用不要依赖SNAPSHOT版本（安全包除外）。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (286, 72, 'HashSet', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (287, 72, 'LinkedList', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (288, 72, 'HdSllMdp', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (289, 72, 'TreeSet', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (290, 73, 'json 操作使用 fastjson0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (291, 73, 'md5 操作使用 commons-codec0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (292, 73, 'ArrayUtils. NumberUtils. DateFormatUtils. DateUtils 等优先使用org.apache.commons.lang 包。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (293, 73, 'CollectionUtils 优先使用 org.apache.commons.collections，包。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (294, 74, '类名使用UpperCamelCase命名法，但是领域模型命名除外，如：ProductDO 的命名是规范的。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (295, 74, '方法名命名应该使用lowerCamelCase命名法，如方法名:getHttpMessage()是符合命名规范的。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (296, 74, '为了方便理解，方法名或参数名可以使用拼音与英文混合的方式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (297, 74, '所有编程相关的命名均不能以下划线或美元符号开始，也不能以下划线或美元 符号结束。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (298, 75, 'id', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (299, 75, 'gmt modified', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (300, 75, 'parentid', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (301, 75, 'gmt create', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (302, 76, '写在业务代码休里边，方便调试。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (303, 76, '写在业务代码同一个包下，方便归类查找。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (304, 76, '写在 src/test/java 目录下。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (305, 76, '与在sic/jdvd曰录下。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (306, 77, '使用索引的效率一定高于全表扫描的效率。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (307, 77, '关于explain的结果，type = index的索引效率好于type = refo', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (308, 77, 'sql查询条件where a like \'%阿里％\',不会走索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (309, 77, ' sql查询条件where a like \'阿里％， ,a列创建了索引，一般会使用索引进 行检索。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (310, 78, '能够减少在创建和销毁线程上所花的时间以及系统资源的开销。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (311, 78, '使用线程池一定能避免00M问题。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (312, 78, '线程资源必须通过线程池提供，不允许在应用中自行显式创建线程。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (313, 78, '线程池能够根据资源等待情况，自动凋整线程优先级并解决死锁问题。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (314, 79, 'Border,边界值测试，包括循环边界.特殊取值、特殊时间点、数据顺序等。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (315, 79, 'Correct,正确的输入，并得到预期的结果。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (316, 79, 'Design,与设计文档相结合，来编写单元测试。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (317, 79, 'Equal,单元测试环境必须与线上生产环境一致。（Error）', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (318, 80, '数据对象命名：xxxDO, xxx即为数据表名，例如：ResellerAccountDO.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (319, 80, '数据传输对象：xxxDTO, xxx为业务领域相关的名称，例如ProductDTO.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (320, 80, '展示层对象：xxxVO, xxx—般为网页名称，例如RecommendProductVO.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (321, 80, 'POJO 是 DO/DTO/BO/VO 的统称，命名成 xxxPOJO.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (322, 81, '客户的密码，密钥及密保问题答奏等信息禁止展示。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (323, 81, '客户的银行卡号只显示后四位。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (324, 81, '客户的证件号码只显示第一位和最后一位，在必要业务场景下，经多因子强验 证后可完整展示。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (325, 81, '涉及有完整展示客户信息的页面均需要接入防爬系统', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (326, 82, '线程遂源必须通过线程池提供，不允许在应用中目行显式创建线程。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (327, 82, '同步处理时，能锁部分代码区块的情况下不要锁整个方法；高并发时，同步调 用应该考虑到性能损耗。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (328, 82, '创建线程或线程池时，推荐给线程指定一个有意义的名称，方便出错时回溯。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (329, 82, '推荐使用Executors.newFixedThreadPool(int x)生成指定大小的线程池。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (330, 83, '分页查询，当统计的count为0时，应该直接返回，不要再执行分页查询语句。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (331, 83, 'iBATIS 自帝的 queryForList(String statementNamejnt start,int size)分页接 口有性能隐患，不允许使用。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (332, 83, '定义明确的sql查询语句，通过传入参数start和size来实现分页逻辑。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (333, 83, '可使用存储过程写分页逻辑，提高效率。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (334, 84, '如果需要捕获不同类型异常，为了方便处理，可以使用catch(Exception e){...}°', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (335, 84, '不要捕获异常后不处理，丟弃异常信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (336, 84, '捕获异常与抛异常，必须是完全匹配.或者捕获异常是抛异常的父类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (337, 84, '异常定义时区分unchecked / checked异常，避免直接使用 RuntimeException 抛出。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (338, 85, '所有的POJO美属性必须使用包装数有类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (339, 85, 'RPC方法的返回值和参数必须使用包装数据类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (340, 85, '因为JAVA的自动装箱与拆箱机制，不需要根据场景来区分数据类型。〃容易 选错', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (341, 85, '所有的局部变量推荐使用基本数据类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (342, 86, '异常信息应该包括两类信息：奏发现场信息和异常堆栈信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (343, 86, '日志文件推荐至少保存15天，因为有些异常具备以\"周\"为频次发生的特点。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (344, 86, '避免重冥打印日志，浪菱磁盘空间，务必在Iog4j.xml中设置additivity=falseo', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (345, 86, '错误曰志和业务日志尽量分开存放。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (346, 87, '绝对禁止左模糊。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (347, 87, '绝对禁止主模糊。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (348, 87, '绝对禁止右模糊。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (349, 87, '全模糊或左模糊直询需求，优先使用熒索引擎。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (350, 88, 'POJ0美中的任何布尔类型的变量，都不要加is,因为部分框架解析时有可能 会出现序列化错误。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (351, 88, '包名统一使用单数形式，如：com.alibaba.mpp.utiL', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (352, 88, '中括号是数组类型的一部分，数组定义如下：String。args;不要误写为String 出9，[];', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (353, 88, 'Service/DAO B方法命名可以参考规约，例如：删除的方法推荐使用remove 或delete做前缀。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (354, 89, '数组元素的修改，会影响到转化过来的集合。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (355, 89, '数组元素的修改，不会影响到转化过来的集合。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (356, 89, '对于转换过来的集合，它的add/remove/clear方法会抛出:Un supportedOperation Exception。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (357, 89, 'Arrays.asList体现的是适配器模式，只是转换接口，后台的数据仍是数组。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (358, 90, '禁止将URL、文件名、系统参数、数矣岸连接地址、业务规则的可变参数，硬 编码在工程中。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (359, 90, 'long或者Long初始赋值时，必须是大写的L,不能小写。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (360, 90, '当一个类有多个构造方法，或是多个同名方法，这些方法应该按顺序放置在一 起，便于阅读。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (361, 90, '相同参数类型，同等业务含义，才可以使用Java的可变参数，参数的类型尽 量避免使用Object。//避免强制转换引起RuntimeException的ClassCastException', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (362, 91, '查询语句 WHERE a = 10 ORDER B\"b,可以利用表引(A. b)来进行索引排序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (363, 91, '查询语句WHERE a > 10 ORDER BY b,不可以利用素引(A. b)进行索引排序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (364, 91, '查询语句WHERE a IN (10, 11) ODER BY b.可以利用索引(A. b)来进行索引排 序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (365, 91, '查询语句WHER a>10 AND b=20 ORDER BY A.可以利用索引(b, a)来进行素 引排序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (366, 92, 'HashSet', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (367, 92, 'LinkedList', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (368, 92, 'HdSllMdp', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (369, 92, 'TreeMap', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (370, 93, '任何美、方法、严控访问范围。因为过宽泛的访问范围，不利于模块解耦。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (371, 93, '对外暴露的接口签名，原则上不允许修改，宁可新瑁，避免对依赖端产生影响。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (372, 93, '如果新瑁一个功能完全相同的新接口，过时接口必须加@deprecated注释。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (373, 93, '所有过时的美与方法不得使用。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (374, 94, '事务场景中，抛出异常核catch后，如果需要回滚，一定要手动回滚事务。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (375, 94, '在finally对文件流进行关闭。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (376, 94, '推荐在finally使用return语句。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (377, 94, '在try块内，可以不用对可能为null的对象做非空判断,因为如果抛掷NPE,会被 catch块捕获井处理', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (378, 95, '对trace/debug/info级别的日志输出，必须使用条件输出形式或者使用占位符 的方式', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (379, 95, '条件输出方式可以避免log参数中字符串拼接的开销。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (380, 95, '占位符输出格式可以和条件输出一样避免参数中字符串拼接开销。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (381, 95, '因为设置了日志输出级别，所以无需使用条件输出方式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (382, 96, '只要是常量，就使用校举值.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (383, 96, '如果变量值在一个范围内变化，而且还带有名称之外的延伸属性，必须使用Enum 美，如：pubic enum MonthEnm( JANUARY。),FEBRARY(2),MCAC (I)3, APA14DDEME 12)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (384, 96, '枚举名命名建议帝上Enum,枚举成员名称需要全大写，单词用\"」分割。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (385, 96, '定义星期一至星期日这种范围固定的言息，不推荐使用校举类型。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (386, 97, '批量处理接口必须做好接口入参保护', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (387, 97, '需要极高稳定性和可用性的方法需要对参数进行校验', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (388, 97, '底层的方法，在上层调用中参数多半已经被校验过，可以考虑不校验。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (389, 97, '对外提供的开放接口，都要进行参数检验。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (390, 98, 'TEXT文本类型的字段。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (391, 98, '基本固定不变的类目名称。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (392, 98, 'varchar(2500)的字段', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (393, 98, '需要频繋修改的字段', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (394, 99, '方法头定义签名上的注释可以使用〃〔双划线)简单说明，不必要道守javadoc 规范。(/** */)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (395, 99, '类定义开始部分，一般都用Javadoc注释程序的总体描述以及作者信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (396, 99, '方法头定义签名上的注释必须道守javadoc规范，使用/**回车来生成，不得 在方法定义上方使用〃(双划线)简单说明。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (397, 99, '方法头走义签名上的注释，可以使ffl// xxx的形式', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (398, 100, '可以只锁代码区块的情况下，就不要锁整个方法体。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (399, 100, '高并发的业务场景下，要考虑加锁及同步处理带来的性能损耗，能用无锁数据 结构，就不要用锁。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (400, 100, '能用对象锁的情况下，就不要用美锁。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (401, 100, '加锁时需要保持一致的加锁顺序，否则可能会造成死锁。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (402, 101, 'id', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (403, 101, 'gmt modified', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (404, 101, 'parentid', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (405, 101, 'gmt create', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (406, 102, '写在业务代码体里边，方便调试。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (407, 102, '写在业务代码同一个包下，方便归类查找。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (408, 102, '写在 src/test/java 目录下。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (409, 102, '写在src/java目录下。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (410, 103, 'Border,边界值测试，包括循环边界.特殊取值、特殊时间点、数据顺序等。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (411, 103, 'Correct,正确的输入，并得到预期的结果。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (412, 103, 'Design,与设计文档柏结合，来编写单元测试。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (413, 103, 'Equal,单元测试环境必须与线上生产环境一致。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (414, 104, '测试数据入库时加特殊前缀标识。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (415, 104, '测试数据使用独立的测试库。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (416, 104, '自动回滚单元测试产生的脏数据。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (417, 104, '无须区别，统一在业务代码中进行判断和识别。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (418, 105, '异常信息应该包括两类信息：室发现场信息和异常堆栈信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (419, 105, '日志文件推荐至少保存15天，因为有些异常具备以\"周\"为频次发生的特点。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (420, 105, '避免重冥打印日志，浪斐磁盘空间，务必在Iog4j.xml中设置additivity=falseo', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (421, 105, '错误曰志和业务日志尽量分开存放。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (422, 106, '若查询条件中不包含索引的最左列，则无法使用索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (423, 106, '对于范围查询，只能利用索引的最左列。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (424, 106, '对于0rder by A或group by A语句，在A上建立索引，可以避免排序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (425, 106, '对于多列排序，需要所有所有列排序方向一致，才能利用索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (426, 107, '继承 java.lang.Error 的美属于 checked exception„', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (427, 107, 'checked 异常继承 jdVd.ldrig.Exceplion 类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (428, 107, 'unchecked 异常继承 java.lang. Run time Exception 类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (429, 107, 'NullPointerException , lllegalArgumentException 属于 unchecked exception0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (430, 108, '推荐用try-catch来做流程控制、条件控制。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (431, 108, '捕获异常与抛异常，必须是完全匹配，或者捕获异常是抛异常的父类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (432, 108, '对大段代码进行try-catch,利用Throwable来捕捉，万无一失。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (433, 108, '对大段代码进行try-catch,这是不负责任的表现，分清稳定代码和非稳定代 码，对非稳定的代码做对应的异常处理。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (434, 109, '测试数据入库时加特殊前缀标识。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (435, 109, '测试数据使用独立的测试库。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (436, 109, '自动回滚单元测试产生的脏数据。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (437, 109, '无须区别，统一在业务代码中进行判断和识别。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (438, 110, '单行字符数限制不超过140个，超出需求换行', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (439, 110, 'IDE的text file encoding设置为GBK; IDE中文件的换行符使用Unix格式， 不要使用windows格式。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (440, 110, '大括号与if,else,for,do,while语句一起使用，即使只有一条语句（或是空）， 也应该把人括号与上。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (441, 110, '大括号的使用约定。如果是大括号内为空，则简洁地写成｛｝即可，不需要换行；', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (442, 111, 'String类型的默认值设定为空字符审。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (443, 111, 'Date类型的默认值设定为new Date()o', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (444, 111, '集合类型的默认值设定为Collections.EMPTY_LIST0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (445, 111, '不要设定任何属性默认值。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (446, 112, 'Qjbect的equals方法容易抛空指针，使用常量或确定有值的对象来调用 equals方法', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (447, 112, '所有的相同类型的包装类对象之间值的比较，全部使用equals方法比较。// 原问题是指所有整型包装类', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (448, 112, 'DO/V。等领域模型类不需要農写Qjbect#toString()方法，没啥用处。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (449, 112, '慎用Ojbect#clone()方法来拷贝对象。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (450, 113, 'Integer a = 3 ; Integer b = 3;那么条件表达式(a == b)返回的结果是true.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (451, 113, 'Integer a = 3 ;lnteger b = 3;那么条件表达式(a == b )返回的结果是false.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (452, 113, 'Integer a = 273;lnteger b = 273;那么条件表达式(a == b)返回的结果是 trueo', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (453, 113, 'Integer a = 273;lnteger b = 273;那么条件表达式(a == b)返回的结果是 false。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (454, 114, '构造方法里面禁止加入任何业务逻辑.如果有初始化逻辑，请放在init方法中。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (455, 114, '当一个类有多个构造方法，应该按顺序放置在一起，便于阅读。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (456, 114, '如果不允许外部直接通过new来创建对象，那么构造方法必须是private.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (457, 114, '构造方法中可以有业务实现代码，如果成员变量的简单运算、业务判断等。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (458, 115, 'HashSet', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (459, 115, 'LinkedList', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (460, 115, 'HashMap', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (461, 115, 'TreeMap', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (462, 116, ' Vector无法使用toArray转换成数组。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (463, 116, '优先推荐：调用集合类的方法toArray(T[] a),传入的是类型完全一样的数组， 大小就是集合的size。。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (464, 116, '集合的修改，会影响到数组元素的改变。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (465, 116, '数组的修改，会影响到集合元素的改变。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (466, 117, '线程池不允许使用Executors去创建，而是通过ThreadPoolExecutor的方式', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (467, 117, 'new FixedThreadPool和new SingleThreadPool的主要问题是堆积的请求处 理队列可能会耗菱非常大的内存，甚至00M。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (468, 117, 'new CachedThreadPool 和 new ScheduledThreadPool 的主要问题是线程数 量最大数是lnteger.MAX_VALUE,可能会创建数量非常多的线程，甚至00M。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (469, 117, '我们的机器运算速度够快，所以线程泡的创建并不需要特别的约定。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (470, 118, '每个线程退出前必须调用countDownO方法。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (471, 118, '线程执行代码注意catch异常，确保countDownO方法可以被执行。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (472, 118, '子线程抛出异常堆栈，直接就可以在主线程catch到。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (473, 118, '主线程必须在启动其他线程后调用await()方法，这样主线程的操作就会在这 个方法上阻塞，直到其他线程完成各自的任务。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (474, 119, 'type列显示了连接使用了何种类型，从最好到最差的连接类型为：const eq_ret, ret, range, index. ALL.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (475, 119, 'possible_ keys显示可能在这张表中的素引，如果为空，表示没有可能的素引.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (476, 119, 'key列表示实际使用的索引.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (477, 119, 're例显示素引的哪一列被使用了。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (478, 120, 'int日志尽可能多输出，方便开发人员排查问题。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (479, 120, '如果使用wan来记录刚上线时的业务行为信国一定要注意日志输出重的问题， 避免把服务最巴盘理明，并记得及时量除这些现事日志。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (480, 120, '生产环墙禁止输出debug曰e,', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (481, 120, 'error级别只记录系统逻辑出错，异常或物重要的损误信息。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (482, 121, '如果表中字段和DO中的字段名完全一致，可直接用DO作为resuRCIass,', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (483, 121, 'JBATIS 中目带了 queirFiLsl(SLing sldlemenlNdiiie inL sdilinl的分页接 口，可直接使用，无需再自行封装。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (484, 121, '不要定义大而全的数据更新接口，对整个DO进行更新。必须按需更新。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (485, 121, 'sqlmap中写update语句时，必须包含过象中gmt, moanted字段的更新。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (486, 122, '数量本的查询结可', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (487, 122, '重台只需要断sNolEmply ,谭出的数据元素不需要+.断是否为加u,', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (488, 122, '远程调用近回对像，一律要求进行NPE判断', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (489, 122, '对于sesion中缺取的数据，建义NFE章,迎免空物针，', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (490, 123, '不要使用count（列名盛eount（常量）来昔f代count\'）。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (491, 123, 'coun（列名）会统计值为NLL的行，而面cunt\'不会', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (492, 123, '当某一列的值全是NULL时）count（列名返回0.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (493, 123, '在程序代码中写分页查询逻辑时，若count为0应直接返回，以避免执行后面的 分页语句。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (494, 124, '方法的返回值可以为null ,如果是集台，必须返回空集白。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (495, 124, '方法的返回值可以为nul ,不强制近回空集白或者空对象等，', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (496, 124, '方法实现者必须添加注释,充分说明什么情只不会近回nul值。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (497, 124, '防止NPE是调用者的责任。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (498, 125, '索引的数据结构主要有B-Tree Hasm. R-Tree. Fll-Tex等。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (499, 125, '从物理存储来看,生要分为聚集(gdstered)和非絮集(non-clustered)m引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (500, 125, 'MySQL的表是聚重素引组织表(index of table).', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (501, 125, '聚族索引的叶子节点存放的是数据，非聚族索引的叶子节点存放的是非聚集素 引的key和主键值。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (502, 126, 'snapshol在本地响评时，都会到中央仓库下就最的方库，', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (503, 126, 'release在本地情浑时，如果已经存在相同的版本号。已使中央仓库有最新相网 板本的二方库也不会拉取。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (504, 126, '应用使用了 A的relase版本二方库，A依赖了 B的snapshoC方库，应用本地调 评时。并不会拉取B最新的snapshoC方库，', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (505, 126, '应用发布尽量使用release版本的二方库，此学是保证发布的写等性。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (506, 127, 'GroupID格式为：com（公司/子公司）业务线［子业务街］。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (507, 127, 'GroupID格式为：com｛公司子公司｝业务线.子业务线.子模块。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (508, 127, 'AtactIO格式为：产品线名_模块名或者产品线.模块名。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (509, 127, 'ArtactD格式为：产品线名-模块名，', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (510, 128, 'join的字E殳，数据类型须保持绝对一致', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (511, 128, 'join列必须有索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (512, 128, '优先where过滤。其次再join关联。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (513, 128, '只要满足业务需求和Join表的个数不受限制。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (514, 129, 'System ot(oox\'te getMessageO).', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (515, 129, 'System er(oor\'te getMessageO.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (516, 129, 'e pintackTace).', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (517, 129, 'logger er\'excetion happensproduect info. *productgstringl+ e getMessageO e)o', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (518, 130, 'SQL性能优化的目标：至少要达到range级别。要求是te吸别，如果可以是 arss最好，', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (519, 130, 'Index级别走的是扫插索引，所以速度会比re快。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (520, 130, 'range级别是指对表进行范围素引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (521, 130, 're吸别是指使用主键或者难素引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (522, 131, 'try块放到了事务代码中，catch异常后，如果需要回滚事务，必须要手动回《事务。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (523, 131, '在finaly块必须对文件流进行关团。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (524, 131, '不能在1 mnaly块使用return, fnaly块中的return返回后方法结来执行，不会 再执行n块中的return语句。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (525, 131, '循环体中避免不必要的try-catch操作。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (526, 132, '当需要获取数据表所有字E殳的值映射到DO时,可使用sei ecl \"来直询。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (527, 132, '绝对禁止左模糊和金模湖直间;限制使用右模湖查询。全模糊或左模糊搜素的需 求走搜索引厚实现', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (528, 132, '禁止使用存储过程来查询返回数据，“', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (529, 132, '在表查询中，需aidel插李时，优先使用主', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (530, 133, '单元则试应该是全自动执行的，并且非交互式的。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (531, 133, '单元测试必须在线上环墙能够全部被正确地编译。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (532, 133, '为了保证单元则试稳定可靠且便于维护。单元测试用例之间决不能互后调用。 也不能依赖执行的先后次序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (533, 133, '单元测试是可以重复执行的。，', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (534, 134, 'L0g41.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (535, 134, 'SUFEJ.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (536, 134, 'JCBVIakatea Commons Lggng).', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (537, 134, 'Logback,', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (538, 135, '字段为非负数，必须定义为onsigned.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (539, 135, '存储的字符数几乎完全相等的字段，推荐定义为char关型存储。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (540, 135, 'varchar会预先分配存储空间。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (541, 135, '不得使用级联与外键一切外键概念必须在应用层解决。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (542, 136, '查询条件where a=0, and b=\'1‘，当组合索引为(b a)的时候能进行索引扫插。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (543, 136, '查询条件where a=,0, and b=T ,当组台素引为(C ,A.b)的时候能进行素引扫 風', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (544, 136, '查询select b from table where a=,0；当电台素引为(a b)的时候会进行素引 扫插。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (545, 136, '查询条件where a> \'O\' order by b，当组合素引为(a. b)时会利用素引进行排 序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (546, 137, '那是测试同学干的事情。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (547, 137, '单元测试代码码是多余的。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (548, 137, '单元测试代码不需要维护。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (549, 137, '单元测试互线上故障没有辩证关系。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (550, 138, '数据库的查询结果可能为null', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (551, 138, '集合只需要判断isNotEmpty,对取出的数据元素不需要判断是否为nulL', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (552, 138, '远程调用返回对象，一律要求进行NPE判断', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (553, 138, '对于Session中获取的数据，建议NPE检查，避免空指针。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (554, 139, '推荐用try-catch来做流程控制、条件控制。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (555, 139, '捕获异常与抛异常，必须是完全匹配，或者捕获异常是抛异常的父类。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (556, 139, '对大段代码进行try-catch,利用Throwable来捕捉，万无一失。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (557, 139, '对大段代码进行try-catch,这是不负责任的表现，分清稳定代码和非稳定代 码，对非稳定的代码做对应的异常处理。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (558, 140, 'Log4ja', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (559, 140, 'SLF4J.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (560, 140, 'JCL(Jakarta Commons Logging)。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (561, 140, 'Logback0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (562, 141, 'System.out(\"xxx\"+e.getMessage())»', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (563, 141, 'System.err(\'xxx\'+e.getMessage())o', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (564, 141, 'e.printStackTrace()o', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (565, 141, 'Iogger,error(\"exception happens productinfo:\' + product.toString()+,,_\'+e.getMessage())0', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (566, 142, '查询条件where a=,0, and b=T ,当组合索引为(b,a)的时候能进行索引扫 風', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (567, 142, '查询条件where a=\'0, and b=T ,当组合索引为(c,A.b)的时候进行索引扫插。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (568, 142, '查询select b from table where a=\'O\',当组合索引为(A.b)的时候会进行索引 扫插。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (569, 142, '直询条件 where d > \'Q\' uidei by b.当组合家引为(d,b)时会利用索引进行排 序。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (570, 143, '查询语句 where a between 5 and 10可以使用该索引', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (571, 143, '查询语句where a = 5 and b between 5 and 10可以使用该索引.', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (572, 143, '查询语句where a in(5,6,7,8,9)and b=5可以使用该索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (573, 143, '查询语句where b = 5 and c = 10可以使用该索引。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (574, 144, '如果表中字段和DO中的字段名完全一致，可直接用DO作为resultclass。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (575, 144, 'iBATIS 中自帝了 queryForList（String statementNameJnt start,int size）的分 页接口，可直接使用，无需再自行封闭。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (576, 144, '不要定义大而全的数据更新接口，对整个DO进行更新。必须按需更新。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (577, 144, 'sqlmap中写update语句时，必须包含对记录中gmt modified字段的更新。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (578, 145, 'snapshot在本地编译时，都会到中央库下载最新的二方库', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (579, 145, 'release在本地编译时，如果已经存在相同的版本号，即使中央仓库有最新相同 版本的二方库也不会拉取', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (580, 145, '应用使用了 A的release版本的二方庠，A依赖了 B的snapshot ~方障,应用本地编译时，并不会拉取B最新的snapshot的jar', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (581, 145, '应用发布尽量使用release版本的二方库，此举是为了保证发布的冥等性', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (582, 146, 'GroupID格式为：com.｛公司/子公司｝.业务线｛子业务线｝。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (583, 146, 'GroupID格式为：com.｛公司/子公司［.业务线.子业务线.子模块。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (584, 146, 'ArtifactID格式为：产品线名_模块名或者产品线.模块名。', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (585, 146, 'ArtifactID格式为：产品线名-模块名，', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (590, 162, '原子性（Atomicity） 一致性（Consistency） 非隔离性（Isolation）持久性（Durability）', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (591, 162, '原子性（Atomicity） 一致性（Consistency） 隔离性（Isolation）特殊性（Durability）', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (592, 162, '真子性（Atomicity） 一致性（Consistency） 隔离性（Isolation）持久性（Durability）', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (593, 162, '原子性（Atomicity） 一致性（Consistency） 隔离性（Isolation）持久性（Durability）', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (594, 163, '新建状态(New)： ', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (595, 163, '就绪状态(Runnable)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (596, 163, '运行状态(Running)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (597, 163, '阻塞状态(Blocked)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (598, 163, ' 等待状态(Dead)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (599, 111, NULL, NULL, '2022-03-30 20:13:05', NULL, NULL);
INSERT INTO `exam_option` VALUES (608, 187, '提交读(Read Committed)：', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (609, 187, '可重复读(Repeated Read)：', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (610, 187, '未提交读(Read Uncommitted)', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (611, 187, '串行读(Serializable)：', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (612, 11, NULL, NULL, '2022-05-25 10:12:40', NULL, NULL);
INSERT INTO `exam_option` VALUES (617, 191, '男', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (618, 191, '女', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (619, 191, '中性', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (620, 193, '', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (621, 193, '', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (622, 193, '', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (623, 193, '', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (628, 196, '', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (629, 196, '', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (630, 196, '', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (631, 197, '五颜六色', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (632, 198, '1', NULL, NULL, NULL, NULL);
INSERT INTO `exam_option` VALUES (633, 198, '2', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper`;
CREATE TABLE `exam_paper`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '试卷名称',
  `duration` int NULL DEFAULT NULL COMMENT '考试时长',
  `total_point` int NULL DEFAULT NULL COMMENT '试卷总分',
  `question_bank_ids` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题库ids',
  `question_count` int NULL DEFAULT NULL COMMENT '题目数量',
  `is_issue` tinyint(1) NULL DEFAULT NULL COMMENT '是否发布',
  `label_ids` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标签ids',
  `passing_score` int NULL DEFAULT NULL COMMENT '及格线',
  `good_score` int NULL DEFAULT NULL COMMENT '优秀线',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `select_score` int NULL DEFAULT NULL COMMENT '单选题分值',
  `selects_score` int NULL DEFAULT NULL COMMENT '多选题分值',
  `judge_score` int NULL DEFAULT NULL COMMENT '判断题分值',
  `answer_score` int NULL DEFAULT NULL COMMENT '问答题分值',
  `create_user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试卷' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_paper
-- ----------------------------
INSERT INTO `exam_paper` VALUES (29, '111', 30, 2, NULL, 2, 1, NULL, 1, 1, '2022-08-29 22:50:20', '1', NULL, NULL, 1, 1, 0, 0, NULL);

-- ----------------------------
-- Table structure for exam_paper_detail
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_detail`;
CREATE TABLE `exam_paper_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` int NOT NULL COMMENT '试卷的id',
  `bank_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题库的id',
  `label_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标签,字符串切割',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `select_count` int NULL DEFAULT NULL COMMENT '单选题数量',
  `selects_count` int NULL DEFAULT NULL COMMENT '多选题数量',
  `judge_count` int NULL DEFAULT NULL COMMENT '判断题数量',
  `answer_count` int NULL DEFAULT NULL COMMENT '问答题数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试卷生成规则表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_paper_detail
-- ----------------------------
INSERT INTO `exam_paper_detail` VALUES (1, 1, '2', '1', '2022-01-14 09:45:26', '1', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (2, 2, '2', '1', '2022-01-14 09:47:45', '1', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (13, 13, '', '4', '2022-02-18 00:15:48', '1', NULL, NULL, 0, 0, 0, 1);
INSERT INTO `exam_paper_detail` VALUES (16, 16, '', '4', '2022-02-21 22:39:54', '1', NULL, NULL, 0, 0, 0, 2);
INSERT INTO `exam_paper_detail` VALUES (22, 22, '1', '6', '2022-02-21 23:13:20', '1', NULL, NULL, 10, 20, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (23, 23, '1', '6', '2022-02-21 23:19:45', '1', NULL, NULL, 5, 3, 0, 2);
INSERT INTO `exam_paper_detail` VALUES (24, 24, '10', '4', '2022-03-03 22:51:23', '1', NULL, NULL, 1, 1, 0, 12);
INSERT INTO `exam_paper_detail` VALUES (25, 25, '10', '4', '2022-03-03 22:52:08', '1', NULL, NULL, 1, 1, 0, 12);
INSERT INTO `exam_paper_detail` VALUES (26, 26, '', '', '2022-04-14 11:26:31', '1', NULL, NULL, 10, 10, 3, 1);
INSERT INTO `exam_paper_detail` VALUES (27, 27, '10', '4', '2022-05-22 18:37:06', '1', NULL, NULL, 1, 1, 0, 24);
INSERT INTO `exam_paper_detail` VALUES (28, 28, '10', '4', '2022-08-29 22:49:17', '1', NULL, NULL, 2, 1, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (29, 29, '10', '4', '2022-08-29 22:50:20', '1', NULL, NULL, 1, 1, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (30, 30, '', '4', '2022-09-03 15:37:52', '1', NULL, NULL, 2, 1, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (31, 31, '21', '', '2022-09-03 16:18:03', 'test', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (32, 32, '21', '', '2022-09-03 16:20:47', 'test', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (33, 33, '21', '', '2022-09-03 16:30:01', 'test', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (34, 34, '21', '', '2022-09-03 16:56:26', 'test', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (35, 35, '', '4', '2022-09-03 17:28:51', 'test', NULL, NULL, 2, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (36, 36, '', '4', '2022-09-03 17:30:29', 'test', NULL, NULL, 2, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (37, 37, '', '4', '2022-09-03 18:03:32', 'test', NULL, NULL, 2, 0, 0, 0);
INSERT INTO `exam_paper_detail` VALUES (38, 38, '', '6', '2022-09-03 18:03:59', 'test', NULL, NULL, 10, 0, 0, 0);

-- ----------------------------
-- Table structure for exam_paper_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_questions`;
CREATE TABLE `exam_paper_questions`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `examination_paper_id` int NOT NULL COMMENT '试卷id',
  `examination_questions_id` int NOT NULL COMMENT '试题id',
  `examination_questions_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题目类型',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `score` int NULL DEFAULT NULL COMMENT '题目分值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_4`(`examination_paper_id`) USING BTREE,
  INDEX `FK_Reference_5`(`examination_questions_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试卷与试题关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_paper_questions
-- ----------------------------
INSERT INTO `exam_paper_questions` VALUES (1, 1, 150, 'select', NULL, '2022-01-14 09:45:26', NULL, NULL, 60);
INSERT INTO `exam_paper_questions` VALUES (2, 2, 150, 'select', NULL, '2022-01-14 09:47:45', NULL, NULL, 100);
INSERT INTO `exam_paper_questions` VALUES (8, 13, 152, 'answer', NULL, '2022-02-18 00:15:48', NULL, NULL, NULL);
INSERT INTO `exam_paper_questions` VALUES (9, 16, 149, 'answer', NULL, '2022-02-21 22:39:54', NULL, NULL, 5);
INSERT INTO `exam_paper_questions` VALUES (10, 16, 152, 'answer', NULL, '2022-02-21 22:39:54', NULL, NULL, 5);
INSERT INTO `exam_paper_questions` VALUES (11, 22, 3, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (12, 22, 4, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (13, 22, 5, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (14, 22, 8, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (15, 22, 10, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (16, 22, 11, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (17, 22, 21, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (18, 22, 26, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (19, 22, 27, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (20, 22, 31, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (21, 22, 37, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (22, 22, 38, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (23, 22, 44, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (24, 22, 52, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (25, 22, 57, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (26, 22, 58, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (27, 22, 65, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (28, 22, 70, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (29, 22, 82, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (30, 22, 101, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (31, 22, 103, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (32, 22, 111, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (33, 22, 112, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (34, 22, 115, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (35, 22, 117, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (36, 22, 122, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (37, 22, 123, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (38, 22, 126, 'selects', NULL, '2022-02-21 23:13:21', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (39, 22, 130, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (40, 22, 141, 'select', NULL, '2022-02-21 23:13:21', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (41, 23, 18, 'selects', NULL, '2022-02-21 23:19:45', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (42, 23, 29, 'select', NULL, '2022-02-21 23:19:45', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (43, 23, 44, 'select', NULL, '2022-02-21 23:19:45', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (44, 23, 53, 'selects', NULL, '2022-02-21 23:19:45', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (45, 23, 58, 'select', NULL, '2022-02-21 23:19:45', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (46, 23, 76, 'select', NULL, '2022-02-21 23:19:45', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (47, 23, 93, 'selects', NULL, '2022-02-21 23:19:45', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (48, 23, 115, 'select', NULL, '2022-02-21 23:19:45', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (49, 23, 149, 'answer', NULL, '2022-02-21 23:19:45', NULL, NULL, 5);
INSERT INTO `exam_paper_questions` VALUES (50, 23, 152, 'answer', NULL, '2022-02-21 23:19:45', NULL, NULL, 5);
INSERT INTO `exam_paper_questions` VALUES (51, 24, 153, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (52, 24, 154, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (53, 24, 155, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (54, 24, 157, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (55, 24, 158, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (56, 24, 159, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (57, 24, 160, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (58, 24, 161, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (59, 24, 162, 'select', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (60, 24, 163, 'selects', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (61, 24, 164, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (62, 24, 165, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (63, 24, 167, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (64, 24, 168, 'answer', NULL, '2022-03-03 22:51:23', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (65, 25, 153, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (66, 25, 154, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (67, 25, 155, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (68, 25, 157, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (69, 25, 158, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (70, 25, 159, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (71, 25, 160, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (72, 25, 161, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (73, 25, 162, 'select', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (74, 25, 163, 'selects', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (75, 25, 164, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (76, 25, 165, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (77, 25, 167, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (78, 25, 168, 'answer', NULL, '2022-03-03 22:52:08', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (79, 26, 10, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (80, 26, 23, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (81, 26, 29, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (82, 26, 40, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (83, 26, 43, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (84, 26, 52, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (85, 26, 54, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (86, 26, 58, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (87, 26, 63, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (88, 26, 65, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (89, 26, 72, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (90, 26, 76, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (91, 26, 82, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (92, 26, 85, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (93, 26, 91, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (94, 26, 112, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (95, 26, 115, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (96, 26, 116, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (97, 26, 119, 'selects', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (98, 26, 157, 'answer', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (99, 26, 162, 'select', NULL, '2022-04-14 11:26:31', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (100, 27, 153, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (101, 27, 154, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (102, 27, 155, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (103, 27, 157, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (104, 27, 158, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (105, 27, 159, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (106, 27, 160, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (107, 27, 161, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (108, 27, 162, 'select', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (109, 27, 163, 'selects', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (110, 27, 164, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (111, 27, 165, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (112, 27, 167, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (113, 27, 168, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (114, 27, 169, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (115, 27, 170, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (116, 27, 171, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (117, 27, 178, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (118, 27, 179, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (119, 27, 180, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (120, 27, 181, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (121, 27, 182, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (122, 27, 183, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (123, 27, 184, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (124, 27, 185, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (125, 27, 186, 'answer', NULL, '2022-05-22 18:37:06', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (126, 28, 162, 'select', NULL, '2022-08-29 22:49:17', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (127, 28, 163, 'selects', NULL, '2022-08-29 22:49:17', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (128, 28, 187, 'select', NULL, '2022-08-29 22:49:17', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (129, 29, 163, 'selects', NULL, '2022-08-29 22:50:20', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (130, 29, 187, 'select', NULL, '2022-08-29 22:50:20', NULL, NULL, 1);
INSERT INTO `exam_paper_questions` VALUES (131, 30, 162, 'select', NULL, '2022-09-03 15:37:52', NULL, NULL, 20);
INSERT INTO `exam_paper_questions` VALUES (132, 30, 163, 'selects', NULL, '2022-09-03 15:37:52', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (133, 30, 187, 'select', NULL, '2022-09-03 15:37:52', NULL, NULL, 20);
INSERT INTO `exam_paper_questions` VALUES (134, 31, 198, 'select', NULL, '2022-09-03 16:18:03', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (135, 32, 198, 'select', NULL, '2022-09-03 16:20:48', NULL, NULL, 0);
INSERT INTO `exam_paper_questions` VALUES (136, 33, 198, 'select', NULL, '2022-09-03 16:30:01', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (137, 34, 198, 'select', NULL, '2022-09-03 16:56:26', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (138, 35, 162, 'select', NULL, '2022-09-03 17:28:51', NULL, NULL, 23);
INSERT INTO `exam_paper_questions` VALUES (139, 35, 187, 'select', NULL, '2022-09-03 17:28:51', NULL, NULL, 23);
INSERT INTO `exam_paper_questions` VALUES (140, 36, 162, 'select', NULL, '2022-09-03 17:30:29', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (141, 36, 187, 'select', NULL, '2022-09-03 17:30:29', NULL, NULL, 10);
INSERT INTO `exam_paper_questions` VALUES (142, 37, 162, 'select', NULL, '2022-09-03 18:03:32', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (143, 37, 187, 'select', NULL, '2022-09-03 18:03:32', NULL, NULL, 2);
INSERT INTO `exam_paper_questions` VALUES (144, 38, 8, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (145, 38, 27, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (146, 38, 29, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (147, 38, 44, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (148, 38, 76, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (149, 38, 92, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (150, 38, 102, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (151, 38, 116, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (152, 38, 129, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);
INSERT INTO `exam_paper_questions` VALUES (153, 38, 198, 'select', NULL, '2022-09-03 18:03:59', NULL, NULL, 3);

-- ----------------------------
-- Table structure for exam_paper_questions_option
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_questions_option`;
CREATE TABLE `exam_paper_questions_option`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `option_id` int NOT NULL COMMENT '试题选项id',
  `serial_number` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '试题序号ABCD',
  `examination_paper_questions_id` int NOT NULL COMMENT '考试试题的id',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`examination_paper_questions_id`) USING BTREE,
  INDEX `FK_Reference_2`(`option_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 292 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试卷的试题的选项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_paper_questions_option
-- ----------------------------
INSERT INTO `exam_paper_questions_option` VALUES (1, 588, 'A', 1, '1', '2022-01-14 09:45:27', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (2, 587, 'B', 1, '1', '2022-01-14 09:45:27', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (3, 586, 'C', 1, '1', '2022-01-14 09:45:27', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (4, 589, 'D', 1, '1', '2022-01-14 09:45:27', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (5, 587, 'A', 2, '1', '2022-01-14 09:47:45', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (6, 589, 'B', 2, '1', '2022-01-14 09:47:45', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (7, 588, 'C', 2, '1', '2022-01-14 09:47:45', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (8, 586, 'D', 2, '1', '2022-01-14 09:47:45', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (9, 10, 'A', 11, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (10, 9, 'B', 11, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (11, 32, 'A', 14, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (12, 31, 'B', 14, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (13, 39, 'A', 15, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (14, 40, 'B', 15, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (15, 38, 'C', 15, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (16, 37, 'D', 15, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (17, 41, 'A', 16, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (18, 43, 'B', 16, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (19, 42, 'C', 16, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (20, 44, 'D', 16, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (21, 84, 'A', 17, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (22, 82, 'B', 17, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (23, 83, 'C', 17, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (24, 81, 'D', 17, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (25, 103, 'A', 18, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (26, 101, 'B', 18, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (27, 102, 'C', 18, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (28, 104, 'D', 18, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (29, 105, 'A', 19, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (30, 107, 'B', 19, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (31, 106, 'C', 19, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (32, 108, 'D', 19, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (33, 124, 'A', 20, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (34, 121, 'B', 20, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (35, 123, 'C', 20, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (36, 122, 'D', 20, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (37, 145, 'A', 21, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (38, 146, 'B', 21, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (39, 147, 'C', 21, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (40, 148, 'D', 21, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (41, 149, 'A', 22, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (42, 150, 'B', 22, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (43, 152, 'C', 22, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (44, 151, 'D', 22, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (45, 176, 'A', 23, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (46, 173, 'B', 23, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (47, 175, 'C', 23, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (48, 174, 'D', 23, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (49, 206, 'A', 24, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (50, 208, 'B', 24, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (51, 205, 'C', 24, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (52, 207, 'D', 24, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (53, 226, 'A', 25, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (54, 228, 'B', 25, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (55, 227, 'C', 25, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (56, 229, 'D', 25, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (57, 231, 'A', 26, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (58, 232, 'B', 26, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (59, 233, 'C', 26, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (60, 230, 'D', 26, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (61, 261, 'A', 27, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (62, 258, 'B', 27, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (63, 260, 'C', 27, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (64, 259, 'D', 27, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (65, 280, 'A', 28, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (66, 279, 'B', 28, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (67, 278, 'C', 28, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (68, 281, 'D', 28, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (69, 326, 'A', 29, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (70, 327, 'B', 29, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (71, 329, 'C', 29, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (72, 328, 'D', 29, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (73, 403, 'A', 30, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (74, 405, 'B', 30, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (75, 404, 'C', 30, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (76, 402, 'D', 30, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (77, 413, 'A', 31, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (78, 412, 'B', 31, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (79, 411, 'C', 31, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (80, 410, 'D', 31, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (81, 443, 'A', 32, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (82, 442, 'B', 32, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (83, 444, 'C', 32, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (84, 445, 'D', 32, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (85, 449, 'A', 33, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (86, 448, 'B', 33, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (87, 447, 'C', 33, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (88, 446, 'D', 33, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (89, 459, 'A', 34, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (90, 460, 'B', 34, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (91, 458, 'C', 34, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (92, 461, 'D', 34, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (93, 469, 'A', 35, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (94, 466, 'B', 35, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (95, 468, 'C', 35, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (96, 467, 'D', 35, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (97, 487, 'A', 36, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (98, 486, 'B', 36, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (99, 488, 'C', 36, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (100, 489, 'D', 36, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (101, 491, 'A', 37, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (102, 492, 'B', 37, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (103, 490, 'C', 37, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (104, 493, 'D', 37, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (105, 504, 'A', 38, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (106, 505, 'B', 38, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (107, 502, 'C', 38, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (108, 503, 'D', 38, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (109, 519, 'A', 39, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (110, 518, 'B', 39, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (111, 520, 'C', 39, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (112, 521, 'D', 39, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (113, 563, 'A', 40, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (114, 565, 'B', 40, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (115, 564, 'C', 40, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (116, 562, 'D', 40, '1', '2022-02-21 23:13:21', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (117, 70, 'A', 41, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (118, 71, 'B', 41, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (119, 72, 'C', 41, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (120, 69, 'D', 41, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (121, 113, 'A', 42, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (122, 114, 'B', 42, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (123, 115, 'C', 42, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (124, 116, 'D', 42, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (125, 173, 'A', 43, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (126, 174, 'B', 43, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (127, 175, 'C', 43, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (128, 176, 'D', 43, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (129, 210, 'A', 44, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (130, 211, 'B', 44, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (131, 212, 'C', 44, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (132, 209, 'D', 44, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (133, 231, 'A', 45, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (134, 232, 'B', 45, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (135, 233, 'C', 45, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (136, 230, 'D', 45, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (137, 305, 'A', 46, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (138, 302, 'B', 46, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (139, 303, 'C', 46, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (140, 304, 'D', 46, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (141, 371, 'A', 47, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (142, 373, 'B', 47, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (143, 370, 'C', 47, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (144, 372, 'D', 47, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (145, 460, 'A', 48, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (146, 458, 'B', 48, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (147, 459, 'C', 48, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (148, 461, 'D', 48, '1', '2022-02-21 23:19:46', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (149, 591, 'A', 59, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (150, 593, 'B', 59, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (151, 590, 'C', 59, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (152, 592, 'D', 59, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (153, 596, 'A', 60, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (154, 598, 'B', 60, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (155, 594, 'C', 60, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (156, 597, 'D', 60, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (157, 595, 'E', 60, '1', '2022-03-03 22:51:23', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (158, 592, 'A', 73, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (159, 590, 'B', 73, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (160, 593, 'C', 73, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (161, 591, 'D', 73, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (162, 594, 'A', 74, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (163, 597, 'B', 74, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (164, 598, 'C', 74, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (165, 595, 'D', 74, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (166, 596, 'E', 74, '1', '2022-03-03 22:52:08', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (167, 38, 'A', 79, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (168, 40, 'B', 79, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (169, 39, 'C', 79, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (170, 37, 'D', 79, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (171, 89, 'A', 80, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (172, 92, 'B', 80, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (173, 91, 'C', 80, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (174, 90, 'D', 80, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (175, 114, 'A', 81, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (176, 113, 'B', 81, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (177, 116, 'C', 81, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (178, 115, 'D', 81, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (179, 157, 'A', 82, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (180, 160, 'B', 82, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (181, 159, 'C', 82, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (182, 158, 'D', 82, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (183, 169, 'A', 83, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (184, 171, 'B', 83, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (185, 170, 'C', 83, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (186, 172, 'D', 83, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (187, 205, 'A', 84, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (188, 206, 'B', 84, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (189, 208, 'C', 84, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (190, 207, 'D', 84, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (191, 216, 'A', 85, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (192, 213, 'B', 85, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (193, 217, 'C', 85, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (194, 214, 'D', 85, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (195, 215, 'E', 85, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (196, 230, 'A', 86, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (197, 232, 'B', 86, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (198, 233, 'C', 86, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (199, 231, 'D', 86, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (200, 253, 'A', 87, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (201, 252, 'B', 87, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (202, 250, 'C', 87, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (203, 251, 'D', 87, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (204, 260, 'A', 88, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (205, 259, 'B', 88, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (206, 258, 'C', 88, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (207, 261, 'D', 88, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (208, 289, 'A', 89, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (209, 288, 'B', 89, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (210, 287, 'C', 89, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (211, 286, 'D', 89, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (212, 305, 'A', 90, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (213, 304, 'B', 90, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (214, 302, 'C', 90, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (215, 303, 'D', 90, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (216, 327, 'A', 91, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (217, 328, 'B', 91, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (218, 329, 'C', 91, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (219, 326, 'D', 91, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (220, 338, 'A', 92, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (221, 339, 'B', 92, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (222, 340, 'C', 92, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (223, 341, 'D', 92, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (224, 365, 'A', 93, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (225, 364, 'B', 93, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (226, 363, 'C', 93, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (227, 362, 'D', 93, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (228, 449, 'A', 94, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (229, 447, 'B', 94, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (230, 446, 'C', 94, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (231, 448, 'D', 94, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (232, 460, 'A', 95, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (233, 459, 'B', 95, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (234, 458, 'C', 95, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (235, 461, 'D', 95, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (236, 463, 'A', 96, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (237, 464, 'B', 96, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (238, 465, 'C', 96, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (239, 462, 'D', 96, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (240, 475, 'A', 97, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (241, 474, 'B', 97, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (242, 476, 'C', 97, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (243, 477, 'D', 97, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (244, 591, 'A', 99, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (245, 590, 'B', 99, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (246, 592, 'C', 99, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (247, 593, 'D', 99, '1', '2022-04-14 11:26:31', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (248, 590, 'A', 108, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (249, 592, 'B', 108, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (250, 591, 'C', 108, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (251, 593, 'D', 108, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (252, 595, 'A', 109, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (253, 594, 'B', 109, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (254, 598, 'C', 109, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (255, 596, 'D', 109, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (256, 597, 'E', 109, '1', '2022-05-22 18:37:06', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (257, 592, 'A', 126, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (258, 593, 'B', 126, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (259, 591, 'C', 126, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (260, 590, 'D', 126, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (261, 594, 'A', 127, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (262, 598, 'B', 127, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (263, 596, 'C', 127, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (264, 595, 'D', 127, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (265, 597, 'E', 127, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (266, 609, 'A', 128, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (267, 610, 'B', 128, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (268, 611, 'C', 128, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (269, 608, 'D', 128, '1', '2022-08-29 22:49:17', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (270, 596, 'A', 129, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (271, 598, 'B', 129, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (272, 595, 'C', 129, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (273, 597, 'D', 129, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (274, 594, 'E', 129, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (275, 608, 'A', 130, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (276, 609, 'B', 130, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (277, 610, 'C', 130, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (278, 611, 'D', 130, '1', '2022-08-29 22:50:20', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (279, 591, 'A', 131, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (280, 590, 'B', 131, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (281, 592, 'C', 131, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (282, 593, 'D', 131, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (283, 595, 'A', 132, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (284, 594, 'B', 132, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (285, 597, 'C', 132, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (286, 596, 'D', 132, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (287, 598, 'E', 132, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (288, 610, 'A', 133, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (289, 609, 'B', 133, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (290, 608, 'C', 133, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (291, 611, 'D', 133, '1', '2022-09-03 15:37:52', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (292, 633, 'A', 134, 'test', '2022-09-03 16:18:03', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (293, 632, 'B', 134, 'test', '2022-09-03 16:18:03', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (294, 633, 'A', 135, 'test', '2022-09-03 16:20:48', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (295, 632, 'B', 135, 'test', '2022-09-03 16:20:48', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (296, 633, 'A', 136, 'test', '2022-09-03 16:30:02', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (297, 632, 'B', 136, 'test', '2022-09-03 16:30:02', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (298, 632, 'A', 137, 'test', '2022-09-03 16:56:27', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (299, 633, 'B', 137, 'test', '2022-09-03 16:56:27', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (300, 592, 'A', 138, 'test', '2022-09-03 17:28:51', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (301, 591, 'B', 138, 'test', '2022-09-03 17:28:51', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (302, 590, 'C', 138, 'test', '2022-09-03 17:28:51', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (303, 593, 'D', 138, 'test', '2022-09-03 17:28:51', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (304, 610, 'A', 139, 'test', '2022-09-03 17:28:51', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (305, 608, 'B', 139, 'test', '2022-09-03 17:28:51', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (306, 611, 'C', 139, 'test', '2022-09-03 17:28:51', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (307, 609, 'D', 139, 'test', '2022-09-03 17:28:51', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (308, 593, 'A', 140, 'test', '2022-09-03 17:30:29', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (309, 592, 'B', 140, 'test', '2022-09-03 17:30:29', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (310, 591, 'C', 140, 'test', '2022-09-03 17:30:29', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (311, 590, 'D', 140, 'test', '2022-09-03 17:30:29', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (312, 609, 'A', 141, 'test', '2022-09-03 17:30:29', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (313, 610, 'B', 141, 'test', '2022-09-03 17:30:29', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (314, 608, 'C', 141, 'test', '2022-09-03 17:30:29', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (315, 611, 'D', 141, 'test', '2022-09-03 17:30:29', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (316, 590, 'A', 142, 'test', '2022-09-03 18:03:32', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (317, 593, 'B', 142, 'test', '2022-09-03 18:03:32', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (318, 591, 'C', 142, 'test', '2022-09-03 18:03:32', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (319, 592, 'D', 142, 'test', '2022-09-03 18:03:32', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (320, 608, 'A', 143, 'test', '2022-09-03 18:03:32', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (321, 611, 'B', 143, 'test', '2022-09-03 18:03:32', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (322, 610, 'C', 143, 'test', '2022-09-03 18:03:32', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (323, 609, 'D', 143, 'test', '2022-09-03 18:03:32', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (324, 31, 'A', 144, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (325, 32, 'B', 144, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (326, 106, 'A', 145, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (327, 107, 'B', 145, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (328, 108, 'C', 145, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (329, 105, 'D', 145, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (330, 115, 'A', 146, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (331, 114, 'B', 146, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (332, 113, 'C', 146, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (333, 116, 'D', 146, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (334, 174, 'A', 147, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (335, 176, 'B', 147, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (336, 175, 'C', 147, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (337, 173, 'D', 147, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (338, 303, 'A', 148, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (339, 305, 'B', 148, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (340, 302, 'C', 148, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (341, 304, 'D', 148, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (342, 369, 'A', 149, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (343, 368, 'B', 149, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (344, 366, 'C', 149, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (345, 367, 'D', 149, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (346, 408, 'A', 150, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (347, 407, 'B', 150, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (348, 409, 'C', 150, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (349, 406, 'D', 150, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (350, 465, 'A', 151, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (351, 464, 'B', 151, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (352, 462, 'C', 151, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (353, 463, 'D', 151, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (354, 517, 'A', 152, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (355, 514, 'B', 152, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (356, 515, 'C', 152, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (357, 516, 'D', 152, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (358, 632, 'A', 153, 'test', '2022-09-03 18:03:59', NULL, NULL);
INSERT INTO `exam_paper_questions_option` VALUES (359, 633, 'B', 153, 'test', '2022-09-03 18:03:59', NULL, NULL);

-- ----------------------------
-- Table structure for exam_question_bank
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_bank`;
CREATE TABLE `exam_question_bank`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题库名字',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '题库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_question_bank
-- ----------------------------
INSERT INTO `exam_question_bank` VALUES (1, '题库1', 'test', NULL, 'admin', '2022-07-25 14:59:37');
INSERT INTO `exam_question_bank` VALUES (10, '面试', 'admin', '2022-02-23 22:44:31', NULL, NULL);
INSERT INTO `exam_question_bank` VALUES (19, '测试题库', 'admin', '2022-06-01 11:00:36', NULL, NULL);
INSERT INTO `exam_question_bank` VALUES (21, '测试安全考题1', 'test', '2022-06-12 16:06:41', NULL, NULL);

-- ----------------------------
-- Table structure for exam_question_bank_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_bank_questions`;
CREATE TABLE `exam_question_bank_questions`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `question_bank_id` int NOT NULL COMMENT '题库id',
  `examination_question_id` int NOT NULL COMMENT '试题id',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_6`(`examination_question_id`) USING BTREE,
  INDEX `FK_Reference_7`(`question_bank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '题库与试题关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_question_bank_questions
-- ----------------------------
INSERT INTO `exam_question_bank_questions` VALUES (1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (2, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (3, 1, 3, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (4, 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (5, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (6, 1, 6, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (7, 1, 7, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (8, 1, 8, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (9, 1, 9, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (10, 1, 10, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (11, 1, 11, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (12, 1, 12, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (13, 1, 13, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (14, 1, 14, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (15, 1, 15, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (16, 1, 16, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (17, 1, 17, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (18, 1, 18, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (19, 1, 19, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (20, 1, 20, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (21, 1, 21, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (22, 1, 22, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (23, 1, 23, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (24, 1, 24, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (25, 1, 25, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (26, 1, 26, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (27, 1, 27, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (28, 1, 28, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (29, 1, 29, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (30, 1, 30, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (31, 1, 31, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (32, 1, 32, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (33, 1, 33, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (34, 1, 34, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (35, 1, 35, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (36, 1, 36, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (37, 1, 37, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (38, 1, 38, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (39, 1, 39, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (40, 1, 40, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (41, 1, 41, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (42, 1, 42, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (43, 1, 43, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (44, 1, 44, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (45, 1, 45, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (46, 1, 46, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (47, 1, 47, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (48, 1, 48, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (49, 1, 49, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (50, 1, 50, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (51, 1, 51, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (52, 1, 52, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (53, 1, 53, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (54, 1, 54, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (55, 1, 55, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (56, 1, 56, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (57, 1, 57, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (58, 1, 58, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (59, 1, 59, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (60, 1, 60, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (61, 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (62, 1, 62, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (63, 1, 63, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (64, 1, 64, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (65, 1, 65, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (66, 1, 66, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (67, 1, 67, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (68, 1, 68, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (69, 1, 69, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (70, 1, 70, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (71, 1, 71, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (72, 1, 72, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (73, 1, 73, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (74, 1, 74, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (75, 1, 75, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (76, 1, 76, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (77, 1, 77, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (78, 1, 78, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (79, 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (80, 1, 80, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (81, 1, 81, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (82, 1, 82, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (83, 1, 83, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (84, 1, 84, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (85, 1, 85, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (86, 1, 86, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (87, 1, 87, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (88, 1, 88, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (89, 1, 89, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (90, 1, 90, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (91, 1, 91, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (92, 1, 92, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (93, 1, 93, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (94, 1, 94, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (95, 1, 95, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (96, 1, 96, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (97, 1, 97, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (98, 1, 98, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (99, 1, 99, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (100, 1, 100, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (101, 1, 101, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (102, 1, 102, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (103, 1, 103, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (104, 1, 104, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (105, 1, 105, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (106, 1, 106, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (107, 1, 107, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (108, 1, 108, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (109, 1, 109, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (110, 1, 110, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (111, 1, 111, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (112, 1, 112, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (113, 1, 113, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (114, 1, 114, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (115, 1, 115, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (116, 1, 116, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (117, 1, 117, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (118, 1, 118, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (119, 1, 119, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (120, 1, 120, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (121, 1, 121, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (122, 1, 122, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (123, 1, 123, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (124, 1, 124, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (125, 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (126, 1, 126, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (127, 1, 127, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (128, 1, 128, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (129, 1, 129, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (130, 1, 130, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (131, 1, 131, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (132, 1, 132, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (133, 1, 133, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (134, 1, 134, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (135, 1, 135, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (136, 1, 136, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (137, 1, 137, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (138, 1, 138, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (139, 1, 139, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (140, 1, 140, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (141, 1, 141, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (142, 1, 142, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (143, 1, 143, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (144, 1, 144, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (145, 1, 145, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (146, 1, 146, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (147, 8, 149, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (150, 8, 152, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (151, 1, 149, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (152, 1, 152, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (153, 10, 153, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (154, 10, 154, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (155, 10, 155, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (156, 10, 157, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (157, 10, 158, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (158, 10, 159, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (159, 10, 160, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (160, 10, 161, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (161, 10, 162, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (162, 10, 163, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (163, 10, 164, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (164, 10, 165, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (166, 10, 167, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (167, 10, 168, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (168, 10, 169, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (169, 10, 170, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (170, 10, 171, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (175, 10, 178, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (176, 10, 179, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (177, 10, 180, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (178, 10, 181, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (179, 10, 182, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (180, 10, 183, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (181, 10, 184, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (182, 10, 185, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (183, 10, 186, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (184, 10, 187, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (185, 10, 188, NULL, NULL, NULL, NULL);
INSERT INTO `exam_question_bank_questions` VALUES (191, 21, 198, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for exam_question_bank_role
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_bank_role`;
CREATE TABLE `exam_question_bank_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `question_bank_id` int NOT NULL COMMENT '题库id',
  `role_id` int NOT NULL COMMENT '角色id',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_8`(`question_bank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '题库与角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_question_bank_role
-- ----------------------------
INSERT INTO `exam_question_bank_role` VALUES (1, 19, 1, 'admin', '2022-06-01 11:00:36', 'admin', '2022-06-01 11:00:36');
INSERT INTO `exam_question_bank_role` VALUES (2, 10, 1, 'admin', '2022-06-01 15:24:55', NULL, NULL);
INSERT INTO `exam_question_bank_role` VALUES (3, 1, 1, 'admin', '2022-06-01 15:25:13', NULL, NULL);
INSERT INTO `exam_question_bank_role` VALUES (4, 20, 1, 'admin', '2022-06-10 21:07:25', 'admin', '2022-06-10 21:07:25');
INSERT INTO `exam_question_bank_role` VALUES (5, 21, 102, 'test', '2022-06-12 16:06:41', 'test', '2022-06-12 16:06:41');
INSERT INTO `exam_question_bank_role` VALUES (6, 22, 1, 'admin', '2022-06-20 16:37:15', 'admin', '2022-06-20 16:37:15');
INSERT INTO `exam_question_bank_role` VALUES (7, 23, 1, 'admin', '2022-06-22 10:57:45', 'admin', '2022-06-22 10:57:45');
INSERT INTO `exam_question_bank_role` VALUES (8, 24, 1, 'admin', '2022-06-28 10:10:24', 'admin', '2022-06-28 10:10:24');
INSERT INTO `exam_question_bank_role` VALUES (9, 25, 1, 'admin', '2022-07-12 08:09:30', 'admin', '2022-07-12 08:09:30');
INSERT INTO `exam_question_bank_role` VALUES (10, 26, 1, 'admin', '2022-07-25 14:59:10', 'admin', '2022-07-25 14:59:10');
INSERT INTO `exam_question_bank_role` VALUES (11, 27, 1, 'admin', '2022-08-11 21:26:59', 'admin', '2022-08-11 21:26:59');
INSERT INTO `exam_question_bank_role` VALUES (12, 28, 1, 'admin', '2022-08-11 21:27:06', 'admin', '2022-08-11 21:27:06');
INSERT INTO `exam_question_bank_role` VALUES (13, 29, 1, 'admin', '2022-08-15 16:30:11', 'admin', '2022-08-15 16:30:11');

-- ----------------------------
-- Table structure for exam_question_role
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_role`;
CREATE TABLE `exam_question_role`  (
  `question_id` int NOT NULL,
  `role_id` int NOT NULL,
  `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `modify_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL,
  `modify_time` timestamp(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question_role
-- ----------------------------

-- ----------------------------
-- Table structure for exam_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_questions`;
CREATE TABLE `exam_questions`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题目',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题目图片',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题目类型',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '问答题答案',
  `judge_answer` tinyint(1) NULL DEFAULT NULL COMMENT '判断题答案',
  `select_answer` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '单选题或者多选题答案',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '试题解析',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_enable` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '试题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_questions
-- ----------------------------
INSERT INTO `exam_questions` VALUES (1, '如何处理单元测试产生的数据，下列哪些说法是正确的？ ', NULL, 'selects', NULL, NULL, '1,2,3', NULL, NULL, '2022-01-12 00:24:35', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (2, '关于并发处理，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '5,6,7', NULL, NULL, '2022-01-12 00:24:36', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (3, '下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '9,11,12', '2', NULL, '2022-01-12 00:24:36', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (4, '关于分页查询，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '13,14,15', NULL, NULL, '2022-01-12 00:24:37', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (5, '根据《阿里巴巴Java开发手册》，以下功能必须进行水平权限控制校验 的有', NULL, 'selects', NULL, NULL, '17,18,19,20', NULL, NULL, '2022-01-12 00:24:38', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (6, '关于数据库中NULL的描述，下列哪些说法符合《阿里巴巴Java开发手 册》', NULL, 'selects', NULL, NULL, '22,24', NULL, NULL, '2022-01-12 00:24:38', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (7, '关于接口使用抛异常还是返回错误码，下列哪些说法符合《阿里巴巴Java 开发手册》', NULL, 'selects', NULL, NULL, '25,26,27,28', NULL, NULL, '2022-01-12 00:24:39', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (8, '关于类的序列化，下列说法哪些是正确的', NULL, 'select', NULL, NULL, '32', NULL, NULL, '2022-01-12 00:24:40', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (9, '关于Java的接口描述，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '34,35,36', NULL, NULL, '2022-01-12 00:24:40', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (10, '集合在遍历过程中，有时需要对符合一定条件的元素进行删除，下列哪些 说法是正确的', NULL, 'select', NULL, NULL, '38', NULL, NULL, '2022-01-12 00:24:41', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (11, '关于基本数据类型与包装数据类型的使用标准，下列哪些说法符合《阿里 巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '41,42,44', NULL, NULL, '2022-01-12 00:24:42', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (12, '关于索引的设计，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '45,47,48', NULL, NULL, '2022-01-12 00:24:42', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (13, '关于二方库版本号的命名方式，下列哪些说法符合《阿里巴巴Java开发 手册》', NULL, 'selects', NULL, NULL, '49,50,51,52', NULL, NULL, '2022-01-12 00:24:43', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (14, '关于索引的使用，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '54,55,56', NULL, NULL, '2022-01-12 00:24:44', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (15, '关于生产环境的日志乂件，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '57,58,59,60', NULL, NULL, '2022-01-12 00:24:44', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (16, '关于代码注経，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '61,62,64', NULL, NULL, '2022-01-12 00:24:45', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (17, '关于MySQL性能优化的描述，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '65,66,67,68', NULL, NULL, '2022-01-12 00:24:46', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (18, '关于索引的设计和使用，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '69,70,71,72', NULL, NULL, '2022-01-12 00:24:46', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (19, '关于类命名，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '73,74,75,76', NULL, NULL, '2022-01-12 00:24:47', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (20, '关于数据库模糊检索的描述，下列哪些说法符合《阿里巴巴Java开发手 册》', NULL, 'selects', NULL, NULL, '77,78,80', NULL, NULL, '2022-01-12 00:24:48', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (21, '关于代码注释，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '81,83,84', NULL, NULL, '2022-01-12 00:24:48', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (22, 'checked/unchecked exception,下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '86,87,88', NULL, NULL, '2022-01-12 00:24:49', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (23, '关于Map类型集合的遍历方式，下列哪些说法是正确的', NULL, 'select', NULL, NULL, '92', NULL, NULL, '2022-01-12 00:24:50', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (24, '关于变量、方法名、包的命名，下列哪些说法符合《阿里巴巴Java开发 手册》', NULL, 'selects', NULL, NULL, '93,94,95,96', NULL, NULL, '2022-01-12 00:24:50', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (25, '关于常量定义，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '97,99', NULL, NULL, '2022-01-12 00:24:51', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (26, '关于maven依赖、仲裁、规则，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '101,103,104', NULL, NULL, '2022-01-12 00:24:52', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (27, '关于二方库升级，下列哪些说法是正确的', NULL, 'select', NULL, NULL, '106', NULL, NULL, '2022-01-12 00:24:52', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (28, '关于表宇段和索引，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '109,110,112', NULL, NULL, '2022-01-12 00:24:53', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (29, '关于测试代码的覆盖率，下列哪些说法是正确的？ ', NULL, 'select', NULL, NULL, '114', NULL, NULL, '2022-01-12 00:24:54', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (30, ' Hashtable, HashMap, ConcurrentHashMap 都是 Map 的实现类， 它们在处理null值的存储上有细微的区别，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '117,118,120', NULL, NULL, '2022-01-12 00:24:54', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (31, '关于数据库命名规则，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '122,123,124', NULL, NULL, '2022-01-12 00:24:55', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (32, '关于异常的处理方式，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '126,128', NULL, NULL, '2022-01-12 00:24:56', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (33, '数组使用Arrays.asList转化为集合，下列说法哪些正确的', NULL, 'selects', NULL, NULL, '129,131,132', NULL, NULL, '2022-01-12 00:24:56', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (34, '关于文件编码和格式的设定，下列哪些说法符合《阿里巴巴Java开发手 册》', NULL, 'selects', NULL, NULL, '134,135', NULL, NULL, '2022-01-12 00:24:57', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (35, '关于数据库是与否概念的列的命名方式，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '138,140', NULL, NULL, '2022-01-12 00:24:58', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (36, '以下关于格式规约的说法，正确的有哪些', NULL, 'selects', NULL, NULL, '141,144', NULL, NULL, '2022-01-12 00:24:58', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (37, '通过集合A・subListO获取子集合B,下列说法哪些是正确的', NULL, 'selects', NULL, NULL, '145,146,148', NULL, NULL, '2022-01-12 00:24:59', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (38, '关于捕获异常和抛异常，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '150,151,152', NULL, NULL, '2022-01-12 00:25:00', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (39, '关于线程安全，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '153,155,156', NULL, NULL, '2022-01-12 00:25:00', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (40, '为了更方便地进行单元测试，被测试的业务代码应避免以下哪些情况？', NULL, 'selects', NULL, NULL, '157,158,159,160', NULL, NULL, '2022-01-12 00:25:01', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (41, '关于控制语句，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '161,162,164', NULL, NULL, '2022-01-12 00:25:02', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (42, '关于参数有效性验证，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '165,166,167,168', NULL, NULL, '2022-01-12 00:25:02', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (43, '关于变量和常量定义，下列哪些符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '169,172', NULL, NULL, '2022-01-12 00:25:03', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (44, '在定义DO/DTO/VO/等POJO类时，对属性默认值的设定，下列哪些说 法符合《阿里巴巴Java开发手册》', NULL, 'select', NULL, NULL, '176', NULL, NULL, '2022-01-12 00:25:04', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (45, '关于二方库依赖的解析命令，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '177,178,179', NULL, NULL, '2022-01-12 00:25:04', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (46, '结构的集合，在处理null值的存储上有细微的区别，下列哪些说法是正确 的', NULL, 'select', NULL, NULL, '181', NULL, NULL, '2022-01-12 00:25:05', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (47, '关于数据库中表相关的命名，下列哪些说法符合《阿里巴巴Java开发手 册》', NULL, 'selects', NULL, NULL, '185,186,188', NULL, NULL, '2022-01-12 00:25:05', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (48, '关于多线程并行处理定时任务的情况，下列哪些说法符合《阿里巴巴Java 开发手册》', NULL, 'selects', NULL, NULL, '190,191,192', NULL, NULL, '2022-01-12 00:25:06', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (49, '关于Java代码的设计和开发注意事项，下列哪些说法符合《集合开发规 约》', NULL, 'selects', NULL, NULL, '193,194,195,196', NULL, NULL, '2022-01-12 00:25:07', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (50, '关于数据库索引的命名，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '197,199,200', NULL, NULL, '2022-01-12 00:25:07', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (51, '关于务线程并行处理定时任务的情况，下列哪些说法符合《阿里巴巴Java 开发手册》', NULL, 'selects', NULL, NULL, '202,203,204', NULL, NULL, '2022-01-12 00:25:08', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (52, 'KV结构的集合，在处理null值的存储上有细微的区别，下列哪些说法是 正确的', NULL, 'select', NULL, NULL, '205', NULL, NULL, '2022-01-12 00:25:09', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (53, ' Hashtable, HashMap, ConcurrentHashMap 都是 Map 的实现类, 它们在处理null值的存储上有细微的区别，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '209,210,212', NULL, NULL, '2022-01-12 00:25:09', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (54, '以下关于命名规约内容说明，正确的是', NULL, 'selects', NULL, NULL, '214,215,216,217', NULL, NULL, '2022-01-12 00:25:10', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (55, '关于Java代码的设计和开发注意事项，下列哪些说法符合《阿里巴巴Java 开发手册》', NULL, 'selects', NULL, NULL, '218,219,220', NULL, NULL, '2022-01-12 00:25:11', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (56, '在多线程并发读写的情况下，下列哪些处理方式能保证对象的线程安全', NULL, 'selects', NULL, NULL, '223,224,225', NULL, NULL, '2022-01-12 00:25:11', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (57, '关于代码书写格式，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '227,228,229', NULL, NULL, '2022-01-12 00:25:12', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (58, '关于使用explain对数据库性能进行优化分析，下列哪些说法符合《阿里 巴巴Java开发手册》', NULL, 'select', NULL, NULL, '230', NULL, NULL, '2022-01-12 00:25:13', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (59, '关于用日志记录异常信息，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '234,235', NULL, NULL, '2022-01-12 00:25:13', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (60, '关于ORM的规则，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '238,241', NULL, NULL, '2022-01-12 00:25:14', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (61, '关于注経，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '243,244', NULL, NULL, '2022-01-12 00:25:15', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (62, '关于常量的命名，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '246,247,249', NULL, NULL, '2022-01-12 00:25:15', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (63, '关于二方库使用枚举类型，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '250,251,253', NULL, NULL, '2022-01-12 00:25:16', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (64, '关于hashcode和equals,下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '255,256', NULL, NULL, '2022-01-12 00:25:17', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (65, '针对tcp协议，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '260,261', NULL, NULL, '2022-01-12 00:25:17', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (66, '关于Java代码的设订和开发注意事项，下列哪些说法符合《阿里巴巴Java 开发手册》', NULL, 'selects', NULL, NULL, '262,263,264', NULL, NULL, '2022-01-12 00:25:18', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (67, '关于try・catch的使用方式，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '267,269', NULL, NULL, '2022-01-12 00:25:19', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (68, '关于加锁，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '270,271,272,273', NULL, NULL, '2022-01-12 00:25:19', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (69, '关于系统安全，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '275,276,277', NULL, NULL, '2022-01-12 00:25:20', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (70, '关于应用与数据库之间的操作，下列哪些说法符合《阿里巴巴Java开发 手册》', NULL, 'selects', NULL, NULL, '279,280', NULL, NULL, '2022-01-12 00:25:21', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (71, '关于二方库的依赖处理，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '282,284,285', NULL, NULL, '2022-01-12 00:25:21', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (72, 'sort表示元素在存入集合时进行了排序，数据遍历的结果是按某个排序规 则输岀的；而。rder表示每次遍历的序列都是一样的，元素前后关系每次遍历 都是确定的，那么下列哪些集合既是sort,又是。rder的', NULL, 'select', NULL, NULL, '289', NULL, NULL, '2022-01-12 00:25:22', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (73, '关于工具类二方库巳经提供的，尽量不要在本应用中编程实现，下列哪些 说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '290,291,293', NULL, NULL, '2022-01-12 00:25:23', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (74, '关于类和方法的命名，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '294,295,297', NULL, NULL, '2022-01-12 00:25:23', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (75, '根据《阿里巴巴Java开发手册》，以下哪些字段属于表的必备宇段', NULL, 'selects', NULL, NULL, '298,299,301', NULL, NULL, '2022-01-12 00:25:24', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (76, '单元测试代码写在Java工程的哪个地方最为合适', NULL, 'select', NULL, NULL, '304', NULL, NULL, '2022-01-12 00:25:25', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (77, '关于索引效率，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '308,309', NULL, NULL, '2022-01-12 00:25:25', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (78, '关于线程池管理线程的好处，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '310,312', NULL, NULL, '2022-01-12 00:25:26', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (79, '编写单元测试代码谚守BCDE原则，以保证被测试模块的交付质量，那么 下列说法正确的是', NULL, 'selects', NULL, NULL, '314,315,316', NULL, NULL, '2022-01-12 00:25:27', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (80, '关于领域模型命名，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '318,319,320', NULL, NULL, '2022-01-12 00:25:27', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (81, '关于客户数据展示，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '322,323,324,325', NULL, NULL, '2022-01-12 00:25:28', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (82, '关于并发处理，下列哪些说法符合《阿里R巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '326,327,328', NULL, NULL, '2022-01-12 00:25:29', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (83, '4.关于分页查询，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '330,331,332', NULL, NULL, '2022-01-12 00:25:29', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (84, '38.关于捕获异常和抛异常，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '335,336,337', NULL, NULL, '2022-01-12 00:25:30', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (85, '关于基本数据类型与包装数据类型的使用标准，下列娜些说法符合《阿里 巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '338,339,341', NULL, NULL, '2022-01-12 00:25:31', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (86, '关于生产环境的日志义件，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '342,343,344,345', NULL, NULL, '2022-01-12 00:25:31', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (87, '关于数据库模糊检索的描述下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '346,347,349', NULL, NULL, '2022-01-12 00:25:32', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (88, '关于变量、方法名包的命名下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '350,351,352,353', NULL, NULL, '2022-01-12 00:25:32', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (89, '数组使用Airays.asList转化为集合，下列说法哪些正确的', NULL, 'selects', NULL, NULL, '354,356,357', NULL, NULL, '2022-01-12 00:25:33', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (90, '关于Java代码的设计和开发注意事项下列哪些说法符合《集合开发规约》', NULL, 'selects', NULL, NULL, '358,359,360,361', NULL, NULL, '2022-01-12 00:25:34', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (91, '利用索引进行排序，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '362,363', NULL, NULL, '2022-01-12 00:25:34', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (92, 'sont表示元素在存入集合时进行了排序，数据遍历的结果是主 则输岀的;而。rder表示每次遍历的序列都是一样的，元素前后关系每次遍历都是 确定的，那么下列哪些集合既是sort,又是。rder的', NULL, 'select', NULL, NULL, '369', NULL, NULL, '2022-01-12 00:25:35', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (93, '关于类和方法，下列哪些符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '370,371,372,373', NULL, NULL, '2022-01-12 00:25:36', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (94, '关于异常处理的注意事環下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '374,375', NULL, NULL, '2022-01-12 00:25:36', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (95, '关于日志的条件输岀和占位符的方式，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '378,381', NULL, NULL, '2022-01-12 00:25:37', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (96, '关于枚举类型，以下描述符合规范的是', NULL, 'selects', NULL, NULL, '383,384', NULL, NULL, '2022-01-12 00:25:38', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (97, '关于参数校验，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '386,387,388,389', NULL, NULL, '2022-01-12 00:25:38', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (98, '根据《阿里巴巴Java开发手册》，数据库的表设计允许适当冗余,以提升SQL查询的性能，避免表的关联查询，下列哪些字段不允许几余', NULL, 'selects', NULL, NULL, '390,392,393', NULL, NULL, '2022-01-12 00:25:39', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (99, '关于注経，下列哪些说法符合 綱里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '395,396', NULL, NULL, '2022-01-12 00:25:40', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (100, '关于加锁，下列哪些说法符合 綱里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '398,399,400,401', NULL, NULL, '2022-01-12 00:25:40', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (101, '根据《阿里巴巴Java开发手册》，以下哪些字段属于表的必备字段', NULL, 'selects', NULL, NULL, '402,403,405', NULL, NULL, '2022-01-12 00:25:41', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (102, '单元测试代码写在Java工程的哪个地方最为合适？ ', NULL, 'select', NULL, NULL, '408', NULL, NULL, '2022-01-12 00:25:42', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (103, '编写单元测试代码道守BCDE原则，以保证被测试模块的交付质量，那么 下列说法正确的是', NULL, 'selects', NULL, NULL, '410,411,412', NULL, NULL, '2022-01-12 00:25:42', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (104, '如何处理单元测试产生的数据，下列哪些说法是正确的？', NULL, 'selects', NULL, NULL, '414,415,416', NULL, NULL, '2022-01-12 00:25:43', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (105, '1关于生产环境的日志义件，下列哪些说法符合《阿里巴巴Java开发手 册》', NULL, 'selects', NULL, NULL, '418,419,420,421', NULL, NULL, '2022-01-12 00:25:44', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (106, '关于素引的设订和使用，下列娜些说法是正确的', NULL, 'selects', NULL, NULL, '422,423,424,425', NULL, NULL, '2022-01-12 00:25:44', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (107, '关于checked/unchecked exception,下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '427,428,429', NULL, NULL, '2022-01-12 00:25:45', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (108, '关于try-catch的使用方式，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '431,433', NULL, NULL, '2022-01-12 00:25:46', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (109, '如何处理单元测试产生的数据，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '434,435,436', NULL, NULL, '2022-01-12 00:25:46', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (110, '下面的例子代码和描述，哪些是不正确的', NULL, 'selects', NULL, NULL, '438,439', NULL, NULL, '2022-01-12 00:25:47', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (111, '在定义DO/DTO/VO/等POJ。类时，对属性默认值的设定，下列哪些说 法符合《阿里巴巴Java开发手册》', NULL, 'select', NULL, NULL, '445', NULL, NULL, '2022-01-12 00:25:48', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (112, '关于Java的方法使用，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '446,447,449', NULL, NULL, '2022-01-12 00:25:48', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (113, '关于Integer值的比较，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '450,453', NULL, NULL, '2022-01-12 00:25:49', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (114, '关于构造方法，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '454,455,456', NULL, NULL, '2022-01-12 00:25:50', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (115, 'sort表示元素在存入集合时进行了排序，数据遍历的结果是按某个排序规 则输岀的;而。rder表示每次遍历的序列都是一样的,元素前后关系每次遍历都是 确定的，那么下列哪些集合既是sort,又是。rder的', NULL, 'select', NULL, NULL, '461', NULL, NULL, '2022-01-12 00:25:50', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (116, 'list子类使用toarray方法实现集合向数组转换，下列哪些说法是正确的', NULL, 'select', NULL, NULL, '463', NULL, NULL, '2022-01-12 00:25:51', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (117, '关于线程池的创建，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '466,467,468', NULL, NULL, '2022-01-12 00:25:52', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (118, '使用CountDownLatchiS行异步转同步操作时，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '470,471,473', NULL, NULL, '2022-01-12 00:25:52', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (119, '关于explain执行计划，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '474,475,476,477', NULL, NULL, '2022-01-12 00:25:53', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (120, '关于日志级别的使用，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '479,480,481', NULL, NULL, '2022-01-12 00:25:54', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (121, '关于使用iBATIS操作数据，下列哪些说法符合《阿里巴巴Java开发手 册》', NULL, 'selects', NULL, NULL, '484,485', NULL, NULL, '2022-01-12 00:25:54', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (122, '防止NPE,是程序员的基本修养，对于可能产生NPE的场景，下列哪些说法 符合(何里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '486,488,489', NULL, NULL, '2022-01-12 00:25:55', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (123, '关于count相关的使用，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '490,492,493', NULL, NULL, '2022-01-12 00:25:56', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (124, '关于方法的返回值是否可以为null,下列哪些说法符合《阿里巴巴Java 开发手册》', NULL, 'selects', NULL, NULL, '495,496,497', NULL, NULL, '2022-01-12 00:25:56', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (125, '对于索引的基本原理，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '498,499,500,501', NULL, NULL, '2022-01-12 00:25:57', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (126, '关于二方库的snapshot与release的区别，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '502,503,505', NULL, NULL, '2022-01-12 00:25:58', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (127, '关于二方库GroupID和ArifactD格式，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '506,509', NULL, NULL, '2022-01-12 00:25:58', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (128, '关于join的描述，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '510,511', NULL, NULL, '2022-01-12 00:25:59', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (129, '关于日志的打印，下列哪些写法符合《阿里巴巴Java开发手册》', NULL, 'select', NULL, NULL, '517', NULL, NULL, '2022-01-12 00:26:00', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (130, '关于使用exlain对数据库性能进行优化分析，下列哪些说法符合《阿里巴 巴Java开发手册》', NULL, 'select', NULL, NULL, '518', NULL, NULL, '2022-01-12 00:26:00', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (131, '关于异常处理，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '522,523,524,525', NULL, NULL, '2022-01-12 00:26:01', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (132, '关于数据库查询的描述，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '527,528,529', NULL, NULL, '2022-01-12 00:26:02', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (133, '好的单元测试必须道守AIR原则，那么AIR原则具体是指', NULL, 'selects', NULL, NULL, '530,532,533', NULL, NULL, '2022-01-12 00:26:02', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (134, '关于应用中可以直接依赖的日志框架，下列哪些说法符合〈阿里巴巴Java 开发手册》', NULL, 'selects', NULL, NULL, '535,536', NULL, NULL, '2022-01-12 00:26:03', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (135, '关于建表规约，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '538,539,541', NULL, NULL, '2022-01-12 00:26:04', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (136, '关于组合索引，下他哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '542,544', NULL, NULL, '2022-01-12 00:26:04', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (137, '在《阿里巴巴Java开发手册》中，提到不要对单元测试存在哪些误解？', NULL, 'selects', NULL, NULL, '546,547,548,549', NULL, NULL, '2022-01-12 00:26:05', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (138, '防止NPE,是程序员的基本修养，对于可自萨生NPE的场景，下列哪些 说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '550,552,553', NULL, NULL, '2022-01-12 00:26:06', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (139, 'try-catch的使用方式，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '555,557', NULL, NULL, '2022-01-12 00:26:06', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (140, '关于应用中可以直接依赖的日志框架，下列哪些说法符合《阿里巴巴Java 开发手册》', NULL, 'selects', NULL, NULL, '559,560', NULL, NULL, '2022-01-12 00:26:07', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (141, '关于日志的打印，下列哪些符合《阿里巴巴Java开发手册》', NULL, 'select', NULL, NULL, '565', NULL, NULL, '2022-01-12 00:26:08', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (142, '关于组合索引，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '566,568', NULL, NULL, '2022-01-12 00:26:08', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (143, '对于索引(a,b,c),下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '570,571,572', NULL, NULL, '2022-01-12 00:26:09', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (144, '关于使用iBATIS操作数据，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '576,577', NULL, NULL, '2022-01-12 00:26:10', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (145, ' 关于二方库的snapshot与release的区别，下列哪些说法是正确的', NULL, 'selects', NULL, NULL, '578,579,581', NULL, NULL, '2022-01-12 00:26:10', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (146, '关于二方库GroupID和ArtifadID格式，下列哪些说法符合《阿里巴巴Java开发手册》', NULL, 'selects', NULL, NULL, '582,585', NULL, NULL, '2022-01-12 00:26:11', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (149, 'hashmap的实现原理和特点', NULL, 'answer', '123', 1, NULL, '', NULL, '2022-01-13 16:52:21', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (152, 'mysql的MyISAM和InnoDB引擎的区别', NULL, 'answer', '1.MyISAM不支持事务\n2.InnoDB是聚簇索引，使用的B+Tree  MyISAM的是非聚簇索引，使用的BTree \n3.*MyISAM只支持表锁。InnoDB支持表锁、行锁 行锁大幅度提高了多用户并发操作的新能。但是InnoDB的行锁，只是在WHERE的主键是有效的，非主键的WHERE都会锁全表的\n4.MyISAM表文件有三个 表结构文件，后缀名为frm 索引文件，后缀名为MYI 数据文件，后缀名为MYD\n但是 InnoDB 只有两， 表结构文件，后缀名为frm 数据、索引文件，后缀名为ibd', 1, NULL, '', NULL, '2022-02-09 16:12:58', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (153, 'redis的持久化策略', NULL, 'answer', 'rdb:快照形式是直接把内存中的数据保存到一个dump文件中，定时保存，保存策略  \naof：把所有的对redis的服务器进行修改的命令都存到一个文件里，命令的集合', 1, NULL, '', NULL, '2022-02-23 22:46:30', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (154, 'redis的过期策略', NULL, 'answer', '定期删除\n定期删除是指Redis默认每隔 100ms 就 随机抽取 一些设置了过期时间的key，检测这些key是否过期，如果过期了就将其删除。\n在Redis的配置文件redis.conf中有一个属性\"hz\"，默认为10，表示1s执行10次定期删除，即每隔100ms执行一次，可以修改这个配置值。\n随机抽取的数据量 由redis.conf文件中的maxmemory-samples属性决定的，默认为5。\n惰性删除\n惰性删除不是去主动删除，而是在你要获取某个key 的时候，redis会先去检测一下这个key是否已经过期，如果没有过期则返回给你，如果已经过期了，那么redis会删除这个key', 1, NULL, '', NULL, '2022-02-23 22:55:18', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (155, 'redis的内存淘汰策略', NULL, 'answer', 'no-eviction\n\n当内存不足以容纳新写入数据时，新写入操作会报错，无法写入新数据，一般不采用。\n\nallkeys-lru\n\n当内存不足以容纳新写入数据时，移除最近最少使用的key，这个是最常用的\n\nallkeys-random\n\n当内存不足以容纳新写入的数据时，随机移除key\n\nallkeys-lfu\n\n当内存不足以容纳新写入数据时，移除最不经常（最少）使用的key\n\nvolatile-lru\n\n当内存不足以容纳新写入数据时，在设置了过期时间的key中，移除最近最少使用的key。\n\nvolatile-random\n\n内存不足以容纳新写入数据时，在设置了过期时间的key中，随机移除某个key 。\n\nvolatile-lfu\n\n当内存不足以容纳新写入数据时，在设置了过期时间的key中，移除最不经常（最少）使用的key\n\nvolatile-ttl\n\n当内存不足以容纳新写入数据时，在设置了过期时间的key中，优先移除过期时间最早（剩余存活时间最短）的key。\n\nredis.conf配置文件中的 maxmemory 属性限定了 Redis 最大内存使用量，当占用内存大于maxmemory的配置值时会执行内存淘汰策略。\n内存淘汰机制由redis.conf配置文件中的maxmemory-policy属性设置，没有配置时默认为no-eviction模式。', 1, NULL, '', NULL, '2022-02-23 22:59:02', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (157, 'redis的内存淘汰策略的LRU&LFU算法', NULL, 'answer', 'LRU【最近最久未使用】\n标准LRU算法是这样的：它把数据存放在链表中按照“最近访问”的顺序排列，当某个key被访问时就将此key移动到链表的头部，保证了最近访问过的元素在链表的头部或前面。当链表满了之后，就将\"最近最久未使用\"的，即链表尾部的元素删除，再将新的元素添加至链表头部。\n在Redis 3.0以后增加了LRU淘汰池，进一步提高了与标准LRU算法效果的相似度。淘汰池即维护的一个数组，数组大小等于抽样数量 maxmemory_samples，在每一次淘汰时，新随机抽取的key和淘汰池中的key进行合并，然后淘汰掉最旧的key，将剩余较旧的前面5个key放入淘汰池中待下一次循环使用。假如maxmemory_samples=5，随机抽取5个元素，淘汰池中还有5个元素，相当于变相的maxmemory_samples=10了，所以进一步提高了与LRU算法的相似度。\n\nLFU【最近最少使用】\n假设在位置※时需要删除一个元素，对比A和B，如果使用LRU，那么删除的应该是A,因为A上次被访问距现在的时间更长，但我们发现这是不合理的，因为其实A元素被访问更频繁、更热点，所以我们实际希望删除的是B，保留A，LFU就是为应对这种情况而生的。\n\n    在Redis LFU算法中，为每个key维护了一个计数器，每次key被访问的时候，计数器增大，计数器越大，则认为访问越频繁。但其实这样会有问题，\n\n    1、因为访问频率是动态变化的，前段时间频繁访问的key，之后也可能很少再访问（如微博热搜）。为了解决这个问题，Redis记录了每个key最后一次被访问的时间，随着时间的推移，如果某个key再没有被访问过，计数器的值也会逐渐降低。\n\n    2、新生key问题，对于新加入缓存的key，因为还没有被访问过，计数器的值如果为0，就算这个key是热点key，因为计数器值太小，也会被淘汰机制淘汰掉。为了解决这个问题，Redis会为新生key的计数器设置一个初始值。\n\n    上面说过在Redis LRU算法中，会给每个key维护一个大小为24bit的属性字段，代表最后一次被访问的时间戳。在LFU中也维护了这个24bit的字段，不过被分成了16 bits与8 bits两部分：\n\n        16 bits      8 bits\n\n+--------------------+------------+\n\n+ Last decr time | LOG_C  |\n\n+--------------------+-----------+\n\n其中高16 bits用来记录计数器的上次缩减时间，时间戳，单位精确到分钟。低8 bits用来记录计数器的当前数值。\n\n在redis.conf配置文件中还有2个属性可以调整LFU算法的执行参数：lfu-log-factor、lfu-decay-time。其中lfu-log-factor用来调整计数器counter的增长速度，lfu-log-factor越大，counter增长的越慢。lfu-decay-time是一个以分钟为单位的数值，用来调整counter的缩减速度', 1, NULL, '', NULL, '2022-02-23 23:02:59', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (158, 'LinkedHashMap手写一个LRU算法的简单实现!', NULL, 'answer', '/**\n * @Copyright (C), 程序员耕耘\n * @ClassName: LRU\n * @Author: long.yuan\n * @Date: 2020/2/20 13:50\n * @Version: V1.0\n * @Description: 利用LinkedHashMap简单手写LRU算法\n */\npublic class LRU {\n    public static void main(String[] args) {\n \n        // 定义最大容量为10\n        final int maxSize = 10;\n \n        // 参数boolean accessOrder含义:false-按照插入顺序排序；true-按照访问顺序排序。\n        Map<Integer, Integer> map = new LinkedHashMap<Integer, Integer>(0, 0.75f, true) {\n            // LinkedHashMap加入新元素时会自动调用该方法，若返回true，则会删除链表尾部的元素\n            @Override\n            protected boolean removeEldestEntry(Map.Entry<Integer, Integer> eldest) {\n                return size() > maxSize;\n            }\n        };\n \n        // 先往map中加入10个元素(定义的最大容量为10)\n        for (int i = 1; i <= 10; i++) {\n            map.put(i, i);\n        }\n \n        // 访问一下第6个元素,看看是否会排到链表的头部\n        map.get(6);\n        System.out.println(\"发现第6个元素排到了链表的头部：\" + map.toString());\n \n        // 再加数据\n        map.put(11, 11);\n        System.out.println(\"删除链表尾部的元素，再将新的元素添加至链表头部 ：\" + map.toString());\n    }\n}', 1, NULL, '', NULL, '2022-02-23 23:04:02', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (159, '缓存穿透  ', NULL, 'answer', '缓存穿透\n缓存穿透是指查询一个一定不存在的数据，由于缓存是不命中时被动写的，并且出于容错考虑，如果从存储层查不到数据则不写入缓存，这将导致这个不存在的数据每次请求都要到存储层去查询，失去了缓存的意义。在流量大时，可能DB就挂掉了，要是有人利用不存在的key频繁攻击我们的应用，这就是漏洞。\n\n解决方案\n有很多种方法可以有效地解决缓存穿透问题，最常见的则是采用布隆过滤器，将所有可能存在的数据哈希到一个足够大的bitmap中，一个一定不存在的数据会被 这个bitmap拦截掉，从而避免了对底层存储系统的查询压力。另外也有一个更为简单粗暴的方法（我们采用的就是这种），如果一个查询返回的数据为空（不管是数 据不存在，还是系统故障），我们仍然把这个空结果进行缓存，但它的过期时间会很短，最长不超过五分钟', 1, NULL, '', NULL, '2022-02-23 23:05:43', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (160, '缓存雪崩', NULL, 'answer', '缓存雪崩\n缓存雪崩是指在我们设置缓存时采用了相同的过期时间，导致缓存在某一时刻同时失效，请求全部转发到DB，DB瞬时压力过重雪崩。\n\n解决方案\n缓存失效时的雪崩效应对底层系统的冲击非常可怕。大多数系统设计者考虑用加锁或者队列的方式保证缓存的单线 程（进程）写，从而避免失效时大量的并发请求落到底层存储系统上。这里分享一个简单方案就时讲缓存失效时间分散开，比如我们可以在原有的失效时间基础上增加一个随机值，比如1-5分钟随机，这样每一个缓存的过期时间的重复率就会降低，就很难引发集体失效的事件。\n', 1, NULL, '', NULL, '2022-02-23 23:06:29', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (161, '缓存击穿', NULL, 'answer', '缓存击穿\n对于一些设置了过期时间的key，如果这些key可能会在某些时间点被超高并发地访问，是一种非常“热点”的数据。这个时候，需要考虑一个问题：缓存被“击穿”的问题，这个和缓存雪崩的区别在于这里针对某一key缓存，前者则是很多key。\n\n缓存在某个时间点过期的时候，恰好在这个时间点对这个Key有大量的并发请求过来，这些请求发现缓存过期一般都会从后端DB加载数据并回设到缓存，这个时候大并发的请求可能会瞬间把后端DB压垮。\n\n解决方案\n使用互斥锁，\n简单地来说，就是在缓存失效的时候（判断拿出来的值为空），不是立即去load db，而是先使用缓存工具的某些带成功操作返回值的操作（比如Redis的SETNX或者Memcache的ADD）去set一个mutex key，当操作返回成功时，再进行load db的操作并回设缓存；否则，就重试整个get缓存的方法。\nSETNX，是「SET if Not eXists」的缩写，也就是只有不存在的时候才设置，可以利用它来实现锁的效果。在redis2.6.1之前版本未实现setnx的过期时间，\n', 1, NULL, '', NULL, '2022-02-23 23:08:54', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (162, '事务的四大特性', NULL, 'select', NULL, NULL, '593', '原子性（Atomicity） 一致性（Consistency） 隔离性（Isolation）持久性（Durability）', NULL, '2022-02-23 23:11:00', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (163, '以下哪些属于线程的状态', NULL, 'selects', NULL, NULL, '594,595,596,597', '新建状态(New)： 就绪状态(Runnable) 运行状态(Running) 阻塞状态(Blocked) 死亡状态(Dead)', NULL, '2022-02-23 23:13:52', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (164, '线程池的七个参数', NULL, 'answer', 'corePoolSize 线程池核心线程大小\n线程池中会维护一个最小的线程数量，即使这些线程处理空闲状态，他们也不会被销毁，除非设置了allowCoreThreadTimeOut。这里的最小线程数量即是corePoolSize。\nmaximumPoolSize 线程池最大线程数量\n个任务被提交到线程池以后，首先会找有没有空闲存活线程，如果有则直接将任务交给这个空闲线程来执行，如果没有则会缓存到工作队列（后面会介绍）中，如果工作队列满了，才会创建一个新线程，然后从工作队列的头部取出一个任务交由新线程来处理，而将刚提交的任务放入工作队列尾部。线程池不会无限制的去创建新线程，它会有一个最大线程数量的限制，这个数量即由maximunPoolSize指定\n三：keepAliveTime 空闲线程存活时间\n四、unit 空闲线程存活时间单位\n五、workQueue 工作队列\n六、threadFactory 线程工厂\n七、handler 拒绝策略', 1, NULL, '', NULL, '2022-02-23 23:16:29', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (165, '同步锁Synchronized及其实现原理', NULL, 'answer', 'JVM规范中描述：每个对象有一个监视器锁（monitor）。\n\n当monitor被占用时就会处于锁定状态，线程执行monitorenter指令时尝试获取monitor的所有权，过程如下：\n\n1、如果monitor的进入数为0，则该线程进入monitor，然后将进入数设置为1，该线程即为monitor的所有者。\n\n2、如果线程已经占有该monitor，只是重新进入，则进入monitor的进入数加1.\n\n3.如果其他线程已经占用了monitor，则该线程进入阻塞状态，直到monitor的进入数为0，再重新尝试获取monitor的所有权。\n\nSynchronized的语义底层是通过一个monitor的对象来完成，其实wait/notify等方法也依赖于monitor对象，\n\n这就是为什么只有在同步的块或者方法中才能调用wait/notify等方法，否则会抛出java.lang.IllegalMonitorStateException的异常的原因。\n\nSynchronized是通过对象内部的一个叫做监视器锁（monitor）来实现的。\n\n但是监视器锁本质又是依赖于底层的操作系统的互斥锁（Mutex Lock）来实现的。而操作系统实现线程之间的切换这就需要从用户态转换到核心态，这个成本非常高，状态之间的转换需要相对比较长的时间，这就是为什么Synchronized效率低的原因。\n\n因此，这种依赖于操作系统互斥锁（Mutex Lock）所实现的锁我们称之为“重量级锁”。\n', 1, NULL, '', NULL, '2022-02-23 23:18:54', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (167, '线程的三种创建方式', NULL, 'answer', '1、继承Thread类创建线程类（省略）\n2、通过Runnable接口创建线程类（省略）\n3、通过Callable和Future创建线程\n\n\n采用实现Runnable、Callable接口的方式创建多线程时：\n\n　优势是：　　　　\n\n　　（1）线程类只是实现了Runnable接口或Callable接口，还可以继承其他类。\n\n　　（2）在这种方式下，多个线程可以共享同一个target对象，所以非常适合多个相同线程来处理同一份资源的情况，从而可以将CPU、代码和数据分开，形成清晰的模型，较好地体现了面向对象的思想。\n\n　劣势是：\n\n　　（1）编程稍微复杂，如果要访问当前线程，则必须使用Thread.currentThread()方法。\n\n使用继承Thread类的方式创建多线程时：\n\n　优势是：\n\n　　（1）编写简单，如果需要访问当前线程，则无需使用Thread.currentThread()方法，直接使用this即可获得当前线程。\n\n　劣势是：\n\n　　（1）线程类已经继承了Thread类，所以不能再继承其他父类。\n\n、Runnable和Callable的区别\n\n　　(1) Callable规定（重写）的方法是call()，Runnable规定（重写）的方法是run()。\n\n　　(2) Callable的任务执行后可返回值，而Runnable的任务是不能返回值的。\n\n　　(3) call方法可以抛出异常，run方法不可以。\n\n　　(4) 运行Callable任务可以拿到一个Future对象，表示异步计算的结果。它提供了检查计算是否完成的方法，以等待计算的完成，并检索计算的结果。通过Future对象可以了解任务执行情况，可取消任务的执行，还可获取执行结果。', 1, NULL, '', NULL, '2022-02-23 23:33:29', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (168, 'jvm内存模型', NULL, 'answer', 'JVM 内存模型共分为虚拟机栈，堆，方法区，程序计数器，本地方法栈五个部分。\n 程序计数器(PC寄存器)\n\n由于在JVM中，多线程是通过线程轮流切换来获得CPU执行时间的，因此，在任一具体时刻，一个CPU的内核只会执行一条线程中的指令，\n\n因此，为了能够使得每个线程都在线程切换后能够恢复在切　换　之前的程序执行位置，每个线程都需要有自己独立的程序计数器，并且不能互相被干扰，\n\n否则就会影响到程序的正常执行次序。因此，可以这么说，程序计数器是每个线程所私有的。由于程序计数器中存储的数据所占空间的大小不会随程序的执行而发生改变，\n\n因此，对于程序计数器是不会发生内存溢出现象(OutOfMemory)的。\n) java栈\n\nJava栈中存放的是一个个的栈帧，每个栈帧对应一个被调用的方法，在栈帧中包括局部变量表(Local Variables)、操作数栈(Operand Stack)、\n\n指向当前方法所属的类的运行时常量池（运行时常量池的概念在方法区部分会谈到）的引用(Reference to runtime constant pool)、\n\n**方法返回地址(Return Address)**和一些额外的附加信息。当线程执行一个方法时，就会随之创建一个对应的栈帧，并将建立的栈帧压栈。当方法执行完毕之后，便会将栈帧出栈。\n本地方法栈\n\n本地方法栈与Java栈的作用和原理非常相似。区别只不过是Java栈是为执行Java方法服务的，而本地方法栈则是为执行本地方法（Native Method）服务的\n堆\n\nJava中的堆是用来存储对象本身的以及数组（数组引用是存放在Java栈中的）。堆是被所有线程共享的，在JVM中只有一个堆。\nJava Heap是Java虚拟机所管理的内存中最大的一块，它是所有线程共享的一块内存区域。几乎所有的对象实例和数组都在这类分配内存。Java Heap是垃圾收集器管理的主要区域，因此很多时候也被称为“GC堆”。\n方法区\n\n与堆一样，是被线程共享的区域。在方法区中，存储了每个类的信息（包括类的名称、方法信息、字段信息）、静态变量、常量以及编译器编译后的代码等。\n\n在Class文件中除了类的字段、方法、接口等描述信息外，还有一项信息是常量池，用来存储编译期间生成的字面量和符号引用。\n\n在方法区中有一个非常重要的部分就是运行时常量池，它是每一个类或接口的常量池的运行时表示形式，在类和接口被加载到JVM后，\n\n对应的运行时常量池就被创建出来。当然并非Class文件常量池中的内容才能进入运行时常量池，在运行期间也可将新的常量放入运行时常量池中，比如String的intern方法。\n', 1, NULL, '', NULL, '2022-02-23 23:38:38', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (169, '事务的隔离级别', NULL, 'answer', '已读未提交，顾名思义，就是一个事务可以读取另一个未提交事务的数据。\n已读提交，顾名思义，就是一个事务要等另一个事务提交后才能读取数据。\n重复读，就是在开始读取数据（事务开启）时，不再允许修改操作\nSerializable 是最高的事务隔离级别，在该级别下，事务串行化顺序执行，可以避免脏读、不可重复读与幻读。但是这种事务隔离级别效率低下，比较耗数据库性能，一般不使用。', 1, NULL, '', NULL, '2022-03-04 00:13:45', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (170, '什么是幂等性?它是如何使用的？', NULL, 'answer', '幂等性指的是这样一种场景:您重复执行一项任务，但最终结果保持不变或类似。\n\n幂等性主要用作数据源或远程服务，当它接收一组以上指令时，它只处理一组指令。', 1, NULL, '', NULL, '2022-03-04 00:17:36', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (171, 'JVM的GC策略', NULL, 'answer', '引用计数法\n    简单的想一下，如果一个对象没有被任何人引用，那么他就要被回收。这个实现起来很简单，但是会有一个问题。如果有两个对象互相引用，但是没有任何其他对象引用他们，那么他们就会造成资源泄漏。所以实际使用时还是有些问题的，只能适合一些简单引用的场景。\n跟踪收集法\n    就是把整个引用想象成一个允许有环路的树结构，但是根节点只有一个，然后从根节点出发去查看对象是否可达。但这个就是要程序暂停，来保证一次扫描的现场不变。\nCopying\n    开辟另外一个内存空间，把扫描到可达的对象复制过去，然后把原内存空间全部清除即可。适用于存活对象较少的情况。\nMark-Sweep\n    把扫描到可达的对象都标记下来，然后把所有未标记的对象清除。但这个方法会引起内存碎片。适用于存活对象较多的情况。\nMark-Compact\n    在Mark-Sweep基础上，在把内存空间整理一下，让存储连续以消除内存碎片。\n\n', 1, NULL, '', NULL, '2022-03-04 00:27:15', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (178, 'bean的生命周期', NULL, 'answer', '对于Bean的生命周期，主要步骤为：\n- 实例化Bean：通过反射调用构造方法实例化对象。\n- 依赖注入：装配Bean的属性\n- 实现了Aware接口的Bean，执行接口方法：如顺序执行BeanNameAware、BeanFactoryAware、\nApplicationContextAware的接口方法。\n- Bean对象初始化前，循环调用实现了BeanPostProcessor接口的预初始化方法\n（postProcessBeforeInitialization）\n- Bean对象初始化：顺序执行@PostConstruct注解方法、InitializingBean接口方法、init-method\n方法\n- Bean对象初始化后，循环调用实现了BeanPostProcessor接口的后初始化方法\n（postProcessAfterInitialization）\n- 容器关闭时，执行Bean对象的销毁方法，顺序是：@PreDestroy注解方法、DisposableBean接口\n方法、destroy-method ', 1, NULL, '', NULL, '2022-05-22 18:18:16', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (179, '如何管理spring的bean', NULL, 'answer', '首先有一个bean 类（即要交给spring管理的类）\n在XML文件中 以<bean></bean>对该类进行配置\n有一个bean的公共转型类(beanDefination)，负责存储bean的信息\n有一个容器类（applicationContex）\n类中有个两个属性：分别是存储bean信息的List<BeanDefinition>和存放实例化对象的Map<String,Object>\n【读取xml配置文件】\n创建读取器\n根据文件路径获取文档下的所有节点（element类）\n获取节点的关键信息，并把信息封装成转型类对象（BeanDefinition）\n然后把封装后的节点信息放到集合中去List<BeanDefinition>\n【完成bean的实例化】\n遍历节点信息集合List<BeanDefinition>\n如果节点信息不为空，则根据类名等信息通过反射技术实例化对象\n通过key=类名，value=对象的结构放入map中\n【获取bean对象】\n根据类名获取对象 Object beanObject = map.get(className)\n测试\n首先通过“文件名”创建容器applicationContext\n调用  容器的 getbean（className）方法获取对象\n以上过程也可以再简化为一下几句话\n读取配置文件bean.xml，并根据文件中bean的id,class属性实例化一个BeanDefinition，装入泛型集合中。\n通过循环+反射，将List<BeanDefinition>中的bean加入到Map<String,Object>中，这里用反射将bean中的className属性转换为一个实例化的bean对象加入到了Map中。\n提供一个对外的接口，通过传入参数获取该bean。', 1, NULL, '', NULL, '2022-05-22 18:20:10', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (180, 'spring的核心组件', NULL, 'answer', 'bean 组件\nbean的创建  定义 以及对bean的解析\ncontext组件 \n提供了一个运行时的环境，用于保存各个对象的状态 \n集成了五个接口来扩展context的功能\ncore组件 定义了资源的访问方式 ，将所有资源都抽象成了一个接口的方式', 1, NULL, '', NULL, '2022-05-22 18:24:20', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (181, '如何实现Redis高可用', NULL, 'answer', 'redis的高可用，主要有哨兵模式和集群模式这两种方式。 哨兵模式：哨兵模式是一个分布式架构，它包含若干个哨兵节点和数据节点，每一个哨兵节点都监控着其他的数据节点和哨兵节点，当发现节点不可达时，会对节点做下线标识。如果被标识的是主节点，它就会与其他哨兵节点协商，可以避免误判，当大多数哨兵节点都认为主节点不可达时，它们便会选择出一个哨兵节点来做自动故障转移工作，可以将从节点晋升为主节点，同时还会实时的通知到应用方，整个过程自动的，实现高可用。 集群模式：Redis集群采用虚拟槽分区来实现数据分片，它把所有的键根据哈希函数映射到0-16383整数槽内，计算公式为slot=CRC16(key)&16383，每一个节点负责维护一部分槽以及槽所映射的键值数据。', 1, NULL, '', NULL, '2022-05-22 18:25:49', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (182, '说说Spring Boot的自动装配', NULL, 'answer', '加载spring.factories中的autoConfiguation类，满足conditonal注解的条件时，就实例化该autoConfiguation中定义的bean', 1, NULL, '', NULL, '2022-05-22 18:26:53', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (183, '说说你对面向对象的理解', NULL, 'answer', '面向对象三大特性：封装，继承，多态。封装：一个类对象内部的所有的实现细节对外部是不公开的，外部只能通过该类对象提供的方法对象进行操作，这样做有助于规范操作行为，提高了代码的可维护性。继承：子类可以通过extends关键字继承父类中的一些成员变量和方法。多态：继承于同一父类的多个子类在执行同一个方法时可能会表现出不同的情况，这一特性主要通过方法重写来实现。', 1, NULL, '', NULL, '2022-05-22 18:28:01', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (184, '说说类的实例化过程', NULL, 'answer', ' 在JVM中,对象的创建遵循如下过程： 当JVM遇到一条字节码new指令时,首先将去检查这个指令的参数是否能在常量池中定位到一个类的符号引用,并且检查这个符号引用代表的类是否已被加载、解析和初始化过。如果没有,那必须先执行相应的类加载过程。 在类加载检查通过后,接下来虚拟机将为新生对象分配内存。对象所需内存的大小在类加载完成后便可完全确定,为对象分配空间的任务实际上便等同于把一块确定大小的内存块从Java堆中划分出来。 内存分配完成之后,虚拟机必须将分配到的内存空间都初始化为零值,如果使用了TLAB的话,这一项工作也可以提前至TLAB分配时顺便进行。这步操作保证了对象的实例字段在Java代码中可以不赋初始值就直接使用,使程序能访问到这些字段的数据类型所对应的零值。 接下来,虚拟机还要对对象进行必要的设置,例如这个对象是哪个类的实例、如何才能找到类的元数据信息、对象的哈希码、对象的GC分代年龄等信息。这些信息存放在对象的对象头之中。根据虚拟机当前运行状态的不同,如是否启用偏向锁等,对象头会有不同的设置方式。 在上面工作都完成之后,从虚拟机的视角来看,一个新的对象已经产生了。但是从Java程序的视角看来,对象创建才刚刚开始——构造函数,即Class文件中的`<init>()`方法还没有执行,所有的字段都为默认的零值,对象需要的其他资源和状态信息也还没有按照预定的意图构造好。 一般来说,new指令之后会接着执行`<init>()`方法,按照程序员的意愿对对象进行初始化,这样一个真正可用的对象才算完全被构造出来', 1, NULL, '', NULL, '2022-05-22 18:28:36', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (185, '说说Spring事务管理', NULL, 'answer', '两种事务管理，一个是编程式事务，另一个是声明式事务，编程式事务可以将事务管理的范围控制的更为精确，声明式事务这种方式十分的方便，我们只需在方法上加上Transaction注解，以声明特征即可。\n 1  0 ', 1, NULL, '基于Aspectj AOP配置事务\n编程式事务管理对基于 POJO 的应用来说是唯一选择。我们需要在代码中调用beginTransaction()、commit()、rollback()等事务管理相关的方法，这就是编程式事务管理。\n\n （2）基于 TransactionProxyFactoryBean的声明式事务管理\n\n （3）基于 @Transactional 的声明式事务管理', NULL, '2022-05-22 18:31:02', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (186, '请你讲一下Java 8的新特性', NULL, 'answer', 'Lambda 表达式 − Lambda 允许把函数作为一个方法的参数（函数作为参数传递到方法中）。\n\n方法引用 − 方法引用提供了非常有用的语法，可以直接引用已有Java类或对象（实例）的方法或构造器。与lambda联合使用，方法引用可以使语言的构造更紧凑简洁，减少冗余代码。\n\n默认方法 − 默认方法就是一个在接口里面有了一个实现的方法。\n\n新工具 − 新的编译工具，如：Nashorn引擎 jjs、 类依赖分析器jdeps。\n\nStream API −新添加的Stream API（java.util.stream） 把真正的函数式编程风格引入到Java中。\n\nDate Time API − 加强对日期与时间的处理。\n\nOptional 类 − Optional 类已经成为 Java 8 类库的一部分，用来解决空指针异常。\n\nNashorn, JavaScript 引擎 − Java 8提供了一个新的Nashorn javascript引擎，它允许我们在JVM上运行特定的javascript应用。', 1, NULL, '', NULL, '2022-05-22 18:32:36', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (187, 'Mysql的默认事务隔离级别', NULL, 'select', NULL, NULL, '610', '', NULL, '2022-05-23 16:55:53', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (188, 'Mysql的事务隔离级别', NULL, 'answer', '1、未提交读(Read Uncommitted)：允许脏读，也就是可能读取到其他会话中未提交事务修改的数据\n\n2、提交读(Read Committed)：只能读取到已经提交的数据。Oracle等多数数据库默认都是该级别 (不重复读)\n\n3、可重复读(Repeated Read)：可重复读。在同一个事务内的查询都是事务开始时刻一致的，InnoDB默认级别。在SQL标准中，该隔离级别消除了不可重复读，但是还存在幻象读，但是innoDB解决了幻读\n\n4、串行读(Serializable)：完全串行化的读，每次读都需要获得表级共享锁，读写相互都会阻塞', 1, NULL, '', NULL, '2022-05-23 16:57:59', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (191, '奥特曼的性别', NULL, 'select', NULL, NULL, '617', '', NULL, '2022-06-12 16:16:19', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (192, '下雨怎么办', NULL, 'answer', '', 1, NULL, '', NULL, '2022-06-12 16:16:58', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (193, '', NULL, 'select', NULL, NULL, '620,621,622,623', '', NULL, '2022-06-22 10:58:41', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (196, '', NULL, 'select', NULL, NULL, '628,629,630', '', NULL, '2022-07-15 22:33:55', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (197, '花朵是什么颜色', NULL, 'select', NULL, NULL, '631', '', NULL, '2022-07-20 11:11:44', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (198, 'test', NULL, 'select', NULL, NULL, '632', '', NULL, '2022-08-31 14:09:09', NULL, NULL, 0);
INSERT INTO `exam_questions` VALUES (199, '判断题测试', NULL, 'verdict', NULL, 0, NULL, '', NULL, '2022-09-03 21:11:56', NULL, NULL, 0);

-- ----------------------------
-- Table structure for exam_task
-- ----------------------------
DROP TABLE IF EXISTS `exam_task`;
CREATE TABLE `exam_task`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务名称',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '任务开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '任务结束时间',
  `examination_paper_id` int NOT NULL COMMENT '试卷id',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务状态',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `count` int NULL DEFAULT NULL COMMENT '答题次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_10`(`examination_paper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '考试任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_task
-- ----------------------------
INSERT INTO `exam_task` VALUES (12, '任务一', '2022-08-29 00:00:00', '2022-08-31 00:00:00', 29, 'true', NULL, '2022-08-29 22:50:53', NULL, NULL, 1);

-- ----------------------------
-- Table structure for exam_task_role
-- ----------------------------
DROP TABLE IF EXISTS `exam_task_role`;
CREATE TABLE `exam_task_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `task_id` int NOT NULL COMMENT '考试任务id',
  `role_id` int NOT NULL COMMENT '角色id',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_11`(`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '考试任务与角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_task_role
-- ----------------------------

-- ----------------------------
-- Table structure for exam_user_answer
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_answer`;
CREATE TABLE `exam_user_answer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `examination_paper_id` int NOT NULL COMMENT '试卷id',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `user_id` int NULL DEFAULT NULL COMMENT '答题用户的id',
  `total_points` int NULL DEFAULT NULL COMMENT '总得分',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `task_id` int NULL DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_14`(`examination_paper_id`) USING BTREE,
  INDEX `FK_Reference_17`(`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户答题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_user_answer
-- ----------------------------
INSERT INTO `exam_user_answer` VALUES (1, 29, '2022-08-29 22:51:03', '2022-08-29 22:51:07', 103, 0, 'admin', '2022-08-29 22:51:06', NULL, NULL, 12);
INSERT INTO `exam_user_answer` VALUES (2, 29, '2022-08-30 07:59:43', '2022-08-30 08:00:00', 100, 0, 'test', '2022-08-30 08:00:00', NULL, NULL, 12);

-- ----------------------------
-- Table structure for exam_user_answer_details
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_answer_details`;
CREATE TABLE `exam_user_answer_details`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_answer_id` int NOT NULL COMMENT '答题表id',
  `examination_paper_questions_id` int NOT NULL COMMENT '题目id',
  `questions_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '题目类型',
  `user_answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '题目答案',
  `questions_answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '正确答案',
  `is_correct` tinyint(1) NULL DEFAULT NULL COMMENT '是否正确 0为false 错误  1为正确 true',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改用户',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_15`(`user_answer_id`) USING BTREE,
  INDEX `FK_Reference_16`(`examination_paper_questions_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '答题明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_user_answer_details
-- ----------------------------
INSERT INTO `exam_user_answer_details` VALUES (1, 1, 129, 'selects', 'A', 'E,C,A,D', 0, 'admin', '2022-08-29 22:51:06', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (2, 1, 130, 'select', 'A', 'C', 0, 'admin', '2022-08-29 22:51:06', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (3, 2, 129, 'selects', 'A', 'E,C,A,D', 0, 'test', '2022-08-30 08:00:00', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (4, 2, 130, 'select', 'B', 'C', 0, 'test', '2022-08-30 08:00:00', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (39, 20, 129, 'selects', 'A', 'E,C,A,D', 0, 'test', '2022-09-03 20:55:56', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (40, 20, 130, 'select', 'B', 'C', 0, 'test', '2022-09-03 20:55:56', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (41, 21, 129, 'selects', 'A,D', 'E,C,A,D', 0, 'test', '2022-09-03 21:03:50', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (42, 21, 130, 'select', 'A', 'C', 0, 'test', '2022-09-03 21:03:50', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (43, 22, 129, 'selects', 'A,B,C,D', 'E,C,A,D', 0, 'test', '2022-09-03 21:09:58', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (44, 22, 130, 'select', 'A', 'C', 0, 'test', '2022-09-03 21:09:58', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (45, 23, 129, 'selects', 'A,B,C,D', 'E,C,A,D', 0, 'test', '2022-09-03 21:10:12', NULL, NULL);
INSERT INTO `exam_user_answer_details` VALUES (46, 23, 130, 'select', 'A', 'C', 0, 'test', '2022-09-03 21:10:12', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;