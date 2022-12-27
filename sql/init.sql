SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_authority
-- ----------------------------
DROP TABLE IF EXISTS `ss_authority`;
CREATE TABLE `ss_authority` (
                                `id` int(11) NOT NULL COMMENT '主键',
                                `parent_id` int(11) DEFAULT NULL COMMENT '父权限id',
                                `name` varchar(255) NOT NULL COMMENT '权限名称',
                                `desc` varchar(255) DEFAULT NULL COMMENT '权限描述',
                                `resource` varchar(255) DEFAULT NULL COMMENT '权限类型。0：菜单，1：接口',
                                `type` int(1) NOT NULL COMMENT '权限类型。0：菜单，1：组件',
                                `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Records of ss_authority
-- ----------------------------
BEGIN;
INSERT INTO `ss_authority` VALUES (1, NULL, '用户菜单', '用户菜单', NULL, 0, '2021-08-23 16:15:15');
INSERT INTO `ss_authority` VALUES (101, 1, '菜单1', '菜单1', NULL, 0, '2021-08-23 16:15:36');
INSERT INTO `ss_authority` VALUES (102, 1, '菜单2', '菜单2', NULL, 0, '2021-08-23 16:15:54');
INSERT INTO `ss_authority` VALUES (10101, 101, '问好', '菜单1功能：问好', 'api:hello', 1, '2021-08-23 16:18:01');
INSERT INTO `ss_authority` VALUES (10201, 102, '用户名', '菜单2功能：输出用户名', 'user:name', 1, '2021-08-23 17:02:08');
COMMIT;

-- ----------------------------
-- Table structure for ss_authority_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `ss_authority_role_rel`;
CREATE TABLE `ss_authority_role_rel` (
                                         `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
                                         `authority_id` int(11) NOT NULL COMMENT '权限id',
                                         `role_id` int(11) NOT NULL COMMENT '角色id',
                                         PRIMARY KEY (`id`,`authority_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='权限—角色关联表';

-- ----------------------------
-- Records of ss_authority_role_rel
-- ----------------------------
BEGIN;
INSERT INTO `ss_authority_role_rel` VALUES (1, 1, 1);
INSERT INTO `ss_authority_role_rel` VALUES (2, 101, 1);
INSERT INTO `ss_authority_role_rel` VALUES (3, 102, 1);
INSERT INTO `ss_authority_role_rel` VALUES (4, 10101, 1);
INSERT INTO `ss_authority_role_rel` VALUES (5, 10201, 1);
INSERT INTO `ss_authority_role_rel` VALUES (6, 1, 2);
INSERT INTO `ss_authority_role_rel` VALUES (7, 101, 2);
INSERT INTO `ss_authority_role_rel` VALUES (8, 10101, 2);
COMMIT;

-- ----------------------------
-- Table structure for ss_role
-- ----------------------------
DROP TABLE IF EXISTS `ss_role`;
CREATE TABLE `ss_role` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `name` varchar(255) DEFAULT NULL COMMENT '角色名',
                           `desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
                           `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of ss_role
-- ----------------------------
BEGIN;
INSERT INTO `ss_role` VALUES (1, 'ADMIN', '超级管理员', '2021-08-23 16:08:02');
INSERT INTO `ss_role` VALUES (2, 'USER', '用户', '2021-08-23 16:08:02');
COMMIT;

-- ----------------------------
-- Table structure for ss_user
-- ----------------------------
DROP TABLE IF EXISTS `ss_user`;
CREATE TABLE `ss_user` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `username` varchar(255) NOT NULL COMMENT '用户名',
                           `password` varchar(255) NOT NULL COMMENT '密码',
                           `status` int(4) DEFAULT NULL COMMENT '状态',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ss_user
-- ----------------------------
BEGIN;
INSERT INTO `ss_user` VALUES (1, 'user', '{bcrypt}$2a$10$jhS817qUHgOR4uQSoEBRxO58.rZ1dBCmCTjG8PeuQAX4eISf.zowm', 1);
INSERT INTO `ss_user` VALUES (2, 'test', '{bcrypt}$2a$10$jhS817qUHgOR4uQSoEBRxO58.rZ1dBCmCTjG8PeuQAX4eISf.zowm', 1);
COMMIT;

-- ----------------------------
-- Table structure for ss_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `ss_user_role_rel`;
CREATE TABLE `ss_user_role_rel` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
                                    `rid` int(11) NOT NULL COMMENT '角色表id',
                                    `uid` int(11) NOT NULL COMMENT '用户表id',
                                    PRIMARY KEY (`id`,`rid`,`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户-角色关联表';

-- ----------------------------
-- Records of ss_user_role_rel
-- ----------------------------
BEGIN;
INSERT INTO `ss_user_role_rel` VALUES (1, 1, 1);
INSERT INTO `ss_user_role_rel` VALUES (2, 2, 1);
INSERT INTO `ss_user_role_rel` VALUES (3, 2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
