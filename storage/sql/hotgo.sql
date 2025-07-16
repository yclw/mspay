-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2024-08-27 19:04:42
-- 服务器版本： 5.7.37-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotgo`
--

-- --------------------------------------------------------

--
-- 表的结构 `hg_addon_hgexample_table`
--

CREATE TABLE IF NOT EXISTS `hg_addon_hgexample_table` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `pid` bigint(20) NOT NULL COMMENT '上级ID',
  `level` int(11) DEFAULT '1' COMMENT '树等级',
  `tree` varchar(512) DEFAULT NULL COMMENT '关系树',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `flag` json DEFAULT NULL COMMENT '标签',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `content` longtext COMMENT '内容',
  `image` varchar(255) DEFAULT NULL COMMENT '单图',
  `images` json DEFAULT NULL COMMENT '多图',
  `attachfile` varchar(255) DEFAULT NULL COMMENT '附件',
  `attachfiles` json DEFAULT NULL COMMENT '多附件',
  `map` json DEFAULT NULL COMMENT '动态键值对',
  `star` decimal(5,1) DEFAULT '0.0' COMMENT '推荐星',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  `activity_at` date DEFAULT NULL COMMENT '活动时间',
  `start_at` datetime DEFAULT NULL COMMENT '开启时间',
  `end_at` datetime DEFAULT NULL COMMENT '结束时间',
  `switch` tinyint(1) DEFAULT NULL COMMENT '开关',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `qq` varchar(20) DEFAULT '' COMMENT 'qq',
  `email` varchar(60) DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `hobby` json DEFAULT NULL COMMENT '爱好',
  `channel` int(11) DEFAULT '1' COMMENT '渠道',
  `city_id` bigint(20) DEFAULT '0' COMMENT '所在城市',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_by` bigint(20) DEFAULT '0' COMMENT '创建者',
  `updated_by` bigint(20) DEFAULT '0' COMMENT '更新者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='插件_案例_表格';

--
-- 转存表中的数据 `hg_addon_hgexample_table`
--

INSERT INTO `hg_addon_hgexample_table` (`id`, `pid`, `level`, `tree`, `category_id`, `flag`, `title`, `description`, `content`, `image`, `images`, `attachfile`, `attachfiles`, `map`, `star`, `price`, `views`, `activity_at`, `start_at`, `end_at`, `switch`, `sort`, `avatar`, `sex`, `qq`, `email`, `mobile`, `hobby`, `channel`, `city_id`, `remark`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, '', 1, '[1, 2]', '测试标题', '描述', '<p>这是内容............</p>', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqamvhlq4w3ki6bl.webp', '["https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqap5l9brk2lkavu.jpg", "https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqaqua7fw8ukbbp5.jpg"]', 'http://localhost:8000/attachment/2023-07-18/cu54ama4z54oejf5xx.mp3', '["https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqawg96ba4cuezvv.xlsx", "https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqaup19k9oznyixz.doc"]', '[{"key": "qwe", "value": "123"}, {"key": "asd", "value": "456"}]', '3.0', '88.00', 10, '2022-12-23', '2022-12-01 00:00:00', '2022-12-31 23:59:59', 1, 20, '', 15, '133814250', '133814250@qq.com', '15303830571', '[3, 2, 1]', 1, 140406, '备注！', 1, 1, 1, '2022-12-15 19:30:14', '2023-07-18 20:05:45', NULL),
(2, 0, 1, '', 0, '[1]', '测试2', '描述', '<h2><strong>不知道写点啥！</strong></h2><p><br></p><p><img src="https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqbknawlkgdttuxl.png"></p>', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqbmxmtaq06gbnqa.jpeg', '["https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqborf529kf4cxbm.jpeg"]', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqawg96ba4cuezvv.xlsx', '["https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqaup19k9oznyixz.doc"]', '{}', '2.5', '10.00', 0, '2023-02-18', NULL, NULL, 2, 30, '', 0, '', '1561561@qq.com', '15303830571', '[2, 1]', 3, 140214, '', 1, 1, 1, '2023-02-06 14:17:11', '2023-11-13 17:18:18', NULL),
(3, 1, 2, 'tr_1 ', 0, '[1]', 'AAA', '', '', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqamvhlq4w3ki6bl.webp', '["https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqborf529kf4cxbm.jpeg"]', '', '{}', '{}', '1.0', '10.00', 0, '2023-11-13', NULL, NULL, 1, 40, '', 0, '13311', '1331@qq.cc', '15303830571', '{}', 0, 0, '', 1, 1, 1, '2023-11-13 17:34:42', '2023-11-13 17:55:26', NULL),
(4, 1, 2, 'tr_1 ', 0, '[1]', 'BBB', '', '', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqamvhlq4w3ki6bl.webp', '["https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqborf529kf4cxbm.jpeg"]', '', '{}', '{}', '2.5', '10.00', 0, '2023-11-13', NULL, NULL, 0, 50, '', 0, '12212', '165165@q.cc', '15303830561', '{}', 0, 0, '', 1, 1, 1, '2023-11-13 17:43:58', '2023-11-13 17:43:58', NULL),
(5, 3, 3, 'tr_1 tr_3', 0, '[1]', 'A1', '', '', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqamvhlq4w3ki6bl.webp', '["https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqborf529kf4cxbm.jpeg"]', '', '{}', '{}', '1.0', '10.00', 0, '2023-11-13', NULL, NULL, 1, 60, '', 0, '10121212', '122112@qq.cc', '15303830571', '{}', 3, 0, '', 1, 1, 1, '2023-11-13 17:45:22', '2024-07-21 21:55:01', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `hg_addon_hgexample_tenant_order`
--

CREATE TABLE IF NOT EXISTS `hg_addon_hgexample_tenant_order` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT '购买产品',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单号',
  `money` decimal(10,2) NOT NULL COMMENT '充值金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT '1' COMMENT '订单状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='多租户_充值订单';

--
-- 转存表中的数据 `hg_addon_hgexample_tenant_order`
--

INSERT INTO `hg_addon_hgexample_tenant_order` (`id`, `tenant_id`, `merchant_id`, `user_id`, `product_name`, `order_sn`, `money`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 11, 12, '羊毛混纺大衣', '20230502074731zsv1Vh', '99.90', '', 1, '2024-04-10 00:00:00', '2024-04-19 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_cash`
--

CREATE TABLE IF NOT EXISTS `hg_admin_cash` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `member_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `fee` decimal(10,2) NOT NULL COMMENT '手续费',
  `last_money` decimal(10,2) NOT NULL COMMENT '最终到账金额',
  `ip` varchar(128) NOT NULL COMMENT '申请人IP',
  `status` bigint(20) NOT NULL COMMENT '状态码',
  `msg` varchar(128) NOT NULL COMMENT '处理结果',
  `handle_at` datetime DEFAULT NULL COMMENT '处理时间',
  `created_at` datetime NOT NULL COMMENT '申请时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_提现记录表';

--
-- 转存表中的数据 `hg_admin_cash`
--

INSERT INTO `hg_admin_cash` (`id`, `member_id`, `money`, `fee`, `last_money`, `ip`, `status`, `msg`, `handle_at`, `created_at`) VALUES
(1, 1, '100.00', '3.00', '97.00', '127.0.0.1', 2, '', '2023-05-29 14:17:17', '2023-05-29 14:16:57');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_credits_log`
--

CREATE TABLE IF NOT EXISTS `hg_admin_credits_log` (
  `id` bigint(20) NOT NULL COMMENT '变动ID',
  `member_id` bigint(20) DEFAULT '0' COMMENT '管理员ID',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  `addons_name` varchar(100) NOT NULL DEFAULT '' COMMENT '插件名称',
  `credit_type` varchar(32) NOT NULL DEFAULT '' COMMENT '变动类型',
  `credit_group` varchar(32) DEFAULT NULL COMMENT '变动组别',
  `before_num` decimal(10,2) DEFAULT '0.00' COMMENT '变动前',
  `num` decimal(10,2) DEFAULT '0.00' COMMENT '变动数据',
  `after_num` decimal(10,2) DEFAULT '0.00' COMMENT '变动后',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `ip` varchar(20) DEFAULT NULL COMMENT '操作人IP',
  `map_id` bigint(20) DEFAULT '0' COMMENT '关联ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_资产变动表';

--
-- 转存表中的数据 `hg_admin_credits_log`
--

INSERT INTO `hg_admin_credits_log` (`id`, `member_id`, `app_id`, `addons_name`, `credit_type`, `credit_group`, `before_num`, `num`, `after_num`, `remark`, `ip`, `map_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '', 'balance', 'apply_cash', '99391.78', '-100.00', '99291.78', '后台申请提现', '127.0.0.1', 1, 0, '2023-05-29 14:16:57', '2023-05-29 14:16:57'),
(2, 1, 'admin', '', 'balance', 'op_incr', '99291.78', '-1.00', '99290.78', '为后台用户:8 操作增加余额:1', '127.0.0.1', 0, 0, '2023-07-06 17:17:39', '2023-07-06 17:17:39'),
(3, 8, 'admin', '', 'balance', 'incr', '3.22', '1.00', '4.22', '后台用户:1 为你操作增加余额:1', '127.0.0.1', 0, 0, '2023-07-06 17:17:39', '2023-07-06 17:17:39'),
(4, 1, 'admin', '', 'balance', 'op_incr', '99290.78', '-1.00', '99289.78', '为后台用户:13 操作增加余额:1', '::1', 0, 1, '2024-07-21 21:49:40', '2024-07-21 21:49:40'),
(5, 13, 'admin', '', 'balance', 'incr', '0.00', '1.00', '1.00', '后台用户:1 为你操作增加余额:1', '::1', 0, 1, '2024-07-21 21:49:40', '2024-07-21 21:49:40'),
(6, 1, 'admin', '', 'integral', 'op_incr', '89.00', '-1.00', '88.00', '为后台用户:12 操作增加积分:1', '::1', 0, 1, '2024-07-21 21:49:46', '2024-07-21 21:49:46'),
(7, 12, 'admin', '', 'integral', 'incr', '0.00', '1.00', '1.00', '后台用户:1 为你操作增加积分:1', '::1', 0, 1, '2024-07-21 21:49:46', '2024-07-21 21:49:46');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_dept`
--

CREATE TABLE IF NOT EXISTS `hg_admin_dept` (
  `id` bigint(20) NOT NULL COMMENT '部门ID',
  `pid` bigint(20) DEFAULT '0' COMMENT '父部门ID',
  `name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `code` varchar(255) DEFAULT NULL COMMENT '部门编码',
  `type` varchar(10) DEFAULT NULL COMMENT '部门类型',
  `leader` varchar(32) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `level` int(11) NOT NULL COMMENT '关系树等级',
  `tree` varchar(512) DEFAULT NULL COMMENT '关系树',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '部门状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_部门';

--
-- 转存表中的数据 `hg_admin_dept`
--

INSERT INTO `hg_admin_dept` (`id`, `pid`, `name`, `code`, `type`, `leader`, `phone`, `email`, `level`, `tree`, `sort`, `status`, `created_at`, `updated_at`) VALUES
(100, 0, 'hotgo', 'hotgo', 'company', 'mengshuai', '15303830571', '133814250@qq.com', 1, '', 10, 1, '2022-01-04 09:54:52', '2024-04-24 23:14:24'),
(101, 100, '深圳总公司', 'shenzhen', 'company', 'hotgo', '15888888888', 'hotgo@qq.com', 2, 'tr_100 ', 20, 1, '2022-01-04 17:54:52', '2023-08-02 14:03:23'),
(102, 100, '租户', 'tenant', 'tenant', 'hotgo', '15888888888', 'hotgo@qq.com', 2, 'tr_100 ', 1000, 1, '2022-01-04 01:54:52', '2024-04-13 22:24:58'),
(103, 101, '研发部门', 'science', 'company', 'hotgo', '15888888888', 'hotgo@qq.com', 3, 'tr_100 tr_101 ', 40, 1, '2022-01-04 17:54:52', '2024-04-12 09:29:37'),
(105, 101, '测试部门', 'test', 'company', 'hotgo', '15888888888', 'hotgo@qq.com', 3, 'tr_100 tr_101 ', 50, 1, '2022-01-04 17:54:52', '2024-04-12 09:29:41'),
(106, 101, '财务部门', 'finance', 'company', 'hotgo', '15888888888', 'hotgo@qq.com', 3, 'tr_100 tr_101 ', 60, 1, '2022-01-04 17:54:52', '2024-04-12 09:29:45'),
(107, 101, '运维部门', 'maintain', 'company', 'hotgo', '15888888888', 'hotgo@qq.com', 3, 'tr_100 tr_101 ', 70, 1, '2022-01-04 09:54:52', '2024-04-12 09:29:49'),
(110, 111, '用户', 'user', 'user', 'hotgo', '15888888888', 'hotgo@qq.com', 4, 'tr_100 tr_102 tr_111 ', 10, 1, '2024-04-12 09:18:44', '2024-04-13 22:25:07'),
(111, 102, '商户', 'merchant', 'merchant', 'hotgo', '15888888888', 'hotgo@qq.com', 3, 'tr_100 tr_102 ', 2000, 1, '2024-04-12 09:31:58', '2024-04-14 22:00:20');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_member`
--

CREATE TABLE IF NOT EXISTS `hg_admin_member` (
  `id` bigint(20) NOT NULL COMMENT '管理员ID',
  `dept_id` bigint(20) DEFAULT '0' COMMENT '部门ID',
  `role_id` bigint(20) DEFAULT '10' COMMENT '角色ID',
  `real_name` varchar(32) DEFAULT '' COMMENT '真实姓名',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '帐号',
  `password_hash` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(16) NOT NULL COMMENT '密码盐',
  `password_reset_token` varchar(150) DEFAULT '' COMMENT '密码重置令牌',
  `integral` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '积分',
  `balance` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '余额',
  `avatar` char(150) DEFAULT '' COMMENT '头像',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别',
  `qq` varchar(20) DEFAULT '' COMMENT 'qq',
  `email` varchar(60) DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city_id` bigint(20) DEFAULT '0' COMMENT '城市编码',
  `address` varchar(100) DEFAULT '' COMMENT '联系地址',
  `pid` bigint(20) NOT NULL COMMENT '上级管理员ID',
  `level` int(11) DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(512) NOT NULL COMMENT '关系树',
  `invite_code` varchar(12) DEFAULT NULL COMMENT '邀请码',
  `cash` json DEFAULT NULL COMMENT '提现配置',
  `last_active_at` datetime DEFAULT NULL COMMENT '最后活跃时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_用户表';

--
-- 转存表中的数据 `hg_admin_member`
--

INSERT INTO `hg_admin_member` (`id`, `dept_id`, `role_id`, `real_name`, `username`, `password_hash`, `salt`, `password_reset_token`, `integral`, `balance`, `avatar`, `sex`, `qq`, `email`, `mobile`, `birthday`, `city_id`, `address`, `pid`, `level`, `tree`, `invite_code`, `cash`, `last_active_at`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 100, 1, '孟帅', 'admin', 'a7c588fffeb2c1d99b29879d7fe97c78', '6541561', '', '88.00', '99289.78', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png', 1, '133814250', '133814250@qq.com', '15303830571', '2016-04-16', 410172, '莲花街001号', 0, 1, '', '111', '{"name": "孟帅", "account": "15303830571", "payeeCode": "https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq8mqal5isvcb58g.jpg"}', '2024-08-27 19:02:49', NULL, 1, '2021-02-12 17:59:45', '2024-08-27 19:02:49'),
(3, 100, 2, '测试管理员', 'test', 'a7c588fffeb2c1d99b29879d7fe97c78', '6541561', '', '0.00', '4.00', '', 1, '', 'c@qq.cc', '15303888888', '2016-04-13', 371100, '大潮街道666号', 1, 2, 'tr_1 ', '222', NULL, '2024-04-24 11:47:48', '', 1, '2022-02-11 17:59:45', '2024-04-24 11:47:48'),
(8, 102, 200, '阿萌', 'ameng', '382df3b083a27886edb94e669a857c33', 'hfuUEb', '', '11.00', '4.22', '', 2, '', '', '', NULL, 0, '', 1, 2, 'tr_1 ', '333', NULL, '2024-04-16 18:56:00', '', 1, '2023-02-03 17:34:31', '2024-04-16 18:56:00'),
(9, 100, 206, '黄敏', 'test_finance', '151f5f6bb8b223fc7b589a32effb6f91', 'FhShzw', '', '0.00', '0.00', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png', 1, '', '', '', NULL, 0, '', 1, 2, 'tr_1 ', '5jZUI3uWLfcj', NULL, NULL, '', 1, '2023-08-02 11:30:45', '2023-08-02 11:31:09'),
(11, 111, 209, '刘芳', 'abai', '5787c7a121190011fac8376b1d3e0396', 'puUFvx', '', '0.00', '0.00', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png', 1, '', '', '', NULL, 0, '', 8, 3, 'tr_1 tr_8 ', 'SH5akjqInb2p', NULL, '2024-04-16 18:56:02', '', 1, '2023-08-02 14:24:50', '2024-04-16 18:56:02'),
(12, 110, 210, '李明', 'asong', '18d1e667e2e756c03186ff6d33b18fd4', 'ONYhgf', '', '1.00', '0.00', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png', 1, '', '', '', NULL, 0, '', 11, 4, 'tr_1 tr_8 tr_11 ', 'pHffclXhgeg9', NULL, '2024-04-23 18:05:03', '', 1, '2023-08-02 14:50:49', '2024-07-21 21:49:46'),
(13, 110, 210, '', 'user123', 'a67ec13a65125a6b2566c4229c6c496a', 'auQwMY', '', '0.00', '1.00', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png', 1, '', '', '', NULL, 0, '', 1, 2, 'tr_1 ', 'bpZPxskFMBra', NULL, '2024-04-12 11:52:31', '', 1, '2024-04-12 10:50:46', '2024-07-21 21:49:40');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_member_post`
--

CREATE TABLE IF NOT EXISTS `hg_admin_member_post` (
  `member_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员_用户岗位关联';

--
-- 转存表中的数据 `hg_admin_member_post`
--

INSERT INTO `hg_admin_member_post` (`member_id`, `post_id`) VALUES
(3, 4),
(8, 2),
(9, 4),
(10, 4),
(11, 4);

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_member_role`
--

CREATE TABLE IF NOT EXISTS `hg_admin_member_role` (
  `member_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员_用户角色关联';

--
-- 转存表中的数据 `hg_admin_member_role`
--

INSERT INTO `hg_admin_member_role` (`member_id`, `role_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_menu`
--

CREATE TABLE IF NOT EXISTS `hg_admin_menu` (
  `id` bigint(20) NOT NULL COMMENT '菜单ID',
  `pid` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(255) NOT NULL COMMENT '关系树',
  `title` varchar(64) NOT NULL COMMENT '菜单名称',
  `name` varchar(128) NOT NULL COMMENT '名称编码',
  `path` varchar(200) DEFAULT NULL COMMENT '路由地址',
  `icon` varchar(128) DEFAULT NULL COMMENT '菜单图标',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单类型（1目录 2菜单 3按钮）',
  `redirect` varchar(255) DEFAULT NULL COMMENT '重定向地址',
  `permissions` varchar(512) DEFAULT NULL COMMENT '菜单包含权限集合',
  `permission_name` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `component` varchar(255) NOT NULL COMMENT '组件路径',
  `always_show` tinyint(1) DEFAULT '0' COMMENT '取消自动计算根路由模式',
  `active_menu` varchar(255) DEFAULT NULL COMMENT '高亮菜单编码',
  `is_root` tinyint(1) DEFAULT '0' COMMENT '是否跟路由',
  `is_frame` tinyint(1) DEFAULT '1' COMMENT '是否内嵌',
  `frame_src` varchar(512) DEFAULT NULL COMMENT '内联外部地址',
  `keep_alive` tinyint(1) DEFAULT '0' COMMENT '缓存该路由',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  `affix` tinyint(1) DEFAULT '0' COMMENT '是否固定',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '菜单状态',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=2431 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_菜单权限';

--
-- 转存表中的数据 `hg_admin_menu`
--

INSERT INTO `hg_admin_menu` (`id`, `pid`, `level`, `tree`, `title`, `name`, `path`, `icon`, `type`, `redirect`, `permissions`, `permission_name`, `component`, `always_show`, `active_menu`, `is_root`, `is_frame`, `frame_src`, `keep_alive`, `hidden`, `affix`, `sort`, `remark`, `status`, `updated_at`, `created_at`) VALUES
(2047, 0, 1, '', 'Dashboard', 'Dashboard', '/dashboard', 'DashboardOutlined', 1, '/dashboard/console', 'dashboard', '控制台', 'LAYOUT', 0, '', 0, 1, '', 0, 0, 0, 10, '这是一个备注..', 1, '2023-11-13 15:16:58', '2022-07-17 11:40:03'),
(2048, 2047, 2, 'tr_2047 ', '主控台', 'dashboard_console', 'console', '', 2, '', '/console/stat', '主控台', '/dashboard/console/console', 0, '', 0, 1, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2022-07-17 11:45:09'),
(2050, 2047, 2, 'tr_2047 ', '工作台', 'dashboard_workplace', 'workplace', '', 2, '', 'dashboard_workplace', '工作台', '/dashboard/workplace/workplace', 0, '', 0, 1, '', 0, 0, 0, 40, '', 1, '2023-11-13 15:16:58', '2022-07-17 11:45:09'),
(2061, 0, 1, '', '组织管理', 'Org', '/org', 'AppstoreOutlined', 1, '/org/user', '', '', 'LAYOUT', 1, '', 0, 0, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2022-09-16 06:08:19'),
(2062, 2061, 2, 'tr_2061 ', '后台用户', 'user', 'user', '', 2, '', '/dept/list,/post/list,/role/list,/member/list,/dept/option', '', '/org/user/user', 0, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-09-16 06:09:25'),
(2063, 2061, 2, 'tr_2061 ', '部门管理', 'org_dept', 'dept', '', 2, '', '', '', '/org/dept/dept', 0, '', 0, 0, '', 1, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2022-09-16 14:10:12'),
(2064, 2061, 2, 'tr_2061 ', '岗位管理', 'org_post', 'post', '', 2, '', '/post/list', '', '/org/post/post', 0, '', 0, 0, '', 1, 0, 0, 30, '', 1, '2023-11-13 15:16:58', '2022-09-16 14:11:05'),
(2065, 0, 1, '', '权限管理', 'Permission', '/permission', 'SafetyCertificateOutlined', 1, '/permission/menu', '', '', 'LAYOUT', 1, '', 0, 0, '', 0, 0, 0, 40, '', 1, '2023-11-13 15:16:58', '2022-09-15 22:08:19'),
(2066, 2065, 2, 'tr_2065 ', '菜单权限', 'permission_menu', 'menu', '', 2, '', '/menu/list', '', '/permission/menu/menu', 0, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-09-16 06:09:25'),
(2067, 2065, 2, 'tr_2065 ', '角色权限', 'permission_role', 'role', '', 2, '', '/role/list,/role/dataScope/select,/role/getPermissions', '', '/permission/role/role', 0, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-09-15 22:09:25'),
(2068, 0, 1, '', '系统设置', 'System', '/system', 'SettingOutlined', 1, '/system/config', '', '', 'LAYOUT', 1, '', 0, 0, '', 0, 0, 0, 120, '', 1, '2023-11-17 15:53:10', '2022-09-15 09:17:57'),
(2069, 2068, 2, 'tr_2068 ', '配置管理', 'system_config', 'config', '', 2, '', '', '', '/system/config/system', 0, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-09-16 01:19:01'),
(2070, 2068, 2, 'tr_2068 ', '字典管理', 'system_dict', 'dict', '', 2, '', '', '', '/system/dict/index', 1, '', 0, 0, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2022-09-16 17:33:05'),
(2071, 2068, 2, 'tr_2068 ', '定时任务', 'system_cron', 'cron', '', 2, '', '', '', '/system/cron/index', 1, '', 0, 0, '', 0, 0, 0, 30, '', 1, '2023-11-13 15:16:58', '2022-09-16 17:33:34'),
(2072, 2068, 2, 'tr_2068 ', '黑名单', 'system_blacklist', 'blacklist', '', 2, '', '', '', '/system/blacklist/index', 1, '', 0, 0, '', 0, 0, 0, 40, '', 1, '2023-11-13 15:16:58', '2022-09-16 17:34:01'),
(2073, 2219, 3, 'tr_2093 tr_2219 ', '个人设置', 'home_account', 'account', '', 2, '', '', '', '/home/account/account', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:49', '2022-09-16 17:34:35'),
(2074, 2093, 2, 'tr_2093 ', '日志管理', 'Logs', '/log', '', 1, '/apply/log/log', '', '', 'ParentLayout', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-12 13:41:45', '2022-09-16 01:38:32'),
(2075, 2074, 3, 'tr_2093 tr_2074 ', '全局日志', 'log', 'log', '', 2, '', '/log/list', '', '/log/log/index', 2, '', 2, 2, '', 1, 2, 2, 10, '', 1, '2024-04-24 11:03:39', '2022-09-09 17:39:16'),
(2076, 2074, 3, 'tr_2093 tr_2074 ', '登录日志', 'login_log', 'login-log', '', 2, '', '', '', '/log/login-log/index', 2, '', 2, 2, '', 1, 2, 2, 20, '', 1, '2024-04-24 11:03:42', '2022-09-15 20:04:20'),
(2077, 2074, 3, 'tr_2093 tr_2074 ', '全局日志详情', 'log_view', 'view/:id?', '', 2, '', '/log/view', '', '/log/log/view', 0, 'log', 0, 0, '', 0, 1, 0, 15, '', 1, '2023-11-17 15:27:32', '2022-09-14 20:07:04'),
(2082, 2076, 4, 'tr_2093 tr_2074 tr_2076 ', '登录日志详情', 'loginLogView', 'view/:id?', '', 3, '', '/loginLog/view', '', '/log/login-log/view', 0, 'login_log', 0, 0, '', 0, 1, 0, 62, '', 1, '2023-11-17 15:27:32', '2022-09-14 20:07:04'),
(2083, 2076, 4, 'tr_2093 tr_2074 tr_2076 ', '登录日志列表', 'login_log_index', 'index', '', 3, '', '/loginLog/list', '', '/log/login-log/index', 0, 'login_log', 0, 0, '', 0, 1, 0, 61, '', 1, '2023-11-17 15:27:32', '2022-09-15 04:38:33'),
(2084, 2074, 3, 'tr_2093 tr_2074 ', '短信记录', 'sms_log', 'sms', '', 1, '', '/smsLog/list', '', '/log/sms-log/index', 0, '', 0, 0, '', 0, 0, 0, 70, '', 1, '2023-11-17 15:27:32', '2022-09-17 19:13:51'),
(2087, 2074, 3, 'tr_2093 tr_2074 ', '服务日志', 'monitor_serve_log', 'serve_log', '', 2, '', '', '', '/monitor/serve-log/index', 1, '', 0, 0, '', 0, 0, 0, 30, '', 1, '2023-11-17 15:27:32', '2022-09-18 20:59:28'),
(2088, 2087, 4, 'tr_2093 tr_2074 tr_2087 ', '服务日志详情', 'monitor_serve_log_view', 'view/:id?', '', 3, '', '/serveLog/view', '', '/monitor/serve-log/view', 0, 'monitor_serve_log', 0, 0, '', 0, 1, 0, 62, '', 1, '2023-11-17 15:27:32', '2022-09-14 20:07:04'),
(2089, 2087, 4, 'tr_2093 tr_2074 tr_2087 ', '服务日志列表', 'monitor_serve_log_index', 'index', '', 3, '', '/serveLog/list', '', '/monitor/serve-log/index', 0, 'monitor_serve_log', 0, 0, '', 0, 1, 0, 61, '', 1, '2023-11-17 15:27:32', '2022-09-15 04:38:33'),
(2090, 0, 1, '', '系统监控', 'Monitors', '/monitor', 'FundProjectionScreenOutlined', 1, '', '', '', 'LAYOUT', 1, '', 0, 0, '', 0, 0, 0, 110, '', 1, '2023-11-17 15:34:42', '2022-09-15 17:38:32'),
(2091, 2090, 2, 'tr_2090 ', '在线用户', 'monitor_online', 'online', '', 2, '', '/monitor/userOnlineList', '', '/monitor/online/index', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-09-18 21:23:36'),
(2092, 2090, 2, 'tr_2090 ', '服务监控', 'monitor_serve_monitor', 'serve_monitor', '', 2, '', '', '', '/monitor/serve-monitor/index', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-09-18 21:23:36'),
(2093, 0, 1, '', '系统应用', 'Applys', '/apply', 'CodeSandboxOutlined', 1, '/apply/log/log', '', '', 'LAYOUT', 1, '', 0, 0, '', 0, 0, 0, 100, '', 1, '2024-04-12 15:39:05', '2022-09-18 21:29:53'),
(2094, 2093, 2, 'tr_2093 ', '通知公告', 'apply_notice', 'notice', '', 2, '', '/notice/list', '', '/apply/notice/index', 1, '', 0, 0, '', 0, 0, 0, 300, '', 1, '2023-11-17 15:28:00', '2022-09-18 21:30:19'),
(2095, 2093, 2, 'tr_2093 ', '附件管理', 'apply_attachment', 'attachment', '', 2, '', '/attachment/list', '', '/apply/attachment/index', 1, '', 0, 0, '', 0, 0, 0, 200, '', 1, '2023-11-17 15:27:58', '2022-09-18 21:30:40'),
(2097, 0, 1, '', '开发工具', 'Develops', '/develop', 'CodeOutlined', 1, '/develop/code', '', '', 'LAYOUT', 1, '', 0, 0, '', 0, 0, 0, 210, '', 1, '2023-11-17 15:39:06', '2022-09-18 21:32:27'),
(2109, 2062, 3, 'tr_2061 tr_2062 ', '编辑用户', 'org_user_edit', '', '', 3, '', '/member/edit,/member/view', '', '/', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-22 23:49:17'),
(2110, 2062, 3, 'tr_2061 tr_2062 ', '删除用户', 'org_user_delete', 'user', '', 3, '', '/member/delete', '', '/', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 21:34:51'),
(2111, 2062, 3, 'tr_2061 tr_2062 ', '修改用户状态', 'org_user_status', 'user', '', 3, '', '/member/status', '', '/', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 21:35:48'),
(2112, 2063, 3, 'tr_2061 tr_2063 ', '编辑部门', 'dept_edit', 'dept', '', 3, '', '/dept/edit', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 21:57:15'),
(2113, 2063, 3, 'tr_2061 tr_2063 ', '删除部门', 'dept_delete', 'dept', '', 3, '', '/dept/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 21:57:51'),
(2114, 2063, 3, 'tr_2061 tr_2063 ', '修改部门状态', 'dept_status', 'dept', '', 3, '', '/dept/status', '', '/', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 21:58:40'),
(2115, 2064, 3, 'tr_2061 tr_2064 ', '编辑岗位', 'post_edit', 'post', '', 3, '', '/post/edit', '', '/', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 21:59:30'),
(2116, 2064, 3, 'tr_2061 tr_2064 ', '删除岗位', 'post_delete', 'post', '', 3, '', '/post/delete', '', '/', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 22:00:13'),
(2117, 2064, 3, 'tr_2061 tr_2064 ', '修改岗位状态', 'post_status', 'post', '', 3, '', '/post/status', '', '/', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 22:00:54'),
(2118, 2095, 3, 'tr_2093 tr_2095 ', '上传附件', 'uploadFile', 'attachment', '', 3, '', '/upload/file', '', '/', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2022-11-23 22:14:19'),
(2122, 2228, 3, 'tr_2227 tr_2228 ', '表格例子', 'hgexample_table_index', 'hgexample_table', '', 2, '', '/hgexample/table/list', '', '/addons/hgexample/table/index', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-13 23:54:36', '2022-12-23 15:07:28'),
(2124, 2228, 3, 'tr_2227 tr_2228 ', '表格详情', 'table_view', 'view/:id?', '', 2, '', '/hgexample/table/view', '', '/addons/hgexample/table/view', 0, 'table_index', 0, 0, '', 0, 1, 0, 11, '', 1, '2024-04-13 10:23:05', '2022-09-14 20:07:04'),
(2125, 2097, 2, 'tr_2097 ', '生成配置', 'develop_code_deploy', 'deploy/:id?', '', 2, '', '', '', '/develop/code/deploy', 0, 'develop_code', 0, 0, '', 0, 1, 0, 20, '', 1, '2023-11-13 15:16:58', '2022-12-31 17:16:26'),
(2207, 2076, 4, 'tr_2093 tr_2074 tr_2076 ', '删除登录日志', 'loginLogDelete', '', '', 3, '', '/loginLog/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:32', '2023-01-19 21:06:45'),
(2208, 2076, 4, 'tr_2093 tr_2074 tr_2076 ', '导出登录日志', 'loginLogExport', '', '', 3, '', '/loginLog/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:32', '2023-01-19 21:06:45'),
(2209, 2087, 4, 'tr_2093 tr_2074 tr_2087 ', '删除服务日志', 'serveLogDelete', '', '', 3, '', '/serveLog/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:32', '2023-01-20 18:37:50'),
(2210, 2087, 4, 'tr_2093 tr_2074 tr_2087 ', '导出服务日志', 'serveLogExport', '', '', 3, '', '/serveLog/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:32', '2023-01-20 18:37:50'),
(2211, 2094, 3, 'tr_2093 tr_2094 ', '获取公告最大排序', 'noticeMaxSort', '', '', 3, '', '/notice/maxSort', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-01-18 15:19:43'),
(2212, 2094, 3, 'tr_2093 tr_2094 ', '删除公告', 'noticeDelete', '', '', 3, '', '/notice/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-01-18 15:19:43'),
(2213, 2094, 3, 'tr_2093 tr_2094 ', '修改公告状态', 'noticeStatus', '', '', 3, '', '/notice/status', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-01-18 15:19:43'),
(2214, 2094, 3, 'tr_2093 tr_2094 ', '操作公告开关', 'noticeSwitch', '', '', 3, '', '/notice/switch', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-01-18 15:19:43'),
(2215, 2094, 3, 'tr_2093 tr_2094 ', '发送/编辑通知', 'noticeEditNotify', '', '', 3, '', '/notice/editNotify', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-01-18 15:19:43'),
(2216, 2094, 3, 'tr_2093 tr_2094 ', '发送/编辑公告', 'noticeEditNotice', '', '', 3, '', '/notice/editNotice', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-01-18 15:19:43'),
(2217, 2094, 3, 'tr_2093 tr_2094 ', '发送/编辑私信', 'noticeEditLetter', '', '', 3, '', '/notice/editLetter', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-01-18 15:19:43'),
(2218, 2094, 3, 'tr_2093 tr_2094 ', '编辑公告', 'noticeEdit', '', '', 3, '', '/notice/edit', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-01-18 15:19:43'),
(2219, 2093, 2, 'tr_2093 ', '个人中心', 'home', '/home', 'UserOutlined', 1, '', '', '', 'ParentLayout', 1, '', 0, 2, '', 0, 1, 0, 3000, '', 1, '2023-11-17 15:33:52', '2023-02-01 14:59:40'),
(2220, 2219, 3, 'tr_2093 tr_2219 ', '我的消息', 'home_message', 'message', '', 2, '', '/notice/messageList', '', '/home/message/message', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2023-11-17 15:27:49', '2023-02-01 15:05:17'),
(2221, 2122, 4, 'tr_2227 tr_2228 tr_2122 ', '获取最大排序', 'testMaxSort', '/test/maxSort', '', 3, '', '/hgexample/table/maxSort', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2024-04-13 23:54:11', '2023-02-06 14:29:42'),
(2222, 2122, 4, 'tr_2227 tr_2228 tr_2122 ', '导出测试', 'testExport', '', '', 3, '', '/hgexample/table/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-13 23:54:16', '2023-01-20 18:37:50'),
(2223, 2122, 4, 'tr_2227 tr_2228 tr_2122 ', '删除测试', 'testDelete', '', '', 3, '', '/hgexample/table/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-13 23:54:20', '2023-01-18 15:19:43'),
(2224, 2122, 4, 'tr_2227 tr_2228 tr_2122 ', '修改测试状态', 'testStatus', '', '', 3, '', '/hgexample/table/status', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-13 23:54:23', '2023-01-18 15:19:43'),
(2225, 2122, 4, 'tr_2227 tr_2228 tr_2122 ', '操作测试开关', 'testSwitch', '', '', 3, '', '/hgexample/table/switch', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-13 23:54:26', '2023-01-18 15:19:43'),
(2226, 2122, 4, 'tr_2227 tr_2228 tr_2122 ', '编辑测试', 'testEdit', '', '', 3, '', '/hgexample/table/edit', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-13 23:54:30', '2023-01-18 15:19:43'),
(2227, 0, 1, '', '插件应用', 'addons', '/addons', 'AppstoreOutlined', 1, '/addons/hgexample/hgexample_portal', '', '', 'LAYOUT', 1, '', 0, 2, '', 0, 0, 0, 130, '', 1, '2023-11-13 15:16:58', '2023-02-17 13:44:27'),
(2228, 2227, 2, 'tr_2227 ', '功能案例', 'hgexample', '/hgexample', '', 1, '', '', '', '/hgexample', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-02-17 13:44:27'),
(2229, 2097, 2, 'tr_2097 ', '插件管理', 'develop_addons', 'addons', '', 2, '', '/addons/selects,/addons/list', '', '/develop/addons/index', 1, '', 0, 0, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2022-09-18 21:32:46'),
(2230, 2228, 3, 'tr_2227 tr_2228 ', '应用入口', 'hgexample_portal', 'hgexample_portal', '', 2, '', '', '', '/addons/hgexample/portal/index', 1, '', 0, 0, '', 0, 0, 0, 5, '', 1, '2023-11-13 15:16:58', '2022-09-14 20:07:04'),
(2231, 2228, 3, 'tr_2227 tr_2228 ', '插件配置', 'hgexample_config', 'hgexample_config', '', 2, '', '/hgexample/config/get,/hgexample/config/update', '', '/addons/hgexample/config/system', 1, '', 0, 0, '', 0, 0, 0, 8, '', 1, '2024-04-13 23:53:06', '2022-09-14 20:07:04'),
(2232, 2237, 3, 'tr_2093 tr_2237 ', '在线充值', 'asset_recharge', 'recharge', '', 2, '', '/order/create,/order/option', '', '/asset/recharge/recharge', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2024-04-12 13:53:42', '2023-02-01 15:05:17'),
(2235, 2236, 4, 'tr_2093 tr_2237 tr_2236 ', '资金变动导出', 'creditsLogExport', '', '', 3, '', '/creditsLog/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-12 13:52:59', '2023-04-15 15:59:58'),
(2236, 2237, 3, 'tr_2093 tr_2237 ', '资金变动', 'creditsLogIndex', 'creditsLogIndex', '', 2, '', '/creditsLog/list,/creditsLog/option', '', '/asset/creditsLog/index', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-12 13:53:36', NULL),
(2237, 2093, 2, 'tr_2093 ', '资金管理', 'asset', '/asset', '', 1, '/apply/asset/creditsLogIndex', '', '', 'ParentLayout', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2024-04-12 13:53:54', '2023-04-18 22:16:20'),
(2240, 2232, 4, 'tr_2093 tr_2237 tr_2232 ', '充值记录', 'asset_recharge_log', '', '', 3, '', '/order/list', '', '', 1, '', 0, 2, '', 0, 0, 0, 40, '', 1, '2023-11-17 15:28:23', '2023-04-18 23:26:01'),
(2241, 2232, 4, 'tr_2093 tr_2237 tr_2232 ', '受理退款', 'asset_recharge_accept_refund', '', '', 3, '', '/order/acceptRefund', '', '', 1, '', 0, 2, '', 0, 0, 0, 40, '', 1, '2023-11-17 15:28:23', '2023-04-18 23:26:01'),
(2242, 2232, 4, 'tr_2093 tr_2237 tr_2232 ', '申请退款', 'asset_recharge_apply_refund', '', '', 3, '', '/order/applyRefund', '', '', 1, '', 0, 2, '', 0, 0, 0, 40, '', 1, '2023-11-17 15:28:23', '2023-04-18 23:26:01'),
(2243, 2232, 4, 'tr_2093 tr_2237 tr_2232 ', '删除关闭订单', 'asset_recharge_order_delete', '', '', 3, '', '/order/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 40, '', 1, '2023-11-17 15:28:23', '2023-04-18 23:26:01'),
(2244, 2237, 3, 'tr_2093 tr_2237 ', '提现管理', 'asset_cash', '/cash', '', 2, '', '/cash/list,/cash/apply,/config/getCash', '', '/asset/cash/index', 1, '', 0, 0, '', 0, 0, 0, 30, '', 1, '2024-04-12 13:53:45', '2022-11-29 12:30:00'),
(2245, 2244, 4, 'tr_2093 tr_2237 tr_2244 ', '申请提现', 'cash_apply', '', '', 3, '', '/cash/apply', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:28:23', '2023-04-26 21:37:56'),
(2246, 2244, 4, 'tr_2093 tr_2237 tr_2244 ', '提现打款处理', 'cash_payment', '', '', 3, '', '/cash/payment,/cash/view', '', '', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2023-11-17 15:28:23', '2023-04-26 21:38:25'),
(2247, 2062, 3, 'tr_2061 tr_2062 ', '变更余额', 'org_user_add_balance', '', '', 3, '', '/member/addBalance', '', '', 1, '', 0, 2, '', 0, 0, 0, 40, '', 1, '2023-11-13 15:16:58', '2023-04-27 22:31:02'),
(2248, 2062, 3, 'tr_2061 tr_2062 ', '变更积分', 'org_user_add_integral', '', '', 3, '', '/member/addIntegral', '', '', 1, '', 0, 2, '', 0, 0, 0, 50, '', 1, '2023-11-13 15:16:58', '2023-04-27 22:31:43'),
(2249, 2062, 3, 'tr_2061 tr_2062 ', '重置登录密码', 'member_reset_pwd', '', '', 3, '', '/member/resetPwd', '', '', 1, '', 0, 2, '', 0, 0, 0, 60, '', 1, '2023-11-13 15:16:58', '2023-04-27 22:50:27'),
(2250, 2062, 3, 'tr_2061 tr_2062 ', '用户列表', 'member_list', '', '', 3, '', '/dept/list,/post/list,/role/list,/member/list,/dept/option', '', '', 1, '', 0, 2, '', 0, 0, 0, 0, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:06:17'),
(2251, 2069, 3, 'tr_2068 tr_2069 ', '查看配置', 'config_get', '', '', 3, '', '/config/get', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:18:44'),
(2252, 2069, 3, 'tr_2068 tr_2069 ', '更新配置', 'config_update', '', '', 3, '', '/config/update', '', '', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:19:14'),
(2253, 2070, 3, 'tr_2068 tr_2070 ', '查看字典列表', 'dict_data_list', '', '', 3, '', '/dictType/tree,/dictData/list,/config/typeSelect', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:21:47'),
(2254, 2070, 3, 'tr_2068 tr_2070 ', '编辑字典', 'dict_data_edit', '', '', 3, '', '/dictData/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:22:15'),
(2255, 2070, 3, 'tr_2068 tr_2070 ', '删除字典', 'dict_data_delete', '', '', 3, '', '/dictData/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 30, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:22:15'),
(2256, 2070, 3, 'tr_2068 tr_2070 ', '编辑字典类型', 'dict_type_edit', '', '', 3, '', '/dictType/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 40, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:22:15'),
(2257, 2070, 3, 'tr_2068 tr_2070 ', '删除字典类型', 'dict_type_delete', '', '', 3, '', '/dictType/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 60, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:22:15'),
(2258, 2071, 3, 'tr_2068 tr_2071 ', '任务列表', '/cron/list', '', '', 3, '', '/cron/list', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:25:46'),
(2259, 2071, 3, 'tr_2068 tr_2071 ', '任务分组列表', '/cronGroup/list', '', '', 3, '', '/cronGroup/select,/cronGroup/list', '', '', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:26:40'),
(2260, 2071, 3, 'tr_2068 tr_2071 ', '编辑任务', '/cron/edit', '', '', 3, '', '/cron/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 30, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:27:07'),
(2261, 2071, 3, 'tr_2068 tr_2071 ', '删除任务', '/cron/delete', '', '', 3, '', '/cron/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 40, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:27:59'),
(2262, 2071, 3, 'tr_2068 tr_2071 ', '修改任务状态', '/cron/status', '', '', 3, '', '/cron/status', '', '', 1, '', 0, 2, '', 0, 0, 0, 60, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:28:16'),
(2263, 2071, 3, 'tr_2068 tr_2071 ', '在线执行', '/cron/onlineExec', '', '', 3, '', '/cron/onlineExec', '', '', 1, '', 0, 2, '', 0, 0, 0, 70, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:28:32'),
(2264, 2071, 3, 'tr_2068 tr_2071 ', '编辑任务分组', '/cronGroup/edit', '', '', 3, '', '/cronGroup/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 80, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:28:55'),
(2265, 2071, 3, 'tr_2068 tr_2071 ', '删除任务分组', '/cronGroup/delete', '', '', 3, '', '/cronGroup/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 90, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:29:14'),
(2266, 2072, 3, 'tr_2068 tr_2072 ', '黑名单列表', '/blacklist/list', '', '', 3, '', '/blacklist/list', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:29:59'),
(2267, 2072, 3, 'tr_2068 tr_2072 ', '编辑黑名单策略', '/blacklist/edit', '', '', 3, '', '/blacklist/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:30:25'),
(2268, 2072, 3, 'tr_2068 tr_2072 ', '修改策略状态', '/blacklist/status', '', '', 3, '', '/blacklist/status', '', '', 1, '', 0, 2, '', 0, 0, 0, 30, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:31:07'),
(2269, 2072, 3, 'tr_2068 tr_2072 ', '删除策略', '/blacklist/delete', '', '', 3, '', '/blacklist/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 40, '', 1, '2023-11-13 15:16:58', '2023-04-27 23:31:21'),
(2270, 2073, 4, 'tr_2093 tr_2219 tr_2073 ', '修改登录密码', '/member/updatePwd', '', '', 3, '', '/member/updatePwd', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:49', '2023-04-28 16:40:34'),
(2271, 2073, 4, 'tr_2093 tr_2219 tr_2073 ', '换绑手机号', '/member/updateMobile', '', '', 3, '', '/member/updateMobile', '', '', 1, '', 0, 2, '', 0, 0, 0, 20, '', 1, '2023-11-17 15:27:49', '2023-04-28 16:40:52'),
(2272, 2073, 4, 'tr_2093 tr_2219 tr_2073 ', '换绑邮箱', '/member/updateEmail', '', '', 3, '', '/member/updateEmail', '', '', 1, '', 0, 2, '', 0, 0, 0, 30, '', 1, '2023-11-17 15:27:49', '2023-04-28 16:41:11'),
(2273, 2090, 2, 'tr_2090 ', '在线服务', 'monitor_netconn', 'netconn', '', 1, '', '', '', '/monitor/netconn/index', 1, '', 0, 0, '', 0, 0, 0, 20, '', 1, '2023-11-13 15:16:58', '2022-09-18 21:23:36'),
(2275, 2273, 3, 'tr_2090 tr_2273 ', '服务许可证列表', 'serveLicenseIndex', 'serveLicenseIndex', '', 3, '', '/serveLicense/list', '', '/serveLicense/index', 1, 'monitor_netconn', 0, 0, '', 0, 1, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-07-15 09:36:38'),
(2277, 2275, 4, 'tr_2090 tr_2273 tr_2275 ', '编辑/新增服务许可证', 'serveLicenseEdit', '', '', 3, '', '/serveLicense/edit', '', '', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-07-15 09:36:38'),
(2278, 2275, 4, 'tr_2090 tr_2273 tr_2275 ', '删除服务许可证', 'serveLicenseDelete', '', '', 3, '', '/serveLicense/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-07-15 09:36:38'),
(2279, 2275, 4, 'tr_2090 tr_2273 tr_2275 ', '修改服务许可证状态', 'serveLicenseStatus', '', '', 3, '', '/serveLicense/status', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-07-15 09:36:38'),
(2280, 2275, 4, 'tr_2090 tr_2273 tr_2275 ', '导出服务许可证', 'serveLicenseExport', '', '', 3, '', '/serveLicense/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-07-15 09:36:38'),
(2281, 2275, 4, 'tr_2090 tr_2273 tr_2275 ', '分配许可证路由', 'serveLicenseAssignRouter', '', '', 3, '', '/serveLicense/assignRouter', '', '', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-07-15 09:36:38'),
(2282, 2073, 4, 'tr_2093 tr_2219 tr_2073 ', '更新基本设置', 'memberUpdateProfile', '', '', 3, '', '/member/updateProfile', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:49', '2023-08-02 14:52:48'),
(2283, 2073, 4, 'tr_2093 tr_2219 tr_2073 ', '更新提现设置', 'memberUpdateCash', '', '', 3, '', '/member/updateCash', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:49', '2023-08-02 14:53:34'),
(2292, 2067, 3, 'tr_2065 tr_2067 ', '更新菜单权限', 'updatePermissions', '', '', 3, '', '/role/updatePermissions', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 14:45:56'),
(2293, 2067, 3, 'tr_2065 tr_2067 ', '更新数据权限', 'dataScopeEdit', '', '', 3, '', '/role/dataScope/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 14:51:29'),
(2294, 2067, 3, 'tr_2065 tr_2067 ', '添加/编辑角色', 'roleEdit', '', '', 3, '', '/role/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 14:52:08'),
(2295, 2067, 3, 'tr_2065 tr_2067 ', '删除角色', 'roleDelete', '', '', 3, '', '/role/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 14:52:34'),
(2296, 2066, 3, 'tr_2065 tr_2066 ', '添加/编辑菜单', 'menuEdit', '', '', 3, '', '/menu/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 14:53:24'),
(2297, 2066, 3, 'tr_2065 tr_2066 ', '删除菜单', 'menuDelete', '', '', 3, '', '/menu/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 14:53:52'),
(2298, 2075, 4, 'tr_2093 tr_2074 tr_2075 ', '删除全局日志', 'logDelete', '', '', 3, '', '/log/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:32', '2023-08-11 14:54:37'),
(2299, 2084, 4, 'tr_2093 tr_2074 tr_2084 ', '删除短信记录', 'smsLogDelete', '', '', 3, '', '/smsLog/delete', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-17 15:27:32', '2023-08-11 14:56:47'),
(2300, 2091, 3, 'tr_2090 tr_2091 ', '强制退出用户', 'monitorUserOffline', '', '', 3, '', '/monitor/userOffline', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 14:57:52'),
(2305, 2098, 3, 'tr_2097 tr_2098 ', '查看生成配置', 'genCodesView', '', '', 3, '', '/genCodes/view', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 15:21:28'),
(2306, 2098, 3, 'tr_2097 tr_2098 ', '预览代码', 'genCodesPreview', '', '', 3, '', '/genCodes/preview', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 15:22:18'),
(2307, 2098, 3, 'tr_2097 tr_2098 ', '提交生成', 'genCodesBuild', '', '', 3, '', '/genCodes/build', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 15:22:48'),
(2308, 2098, 3, 'tr_2097 tr_2098 ', '保存生成配置', 'genCodesEdit', '', '', 3, '', '/genCodes/edit', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 15:23:16'),
(2309, 2229, 3, 'tr_2097 tr_2229 ', '更新插件配置', 'addonsUpgrade', '', '', 3, '', '/addons/upgrade', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 15:24:11'),
(2310, 2229, 3, 'tr_2097 tr_2229 ', '卸载插件', 'addonsUninstall', '', '', 3, '', '/addons/uninstall', '', '', 1, '', 0, 2, '', 0, 0, 0, 10, '', 1, '2023-11-13 15:16:58', '2023-08-11 15:24:32'),
(2319, 2228, 3, 'tr_2227 tr_2228 ', '树表例子', '/addons/hgexample/table/tree', '/addons/hgexample/table/tree', '', 2, '', '/hgexample/table/tree,/hgexample/treeTable/select', '', '/addons/hgexample/treeTable/index', 1, '', 0, 2, '', 0, 0, 0, 15, '', 1, '2024-04-13 23:55:01', '2023-11-13 16:46:58'),
(2338, 2228, 3, 'tr_2227 tr_2228 ', '组件示例', 'hgexample_comp', 'hgexample_comp', '', 2, '', '/hgexample/comp/importExcel', '', '/addons/hgexample/comp/index', 1, '', 0, 0, '', 0, 0, 0, 1000, '', 1, '2024-04-13 23:55:45', '2022-09-14 20:07:04'),
(2366, 2097, 2, 'tr_2097 ', '生成演示', 'generateDemo', 'generateDemo', '', 2, '', '', '', 'ParentLayout', 1, '', 0, 2, '', 0, 0, 0, 1000, '', 1, '2024-04-08 10:10:51', '2024-04-08 10:10:51'),
(2367, 2366, 3, 'tr_2097 tr_2366 ', 'CURD列表', 'curdDemo', '/curdDemo', '', 1, '/develop/generateDemo/curdDemo/index', '', '', 'ParentLayout', 1, '', 0, 0, '', 0, 0, 0, 10, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2368, 2367, 4, 'tr_2097 tr_2366 tr_2367 ', 'CUDR列表列表', 'curdDemoIndex', 'index', '', 2, '', '/curdDemo/list', '', '/curdDemo/index', 1, 'curdDemo', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2369, 2368, 5, 'tr_2097 tr_2366 tr_2367 tr_2368 ', 'CUDR列表详情', 'curdDemoView', '', '', 3, '', '/curdDemo/view', '', '', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2370, 2368, 5, 'tr_2097 tr_2366 tr_2367 tr_2368 ', '编辑/新增CUDR列表', 'curdDemoEdit', '', '', 3, '', '/curdDemo/edit', '', '', 1, '', 0, 0, '', 0, 1, 0, 20, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2371, 2370, 6, 'tr_2097 tr_2366 tr_2367 tr_2368 tr_2370 ', '获取CUDR列表最大排序', 'curdDemoMaxSort', '', '', 3, '', '/curdDemo/maxSort', '', '', 1, '', 0, 0, '', 0, 0, 0, 30, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2372, 2368, 5, 'tr_2097 tr_2366 tr_2367 tr_2368 ', '删除CUDR列表', 'curdDemoDelete', '', '', 3, '', '/curdDemo/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 40, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2373, 2368, 5, 'tr_2097 tr_2366 tr_2367 tr_2368 ', '修改CUDR列表状态', 'curdDemoStatus', '', '', 3, '', '/curdDemo/status', '', '', 1, '', 0, 0, '', 0, 0, 0, 50, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2374, 2368, 5, 'tr_2097 tr_2366 tr_2367 tr_2368 ', '操作CUDR列表开关', 'curdDemoSwitch', '', '', 3, '', '/curdDemo/switch', '', '', 1, '', 0, 0, '', 0, 0, 0, 60, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2375, 2368, 5, 'tr_2097 tr_2366 tr_2367 tr_2368 ', '导出CUDR列表', 'curdDemoExport', '', '', 3, '', '/curdDemo/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 70, '', 1, '2024-04-08 10:13:26', '2024-04-08 10:13:26'),
(2376, 2366, 3, 'tr_2097 tr_2366 ', '测试分类', 'testCategory', '/testCategory', '', 1, '/develop/generateDemo/testCategory/index', '', '', 'ParentLayout', 1, '', 0, 0, '', 0, 0, 0, 1000, '', 1, '2024-04-08 23:26:32', '2024-04-08 23:26:32'),
(2377, 2376, 4, 'tr_2097 tr_2366 tr_2376 ', '测试分类列表', 'testCategoryIndex', 'index', '', 2, '', '/testCategory/list', '', '/testCategory/index', 1, 'testCategory', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-08 23:26:32', '2024-04-08 23:26:32'),
(2378, 2377, 5, 'tr_2097 tr_2366 tr_2376 tr_2377 ', '测试分类详情', 'testCategoryView', '', '', 3, '', '/testCategory/view', '', '', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-08 23:26:32', '2024-04-08 23:26:32'),
(2379, 2377, 5, 'tr_2097 tr_2366 tr_2376 tr_2377 ', '编辑/新增测试分类', 'testCategoryEdit', '', '', 3, '', '/testCategory/edit', '', '', 1, '', 0, 0, '', 0, 1, 0, 20, '', 1, '2024-04-08 23:26:32', '2024-04-08 23:26:32'),
(2380, 2379, 6, 'tr_2097 tr_2366 tr_2376 tr_2377 tr_2379 ', '获取测试分类最大排序', 'testCategoryMaxSort', '', '', 3, '', '/testCategory/maxSort', '', '', 1, '', 0, 0, '', 0, 0, 0, 30, '', 1, '2024-04-08 23:26:32', '2024-04-08 23:26:32'),
(2381, 2377, 5, 'tr_2097 tr_2366 tr_2376 tr_2377 ', '删除测试分类', 'testCategoryDelete', '', '', 3, '', '/testCategory/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 40, '', 1, '2024-04-08 23:26:32', '2024-04-08 23:26:32'),
(2382, 2377, 5, 'tr_2097 tr_2366 tr_2376 tr_2377 ', '修改测试分类状态', 'testCategoryStatus', '', '', 3, '', '/testCategory/status', '', '', 1, '', 0, 0, '', 0, 0, 0, 40, '', 1, '2024-04-08 23:26:32', '2024-04-08 23:26:32'),
(2383, 2366, 3, 'tr_2097 tr_2366 ', '普通树表', 'normalTreeDemo', '/normalTreeDemo', '', 1, '/develop/generateDemo/normalTreeDemo/index', '', '', 'ParentLayout', 1, '', 0, 0, '', 0, 0, 0, 200, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2384, 2383, 4, 'tr_2097 tr_2366 tr_2383 ', '普通树表列表', 'normalTreeDemoIndex', 'index', '', 2, '', '/normalTreeDemo/list', '', '/normalTreeDemo/index', 1, 'normalTreeDemo', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2385, 2384, 5, 'tr_2097 tr_2366 tr_2383 tr_2384 ', '普通树表详情', 'normalTreeDemoView', '', '', 3, '', '/normalTreeDemo/view', '', '', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2386, 2384, 5, 'tr_2097 tr_2366 tr_2383 tr_2384 ', '编辑/新增普通树表', 'normalTreeDemoEdit', '', '', 3, '', '/normalTreeDemo/edit', '', '', 1, '', 0, 0, '', 0, 1, 0, 20, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2387, 2386, 6, 'tr_2097 tr_2366 tr_2383 tr_2384 tr_2386 ', '获取普通树表最大排序', 'normalTreeDemoMaxSort', '', '', 3, '', '/normalTreeDemo/maxSort', '', '', 1, '', 0, 0, '', 0, 0, 0, 30, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2388, 2384, 5, 'tr_2097 tr_2366 tr_2383 tr_2384 ', '删除普通树表', 'normalTreeDemoDelete', '', '', 3, '', '/normalTreeDemo/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 40, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2389, 2384, 5, 'tr_2097 tr_2366 tr_2383 tr_2384 ', '修改普通树表状态', 'normalTreeDemoStatus', '', '', 3, '', '/normalTreeDemo/status', '', '', 1, '', 0, 0, '', 0, 0, 0, 50, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2390, 2384, 5, 'tr_2097 tr_2366 tr_2383 tr_2384 ', '导出普通树表', 'normalTreeDemoExport', '', '', 3, '', '/normalTreeDemo/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 70, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2391, 2384, 5, 'tr_2097 tr_2366 tr_2383 tr_2384 ', '获取普通树表关系树选项', 'normalTreeDemoTreeOption', '', '', 3, '', '/normalTreeDemo/treeOption', '', '', 1, '', 0, 0, '', 0, 0, 0, 70, '', 1, '2024-04-09 17:05:13', '2024-04-09 17:05:13'),
(2401, 2366, 3, 'tr_2097 tr_2366 ', '选项树表', 'optionTreeDemo', '/optionTreeDemo', '', 1, '/develop/generateDemo/optionTreeDemo/index', '', '', 'ParentLayout', 1, '', 0, 0, '', 0, 0, 0, 300, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2402, 2401, 4, 'tr_2097 tr_2366 tr_2401 ', '选项树表列表', 'optionTreeDemoIndex', 'index', '', 2, '', '/optionTreeDemo/list', '', '/optionTreeDemo/index', 1, 'optionTreeDemo', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2403, 2402, 5, 'tr_2097 tr_2366 tr_2401 tr_2402 ', '选项树表详情', 'optionTreeDemoView', '', '', 3, '', '/optionTreeDemo/view', '', '', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2404, 2402, 5, 'tr_2097 tr_2366 tr_2401 tr_2402 ', '编辑/新增选项树表', 'optionTreeDemoEdit', '', '', 3, '', '/optionTreeDemo/edit', '', '', 1, '', 0, 0, '', 0, 1, 0, 20, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2405, 2404, 6, 'tr_2097 tr_2366 tr_2401 tr_2402 tr_2404 ', '获取选项树表最大排序', 'optionTreeDemoMaxSort', '', '', 3, '', '/optionTreeDemo/maxSort', '', '', 1, '', 0, 0, '', 0, 0, 0, 30, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2406, 2402, 5, 'tr_2097 tr_2366 tr_2401 tr_2402 ', '删除选项树表', 'optionTreeDemoDelete', '', '', 3, '', '/optionTreeDemo/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 40, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2407, 2402, 5, 'tr_2097 tr_2366 tr_2401 tr_2402 ', '修改选项树表状态', 'optionTreeDemoStatus', '', '', 3, '', '/optionTreeDemo/status', '', '', 1, '', 0, 0, '', 0, 0, 0, 50, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2408, 2402, 5, 'tr_2097 tr_2366 tr_2401 tr_2402 ', '导出选项树表', 'optionTreeDemoExport', '', '', 3, '', '/optionTreeDemo/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 70, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2409, 2402, 5, 'tr_2097 tr_2366 tr_2401 tr_2402 ', '获取选项树表关系树选项', 'optionTreeDemoTreeOption', '', '', 3, '', '/optionTreeDemo/treeOption', '', '', 1, '', 0, 0, '', 0, 0, 0, 70, '', 1, '2024-04-09 17:22:29', '2024-04-09 17:22:29'),
(2417, 2228, 3, 'tr_2227 tr_2228 ', '多租户功能演示', 'tenantOrder', '/tenantOrder', '', 1, '/addons/hgexample/tenantOrder/index', '', '', 'ParentLayout', 1, '', 0, 0, '', 0, 0, 0, 200, '', 1, '2024-04-13 23:37:30', '2024-04-13 23:37:30'),
(2418, 2417, 4, 'tr_2227 tr_2228 tr_2417 ', '多租户功能演示列表', 'tenantOrderIndex', 'index', '', 2, '', '/hgexample/tenantOrder/list', '', '/addons/hgexample/tenantOrder/index', 1, 'tenantOrder', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-13 23:37:30', '2024-04-13 23:37:30'),
(2419, 2418, 5, 'tr_2227 tr_2228 tr_2417 tr_2418 ', '多租户功能演示详情', 'tenantOrderView', '', '', 3, '', '/hgexample/tenantOrder/view', '', '', 1, '', 0, 0, '', 0, 1, 0, 10, '', 1, '2024-04-13 23:37:30', '2024-04-13 23:37:30'),
(2420, 2418, 5, 'tr_2227 tr_2228 tr_2417 tr_2418 ', '编辑/新增多租户功能演示', 'tenantOrderEdit', '', '', 3, '', '/hgexample/tenantOrder/edit', '', '', 1, '', 0, 0, '', 0, 1, 0, 20, '', 1, '2024-04-13 23:37:30', '2024-04-13 23:37:30'),
(2421, 2418, 5, ' tr_2tr_2227228 tr_2417 tr_2418 ', '删除多租户功能演示', 'tenantOrderDelete', '', '', 3, '', '/hgexample/tenantOrder/delete', '', '', 1, '', 0, 0, '', 0, 0, 0, 40, '', 1, '2024-04-13 23:37:30', '2024-04-13 23:37:30'),
(2422, 2418, 5, 'tr_2227 tr_2228 tr_2417 tr_2418 ', '导出多租户功能演示', 'tenantOrderExport', '', '', 3, '', '/hgexample/tenantOrder/export', '', '', 1, '', 0, 0, '', 0, 0, 0, 70, '', 1, '2024-04-13 23:37:30', '2024-04-13 23:37:30');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_notice`
--

CREATE TABLE IF NOT EXISTS `hg_admin_notice` (
  `id` bigint(20) NOT NULL COMMENT '公告ID',
  `title` varchar(64) NOT NULL COMMENT '公告标题',
  `type` bigint(20) NOT NULL COMMENT '公告类型',
  `tag` int(11) DEFAULT NULL COMMENT '标签',
  `content` longtext NOT NULL COMMENT '公告内容',
  `receiver` json DEFAULT NULL COMMENT '接收者',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '公告状态',
  `created_by` bigint(20) DEFAULT NULL COMMENT '发送人',
  `updated_by` bigint(20) DEFAULT '0' COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_通知公告';

--
-- 转存表中的数据 `hg_admin_notice`
--

INSERT INTO `hg_admin_notice` (`id`, `title`, `type`, `tag`, `content`, `receiver`, `remark`, `sort`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(29, '2023年春季学期开学工作通知！', 1, 1, '1.学生：2月11日、2月12日报到，2月13日起安排考试。\n\n2.教职工：2月10日（周五）起正式上班（2月11日、2月12日正常上班）。\n\n3.校内进行的各类社会服务项目，主办部门、单位须关注参与人员的健康状况，如有异常第一时间报告。感染后仍在康复期内的师生，不参加剧烈活动。开学后两周内，原则上不组织各类竞技性较强的体育比赛等活动。\n\n4.全校师生员工要牢固树立健康第一的观念，切实增强个人责任感和防护意识，掌握防护技能，坚持戴口罩、勤洗手等良好卫生习惯，加强身体锻炼，保持健康生活方式，提升健康素养和自我防护能力，当好自身健康第一责任人。符合条件的师生，积极有序接种第二剂次加强针疫苗。', 'null', '', 10, 1, 1, 1, '2023-02-09 12:25:39', '2023-02-09 12:48:08', NULL),
(30, '国务院办公厅关于2023年部分节假日安排的通知', 1, 3, '新华社北京12月8日电  国务院办公厅关于2023年部分节假日安排的通知，全文如下：\n\n　　各省、自治区、直辖市人民政府，国务院\n\n　　各部委、各直属机构：\n\n　　经国务院批准，现将2023年元旦、春节、清明节、劳动节、端午节、中秋节和国庆节放假调休日期的具体安排通知如下。\n\n　　一、元旦：2022年12月31日至2023年1月2日放假调休，共3天。\n\n　　二、春节：1月21日至27日放假调休，共7天。1月28日（星期六）、1月29日（星期日）上班。\n\n　　三、清明节：4月5日放假，共1天。\n\n　　四、劳动节：4月29日至5月3日放假调休，共5天。4月23日（星期日）、5月6日（星期六）上班。\n\n　　五、端午节：6月22日至24日放假调休，共3天。6月25日（星期日）上班。\n\n　　六、中秋节、国庆节：9月29日至10月6日放假调休，共8天。10月7日（星期六）、10月8日（星期日）上班。\n\n　　节假日期间，各地区、各部门要妥善安排好值班和安全、保卫、疫情防控等工作，遇有重大突发事件，要按规定及时报告并妥善处置，确保人民群众祥和平安度过节日假期。', 'null', '', 20, 1, 1, 1, '2023-02-09 12:32:32', '2023-02-09 12:48:28', NULL),
(31, 'hotgo新版本发布啦！', 2, 4, '<p><img src="https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdr8lj1mpl0eu0jpn.png"></p><h2><br></h2><h2>本次更新内容如下：</h2><h2>1. 优化角色权限</h2><h2>2. 优化代码生成</h2><h2>3. ....</h2>', 'null', '', 30, 1, 1, 0, '2023-02-09 12:45:17', '2023-02-09 12:45:17', '2023-06-09 18:04:30'),
(32, '新的好友', 3, 5, '<p><strong>哈喽，你好呀！</strong></p>', '[1, 3, 8]', '', 40, 1, 1, 3, '2023-02-09 12:45:54', '2023-08-11 15:19:04', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_notice_read`
--

CREATE TABLE IF NOT EXISTS `hg_admin_notice_read` (
  `id` bigint(20) NOT NULL COMMENT '记录ID',
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `clicks` int(11) DEFAULT '1' COMMENT '已读次数',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `created_at` datetime DEFAULT NULL COMMENT '阅读时间'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_公告已读记录';

--
-- 转存表中的数据 `hg_admin_notice_read`
--

INSERT INTO `hg_admin_notice_read` (`id`, `notice_id`, `member_id`, `clicks`, `updated_at`, `created_at`) VALUES
(1, 31, 1, 2, '2023-04-26 22:44:51', '2023-04-25 22:59:16'),
(2, 30, 1, 23, '2024-07-21 10:34:04', '2023-04-25 23:01:27'),
(3, 32, 3, 0, '2023-04-28 16:48:41', '2023-04-28 16:48:41'),
(4, 29, 3, 4, '2023-08-11 14:42:22', '2023-04-28 16:48:47'),
(5, 30, 3, 3, '2023-08-11 15:24:45', '2023-04-28 16:48:47'),
(6, 29, 1, 1, '2023-08-11 16:07:58', '2023-06-09 20:26:43'),
(7, 29, 11, 7, '2023-08-02 14:54:26', '2023-08-02 14:54:16'),
(8, 30, 8, 0, '2023-08-02 14:59:21', '2023-08-02 14:59:21');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_oauth`
--

CREATE TABLE IF NOT EXISTS `hg_admin_oauth` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `member_id` bigint(20) DEFAULT '0' COMMENT '用户ID',
  `unionid` varchar(64) DEFAULT '' COMMENT '唯一ID',
  `oauth_client` varchar(32) DEFAULT NULL COMMENT '授权组别',
  `oauth_openid` varchar(128) DEFAULT NULL COMMENT '授权开放ID',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `head_portrait` varchar(512) DEFAULT NULL COMMENT '头像',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `country` varchar(100) DEFAULT '' COMMENT '国家',
  `province` varchar(100) DEFAULT '' COMMENT '省',
  `city` varchar(100) DEFAULT '' COMMENT '市',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(1) DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员_第三方登录';

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_order`
--

CREATE TABLE IF NOT EXISTS `hg_admin_order` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `member_id` bigint(20) DEFAULT '0' COMMENT '管理员id',
  `order_type` varchar(32) NOT NULL COMMENT '订单类型',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `order_sn` varchar(64) DEFAULT '' COMMENT '关联订单号',
  `money` decimal(10,2) NOT NULL COMMENT '充值金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `refund_reason` varchar(255) DEFAULT NULL COMMENT '退款原因',
  `reject_refund_reason` varchar(255) DEFAULT NULL COMMENT '拒绝退款原因',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_充值订单';

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_post`
--

CREATE TABLE IF NOT EXISTS `hg_admin_post` (
  `id` bigint(20) NOT NULL COMMENT '岗位ID',
  `code` varchar(64) NOT NULL COMMENT '岗位编码',
  `name` varchar(50) NOT NULL COMMENT '岗位名称',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_岗位';

--
-- 转存表中的数据 `hg_admin_post`
--

INSERT INTO `hg_admin_post` (`id`, `code`, `name`, `remark`, `sort`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ceo', '董事长', '', 1, 1, '2022-01-04 17:54:52', '2023-07-06 15:17:48'),
(2, 'se', '项目经理', '', 2, 1, '2022-01-04 17:54:52', '2023-01-18 00:00:00'),
(3, 'hr', '人力资源', '', 3, 1, '2022-01-04 17:54:52', '2023-02-26 00:32:40'),
(4, 'user', '普通员工', '', 4, 1, '2022-01-04 17:54:52', '2022-05-15 22:33:09'),
(6, 'test', '测试', '测试..', 5, 1, '2022-08-14 11:41:22', '2023-04-27 23:17:27');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_role`
--

CREATE TABLE IF NOT EXISTS `hg_admin_role` (
  `id` bigint(20) NOT NULL COMMENT '角色ID',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `key` varchar(128) NOT NULL COMMENT '角色权限字符串',
  `data_scope` tinyint(1) DEFAULT '1' COMMENT '数据范围',
  `custom_dept` json DEFAULT NULL COMMENT '自定义部门权限',
  `pid` bigint(20) DEFAULT '0' COMMENT '上级角色ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(512) DEFAULT NULL COMMENT '关系树',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COMMENT='管理员_角色信息';

--
-- 转存表中的数据 `hg_admin_role`
--

INSERT INTO `hg_admin_role` (`id`, `name`, `key`, `data_scope`, `custom_dept`, `pid`, `level`, `tree`, `remark`, `sort`, `status`, `created_at`, `updated_at`) VALUES
(1, '超级管理员', 'super', 1, '[]', 0, 1, NULL, '超级管理员，拥有全部权限', 100, 1, '2022-01-04 17:54:52', '2023-01-12 00:00:00'),
(2, '管理员', 'manage', 3, '[]', 1, 2, 'tr_1 ', '普通管理员，拥有常规的后台管理权限', 200, 1, '2022-01-04 17:54:52', '2023-04-27 00:00:00'),
(200, '租户', 'tenant', 7, '[]', 2, 3, 'tr_1 tr_2 ', '多租户系统中顶层实体客户、组织或实体', 1000, 1, '2023-01-12 00:00:00', '2023-08-11 15:55:46'),
(206, '财务部', 'finance', 2, '[]', 2, 3, 'tr_1 tr_2 ', '', 300, 1, '2023-01-24 20:22:10', '2023-08-11 15:55:46'),
(207, '商务部', 'business', 2, '[]', 2, 3, 'tr_1 tr_2 ', '', 400, 1, '2023-01-24 20:23:27', '2023-08-11 15:55:46'),
(208, '技术部', 'science', 2, '[]', 2, 3, 'tr_1 tr_2 ', '', 500, 1, '2023-01-24 20:23:54', '2023-08-11 15:55:46'),
(209, '商家', 'merchant', 7, '[]', 200, 4, 'tr_1 tr_2 tr_200 ', '租户内部实体，可独立经营但受租户的监管和管理', 2000, 1, '2024-04-12 10:14:21', '2024-04-13 22:24:31'),
(210, '用户', 'user', 5, '[]', 209, 5, 'tr_1 tr_2 tr_200 tr_209 ', '真正使用系统产品的终端用户', 10, 1, '2024-04-12 10:18:45', '2024-04-13 22:24:40');

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_role_casbin`
--

CREATE TABLE IF NOT EXISTS `hg_admin_role_casbin` (
  `id` bigint(20) NOT NULL,
  `p_type` varchar(64) DEFAULT NULL,
  `v0` varchar(256) DEFAULT NULL,
  `v1` varchar(256) DEFAULT NULL,
  `v2` varchar(256) DEFAULT NULL,
  `v3` varchar(256) DEFAULT NULL,
  `v4` varchar(256) DEFAULT NULL,
  `v5` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='管理员_casbin权限表';

-- --------------------------------------------------------

--
-- 表的结构 `hg_admin_role_menu`
--

CREATE TABLE IF NOT EXISTS `hg_admin_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员_角色菜单关联';

--
-- 转存表中的数据 `hg_admin_role_menu`
--

INSERT INTO `hg_admin_role_menu` (`role_id`, `menu_id`) VALUES
(1, 2051),
(1, 2052),
(1, 2053),
(2, 2047),
(2, 2048),
(2, 2049),
(2, 2050),
(2, 2061),
(2, 2062),
(2, 2063),
(2, 2064),
(2, 2065),
(2, 2066),
(2, 2067),
(2, 2068),
(2, 2069),
(2, 2070),
(2, 2071),
(2, 2072),
(2, 2073),
(2, 2074),
(2, 2075),
(2, 2076),
(2, 2077),
(2, 2078),
(2, 2082),
(2, 2083),
(2, 2084),
(2, 2085),
(2, 2086),
(2, 2087),
(2, 2088),
(2, 2089),
(2, 2090),
(2, 2091),
(2, 2092),
(2, 2093),
(2, 2094),
(2, 2095),
(2, 2096),
(2, 2099),
(2, 2100),
(2, 2101),
(2, 2102),
(2, 2103),
(2, 2109),
(2, 2110),
(2, 2111),
(2, 2112),
(2, 2113),
(2, 2114),
(2, 2115),
(2, 2116),
(2, 2117),
(2, 2118),
(2, 2120),
(2, 2121),
(2, 2122),
(2, 2124),
(2, 2198),
(2, 2199),
(2, 2200),
(2, 2201),
(2, 2202),
(2, 2203),
(2, 2204),
(2, 2205),
(2, 2206),
(2, 2207),
(2, 2208),
(2, 2209),
(2, 2210),
(2, 2211),
(2, 2212),
(2, 2213),
(2, 2214),
(2, 2215),
(2, 2216),
(2, 2217),
(2, 2218),
(2, 2219),
(2, 2220),
(2, 2221),
(2, 2222),
(2, 2223),
(2, 2224),
(2, 2225),
(2, 2226),
(2, 2227),
(2, 2228),
(2, 2230),
(2, 2231),
(2, 2232),
(2, 2235),
(2, 2236),
(2, 2237),
(2, 2240),
(2, 2241),
(2, 2242),
(2, 2243),
(2, 2244),
(2, 2245),
(2, 2246),
(2, 2247),
(2, 2248),
(2, 2249),
(2, 2250),
(2, 2251),
(2, 2252),
(2, 2253),
(2, 2254),
(2, 2255),
(2, 2256),
(2, 2257),
(2, 2258),
(2, 2259),
(2, 2260),
(2, 2261),
(2, 2262),
(2, 2263),
(2, 2264),
(2, 2265),
(2, 2266),
(2, 2267),
(2, 2268),
(2, 2269),
(2, 2270),
(2, 2271),
(2, 2272),
(2, 2273),
(2, 2275),
(2, 2277),
(2, 2278),
(2, 2279),
(2, 2280),
(2, 2281),
(2, 2282),
(2, 2283),
(2, 2292),
(2, 2293),
(2, 2294),
(2, 2295),
(2, 2296),
(2, 2297),
(2, 2298),
(2, 2299),
(2, 2300),
(2, 2301),
(2, 2302),
(2, 2319),
(2, 2338),
(2, 2417),
(2, 2418),
(2, 2419),
(2, 2420),
(2, 2421),
(2, 2422),
(100, 2047),
(100, 2048),
(100, 2049),
(100, 2050),
(100, 2061),
(100, 2062),
(100, 2063),
(100, 2064),
(100, 2068),
(100, 2069),
(100, 2070),
(100, 2071),
(100, 2072),
(100, 2073),
(100, 2109),
(100, 2110),
(100, 2111),
(100, 2112),
(100, 2113),
(100, 2114),
(100, 2115),
(100, 2116),
(100, 2117),
(100, 2121),
(100, 2122),
(100, 2124),
(200, 2047),
(200, 2048),
(200, 2050),
(200, 2073),
(200, 2074),
(200, 2075),
(200, 2076),
(200, 2077),
(200, 2082),
(200, 2083),
(200, 2093),
(200, 2095),
(200, 2099),
(200, 2100),
(200, 2102),
(200, 2103),
(200, 2118),
(200, 2120),
(200, 2122),
(200, 2124),
(200, 2207),
(200, 2208),
(200, 2219),
(200, 2220),
(200, 2221),
(200, 2222),
(200, 2223),
(200, 2224),
(200, 2225),
(200, 2226),
(200, 2227),
(200, 2228),
(200, 2230),
(200, 2231),
(200, 2232),
(200, 2235),
(200, 2236),
(200, 2237),
(200, 2240),
(200, 2241),
(200, 2242),
(200, 2243),
(200, 2244),
(200, 2245),
(200, 2270),
(200, 2271),
(200, 2272),
(200, 2282),
(200, 2283),
(200, 2298),
(200, 2319),
(200, 2338),
(200, 2417),
(200, 2418),
(200, 2419),
(200, 2420),
(200, 2421),
(200, 2422),
(201, 2047),
(201, 2048),
(201, 2050),
(201, 2073),
(201, 2074),
(201, 2075),
(201, 2076),
(201, 2077),
(201, 2082),
(201, 2083),
(201, 2093),
(201, 2095),
(201, 2099),
(201, 2100),
(201, 2102),
(201, 2103),
(201, 2118),
(201, 2120),
(201, 2207),
(201, 2208),
(201, 2219),
(201, 2220),
(201, 2232),
(201, 2235),
(201, 2236),
(201, 2237),
(201, 2240),
(201, 2241),
(201, 2242),
(201, 2243),
(201, 2244),
(201, 2245),
(201, 2270),
(201, 2271),
(201, 2272),
(201, 2282),
(201, 2283),
(201, 2298),
(202, 2047),
(202, 2048),
(202, 2049),
(202, 2050),
(202, 2073),
(202, 2074),
(202, 2075),
(202, 2076),
(202, 2077),
(202, 2082),
(202, 2083),
(202, 2099),
(202, 2100),
(202, 2102),
(202, 2103),
(202, 2120),
(202, 2207),
(202, 2208),
(202, 2219),
(202, 2220),
(202, 2270),
(202, 2271),
(202, 2272),
(202, 2282),
(202, 2283),
(206, 2047),
(206, 2048),
(206, 2049),
(206, 2050),
(206, 2061),
(206, 2062),
(206, 2063),
(206, 2064),
(206, 2065),
(206, 2066),
(206, 2067),
(206, 2068),
(206, 2069),
(206, 2070),
(206, 2071),
(206, 2072),
(206, 2074),
(206, 2075),
(206, 2076),
(206, 2077),
(206, 2078),
(206, 2082),
(206, 2083),
(206, 2084),
(206, 2086),
(206, 2087),
(206, 2088),
(206, 2089),
(206, 2090),
(206, 2091),
(206, 2092),
(206, 2093),
(206, 2094),
(206, 2095),
(206, 2096),
(206, 2109),
(206, 2110),
(206, 2111),
(206, 2112),
(206, 2113),
(206, 2114),
(206, 2115),
(206, 2116),
(206, 2117),
(206, 2118),
(206, 2121),
(206, 2122),
(206, 2124),
(206, 2207),
(206, 2208),
(206, 2209),
(206, 2210),
(206, 2211),
(206, 2212),
(206, 2213),
(206, 2214),
(206, 2215),
(206, 2216),
(206, 2217),
(206, 2218),
(206, 2221),
(206, 2222),
(206, 2223),
(206, 2224),
(206, 2225),
(206, 2226),
(207, 2047),
(207, 2048),
(207, 2049),
(207, 2050),
(208, 2047),
(208, 2048),
(208, 2049),
(208, 2050),
(208, 2062),
(208, 2109),
(208, 2110),
(208, 2111),
(208, 2247),
(208, 2250),
(209, 2047),
(209, 2048),
(209, 2050),
(209, 2073),
(209, 2074),
(209, 2075),
(209, 2076),
(209, 2077),
(209, 2082),
(209, 2083),
(209, 2093),
(209, 2095),
(209, 2099),
(209, 2100),
(209, 2102),
(209, 2103),
(209, 2118),
(209, 2120),
(209, 2122),
(209, 2124),
(209, 2207),
(209, 2208),
(209, 2219),
(209, 2220),
(209, 2221),
(209, 2222),
(209, 2223),
(209, 2224),
(209, 2225),
(209, 2226),
(209, 2227),
(209, 2228),
(209, 2230),
(209, 2231),
(209, 2232),
(209, 2235),
(209, 2236),
(209, 2237),
(209, 2240),
(209, 2241),
(209, 2242),
(209, 2243),
(209, 2244),
(209, 2245),
(209, 2270),
(209, 2271),
(209, 2272),
(209, 2282),
(209, 2283),
(209, 2298),
(209, 2319),
(209, 2338),
(209, 2417),
(209, 2418),
(209, 2419),
(209, 2420),
(209, 2421),
(209, 2422),
(210, 2047),
(210, 2048),
(210, 2050),
(210, 2073),
(210, 2074),
(210, 2075),
(210, 2076),
(210, 2077),
(210, 2082),
(210, 2083),
(210, 2093),
(210, 2095),
(210, 2099),
(210, 2100),
(210, 2102),
(210, 2103),
(210, 2118),
(210, 2120),
(210, 2122),
(210, 2124),
(210, 2207),
(210, 2208),
(210, 2219),
(210, 2220),
(210, 2221),
(210, 2222),
(210, 2223),
(210, 2224),
(210, 2225),
(210, 2226),
(210, 2227),
(210, 2228),
(210, 2230),
(210, 2231),
(210, 2232),
(210, 2235),
(210, 2236),
(210, 2237),
(210, 2240),
(210, 2241),
(210, 2242),
(210, 2243),
(210, 2244),
(210, 2245),
(210, 2270),
(210, 2271),
(210, 2272),
(210, 2282),
(210, 2283),
(210, 2298),
(210, 2319),
(210, 2338),
(210, 2417),
(210, 2418),
(210, 2419),
(210, 2420),
(210, 2421),
(210, 2422);

-- --------------------------------------------------------

--
-- 表的结构 `hg_pay_log`
--

CREATE TABLE IF NOT EXISTS `hg_pay_log` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `member_id` bigint(20) DEFAULT '0' COMMENT '会员ID',
  `app_id` varchar(50) DEFAULT NULL COMMENT '应用ID',
  `addons_name` varchar(100) DEFAULT '' COMMENT '插件名称',
  `order_sn` varchar(64) DEFAULT '' COMMENT '关联订单号',
  `order_group` varchar(32) DEFAULT '' COMMENT '组别[默认统一支付类型]',
  `openid` varchar(50) DEFAULT '' COMMENT 'openid',
  `mch_id` varchar(20) DEFAULT '' COMMENT '商户支付账户',
  `subject` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `detail` json DEFAULT NULL COMMENT '支付商品详情',
  `auth_code` varchar(50) DEFAULT '' COMMENT '刷卡码',
  `out_trade_no` varchar(128) DEFAULT '' COMMENT '商户订单号',
  `transaction_id` varchar(128) DEFAULT NULL COMMENT '交易号',
  `pay_type` varchar(32) NOT NULL COMMENT '支付类型',
  `pay_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `actual_amount` decimal(10,2) DEFAULT NULL COMMENT '实付金额',
  `pay_status` tinyint(4) DEFAULT '0' COMMENT '支付状态',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `trade_type` varchar(16) DEFAULT '' COMMENT '交易类型',
  `refund_sn` varchar(128) DEFAULT NULL COMMENT '退款单号',
  `is_refund` tinyint(4) DEFAULT '0' COMMENT '是否退款 ',
  `custom` text COMMENT '自定义参数',
  `create_ip` varchar(128) DEFAULT NULL COMMENT '创建者IP',
  `pay_ip` varchar(128) DEFAULT NULL COMMENT '支付者IP',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '支付通知回调地址',
  `return_url` varchar(255) DEFAULT NULL COMMENT '买家付款成功跳转地址',
  `trace_ids` json DEFAULT NULL COMMENT '链路ID集合',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='支付_支付日志';

-- --------------------------------------------------------

--
-- 表的结构 `hg_pay_refund`
--

CREATE TABLE IF NOT EXISTS `hg_pay_refund` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键ID',
  `member_id` bigint(20) DEFAULT '0' COMMENT '会员ID',
  `app_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用ID',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务订单号',
  `refund_trade_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款交易号',
  `refund_money` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `refund_way` tinyint(4) DEFAULT '1' COMMENT '退款方式',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '申请者IP',
  `reason` varchar(255) DEFAULT NULL COMMENT '申请退款原因',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款备注',
  `status` tinyint(4) DEFAULT '1' COMMENT '退款状态',
  `created_at` datetime DEFAULT NULL COMMENT '申请时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付_退款记录';

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_addons_config`
--

CREATE TABLE IF NOT EXISTS `hg_sys_addons_config` (
  `id` bigint(20) NOT NULL COMMENT '配置ID',
  `addon_name` varchar(128) NOT NULL COMMENT '插件名称',
  `group` varchar(128) NOT NULL COMMENT '分组',
  `name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `type` varchar(32) NOT NULL COMMENT '键值类型:string,int,uint,bool,datetime,date',
  `key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `default_value` varchar(500) NOT NULL COMMENT '默认值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `tip` varchar(500) DEFAULT NULL COMMENT '变量描述',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否为系统默认',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统_插件配置';

--
-- 转存表中的数据 `hg_sys_addons_config`
--

INSERT INTO `hg_sys_addons_config` (`id`, `addon_name`, `group`, `name`, `type`, `key`, `value`, `default_value`, `sort`, `tip`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'hgexample', 'basic', '测试参数', 'string', 'basicTest', 'HotGo', 'HotGo', 10, '测试参数，可以按需添加配置自定义参数', 0, 1, '2023-02-14 10:56:01', '2024-07-21 21:54:49');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_addons_install`
--

CREATE TABLE IF NOT EXISTS `hg_sys_addons_install` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '插件名称',
  `version` varchar(128) NOT NULL DEFAULT '' COMMENT '版本号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统_插件安装记录';

--
-- 转存表中的数据 `hg_sys_addons_install`
--

INSERT INTO `hg_sys_addons_install` (`id`, `name`, `version`, `status`, `created_at`, `updated_at`) VALUES
(1, 'hgexample', 'v1.0.0', 1, '2023-02-02 00:00:00', '2024-07-21 19:05:44');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_attachment`
--

CREATE TABLE IF NOT EXISTS `hg_sys_attachment` (
  `id` bigint(20) NOT NULL COMMENT '文件ID',
  `app_id` varchar(64) NOT NULL COMMENT '应用ID',
  `member_id` bigint(20) DEFAULT '0' COMMENT '管理员ID',
  `cate_id` bigint(20) unsigned DEFAULT '0' COMMENT '上传分类',
  `drive` varchar(64) DEFAULT NULL COMMENT '上传驱动',
  `name` varchar(1000) DEFAULT NULL COMMENT '文件原始名',
  `kind` varchar(16) DEFAULT NULL COMMENT '上传类型',
  `mime_type` varchar(128) NOT NULL DEFAULT '' COMMENT '扩展类型',
  `naive_type` varchar(32) DEFAULT NULL COMMENT 'NaiveUI类型',
  `path` varchar(1000) DEFAULT NULL COMMENT '本地路径',
  `file_url` varchar(1000) DEFAULT NULL COMMENT 'url',
  `size` bigint(20) DEFAULT '0' COMMENT '文件大小',
  `ext` varchar(50) DEFAULT NULL COMMENT '扩展名',
  `md5` varchar(32) DEFAULT NULL COMMENT 'md5校验码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='系统_附件管理';

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_blacklist`
--

CREATE TABLE IF NOT EXISTS `hg_sys_blacklist` (
  `id` bigint(20) NOT NULL COMMENT '黑名单ID',
  `ip` varchar(100) DEFAULT '' COMMENT 'IP地址',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='系统_访问黑名单';

--
-- 转存表中的数据 `hg_sys_blacklist`
--

INSERT INTO `hg_sys_blacklist` (`id`, `ip`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, '39.162.138.4', '', 2, '2022-10-01 22:02:09', '2022-10-01 22:39:23'),
(2, '29.162.138.91', '', 2, '2022-10-01 22:02:09', '2022-10-01 22:39:23'),
(3, '19.162.138.94', '指定IP', 1, '2022-10-01 14:02:09', '2023-01-20 23:11:43'),
(5, '19.162.138.91,19.162.138.96', '多个IP', 1, '2022-10-01 14:02:09', '2023-01-20 23:11:36'),
(6, '19.160.138.0/24', 'IP段', 1, '2022-10-01 14:02:09', '2023-01-20 23:11:30'),
(7, '29.160.138.0-29.160.138.5', 'IP范围', 1, '2022-10-01 14:02:09', '2023-04-27 23:30:46');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_config`
--

CREATE TABLE IF NOT EXISTS `hg_sys_config` (
  `id` bigint(20) NOT NULL COMMENT '配置ID',
  `group` varchar(128) NOT NULL COMMENT '配置分组',
  `name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `type` varchar(32) NOT NULL COMMENT '键值类型:string,int,uint,bool,datetime,date',
  `key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `value` longtext COMMENT '参数键值',
  `default_value` varchar(500) NOT NULL COMMENT '默认值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `tip` varchar(500) DEFAULT NULL COMMENT '变量描述',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否为系统默认',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COMMENT='系统_配置';

--
-- 转存表中的数据 `hg_sys_config`
--

INSERT INTO `hg_sys_config` (`id`, `group`, `name`, `type`, `key`, `value`, `default_value`, `sort`, `tip`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'theme', '默认主题', 'string', 'themeDarkTheme', 'dark', 'dark', 50, '', 1, 1, '2021-01-30 13:27:43', '2022-09-05 20:29:05'),
(2, 'theme', '默认系统主题', 'string', 'themeAppTheme', '#2d8cf0', '#2d8cf0', 60, '', 1, 1, '2021-01-30 13:27:43', '2022-09-05 20:29:05'),
(3, 'theme', '默认侧边栏风格', 'string', 'themeNavTheme', 'light', 'dark', 70, '', 1, 1, '2021-01-30 13:27:43', '2022-09-05 20:29:05'),
(6, 'basic', '网站名称', 'string', 'basicName', 'HotGo', 'HotGo!', 10, '', 1, 1, '2021-01-30 13:27:43', '2024-04-21 22:58:30'),
(7, 'basic', '网站logo', 'string', 'basicLogo', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png', '', 20, '首页使用', 1, 1, '2021-01-30 13:27:43', '2024-04-21 22:58:30'),
(8, 'basic', '网站备案号', 'string', 'basicIcpCode', '豫ICP备16035288号', '', 30, '', 1, 1, '2021-01-30 13:27:43', '2024-04-21 22:58:30'),
(9, 'basic', '网站开启访问', 'bool', 'basicSystemOpen', '1', 'true', 50, '', 1, 1, '2021-01-30 13:27:43', '2024-04-21 22:58:30'),
(10, 'basic', '网站关闭提示', 'string', 'basicCloseText', '网站维护中，暂时无法访问！本网站正在进行系统维护和技术升级，网站暂时无法访问，敬请谅解！', '网站维护中，暂时无法访问！本网站正在进行系统维护和技术升级，网站暂时无法访问，敬请谅解！', 60, '', 1, 1, '2021-01-30 13:27:43', '2024-04-21 22:58:29'),
(11, 'basic', '版权所有', 'string', 'basicCopyright', '© 2019 - 2023 HotGo All Rights Reserved.', '© 2021 - 2023 HotGo All Rights Reserved.', 40, '', 1, 1, '2021-01-30 13:27:43', '2024-04-21 22:58:30'),
(12, 'smtp', 'SMTP服务器', 'string', 'smtpHost', 'smtpdm.aliyun.com', 'smtpdm.aliyun.com', 50, '错误的配置发送邮件会导致服务器超时', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(13, 'smtp', 'SMTP端口', 'int', 'smtpPort', '25', '25', 100, '(不加密默认25,SSL默认465,TLS默认587)', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(14, 'smtp', 'SMTP用户名', 'string', 'smtpUser', 'ali@mail.qvnidaye.com', '', 110, '填写完整用户名', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(15, 'smtp', 'SMTP密码', 'string', 'smtpPass', '', '', 120, '填写您的密码', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(16, 'smtp', '发件人名称', 'string', 'smtpSendName', 'HotGo', 'HotGo', 130, '', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(17, 'smtp', '管理员邮箱', 'string', 'smtpAdminMailbox', '133814250@qq.com', '133814250@qq.com', 140, '', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(28, 'upload', '上传驱动', 'string', 'uploadDrive', 'local', '', 300, 'local：本地;ucloud：ucloud;腾讯云:cos', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(29, 'upload', '上传图片大小限制', 'int', 'uploadImageSize', '1', '2', 310, '单位：MB', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(30, 'upload', '上传图片类型限制', 'string', 'uploadImageType', 'jpg,jpeg,gif,npm,png,svg', 'jpg,jpeg,gif,npm,png,svg', 320, '图片上传后缀类型限制', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(31, 'upload', '上传文件大小限制', 'int', 'uploadFileSize', '1000', '10', 330, '单位：MB', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(32, 'upload', '上传文件类型限制', 'string', 'uploadFileType', 'doc,docx,pdf,zip,tar,xls,xlsx,rar,jpg,jpeg,gif,npm,png,svg', 'doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png,svg', 340, '文件上传后缀类型限制', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(33, 'upload', '本地存储路径', 'string', 'uploadLocalPath', 'attachment/', 'attachment/', 350, '对外访问的相对路径', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(34, 'upload', 'UCloud存储路径', 'string', 'uploadUCloudPath', 'hotgo/attachment/', 'hotgo/attachment/', 360, 'UC对象存储中的相对路径', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(35, 'upload', 'UCloud公钥', 'string', 'uploadUCloudPublicKey', '', '', 370, '获取地址：https://console.ucloud.cn/ufile/token', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(36, 'upload', 'UCloud私钥', 'string', 'uploadUCloudPrivateKey', '', '', 380, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(37, 'upload', 'UCloud地域API', 'string', 'uploadUCloudBucketHost', 'api.ucloud.cn', 'api.ucloud.cn', 390, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(38, 'upload', 'UCloud存储桶名称', 'string', 'uploadUCloudBucketName', 'bufanyun', '', 400, '存储空间名称', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(39, 'upload', 'UCloud存储桶地域host', 'string', 'uploadUCloudFileHost', 'cn-bj.ufileos.com', 'cn-bj.ufileos.com', 410, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(40, 'upload', 'UCloud访问域名', 'string', 'uploadUCloudEndpoint', 'https://gmycos.facms.cn', '', 420, '格式，http://abc.com 或  https://abc.com，不可为空', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(41, 'geo', '高德Web服务key', 'string', 'geoAmapWebKey', '', '', 500, '申请地址：https://console.amap.com/dev/key/app', 1, 1, '2021-01-30 13:27:43', '2022-12-07 15:48:43'),
(42, 'sms', '短信驱动,aliyun：阿里云;tencent：腾讯云', 'string', 'smsDrive', 'tencent', '', 600, '', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(43, 'sms', '阿里云AccessKeyID', 'string', 'smsAliYunAccessKeyID', '', '', 610, '应用key和密钥你可以通过 https://ram.console.aliyun.com/manage/ak 获取', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(44, 'sms', '阿里云AccessKeySecret', 'string', 'smsAliYunAccessKeySecret', '', '', 620, '', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(45, 'sms', '阿里云短信签名', 'string', 'smsAliYunSign', '', '', 630, '申请地址：https://dysms.console.aliyun.com/domestic/text/sign', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(46, 'sms', '阿里云短信模板', 'string', 'smsAliYunTemplate', '[{"key":"login","value":"SMS_198921686"},{"key":"register","value":"SMS_198921686"},{"key":"code","value":"SMS_198921686"},{"key":"resetPwd","value":"SMS_198921686"},{"key":"bind","value":"SMS_198921686"},{"key":"cash","value":"SMS_198921686"}]', '', 640, '', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(47, 'sms', '最小发送间隔', 'int', 'smsMinInterval', '60', '', 600, '同号码', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(48, 'sms', 'IP最大发送次数', 'int', 'smsMaxIpLimit', '10', '', 610, '同IP每天最大允许发送次数', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(49, 'sms', '验证码有效期', 'int', 'smsCodeExpire', '600', '', 610, '单位：秒', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(50, 'smtp', '邮件模板', 'string', 'smtpTemplate', '[{"key":"text","value":"./resource/template/email/text.html"},{"key":"login","value":"./resource/template/email/code.html"},{"key":"register","value":"./resource/template/email/code.html"},{"key":"code","value":"./resource/template/email/code.html"},{"key":"resetPwd","value":"./resource/template/email/resetPwd.html"},{"key":"bind","value":"./resource/template/email/code.html"},{"key":"cash","value":"./resource/template/email/code.html"}]', '', 190, '', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(51, 'smtp', '最小发送间隔', 'int', 'smtpMinInterval', '60', '', 150, '同地址', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(52, 'smtp', 'IP最大发送次数', 'int', 'smtpMaxIpLimit', '10', '', 160, '同IP每天最大允许发送次数', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(53, 'smtp', '验证码有效期', 'int', 'smtpCodeExpire', '600', '', 170, '单位：秒', 1, 1, '2021-01-30 13:27:43', '2023-02-04 16:59:13'),
(54, 'basic', '网站域名', 'string', 'basicDomain', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000', 45, '', 1, 1, '2021-01-30 13:27:43', '2024-04-21 22:58:30'),
(55, 'basic', 'websocket地址', 'string', 'basicWsAddr', 'ws://127.0.0.1:8000/socket', 'ws://127.0.0.1:8000/socket', 48, '', 1, 1, '2021-01-30 13:27:43', '2024-04-21 22:58:30'),
(56, 'upload', 'COS存储路径', 'string', 'uploadCosPath', 'hotgo/attachment/', 'hotgo/attachment/', 450, 'COS对象存储中的相对路径', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(57, 'upload', 'COS秘钥ID', 'string', 'uploadCosSecretId', '', '', 460, '子账号密钥获取可参考 https://cloud.tencent.com/document/product/598/37140', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(58, 'upload', 'COS秘钥', 'string', 'uploadCosSecretKey', '', '', 470, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(59, 'upload', 'COS访问域名', 'string', 'uploadCosBucketURL', '', 'https://xxx-1253625515.cos.ap-beijing.myqcloud.com', 480, '控制台查看地址：https://console.cloud.tencent.com/cos/bucket', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(60, 'upload', 'OSS存储路径', 'string', 'uploadOssPath', 'hotgo/attachment/', 'hotgo/attachment/', 500, 'OSS对象存储中的相对路径', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(61, 'upload', 'OSS秘钥ID', 'string', 'uploadOssSecretId', '', '', 510, '阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(62, 'upload', 'OSS秘钥', 'string', 'uploadOssSecretKey', '', '', 520, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(63, 'upload', 'Bucket 域名', 'string', 'uploadOssBucketURL', 'http://bufanyunoss.oss-cn-qingdao.aliyuncs.com', 'https://xxx.oss-cn-qingdao.aliyuncs.com', 530, 'Bucket 域名', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(64, 'upload', 'OSSEndpoint', 'string', 'uploadOssEndpoint', 'http://oss-cn-qingdao.aliyuncs.com', 'https://oss-cn-qingdao.aliyuncs.com', 540, 'Endpoint（地域节点）', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(65, 'upload', 'OSS存储空间名称', 'string', 'uploadOssBucket', '', '', 550, '存储空间名称，例如examplebucket', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(66, 'upload', '七牛云AccessKey', 'string', 'uploadQiNiuAccessKey', '', '', 600, '创建地址：https://portal.qiniu.com/user/key', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(67, 'upload', '七牛云SecretKey', 'string', 'uploadQiNiuSecretKey', '', '', 610, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(68, 'upload', '七牛云储存路径', 'string', 'uploadQiNiuPath', 'hotgo/attachment/', 'hotgo/attachment/', 620, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(69, 'upload', '七牛云存储空间名称', 'string', 'uploadQiNiuBucket', '', 'bufanyun', 630, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(70, 'upload', '七牛云访问域名', 'string', 'uploadQiNiuDomain', '', '', 640, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(78, 'sms', '腾讯云SecretId', 'string', 'smsTencentSecretId', '', '', 650, '获取地址：https://console.cloud.tencent.com/cam/capi', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(79, 'sms', '腾讯云SecretKey', 'string', 'smsTencentSecretKey', '', '', 660, '', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(80, 'sms', '腾讯云短信应用ID', 'string', 'smsTencentAppId', '', '', 670, '查看地址：https://console.cloud.tencent.com/smsv2/app-manage', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(81, 'sms', '腾讯云短信签名', 'string', 'smsTencentSign', '', '', 680, '查看地址：https://console.cloud.tencent.com/smsv2/csms-sign', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(82, 'sms', '腾讯云接入地域域名', 'string', 'smsTencentEndpoint', 'sms.tencentcloudapi.com', 'sms.tencentcloudapi.com', 690, '默认就近地域接入域名为 sms.tencentcloudapi.com ，也支持指定地域域名访问，例如广州地域的域名为 sms.ap-guangzhou.tencentcloudapi.com', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(83, 'sms', '腾讯云地域信息', 'string', 'smsTencentRegion', 'ap-guangzhou', 'ap-guangzhou', 695, '支持的地域列表参考 https://cloud.tencent.com/document/api/382/52071#.E5.9C.B0.E5.9F.9F.E5.88.97.E8.A1.A8', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(84, 'sms', '腾讯云短信模板', 'string', 'smsTencentTemplate', '[{"key":"login","value":"1758990"},{"key":"register","value":"1758990"},{"key":"code","value":"1758990"},{"key":"resetPwd","value":"1758990"},{"key":"bind","value":"1758990"},{"key":"cash","value":"1758990"}]', '', 698, '', 1, 1, '2021-01-30 13:27:43', '2023-04-10 13:55:32'),
(85, 'pay', 'Debug开关', 'bool', 'payDebug', '1', 'true', 800, '输出请求日志', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(86, 'pay', '支付宝应用ID', 'string', 'payAliPayAppId', '', '', 810, '', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(87, 'pay', '支付宝PrivateKey', 'string', 'payAliPayPrivateKey', 'storage/cert/pay/alipay/alipayPrivateKey', '', 820, '应用私钥，支持PKCS1和PKCS8', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(88, 'pay', '支付宝AppCertPublicKey', 'string', 'payAliPayAppCertPublicKey', 'storage/cert/pay/alipay/appCertPublicKey.crt', '', 830, 'appCertPublicKey.crt证书内容', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(89, 'pay', '支付宝RootCert', 'string', 'payAliPayRootCert', 'storage/cert/pay/alipay/alipayRootCert.crt', '', 840, 'alipayRootCert.crt证书内容', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(90, 'pay', '支付宝PublicKeyRSA2', 'string', 'payAliPayCertPublicKeyRSA2', 'storage/cert/pay/alipay/alipayCertPublicKey_RSA2.crt', '', 850, 'alipayCertPublicKey_RSA2.crt证书内容', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(91, 'pay', '微信支付应用ID', 'string', 'payWxPayAppId', '', '', 860, '', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(92, 'pay', '微信支付商户ID', 'string', 'payWxPayMchId', '', '', 870, '商户ID 或者服务商模式的 sp_mchid', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(93, 'pay', '微信支付证书序列号', 'string', 'payWxPaySerialNo', '', '', 880, '商户证书的证书序列号', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(94, 'pay', '微信支付APIv3Key', 'string', 'payWxPayAPIv3Key', '', '', 890, '商户平台获取', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(95, 'pay', '微信支付私钥', 'string', 'payWxPayPrivateKey', '', '', 900, 'apiclient_key.pem 读取后的内容', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(96, 'pay', 'QQ支付应用ID', 'string', 'payQQPayAppId', '', '', 910, '', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(97, 'pay', 'QQ支付商户ID', 'string', 'payQQPayMchId', '', '', 920, '', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(98, 'pay', 'QQ支付ApiKey', 'string', 'payQQPayApiKey', '', '', 930, 'API秘钥值', 1, 1, '2021-01-30 13:27:43', '2023-08-05 14:00:56'),
(99, 'cash', '提现开关', 'int', 'cashSwitch', '1', '1', 200, '', 1, 1, '2021-09-29 23:51:21', '2022-12-21 21:58:52'),
(100, 'cash', '提现最低手续费（元）', 'int', 'cashMinFee', '3', '3', 210, '', 1, 1, '2021-09-29 23:51:21', '2022-12-21 21:58:52'),
(101, 'cash', '提现最低手续费比率', 'string', 'cashMinFeeRatio', '0.03', '0.03', 220, '', 1, 1, '2021-01-30 13:27:43', '2022-12-21 21:58:52'),
(102, 'cash', '提现最低金额', 'int', 'cashMinMoney', '100', '', 230, '', 1, 1, '2021-01-30 13:27:43', '2022-12-21 21:58:52'),
(103, 'cash', '提现提示信息', 'string', 'cashTips', '<p>温馨提示：请保证支付宝信息姓名、账号、收款码信息一致且无误，否则导致不到账后果自负。</p>\n\n <p>提现条件：满100元后可申请提现。</p>\n <p>提现手续费：固定3元/次，提现金额超过100元按3%收取，封顶135元/次。</p>', '', 240, '', 1, 1, '2021-01-30 13:27:43', '2022-12-21 21:58:52'),
(104, 'wechat', '公众号AppId', 'string', 'officialAccountAppId', '', '', 1000, '请填写微信公众平台后台的AppId', 1, 1, '2021-01-30 13:27:43', '2023-07-26 16:06:53'),
(105, 'wechat', '公众号AppSecret', 'string', 'officialAccountAppSecret', '', '', 1010, '请填写微信公众平台后台的AppSecret', 1, 1, '2021-01-30 13:27:43', '2023-07-26 16:06:53'),
(106, 'wechat', '公众号token', 'string', 'officialAccountToken', '', '', 1020, '', 1, 1, '2021-01-30 13:27:43', '2023-07-26 16:06:53'),
(107, 'wechat', '公众号EncodingAESKey', 'string', 'officialAccountEncodingAESKey', '', '', 1030, '与公众平台接入设置值一致，必须为英文或者数字，长度为43个字符. 请妥善保管,EncodingAESKey 泄露将可能被窃取或篡改平台的操作数据', 1, 1, '2021-01-30 13:27:43', '2023-07-26 16:06:53'),
(108, 'wechat', '开放平台AppId', 'string', 'openPlatformAppId', '', '', 1040, '请填写微信开放平台平台后台的AppId', 1, 1, '2021-01-30 13:27:43', '2023-07-26 16:06:53'),
(109, 'wechat', '开放平台AppSecret', 'string', 'openPlatformAppSecret', '', '', 1050, '请填写微信开放平台平台后台的AppSecret', 1, 1, '2021-01-30 13:27:43', '2023-07-26 16:06:53'),
(110, 'wechat', '开放平台EncodingAESKey', 'string', 'openPlatformEncodingAESKey', '', '', 1060, '与开放平台接入设置值一致，必须为英文或者数字，长度为43个字符. 请妥善保管,EncodingAESKey 泄露将可能被窃取或篡改平台的操作数据', 1, 1, '2021-01-30 13:27:43', '2023-07-26 16:06:53'),
(111, 'wechat', '开放平台token', 'string', 'openPlatformToken', '', '', 1070, '', 1, 1, '2021-01-30 13:27:43', '2023-07-26 16:06:53'),
(112, 'login', '注册开关', 'int', 'loginRegisterSwitch', '1', '1', 1100, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:48'),
(113, 'login', '验证码开关', 'int', 'loginCaptchaSwitch', '1', '1', 1110, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:48'),
(114, 'login', '用户协议', 'string', 'loginProtocol', '<p><span style="color: rgb(31, 34, 37);">用户协议..</span></p>', '', 1120, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:48'),
(115, 'login', '隐私权政策', 'string', 'loginPolicy', '<p><span style="color: rgb(31, 34, 37);">隐私权政策..</span></p>', '', 1130, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:48'),
(116, 'login', '默认注册角色', 'int64', 'loginRoleId', '210', '', 1140, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:49'),
(117, 'login', '默认注册部门', 'int64', 'loginDeptId', '110', '', 1150, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:48'),
(118, 'login', '默认注册岗位', '[]int64', 'loginPostIds', '[4]', '', 1160, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:48'),
(119, 'login', '默认注册头像', 'string', 'loginAvatar', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png', '', 1170, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:48'),
(120, 'login', '强制邀请', 'int', 'loginForceInvite', '2', '1', 1190, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:49'),
(121, 'login', '自动获取openId', 'int', 'loginAutoOpenId', '2', '1', 1195, '', 1, 1, '2021-09-29 23:51:21', '2024-08-27 19:02:48'),
(122, 'upload', 'minio AccessKey', 'string', 'uploadMinioAccessKey', '', '', 650, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(123, 'upload', 'minio SecretKey', 'string', 'uploadMinioSecretKey', '', '', 650, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(124, 'upload', 'minio地域节点', 'string', 'uploadMinioEndpoint', '', '', 650, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(125, 'upload', 'minio是否启用SSL', 'int', 'uploadMinioUseSSL', '1', '', 650, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(126, 'upload', 'minio存储路径', 'string', 'uploadMinioPath', 'hotgo/attachment/', '', 650, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(127, 'upload', 'minio桶名称', 'string', 'uploadMinioBucket', '', '', 650, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(128, 'upload', 'minio对外访问域名', 'string', 'uploadMinioDomain', '', '', 650, '', 1, 1, '2021-01-30 13:27:43', '2024-02-28 16:56:35'),
(129, 'login', '验证码方式', 'int', 'loginCaptchaType', '1', '2', 1200, '', 1, 1, '2025-06-25 17:04:39', '2025-06-25 17:23:15');
-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_cron`
--

CREATE TABLE IF NOT EXISTS `hg_sys_cron` (
  `id` bigint(20) NOT NULL COMMENT '任务ID',
  `group_id` bigint(20) NOT NULL COMMENT '分组ID',
  `title` varchar(128) NOT NULL COMMENT '任务标题',
  `name` varchar(100) DEFAULT NULL COMMENT '任务方法',
  `params` varchar(255) DEFAULT NULL COMMENT '函数参数',
  `pattern` varchar(64) NOT NULL COMMENT '表达式',
  `policy` bigint(20) NOT NULL DEFAULT '1' COMMENT '策略',
  `count` bigint(20) NOT NULL DEFAULT '0' COMMENT '执行次数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '任务状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='系统_定时任务';

--
-- 转存表中的数据 `hg_sys_cron`
--

INSERT INTO `hg_sys_cron` (`id`, `group_id`, `title`, `name`, `params`, `pattern`, `policy`, `count`, `sort`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '测试任务', 'test', '', '* * * * * *', 1, 3, 10, '测试无参数任务', 2, '2022-10-01 22:02:09', '2023-11-25 14:33:05'),
(2, 1, '测试带参数', 'test2', 'hotGo,3,欢迎使用hotGo！', '* * * * * *', 1, 0, 10, '测试有参数任务', 2, '2022-10-01 06:02:09', '2023-11-17 18:38:49'),
(3, 1, '测试带参数-多任务', 'test2', 'hotGo,3,这是同一个执行方法开多个定时任务的实例！', '* * * * * *', 1, 1, 10, '相同的执行方法，可以开启多个任务', 2, '2023-11-17 16:12:26', '2023-11-20 10:11:47'),
(4, 1, '测试带参数-错误', 'test2', '666', '* * * * * *', 1, 1, 10, '参入一个错误的参数格式，来模拟执行出错示例', 2, '2023-11-17 18:23:39', '2023-11-17 18:39:59'),
(10, 1, '关闭过期订单', 'close_order', '', '0 */10 * * * *', 1, 1, 100, '取消过期订单，10分钟运行一次', 2, '2023-04-22 21:58:47', '2023-11-18 11:54:07');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_cron_group`
--

CREATE TABLE IF NOT EXISTS `hg_sys_cron_group` (
  `id` bigint(20) NOT NULL COMMENT '任务分组ID',
  `pid` bigint(20) NOT NULL COMMENT '父类任务分组ID',
  `name` varchar(100) DEFAULT '' COMMENT '分组名称',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '分组状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统_定时任务分组';

--
-- 转存表中的数据 `hg_sys_cron_group`
--

INSERT INTO `hg_sys_cron_group` (`id`, `pid`, `name`, `is_default`, `sort`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, '系统默认', 1, 0, '这是系统默认的任务分组，无法删除！', 1, '2021-02-25 17:38:07', '2021-02-25 19:32:57'),
(2, 0, '测试', 0, 0, '这是测试任务分组', 1, NULL, '2023-05-29 14:59:39');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_dict_data`
--

CREATE TABLE IF NOT EXISTS `hg_sys_dict_data` (
  `id` bigint(20) NOT NULL COMMENT '字典数据ID',
  `label` varchar(100) DEFAULT NULL COMMENT '字典标签',
  `value` varchar(100) DEFAULT NULL COMMENT '字典键值',
  `value_type` varchar(255) NOT NULL DEFAULT 'string' COMMENT '键值数据类型：string,int,uint,bool,datetime,date',
  `type` varchar(100) DEFAULT NULL COMMENT '字典类型',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) DEFAULT '2' COMMENT '是否为系统默认',
  `sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COMMENT='系统_字典数据';

--
-- 转存表中的数据 `hg_sys_dict_data`
--

INSERT INTO `hg_sys_dict_data` (`id`, `label`, `value`, `value_type`, `type`, `list_class`, `is_default`, `sort`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, '男', '1', 'int', 'sys_user_sex', 'success', 1, 10, '性别男', 1, '2021-01-30 13:27:43', '2023-04-27 23:24:58'),
(2, '女', '2', 'int', 'sys_user_sex', 'warning', 1, 20, '性别女', 1, '2021-01-30 13:27:43', '2023-01-06 09:45:21'),
(3, '保密', '3', 'int', 'sys_user_sex', 'error', 1, 30, '性别保密', 1, '2021-01-30 13:27:43', '2023-01-06 09:45:18'),
(6, '正常', '1', 'int', 'sys_normal_disable', 'success', 1, 10, '正常状态', 1, '2021-01-30 13:27:43', '2023-01-18 09:52:44'),
(7, '停用', '2', 'int', 'sys_normal_disable', 'warning', 1, 20, '停用状态', 1, '2021-01-30 13:27:43', '2023-01-18 09:52:48'),
(8, '正常', '1', 'int', 'sys_job_status', 'primary', 1, 10, '正常状态', 1, '2021-01-30 13:27:43', '2023-01-18 09:53:48'),
(9, '暂停', '2', 'int', 'sys_job_status', 'error', 1, 20, '停用状态', 1, '2021-01-30 13:27:43', '2023-01-18 09:53:53'),
(10, '默认', 'DEFAULT', 'string', 'sys_job_group', '', 1, 10, '默认分组', 1, '2021-01-30 13:27:43', NULL),
(11, '系统', 'SYSTEM', 'string', 'sys_job_group', '', 1, 20, '系统分组', 1, '2021-01-30 13:27:43', NULL),
(14, '通知', '1', 'int', 'sys_notice_type', 'warning', 1, 10, '通知', 1, '2021-01-30 13:27:43', '2023-01-05 20:06:47'),
(15, '公告', '2', 'int', 'sys_notice_type', 'error', 1, 20, '公告', 1, '2021-01-30 13:27:43', '2023-01-26 12:08:52'),
(18, '新增', '1', 'int', 'sys_oper_type', 'info', 0, 10, '新增操作', 1, '2021-01-30 13:27:43', NULL),
(19, '修改', '2', 'int', 'sys_oper_type', 'info', 0, 20, '修改操作', 1, '2021-01-30 13:27:43', NULL),
(20, '删除', '3', 'int', 'sys_oper_type', 'error', 0, 30, '删除操作', 1, '2021-01-30 13:27:43', NULL),
(21, '授权', '4', 'int', 'sys_oper_type', 'primary', 0, 40, '授权操作', 1, '2021-01-30 13:27:43', NULL),
(22, '导出', '5', 'int', 'sys_oper_type', 'warning', 0, 50, '导出操作', 1, '2021-01-30 13:27:43', NULL),
(23, '导入', '6', 'int', 'sys_oper_type', 'warning', 0, 60, '导入操作', 1, '2021-01-30 13:27:43', NULL),
(24, '强退', '7', 'int', 'sys_oper_type', 'error', 0, 70, '强退操作', 1, '2021-01-30 13:27:43', NULL),
(25, '生成代码', '8', 'int', 'sys_oper_type', 'warning', 0, 80, '生成操作', 1, '2021-01-30 13:27:43', NULL),
(26, '清空数据', '9', 'int', 'sys_oper_type', 'error', 0, 90, '清空操作', 1, '2021-01-30 13:27:43', NULL),
(28, '校验', '11', 'int', 'sys_oper_type', NULL, 0, 110, '校验', 1, '2021-10-04 22:40:50', '2021-10-04 22:50:02'),
(80, '查询', '10', 'int', 'sys_oper_type', NULL, 0, 100, '查询', 1, '2021-10-04 22:37:38', '2021-10-04 22:49:32'),
(88, 'GET', 'GET', 'string', 'sys_oper_method', '', 0, 10, '', 1, '2022-01-25 10:16:46', '2022-01-25 10:16:46'),
(89, 'POST', 'POST', 'string', 'sys_oper_method', '', 0, 20, '', 1, '2022-01-25 10:16:54', '2022-01-25 10:16:54'),
(90, '请求失败', '-1', 'int', 'req_code', 'warning', 0, 20, '通用错误码', 1, '2022-01-25 10:23:34', '2023-01-06 09:58:17'),
(91, '请求成功', '0', 'int', 'req_code', 'success', 0, 10, '通用成功码', 1, '2022-01-25 10:23:54', '2023-01-06 09:58:14'),
(92, '内部发生错误', '50', 'int', 'req_code', 'error', 0, 30, '内部错误', 1, '2022-01-25 10:24:06', '2023-01-06 09:56:31'),
(95, '不允许的操作', '59', 'int', 'req_code', 'error', 0, 60, '当前操作的给定参数无效', 1, '2022-01-25 10:24:38', '2023-01-06 09:56:00'),
(103, '没有授权登录', '61', 'int', 'req_code', 'warning', 0, 140, '未授权', 1, '2022-01-25 10:26:12', '2023-01-06 09:55:50'),
(109, '业务验证失败', '300', 'int', 'req_code', 'warning', 0, 200, '业务验证失败', 1, '2022-01-25 10:27:51', '2023-01-06 09:56:51'),
(110, '大于50ms', '50', 'int64', 'req_take_up_time', 'success', 0, 10, '', 1, '2022-01-25 15:51:45', '2023-01-06 09:59:50'),
(111, '大于100ms', '100', 'int64', 'req_take_up_time', 'success', 0, 20, '', 1, '2022-01-25 15:51:57', '2023-01-06 09:59:53'),
(112, '大于200ms', '200', 'int64', 'req_take_up_time', 'info', 0, 30, '', 1, '2022-01-25 15:52:21', '2023-01-06 09:59:57'),
(113, '大于500ms', '500', 'int64', 'req_take_up_time', 'warning', 0, 40, '', 1, '2022-01-25 15:52:32', '2023-01-06 10:00:02'),
(114, '大于1000ms', '1000', 'int64', 'req_take_up_time', 'error', 0, 50, '', 1, '2022-01-25 15:52:57', '2023-01-06 10:00:06'),
(115, '大于5000ms', '5000', 'int64', 'req_take_up_time', 'error', 0, 60, '', 1, '2022-01-24 23:54:15', '2023-01-06 10:00:10'),
(116, '开启', '1', 'int', 'sys_switch', 'info', 1, 10, '系统开关开启', 1, '2021-01-30 13:27:43', '2022-12-27 00:00:00'),
(117, '关闭', '2', 'int', 'sys_switch', 'warning', 1, 20, '系统开关关闭', 1, '2021-01-30 13:27:43', '2022-12-27 00:00:00'),
(118, 'PC端', '1', 'int', 'sys_user_channel', 'info', 0, 80, '用户来源', 1, '2021-01-30 13:27:43', '2023-01-05 17:01:21'),
(119, '移动端', '2', 'int', 'sys_user_channel', 'success', 0, 80, '用户来源', 1, '2021-01-30 13:27:43', '2023-01-05 16:52:48'),
(120, '微信', '3', 'int', 'sys_user_channel', 'warning', 0, 80, '用户来源', 1, '2021-01-30 13:27:43', '2023-01-05 16:52:43'),
(121, '抖音', '4', 'int', 'sys_user_channel', 'error', 0, 80, '用户来源', 1, '2021-01-30 13:27:43', '2023-01-05 16:52:39'),
(122, '音乐', '1', 'int', 'sys_user_hobby', 'error', 0, 80, '爱好类型', 1, '2021-01-30 13:27:43', '2023-01-06 09:45:11'),
(123, '读书', '2', 'int', 'sys_user_hobby', 'info', 0, 80, '爱好类型', 1, '2021-01-30 13:27:43', '2023-01-06 09:45:08'),
(124, '游泳', '3', 'int', 'sys_user_hobby', 'warning', 0, 80, '爱好类型', 1, '2021-01-30 13:27:43', '2023-01-06 09:45:05'),
(125, '本地存储', 'local', 'string', 'config_upload_drive', 'info', 1, 10, '', 1, '2022-12-30 17:57:50', '2023-01-06 10:02:31'),
(126, 'ucloud', 'ucloud', 'string', 'config_upload_drive', 'success', 1, 20, '', 1, '2022-12-30 17:58:26', '2022-12-30 17:58:26'),
(127, 'DEBU', 'DEBU', 'string', 'sys_log_type', 'default', 0, 10, '', 1, '2023-01-20 16:56:23', '2023-01-20 16:56:23'),
(128, 'INFO', 'INFO', 'string', 'sys_log_type', 'info', 0, 20, '', 1, '2023-01-20 16:56:34', '2023-01-20 16:56:34'),
(129, 'WARN', 'WARN', 'string', 'sys_log_type', 'warning', 0, 30, '', 1, '2023-01-20 16:56:47', '2023-01-20 16:56:47'),
(130, 'ERRO', 'ERRO', 'string', 'sys_log_type', 'error', 0, 50, '', 1, '2023-01-20 16:57:01', '2023-01-20 16:57:01'),
(131, 'PANI', 'PANI', 'string', 'sys_log_type', 'error', 0, 60, '', 1, '2023-01-20 16:57:23', '2023-01-20 16:57:23'),
(132, 'FATA', 'FATA', 'string', 'sys_log_type', 'error', 0, 70, '', 1, '2023-01-20 16:57:37', '2023-01-20 16:57:37'),
(133, '阿里云', 'aliyun', 'string', 'config_sms_drive', 'success', 0, 10, '', 1, '2023-01-21 10:27:59', '2023-01-21 10:27:59'),
(134, '腾讯云', 'tencent', 'string', 'config_sms_drive', 'info', 0, 20, '', 1, '2023-01-21 10:28:23', '2023-01-21 10:28:23'),
(135, '通用验证码', 'code', 'string', 'config_sms_template', 'info', 0, 10, '', 1, '2023-01-21 10:28:39', '2023-01-21 20:40:09'),
(136, '登录', 'login', 'string', 'config_sms_template', 'success', 0, 20, '', 1, '2023-01-21 10:28:48', '2023-01-21 10:28:48'),
(137, '注册', 'register', 'string', 'config_sms_template', 'warning', 0, 30, '', 1, '2023-01-21 10:28:58', '2023-01-21 10:28:58'),
(138, '重置密码', 'resetPwd', 'string', 'config_sms_template', 'error', 0, 40, '', 1, '2023-01-21 10:29:10', '2023-01-21 10:29:10'),
(139, '绑定手机号', 'bind', 'string', 'config_sms_template', 'info', 0, 50, '', 1, '2023-01-21 10:29:22', '2023-01-21 10:29:22'),
(140, '申请提现', 'cash', 'string', 'config_sms_template', 'primary', 0, 60, '', 1, '2023-01-21 10:29:36', '2023-01-21 10:29:40'),
(141, '私信', '3', 'int', 'sys_notice_type', 'info', 0, 30, '', 1, '2023-01-26 12:08:42', '2023-01-26 12:08:42'),
(142, '一般', '1', 'int', 'sys_notice_tag', 'info', 0, 10, '', 1, '2023-01-26 12:13:04', '2023-01-26 12:16:07'),
(143, '重要', '2', 'int', 'sys_notice_tag', 'error', 0, 20, '', 1, '2023-01-26 12:13:36', '2023-01-26 12:13:36'),
(144, '提醒', '3', 'int', 'sys_notice_tag', 'warning', 0, 30, '', 1, '2023-01-26 12:13:52', '2023-01-26 12:13:52'),
(145, '注意', '4', 'int', 'sys_notice_tag', 'success', 0, 40, '', 1, '2023-01-26 12:14:12', '2023-01-26 12:14:12'),
(146, '调试', '5', 'int', 'sys_notice_tag', 'default', 0, 50, '', 1, '2023-01-26 12:15:59', '2023-01-26 12:15:59'),
(147, '通用验证码', 'code', 'string', 'config_ems_template', 'info', 0, 10, '', 1, '2023-01-21 10:28:39', '2023-01-21 20:40:09'),
(148, '登录', 'login', 'string', 'config_ems_template', 'success', 0, 20, '', 1, '2023-01-21 10:28:48', '2023-01-21 10:28:48'),
(149, '注册', 'register', 'string', 'config_ems_template', 'warning', 0, 30, '', 1, '2023-01-21 10:28:58', '2023-01-21 10:28:58'),
(150, '重置密码', 'resetPwd', 'string', 'config_ems_template', 'error', 0, 40, '', 1, '2023-01-21 10:29:10', '2023-01-21 10:29:10'),
(151, '绑定手机号', 'bind', 'string', 'config_ems_template', 'info', 0, 50, '', 1, '2023-01-21 10:29:22', '2023-01-21 10:29:22'),
(152, '申请提现', 'cash', 'string', 'config_ems_template', 'primary', 0, 60, '', 1, '2023-01-21 10:29:36', '2023-01-21 10:29:40'),
(153, '富文本', 'text', 'string', 'config_ems_template', 'default', 0, 0, '自定义编辑邮件内容时使用', 1, '2023-01-21 10:29:36', '2023-05-29 14:30:49'),
(154, '腾讯云', 'cos', 'string', 'config_upload_drive', 'info', 1, 30, '', 1, '2022-12-30 17:58:26', '2022-12-30 17:58:26'),
(155, '阿里云', 'oss', 'string', 'config_upload_drive', 'info', 1, 40, '', 1, '2022-12-30 17:58:26', '2022-12-30 17:58:26'),
(156, '七牛云', 'qiniu', 'string', 'config_upload_drive', 'success', 1, 50, '', 1, '2022-12-30 17:58:26', '2022-12-30 17:58:26'),
(157, 'minio', 'minio', 'string', 'config_upload_drive', 'default', 0, 60, '', 1, '2023-11-11 16:45:12', '2023-11-11 16:45:12'),
(158, '目录', '1', 'int', 'sys_menu_types', 'success', 1, 10, '', 1, '2021-01-30 13:27:43', '2023-04-27 23:24:58'),
(159, '菜单', '2', 'int', 'sys_menu_types', 'primary', 1, 20, '', 1, '2021-01-30 13:27:43', '2023-04-27 23:24:58'),
(160, '按钮', '3', 'int', 'sys_menu_types', 'info', 1, 30, '', 1, '2021-01-30 13:27:43', '2023-04-27 23:24:58'),
(161, '主目录', 'LAYOUT', 'string', 'sys_menu_component', 'default', 0, 10, '', 1, '2024-04-16 13:35:49', '2024-04-16 13:35:49'),
(162, '子目录', 'ParentLayout', 'string', 'sys_menu_component', 'default', 0, 20, '', 1, '2024-04-16 13:36:04', '2024-04-16 13:36:04'),
(163, '内嵌链接', 'IFRAME', 'string', 'sys_menu_component', 'default', 0, 30, '', 1, '2024-04-16 13:36:30', '2024-04-16 13:36:30'),
(164, '登录成功', '1', 'int', 'sys_login_status', 'success', 0, 10, '', 1, '2024-04-16 15:21:41', '2024-04-16 15:21:41'),
(165, '登录失败', '2', 'int', 'sys_login_status', 'warning', 0, 20, '', 1, '2024-04-16 15:22:02', '2024-04-16 15:22:02');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_dict_type`
--

CREATE TABLE IF NOT EXISTS `hg_sys_dict_type` (
  `id` bigint(20) NOT NULL COMMENT '字典类型ID',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '父类字典类型ID',
  `name` varchar(100) DEFAULT '' COMMENT '字典类型名称',
  `type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '字典类型状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COMMENT='系统_字典类型';

--
-- 转存表中的数据 `hg_sys_dict_type`
--

INSERT INTO `hg_sys_dict_type` (`id`, `pid`, `name`, `type`, `sort`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 27, '用户性别', 'sys_user_sex', 0, '用户性别列表', 1, '2021-01-30 13:27:43', '2021-03-24 11:38:47'),
(2, 28, '菜单类型', 'sys_menu_types', 80, '', 1, '2021-01-30 13:27:43', '2023-02-26 00:46:18'),
(3, 28, '系统状态', 'sys_normal_disable', 10, '系统状态列表', 1, '2021-01-30 13:27:43', NULL),
(4, 26, '任务状态', 'sys_job_status', 0, '任务状态列表', 1, '2021-01-30 13:27:43', NULL),
(5, 26, '任务分组', 'sys_job_group', 0, '任务分组列表', 1, '2021-01-30 13:27:43', NULL),
(7, 29, '通知类型', 'sys_notice_type', 0, '通知类型列表', 1, '2021-01-30 13:27:43', NULL),
(9, 28, '操作类型', 'sys_oper_type', 100, '', 1, '2021-01-30 13:27:43', '2023-02-26 00:48:01'),
(22, 25, '请求方式', 'sys_oper_method', 0, '', 1, '2022-01-24 11:33:16', '2022-01-24 11:33:16'),
(23, 25, '请求状态码', 'req_code', 0, '', 1, '2022-01-25 10:22:40', '2022-01-25 10:22:40'),
(24, 25, '请求耗时', 'req_take_up_time', 0, '', 1, '2022-01-25 15:51:19', '2022-01-25 15:51:19'),
(25, 0, '请求枚举', 'req', 40, '', 1, '2022-01-24 11:33:16', '2022-01-24 11:33:16'),
(26, 0, '任务枚举', 'job', 30, '', 1, '2022-01-24 11:33:16', '2022-01-24 11:33:16'),
(27, 0, '组织枚举', 'org', 20, '', 1, '2022-01-24 11:33:16', '2023-04-27 23:24:53'),
(28, 0, '系统枚举', 'sys', 10, '', 1, '2022-01-24 11:33:16', '2023-02-26 00:33:13'),
(29, 0, '通知枚举', 'notice', 50, '', 1, '2022-01-24 11:33:16', '2022-01-24 11:33:16'),
(30, 27, '用户爱好', 'sys_user_hobby', 0, NULL, 1, '2021-03-01 11:41:07', '2021-03-01 11:41:07'),
(31, 27, '用户渠道', 'sys_user_channel', 0, NULL, 1, '2021-03-01 11:41:07', '2021-03-01 11:41:07'),
(32, 0, '配置枚举', 'config', 60, '', 1, '2022-12-30 17:55:42', '2023-05-29 14:47:01'),
(33, 32, '上传驱动', 'config_upload_drive', 10, '', 1, '2022-12-30 17:57:18', '2022-12-30 17:57:18'),
(34, 28, '日志类型', 'sys_log_type', 200, '', 1, '2023-01-20 16:39:52', '2023-02-24 17:40:45'),
(35, 32, '短信驱动', 'config_sms_drive', 20, '', 1, '2023-01-21 10:27:01', '2023-01-21 10:27:01'),
(36, 32, '短信模板', 'config_sms_template', 30, '', 1, '2023-01-21 10:27:41', '2023-01-21 10:27:41'),
(37, 29, '通知标签', 'sys_notice_tag', 20, '', 1, '2023-01-26 12:09:46', '2023-01-26 12:09:46'),
(38, 32, '邮件模板', 'config_ems_template', 40, '', 1, '2023-02-04 12:53:07', '2023-02-04 12:53:07'),
(40, 28, '系统开关', 'sys_switch', 20, '', 1, '2024-04-16 09:50:58', '2024-04-16 09:50:58'),
(41, 28, '菜单组件', 'sys_menu_component', 90, '', 1, '2024-04-16 13:35:29', '2024-04-16 13:35:29'),
(42, 28, '登录状态', 'sys_login_status', 300, '', 1, '2024-04-16 15:21:23', '2024-04-16 15:21:23');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_ems_log`
--

CREATE TABLE IF NOT EXISTS `hg_sys_ems_log` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `event` varchar(64) NOT NULL COMMENT '事件',
  `email` varchar(512) NOT NULL COMMENT '邮箱地址，多个用;隔开',
  `code` varchar(256) DEFAULT '' COMMENT '验证码',
  `times` bigint(20) NOT NULL COMMENT '验证次数',
  `content` longtext COMMENT '邮件内容',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip地址',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1未验证,2已验证)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='系统_邮件发送记录';

--
-- 转存表中的数据 `hg_sys_ems_log`
--

INSERT INTO `hg_sys_ems_log` (`id`, `event`, `email`, `code`, `times`, `content`, `ip`, `status`, `created_at`, `updated_at`) VALUES
(4, 'bind', '133814250@qq.com', '8793', 1, '<!doctype html>\r\n<html>\r\n<head>\r\n    <meta charset="utf-8" />\r\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\r\n    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">\r\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\r\n    <title>验证码邮件</title>\r\n    <style>\r\n        html,\r\n        body {\r\n            margin: 0 auto !important;\r\n            padding: 0 !important;\r\n            width: 100% !important;\r\n            font-family: sans-serif;\r\n            line-height: 1.4;\r\n            -webkit-font-smoothing: antialiased;\r\n            -ms-text-size-adjust: 100%;\r\n            -webkit-text-size-adjust: 100%;\r\n        }\r\n        * {\r\n            -ms-text-size-adjust: 100%;\r\n        }\r\n        table,\r\n        td {\r\n            mso-table-lspace: 0 !important;\r\n            mso-table-rspace: 0 !important;\r\n        }\r\n        img {\r\n            display: block;\r\n            border: none;\r\n            max-width: 100%;\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n        a {\r\n            text-decoration: none;\r\n        }\r\n    </style>\r\n</head>\r\n<body\r\n        leftmargin="0"\r\n        marginwidth="0"\r\n        topmargin="0"\r\n        marginheight="0"\r\n        offset="0"\r\n        width="100%"\r\n        style="margin: 0; padding: 0 !important; mso-line-height-rule: exactly"\r\n>\r\n<table\r\n        role="presentation"\r\n        align="center"\r\n        valign="top"\r\n        border="0"\r\n        cellpadding="0"\r\n        cellspacing="0"\r\n        height="100%"\r\n        width="100%"\r\n        style="border-spacing: 0;\r\n				border-collapse: collapse;\r\n				vertical-align: top;\r\n				padding: 0;\r\n				margin: 0;\r\n				width: 100%;\r\n				text-align: center;"\r\n>\r\n    <tr>\r\n        <td align="center" valign="top">\r\n            <table\r\n                    role="presentation"\r\n                    align="center"\r\n                    border="0"\r\n                    cellpadding="0"\r\n                    cellspacing="0"\r\n                    width="600"\r\n                    bgcolor="#ffffff"\r\n                    style="max-width: 600px;\r\n							border-spacing: 0;\r\n							border-collapse: collapse;\r\n							vertical-align: top;\r\n							padding: 0;\r\n							margin: 0;\r\n							width: 100%;\r\n							background: #ffffff;"\r\n            >\r\n                <tr>\r\n                    <td height=40" style="height:40px"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td align="center" valign="top">\r\n                        <table\r\n                                role="presentation"\r\n                                align="center"\r\n                                border="0"\r\n                                cellpadding="0"\r\n                                cellspacing="0"\r\n                                width="440"\r\n                                style="max-width: 440px;\r\n										border-spacing: 0;\r\n										border-collapse: collapse;\r\n										vertical-align: top;\r\n										padding: 0;\r\n										margin: 0;\r\n										width: 100%;\r\n										text-align: center;"\r\n                        >\r\n                            <tr>\r\n                                <td align="center">\r\n                                    <img\r\n                                            src="https://hotgo.facms.cn/attachment/2022-10-07/cnf9tml2ikirr1i6ss.png"\r\n                                            width="170"\r\n                                            style="border: none; display: block; max-width: 170px; width: 100%"\r\n                                     alt="logo">\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height="40" style="height:40px"></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <h1\r\n                                            style="font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 24px;\r\n													color: #010E28;\r\n													font-weight: bold;\r\n													margin: 0 0 5px;\r\n													padding: 0"\r\n                                    >\r\n                                        这是你发送的验证码吗？\r\n                                    </h1>\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height="15" style="height: 15px"></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <p\r\n                                            style="font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 15px;\r\n													color: #5B6987;\r\n													margin: 0;\r\n													padding: 0;\r\n													line-height: 20px;"\r\n                                    >\r\n                                        Windows 10 <br />\r\n                                        保留地址 (estimated) <br />\r\n                                        IP 地址: 127**.0.1\r\n                                    </p>\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height="30" style="height: 30px"></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <p\r\n                                            style="font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 15px;\r\n													color: #5B6987;\r\n													margin: 0;\r\n													padding: 0;\r\n													line-height: 20px;\r\n													font-weight: bold;"\r\n                                    >\r\n                                        如果是，请输入验证码:\r\n                                    </p>\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height="20" style="height: 20px"></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <p\r\n                                            style="font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 35px;\r\n													color: #010E28;\r\n													margin: 0;\r\n													padding: 0;\r\n													line-height: 20px;\r\n													font-weight: bold;"\r\n                                    >\r\n                                        8793\r\n                                    </p>\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height="20" style="height: 20px">	</td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <p\r\n                                            style="font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 15px;\r\n													color: #5B6987;\r\n													margin: 0;\r\n													padding: 0;\r\n													line-height: 20px;\r\n													font-weight: bold;"\r\n                                    >\r\n                                        该验证码10分钟内有效，请不要告诉于他人！\r\n                                    </p>\r\n                                </td>\r\n                            </tr>\r\n                        </table>\r\n\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td height="40" style="height:40px"></td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n</body>\r\n</html>', '39.165.245.100', 2, '2023-02-04 16:49:39', '2023-02-04 16:56:24');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_gen_codes`
--

CREATE TABLE IF NOT EXISTS `hg_sys_gen_codes` (
  `id` bigint(20) NOT NULL COMMENT '生成ID',
  `gen_type` int(10) unsigned NOT NULL COMMENT '生成类型',
  `gen_template` int(11) DEFAULT '0' COMMENT '生成模板',
  `var_name` varchar(255) NOT NULL COMMENT '实体命名',
  `options` json DEFAULT NULL COMMENT '配置选项',
  `db_name` varchar(128) DEFAULT NULL COMMENT '数据库名称',
  `table_name` varchar(255) NOT NULL COMMENT '主表名称',
  `table_comment` varchar(255) DEFAULT NULL COMMENT '主表注释',
  `dao_name` varchar(255) DEFAULT NULL COMMENT '主表dao模型',
  `master_columns` json DEFAULT NULL COMMENT '主表字段',
  `addon_name` varchar(128) DEFAULT NULL COMMENT '插件名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '生成状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='系统_代码生成记录';

--
-- 转存表中的数据 `hg_sys_gen_codes`
--

INSERT INTO `hg_sys_gen_codes` (`id`, `gen_type`, `gen_template`, `var_name`, `options`, `db_name`, `table_name`, `table_comment`, `dao_name`, `master_columns`, `addon_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 0, 'CurdDemo', '{"join": [{"uuid": "pgJsFoqfaGjqgKjy", "alias": "testCategory", "field": "id", "columns": [{"dc": "分类ID", "id": 1, "name": "id", "extra": "auto_increment", "index": "PRI", "goName": "TestCategoryId", "goType": "int64", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "testCategoryId", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0}, {"dc": "关联分类", "id": 2, "name": "name", "align": "left", "extra": "", "index": "", "width": 100, "goName": "TestCategoryName", "goType": "string", "isEdit": false, "isList": true, "isSort": false, "length": 255, "tsName": "testCategoryName", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": 0, "formMode": "", "formRole": "", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": ""}, {"dc": "分类简称", "id": 3, "name": "short_name", "align": "left", "extra": "", "index": "", "width": null, "goName": "TestCategoryShortName", "goType": "string", "isEdit": false, "isList": false, "isSort": false, "length": 128, "tsName": "testCategoryShortName", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(128)", "dataType": "varchar", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "LIKE %...%", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "描述", "id": 3, "name": "description", "extra": "", "index": "", "goName": "TestCategoryDescription", "goType": "string", "isEdit": false, "isList": false, "isSort": false, "length": 255, "tsName": "testCategoryDescription", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": ""}, {"dc": "排序", "id": 4, "name": "sort", "extra": "", "index": "", "goName": "TestCategorySort", "goType": "int", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "testCategorySort", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "int(11)", "dataType": "int", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0}, {"dc": "备注", "id": 5, "name": "remark", "extra": "", "index": "", "goName": "TestCategoryRemark", "goType": "string", "isEdit": false, "isList": false, "isSort": false, "length": 255, "tsName": "testCategoryRemark", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": ""}, {"dc": "状态", "id": 6, "name": "status", "extra": "", "index": "", "goName": "TestCategoryStatus", "goType": "int", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "testCategoryStatus", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "tinyint(1)", "dataType": "tinyint", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 1}, {"dc": "创建时间", "id": 7, "name": "created_at", "extra": "", "index": "", "goName": "TestCategoryCreatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "testCategoryCreatedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": ""}, {"dc": "修改时间", "id": 8, "name": "updated_at", "extra": "", "index": "", "goName": "TestCategoryUpdatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "testCategoryUpdatedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": ""}, {"dc": "删除时间", "id": 9, "name": "deleted_at", "extra": "", "index": "", "goName": "TestCategoryDeletedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "testCategoryDeletedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": 0, "formMode": "", "formRole": "", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": ""}], "daoName": "TestCategory", "linkMode": 1, "linkTable": "hg_test_category", "masterField": "category_id"}], "menu": {"pid": 2366, "icon": "", "sort": 10}, "tree": {"styleType": 1, "titleColumn": null}, "autoOps": ["genMenuPermissions", "runDao", "runService", "forcedCover"], "headOps": ["add", "batchDel", "export"], "funcDict": {"labelColumn": "title", "valueColumn": "id"}, "columnOps": ["edit", "del", "switch", "check", "status"], "presetStep": {"formGridCols": 2}}', 'default', 'hg_sys_gen_curd_demo', 'CURD列表', 'SysGenCurdDemo', '[{"dc": "ID", "id": 1, "name": "id", "align": "left", "extra": "auto_increment", "index": "PRI", "width": 50, "goName": "Id", "goType": "int64", "isEdit": false, "isList": true, "isSort": true, "length": 0, "tsName": "id", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "Input", "formRole": "none", "isExport": true, "required": true, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0, "formGridSpan": 1}, {"dc": "测试分类", "id": 2, "name": "category_id", "align": "left", "extra": "", "index": "", "width": 100, "goName": "CategoryId", "goType": "int64", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "categoryId", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": -300004223237244, "formMode": "Select", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0, "formGridSpan": 1}, {"dc": "标题", "id": 3, "name": "title", "align": "left", "extra": "", "index": "", "width": 150, "goName": "Title", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 64, "tsName": "title", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "varchar(64)", "dataType": "varchar", "dictType": null, "formMode": "Input", "formRole": "none", "isExport": true, "required": true, "queryWhere": "LIKE %...%", "isAllowNull": "NO", "defaultValue": "", "formGridSpan": 1}, {"dc": "描述", "id": 4, "name": "description", "align": "left", "extra": "", "index": "", "width": 300, "goName": "Description", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 255, "tsName": "description", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": null, "formMode": "InputTextarea", "formRole": "none", "isExport": true, "required": true, "queryWhere": "LIKE %...%", "isAllowNull": "NO", "defaultValue": "", "formGridSpan": 2}, {"dc": "内容", "id": 5, "name": "content", "align": "left", "extra": "", "index": "", "width": null, "goName": "Content", "goType": "string", "isEdit": true, "isList": false, "isSort": false, "length": 65535, "tsName": "content", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "text", "dataType": "text", "dictType": null, "formMode": "InputEditor", "formRole": "none", "isExport": false, "required": true, "queryWhere": "LIKE %...%", "isAllowNull": "NO", "defaultValue": "", "formGridSpan": 2}, {"dc": "单图", "id": 6, "name": "image", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Image", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 255, "tsName": "image", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": null, "formMode": "UploadImage", "formRole": "none", "isExport": true, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "附件", "id": 7, "name": "attachfile", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Attachfile", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 255, "tsName": "attachfile", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": null, "formMode": "UploadFile", "formRole": "none", "isExport": true, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "所在城市", "id": 8, "name": "city_id", "align": "left", "extra": "", "index": "", "width": null, "goName": "CityId", "goType": "int64", "isEdit": true, "isList": false, "isSort": false, "length": 0, "tsName": "cityId", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "CitySelector", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "显示开关", "id": 9, "name": "switch", "align": "left", "extra": "", "index": "", "width": 150, "goName": "Switch", "goType": "int", "isEdit": true, "isList": true, "isSort": false, "length": 0, "tsName": "switch", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "int(11)", "dataType": "int", "dictType": null, "formMode": "Switch", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 1, "formGridSpan": 1}, {"dc": "排序", "id": 10, "name": "sort", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Sort", "goType": "int", "isEdit": true, "isList": true, "isSort": true, "length": 0, "tsName": "sort", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "int(11)", "dataType": "int", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": true, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0, "formGridSpan": 1}, {"dc": "状态", "id": 11, "name": "status", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Status", "goType": "int", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "status", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "tinyint(1)", "dataType": "tinyint", "dictType": 3, "formMode": "Select", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 1, "formGridSpan": 1}, {"dc": "创建者", "id": 12, "name": "created_by", "align": "left", "extra": "", "index": "", "width": 150, "goName": "CreatedBy", "goType": "int64", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "createdBy", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "更新者", "id": 13, "name": "updated_by", "align": "left", "extra": "", "index": "", "width": 150, "goName": "UpdatedBy", "goType": "int64", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "updatedBy", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "删除者", "id": 14, "name": "deleted_by", "align": "left", "extra": "", "index": "", "width": null, "goName": "DeletedBy", "goType": "int64", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "deletedBy", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "创建时间", "id": 14, "name": "created_at", "align": "left", "extra": "", "index": "", "width": 180, "goName": "CreatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "createdAt", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "TimeRange", "formRole": "none", "isExport": true, "required": false, "queryWhere": "BETWEEN", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "修改时间", "id": 15, "name": "updated_at", "align": "left", "extra": "", "index": "", "width": 180, "goName": "UpdatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "updatedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "Time", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "删除时间", "id": 16, "name": "deleted_at", "align": "left", "extra": "", "index": "", "width": null, "goName": "DeletedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "deletedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "Time", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}]', '', 1, '2023-01-18 11:51:22', '2024-08-27 18:45:04'),
(8, 10, 0, 'TestCategory', '{"join": [], "menu": {"pid": 2366, "icon": "", "sort": 1000}, "tree": {"styleType": 1, "titleColumn": null}, "autoOps": ["genMenuPermissions", "runService", "genFuncDict", "forcedCover"], "headOps": ["add", "batchDel"], "funcDict": {"labelColumn": "name", "valueColumn": "id"}, "columnOps": ["edit", "del", "check", "status"], "presetStep": {"formGridCols": 2}}', 'default', 'hg_test_category', '测试分类', 'TestCategory', '[{"dc": "分类ID", "id": 1, "name": "id", "align": "left", "extra": "auto_increment", "index": "PRI", "width": 80, "goName": "Id", "goType": "int64", "isEdit": false, "isList": true, "isSort": true, "length": 0, "tsName": "id", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": true, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0, "formGridSpan": 2}, {"dc": "分类名称", "id": 2, "name": "name", "align": "left", "extra": "", "index": "", "width": null, "goName": "Name", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 255, "tsName": "name", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": null, "formMode": "Input", "formRole": "none", "isExport": true, "required": true, "queryWhere": "LIKE %...%", "isAllowNull": "NO", "defaultValue": "", "formGridSpan": 2}, {"dc": "简称", "id": 3, "name": "short_name", "align": "left", "extra": "", "index": "", "width": 80, "goName": "ShortName", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 128, "tsName": "shortName", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(128)", "dataType": "varchar", "dictType": null, "formMode": "Input", "formRole": "none", "isExport": true, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 2}, {"dc": "描述", "id": 3, "name": "description", "align": "left", "extra": "", "index": "", "width": 300, "goName": "Description", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 255, "tsName": "description", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": null, "formMode": "InputTextarea", "formRole": "none", "isExport": true, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 2}, {"dc": "排序", "id": 4, "name": "sort", "align": "left", "extra": "", "index": "", "width": null, "goName": "Sort", "goType": "int", "isEdit": true, "isList": false, "isSort": true, "length": 0, "tsName": "sort", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "int(11)", "dataType": "int", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": true, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0, "formGridSpan": 1}, {"dc": "状态", "id": 6, "name": "status", "align": "left", "extra": "", "index": "", "width": null, "goName": "Status", "goType": "int", "isEdit": true, "isList": true, "isSort": false, "length": 0, "tsName": "status", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "tinyint(1)", "dataType": "tinyint", "dictType": 3, "formMode": "Select", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 1, "formGridSpan": 1}, {"dc": "备注", "id": 5, "name": "remark", "align": "left", "extra": "", "index": "", "width": null, "goName": "Remark", "goType": "string", "isEdit": true, "isList": false, "isSort": false, "length": 255, "tsName": "remark", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": null, "formMode": "InputTextarea", "formRole": "none", "isExport": true, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 2}, {"dc": "创建时间", "id": 7, "name": "created_at", "align": "left", "extra": "", "index": "", "width": 180, "goName": "CreatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "createdAt", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "TimeRange", "formRole": "none", "isExport": true, "required": false, "queryWhere": "BETWEEN", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "修改时间", "id": 8, "name": "updated_at", "align": "left", "extra": "", "index": "", "width": null, "goName": "UpdatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "updatedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "Time", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "删除时间", "id": 9, "name": "deleted_at", "align": "left", "extra": "", "index": "", "width": null, "goName": "DeletedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "deletedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "Time", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}]', 'hgexample', 1, '2024-04-08 15:18:07', '2024-07-20 21:41:45'),
(9, 11, 0, 'NormalTreeDemo', '{"join": [], "menu": {"pid": 2366, "icon": "", "sort": 200}, "tree": {"styleType": 1, "titleColumn": "title"}, "autoOps": ["genMenuPermissions", "runDao", "runService", "forcedCover"], "headOps": ["add", "batchDel"], "funcDict": {"labelColumn": null, "valueColumn": null}, "columnOps": ["edit", "del", "check"], "presetStep": {"formGridCols": 2}}', 'default', 'hg_sys_gen_tree_demo', '普通树表', 'SysGenTreeDemo', '[{"dc": "标题", "id": 6, "name": "title", "align": "left", "extra": "", "index": "", "width": 200, "goName": "Title", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 64, "tsName": "title", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "varchar(64)", "dataType": "varchar", "dictType": null, "formMode": "Input", "formRole": "none", "isExport": true, "required": true, "queryWhere": "LIKE %...%", "isAllowNull": "NO", "defaultValue": "", "formGridSpan": 2}, {"dc": "ID", "id": 1, "name": "id", "align": "left", "extra": "auto_increment", "index": "PRI", "width": 100, "goName": "Id", "goType": "int64", "isEdit": false, "isList": false, "isSort": true, "length": 0, "tsName": "id", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": true, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0, "formGridSpan": 1}, {"dc": "上级", "id": 2, "name": "pid", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Pid", "goType": "int64", "isEdit": true, "isList": false, "isSort": false, "length": 0, "tsName": "pid", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 2}, {"dc": "关系树级别", "id": 3, "name": "level", "align": "left", "extra": "", "index": "", "width": null, "goName": "Level", "goType": "int", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "level", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "int(11)", "dataType": "int", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 1, "formGridSpan": 1}, {"dc": "关系树", "id": 4, "name": "tree", "align": "left", "extra": "", "index": "", "width": null, "goName": "Tree", "goType": "string", "isEdit": false, "isList": false, "isSort": false, "length": 4294967295, "tsName": "tree", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "longtext", "dataType": "longtext", "dictType": null, "formMode": "InputEditor", "formRole": "none", "isExport": false, "required": false, "queryWhere": "LIKE %...%", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "测试分类", "id": 5, "name": "category_id", "align": "left", "extra": "", "index": "", "width": 100, "goName": "CategoryId", "goType": "int64", "isEdit": true, "isList": true, "isSort": false, "length": 0, "tsName": "categoryId", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": -300004223237244, "formMode": "Select", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 2}, {"dc": "描述", "id": 7, "name": "description", "align": "left", "extra": "", "index": "", "width": 300, "goName": "Description", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 255, "tsName": "description", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": null, "formMode": "Input", "formRole": "none", "isExport": true, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 2}, {"dc": "排序", "id": 8, "name": "sort", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Sort", "goType": "int", "isEdit": true, "isList": false, "isSort": true, "length": 0, "tsName": "sort", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "int(11)", "dataType": "int", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "状态", "id": 9, "name": "status", "align": "left", "extra": "", "index": "", "width": 150, "goName": "Status", "goType": "int", "isEdit": true, "isList": true, "isSort": false, "length": 0, "tsName": "status", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "tinyint(1)", "dataType": "tinyint", "dictType": 3, "formMode": "Select", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 1, "formGridSpan": 1}, {"dc": "创建者", "id": 10, "name": "created_by", "align": "left", "extra": "", "index": "", "width": 100, "goName": "CreatedBy", "goType": "int64", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "createdBy", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "更新者", "id": 11, "name": "updated_by", "align": "left", "extra": "", "index": "", "width": 100, "goName": "UpdatedBy", "goType": "int64", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "updatedBy", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "创建时间", "id": 12, "name": "created_at", "align": "left", "extra": "", "index": "", "width": 180, "goName": "CreatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "createdAt", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "TimeRange", "formRole": "none", "isExport": true, "required": false, "queryWhere": "BETWEEN", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "修改时间", "id": 13, "name": "updated_at", "align": "left", "extra": "", "index": "", "width": 180, "goName": "UpdatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "updatedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "Time", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "删除时间", "id": 14, "name": "deleted_at", "align": "left", "extra": "", "index": "", "width": null, "goName": "DeletedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "deletedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "Time", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}]', '', 1, '2024-04-09 16:06:13', '2024-07-25 16:34:59'),
(10, 11, 0, 'OptionTreeDemo', '{"join": [], "menu": {"pid": 2366, "icon": "", "sort": 300}, "tree": {"styleType": 2, "titleColumn": "title"}, "autoOps": ["genMenuPermissions", "runDao", "runService", "forcedCover"], "headOps": ["add", "batchDel"], "funcDict": {"labelColumn": null, "valueColumn": null}, "columnOps": ["edit", "del", "check"], "presetStep": {"formGridCols": 2}}', 'default', 'hg_sys_gen_tree_demo', '选项树表', 'SysGenTreeDemo', '[{"dc": "标题", "id": 6, "name": "title", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Title", "goType": "string", "isEdit": true, "isList": true, "isSort": false, "length": 64, "tsName": "title", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "varchar(64)", "dataType": "varchar", "dictType": null, "formMode": "Input", "formRole": "none", "isExport": true, "required": true, "queryWhere": "LIKE %...%", "isAllowNull": "NO", "defaultValue": "", "formGridSpan": 2}, {"dc": "ID", "id": 1, "name": "id", "align": "left", "extra": "auto_increment", "index": "PRI", "width": 100, "goName": "Id", "goType": "int64", "isEdit": false, "isList": false, "isSort": true, "length": 0, "tsName": "id", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": true, "queryWhere": "=", "isAllowNull": "NO", "defaultValue": 0, "formGridSpan": 1}, {"dc": "上级", "id": 2, "name": "pid", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Pid", "goType": "int64", "isEdit": true, "isList": false, "isSort": false, "length": 0, "tsName": "pid", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 2}, {"dc": "关系树级别", "id": 3, "name": "level", "align": "left", "extra": "", "index": "", "width": null, "goName": "Level", "goType": "int", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "level", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "int(11)", "dataType": "int", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 1, "formGridSpan": 1}, {"dc": "关系树", "id": 4, "name": "tree", "align": "left", "extra": "", "index": "", "width": null, "goName": "Tree", "goType": "string", "isEdit": false, "isList": false, "isSort": false, "length": 4294967295, "tsName": "tree", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "longtext", "dataType": "longtext", "dictType": 3, "formMode": "SelectMultiple", "formRole": "none", "isExport": false, "required": false, "queryWhere": "LIKE %...%", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "测试分类", "id": 5, "name": "category_id", "align": "left", "extra": "", "index": "", "width": 100, "goName": "CategoryId", "goType": "int64", "isEdit": true, "isList": true, "isSort": false, "length": 0, "tsName": "categoryId", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": -300004223237244, "formMode": "Select", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 2}, {"dc": "描述", "id": 7, "name": "description", "align": "left", "extra": "", "index": "", "width": 300, "goName": "Description", "goType": "string", "isEdit": true, "isList": false, "isSort": false, "length": 255, "tsName": "description", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "varchar(255)", "dataType": "varchar", "dictType": null, "formMode": "Input", "formRole": "none", "isExport": false, "required": false, "queryWhere": "LIKE", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 2}, {"dc": "排序", "id": 8, "name": "sort", "align": "left", "extra": "", "index": "", "width": 100, "goName": "Sort", "goType": "int", "isEdit": true, "isList": false, "isSort": true, "length": 0, "tsName": "sort", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "int(11)", "dataType": "int", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "状态", "id": 9, "name": "status", "align": "left", "extra": "", "index": "", "width": 150, "goName": "Status", "goType": "int", "isEdit": true, "isList": true, "isSort": false, "length": 0, "tsName": "status", "tsType": "number", "unique": false, "isQuery": true, "sqlType": "tinyint(1)", "dataType": "tinyint", "dictType": 3, "formMode": "Select", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 1, "formGridSpan": 1}, {"dc": "创建者", "id": 10, "name": "created_by", "align": "left", "extra": "", "index": "", "width": 100, "goName": "CreatedBy", "goType": "int64", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "createdBy", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "更新者", "id": 11, "name": "updated_by", "align": "left", "extra": "", "index": "", "width": 100, "goName": "UpdatedBy", "goType": "int64", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "updatedBy", "tsType": "number", "unique": false, "isQuery": false, "sqlType": "bigint(20)", "dataType": "bigint", "dictType": null, "formMode": "InputNumber", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": 0, "formGridSpan": 1}, {"dc": "创建时间", "id": 12, "name": "created_at", "align": "left", "extra": "", "index": "", "width": 180, "goName": "CreatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": true, "isSort": false, "length": 0, "tsName": "createdAt", "tsType": "string", "unique": false, "isQuery": true, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "TimeRange", "formRole": "none", "isExport": true, "required": false, "queryWhere": "BETWEEN", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "修改时间", "id": 13, "name": "updated_at", "align": "left", "extra": "", "index": "", "width": 180, "goName": "UpdatedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "updatedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "Time", "formRole": "none", "isExport": true, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}, {"dc": "删除时间", "id": 14, "name": "deleted_at", "align": "left", "extra": "", "index": "", "width": null, "goName": "DeletedAt", "goType": "*gtime.Time", "isEdit": false, "isList": false, "isSort": false, "length": 0, "tsName": "deletedAt", "tsType": "string", "unique": false, "isQuery": false, "sqlType": "datetime", "dataType": "datetime", "dictType": null, "formMode": "Time", "formRole": "none", "isExport": false, "required": false, "queryWhere": "=", "isAllowNull": "YES", "defaultValue": "", "formGridSpan": 1}]', '', 1, '2024-04-09 17:20:33', '2024-07-25 16:35:34');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_gen_curd_demo`
--

CREATE TABLE IF NOT EXISTS `hg_sys_gen_curd_demo` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `category_id` bigint(20) DEFAULT '0' COMMENT '分类ID',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `content` text COMMENT '内容',
  `image` varchar(255) DEFAULT NULL COMMENT '单图',
  `attachfile` varchar(255) DEFAULT NULL COMMENT '附件',
  `city_id` bigint(20) DEFAULT '0' COMMENT '所在城市',
  `switch` int(11) DEFAULT '1' COMMENT '显示开关',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_by` bigint(20) DEFAULT '0' COMMENT '创建者',
  `updated_by` bigint(20) DEFAULT '0' COMMENT '更新者',
  `deleted_by` bigint(20) DEFAULT '0' COMMENT '删除者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='系统_生成curd演示';

--
-- 转存表中的数据 `hg_sys_gen_curd_demo`
--

INSERT INTO `hg_sys_gen_curd_demo` (`id`, `category_id`, `title`, `description`, `content`, `image`, `attachfile`, `city_id`, `switch`, `sort`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '测试标题', '这是一个CRUD生成演示，关联测试分类', '<h2><strong>不知道写点啥！</strong></h2><p><br></p><iframe class="ql-video" frameborder="0" allowfullscreen="true" src="https://media.w3.org/2010/05/sintel/trailer.mp4"></iframe><p><br></p><p><img src="https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdq9iuv0phsg8patk.png"></p>', 'https://gmycos.facms.cn/hotgo/attachment/2023-02-09/cqdqamvhlq4w3ki6bl.webp', 'http://localhost:8000/attachment/2024-07-25/d2yh86z5wxgoyuuyv7.png', 120102, 1, 10, 1, 1, 1, NULL, '2022-12-15 19:30:14', '2024-07-25 16:28:31', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_gen_tree_demo`
--

CREATE TABLE IF NOT EXISTS `hg_sys_gen_tree_demo` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级ID',
  `level` int(11) DEFAULT '1' COMMENT '关系树级别',
  `tree` varchar(512) DEFAULT NULL COMMENT '关系树',
  `category_id` bigint(20) DEFAULT '0' COMMENT '分类ID',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_by` bigint(20) DEFAULT '0' COMMENT '创建者',
  `updated_by` bigint(20) DEFAULT '0' COMMENT '更新者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='系统_生成树表演示';

--
-- 转存表中的数据 `hg_sys_gen_tree_demo`
--

INSERT INTO `hg_sys_gen_tree_demo` (`id`, `pid`, `level`, `tree`, `category_id`, `title`, `description`, `sort`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, NULL, 1, '道生一', '这是一个普通树形表格的生成演示。', 10, 1, 1, 1, '2022-12-15 19:30:14', '2024-07-20 23:38:07', NULL),
(14, 1, 2, 'tr_1 ', 1, '一生二', '', 20, 1, 1, 1, '2024-04-09 17:07:55', '2024-07-21 00:20:15', NULL),
(15, 14, 3, 'tr_1 tr_14 ', 2, '二生三', '', 30, 1, 1, 1, '2024-04-09 17:08:03', '2024-07-21 00:17:21', NULL),
(16, 15, 4, 'tr_1 tr_14 tr_15 ', 4, '三生万物', '', 40, 1, 1, 1, '2024-04-09 17:13:54', '2024-07-21 00:17:24', NULL),
(17, 0, 1, '', 1, '一帆风顺', '', 50, 1, 1, 1, '2024-04-09 17:24:58', '2024-07-21 00:18:13', NULL),
(19, 17, 2, 'tr_17 ', 1, '二龙戏珠', '', 60, 1, 1, 1, '2024-04-09 17:27:40', '2024-07-21 00:17:30', NULL),
(20, 19, 3, 'tr_17 tr_19 ', 1, '三心二意', '', 70, 1, 1, 1, '2024-04-09 17:27:44', '2024-07-21 00:17:33', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_log`
--

CREATE TABLE IF NOT EXISTS `hg_sys_log` (
  `id` bigint(20) NOT NULL COMMENT '日志ID',
  `req_id` varchar(50) DEFAULT NULL COMMENT '对外ID',
  `app_id` varchar(50) DEFAULT '' COMMENT '应用ID',
  `merchant_id` bigint(20) unsigned DEFAULT '0' COMMENT '商户ID',
  `member_id` bigint(20) DEFAULT '0' COMMENT '用户ID',
  `method` varchar(20) DEFAULT NULL COMMENT '提交类型',
  `module` varchar(50) DEFAULT NULL COMMENT '访问模块',
  `url` varchar(1000) DEFAULT NULL COMMENT '提交url',
  `get_data` json DEFAULT NULL COMMENT 'get数据',
  `post_data` json DEFAULT NULL COMMENT 'post数据',
  `header_data` json DEFAULT NULL COMMENT 'header数据',
  `ip` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `province_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '省编码',
  `city_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '市编码',
  `error_code` int(11) DEFAULT '0' COMMENT '报错code',
  `error_msg` longtext COMMENT '对外错误提示',
  `error_data` json DEFAULT NULL COMMENT '报错日志',
  `user_agent` varchar(512) DEFAULT NULL COMMENT 'UA信息',
  `take_up_time` bigint(20) DEFAULT '0' COMMENT '请求耗时',
  `timestamp` bigint(20) DEFAULT '0' COMMENT '响应时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统_全局日志';

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_login_log`
--

CREATE TABLE IF NOT EXISTS `hg_sys_login_log` (
  `id` bigint(20) NOT NULL COMMENT '日志ID',
  `req_id` varchar(50) DEFAULT NULL COMMENT '请求ID',
  `member_id` bigint(20) DEFAULT '0' COMMENT '用户ID',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `response` json DEFAULT NULL COMMENT '响应数据',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(128) DEFAULT NULL COMMENT '登录IP',
  `province_id` bigint(20) DEFAULT NULL COMMENT '省编码',
  `city_id` bigint(20) DEFAULT NULL COMMENT '市编码',
  `user_agent` varchar(512) DEFAULT NULL COMMENT 'UA信息',
  `err_msg` varchar(1000) DEFAULT NULL COMMENT '错误提示',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统_登录日志';

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_serve_license`
--

CREATE TABLE IF NOT EXISTS `hg_sys_serve_license` (
  `id` bigint(20) NOT NULL COMMENT '许可ID',
  `group` varchar(50) NOT NULL COMMENT '分组',
  `name` varchar(128) NOT NULL COMMENT '许可名称',
  `appid` varchar(64) NOT NULL COMMENT '应用ID',
  `secret_key` varchar(255) DEFAULT NULL COMMENT '应用秘钥',
  `remote_addr` varchar(64) DEFAULT NULL COMMENT '最后连接地址',
  `online_limit` int(11) DEFAULT '1' COMMENT '在线限制',
  `login_times` bigint(20) DEFAULT NULL COMMENT '登录次数',
  `last_login_at` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_active_at` datetime DEFAULT NULL COMMENT '最后心跳',
  `routes` json DEFAULT NULL COMMENT '路由表，空使用默认分组路由',
  `allowed_ips` varchar(512) DEFAULT NULL COMMENT 'IP白名单',
  `end_at` datetime NOT NULL COMMENT '授权有效期',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统_服务许可证';

--
-- 转存表中的数据 `hg_sys_serve_license`
--

INSERT INTO `hg_sys_serve_license` (`id`, `group`, `name`, `appid`, `secret_key`, `remote_addr`, `online_limit`, `login_times`, `last_login_at`, `last_active_at`, `routes`, `allowed_ips`, `end_at`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 'cron', '定时任务', '1002', 'hotgo', '127.0.0.1:62082', 1, 193, '2024-07-21 21:46:36', '2024-07-21 21:59:08', NULL, '127.0.0.1', '2033-03-09 00:00:00', '这是默认的定时任务TCP客户端授权凭证。', 1, '2023-03-11 00:00:00', '2024-07-21 21:59:08'),
(2, 'auth', '授权服务', 'mengshuai', '123456', '127.0.0.1:50640', 1, 3, '2023-07-26 17:05:30', '2023-07-26 17:07:01', '["ExampleRPCHelloReq", "ExampleHelloReq", "AuthSummaryReq"]', '127.0.0.1', '2033-03-09 00:00:00', '这是一个测试的授权服务，可以为第三方平台提供授权支持。', 1, '2023-03-11 00:00:00', '2023-07-26 17:07:01');

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_serve_log`
--

CREATE TABLE IF NOT EXISTS `hg_sys_serve_log` (
  `id` bigint(20) NOT NULL COMMENT '日志ID',
  `trace_id` varchar(50) DEFAULT NULL COMMENT '链路ID',
  `level_format` varchar(32) DEFAULT NULL COMMENT '日志级别',
  `content` text COMMENT '日志内容',
  `stack` json DEFAULT NULL COMMENT '打印堆栈',
  `line` varchar(255) NOT NULL COMMENT '调用行',
  `trigger_ns` bigint(20) DEFAULT NULL COMMENT '触发时间(ns)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统_服务日志';

-- --------------------------------------------------------

--
-- 表的结构 `hg_sys_sms_log`
--

CREATE TABLE IF NOT EXISTS `hg_sys_sms_log` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `event` varchar(64) NOT NULL COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(256) DEFAULT '' COMMENT '验证码或短信内容',
  `times` bigint(20) NOT NULL COMMENT '验证次数',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip地址',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1未验证,2已验证)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统_短信发送记录';

--
-- 转存表中的数据 `hg_sys_sms_log`
--

INSERT INTO `hg_sys_sms_log` (`id`, `event`, `mobile`, `code`, `times`, `ip`, `status`, `created_at`, `updated_at`) VALUES
(1, 'code', '1530380571', '1234', 1, '39.165.245.100', 1, '2022-12-16 16:01:30', '2022-01-24 11:33:16');

-- --------------------------------------------------------

--
-- 表的结构 `hg_test_category`
--

CREATE TABLE IF NOT EXISTS `hg_test_category` (
  `id` bigint(20) NOT NULL COMMENT '分类ID',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `short_name` varchar(128) DEFAULT NULL COMMENT '简称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` int(11) NOT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='测试分类';

--
-- 转存表中的数据 `hg_test_category`
--

INSERT INTO `hg_test_category` (`id`, `name`, `short_name`, `description`, `sort`, `remark`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '官方新闻', 'G', '用于演示关联表和字典选项生成和使用。', 10, '', 1, '2023-01-03 00:00:00', '2023-01-03 00:00:00', NULL),
(2, '移动应用', 'Y', '', 20, '', 1, '2023-01-03 00:00:00', '2023-01-03 00:00:00', NULL),
(3, '微信公众号', 'W', '', 30, '', 1, '2023-01-03 00:00:00', '2023-01-03 00:00:00', NULL),
(4, '系统搭建', 'X', '', 40, '', 1, '2023-01-03 00:00:00', '2023-01-03 00:00:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hg_addon_hgexample_table`
--
ALTER TABLE `hg_addon_hgexample_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hg_addon_hgexample_tenant_order`
--
ALTER TABLE `hg_addon_hgexample_tenant_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_sn` (`order_sn`),
  ADD KEY `member_id` (`user_id`),
  ADD KEY `merchant_id` (`merchant_id`),
  ADD KEY `agent_id` (`tenant_id`);

--
-- Indexes for table `hg_admin_cash`
--
ALTER TABLE `hg_admin_cash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`member_id`);

--
-- Indexes for table `hg_admin_credits_log`
--
ALTER TABLE `hg_admin_credits_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `hg_admin_dept`
--
ALTER TABLE `hg_admin_dept`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `hg_admin_member`
--
ALTER TABLE `hg_admin_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invite_code` (`invite_code`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `hg_admin_member_post`
--
ALTER TABLE `hg_admin_member_post`
  ADD PRIMARY KEY (`member_id`,`post_id`);

--
-- Indexes for table `hg_admin_member_role`
--
ALTER TABLE `hg_admin_member_role`
  ADD PRIMARY KEY (`member_id`,`role_id`);

--
-- Indexes for table `hg_admin_menu`
--
ALTER TABLE `hg_admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `hg_admin_notice`
--
ALTER TABLE `hg_admin_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hg_admin_notice_read`
--
ALTER TABLE `hg_admin_notice_read`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `notice_id` (`notice_id`,`member_id`);

--
-- Indexes for table `hg_admin_oauth`
--
ALTER TABLE `hg_admin_oauth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client` (`oauth_client`,`oauth_openid`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `hg_admin_order`
--
ALTER TABLE `hg_admin_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_sn` (`order_sn`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `hg_admin_post`
--
ALTER TABLE `hg_admin_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hg_admin_role`
--
ALTER TABLE `hg_admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hg_admin_role_casbin`
--
ALTER TABLE `hg_admin_role_casbin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hg_admin_role_menu`
--
ALTER TABLE `hg_admin_role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`);

--
-- Indexes for table `hg_pay_log`
--
ALTER TABLE `hg_pay_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_sn` (`order_sn`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `hg_pay_refund`
--
ALTER TABLE `hg_pay_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_sn` (`order_sn`);

--
-- Indexes for table `hg_sys_addons_config`
--
ALTER TABLE `hg_sys_addons_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `addon_name_2` (`addon_name`,`key`),
  ADD KEY `addon_name` (`addon_name`),
  ADD KEY `addon_name_3` (`addon_name`,`group`);

--
-- Indexes for table `hg_sys_addons_install`
--
ALTER TABLE `hg_sys_addons_install`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `hg_sys_attachment`
--
ALTER TABLE `hg_sys_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `md5` (`md5`);

--
-- Indexes for table `hg_sys_blacklist`
--
ALTER TABLE `hg_sys_blacklist`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`ip`);

--
-- Indexes for table `hg_sys_config`
--
ALTER TABLE `hg_sys_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group` (`group`),
  ADD KEY `key` (`key`);

--
-- Indexes for table `hg_sys_cron`
--
ALTER TABLE `hg_sys_cron`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hg_sys_cron_group`
--
ALTER TABLE `hg_sys_cron_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hg_sys_dict_data`
--
ALTER TABLE `hg_sys_dict_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dict_data_idx` (`type`);

--
-- Indexes for table `hg_sys_dict_type`
--
ALTER TABLE `hg_sys_dict_type`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `dict_type` (`type`);

--
-- Indexes for table `hg_sys_ems_log`
--
ALTER TABLE `hg_sys_ems_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `email` (`email`);

--
-- Indexes for table `hg_sys_gen_codes`
--
ALTER TABLE `hg_sys_gen_codes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hg_sys_gen_curd_demo`
--
ALTER TABLE `hg_sys_gen_curd_demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hg_sys_gen_tree_demo`
--
ALTER TABLE `hg_sys_gen_tree_demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hg_sys_log`
--
ALTER TABLE `hg_sys_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `error_code` (`error_code`),
  ADD KEY `req_id` (`req_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `hg_sys_login_log`
--
ALTER TABLE `hg_sys_login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `req_id` (`req_id`);

--
-- Indexes for table `hg_sys_serve_license`
--
ALTER TABLE `hg_sys_serve_license`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appid` (`appid`);

--
-- Indexes for table `hg_sys_serve_log`
--
ALTER TABLE `hg_sys_serve_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`level_format`),
  ADD KEY `traceid` (`trace_id`);

--
-- Indexes for table `hg_sys_sms_log`
--
ALTER TABLE `hg_sys_sms_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `hg_test_category`
--
ALTER TABLE `hg_test_category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hg_addon_hgexample_table`
--
ALTER TABLE `hg_addon_hgexample_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hg_addon_hgexample_tenant_order`
--
ALTER TABLE `hg_addon_hgexample_tenant_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hg_admin_cash`
--
ALTER TABLE `hg_admin_cash`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hg_admin_credits_log`
--
ALTER TABLE `hg_admin_credits_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '变动ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `hg_admin_dept`
--
ALTER TABLE `hg_admin_dept`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `hg_admin_member`
--
ALTER TABLE `hg_admin_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `hg_admin_menu`
--
ALTER TABLE `hg_admin_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',AUTO_INCREMENT=2431;
--
-- AUTO_INCREMENT for table `hg_admin_notice`
--
ALTER TABLE `hg_admin_notice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告ID',AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `hg_admin_notice_read`
--
ALTER TABLE `hg_admin_notice_read`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `hg_admin_oauth`
--
ALTER TABLE `hg_admin_oauth`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `hg_admin_order`
--
ALTER TABLE `hg_admin_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hg_admin_post`
--
ALTER TABLE `hg_admin_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hg_admin_role`
--
ALTER TABLE `hg_admin_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',AUTO_INCREMENT=211;
--
-- AUTO_INCREMENT for table `hg_admin_role_casbin`
--
ALTER TABLE `hg_admin_role_casbin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hg_pay_log`
--
ALTER TABLE `hg_pay_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hg_pay_refund`
--
ALTER TABLE `hg_pay_refund`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID';
--
-- AUTO_INCREMENT for table `hg_sys_addons_config`
--
ALTER TABLE `hg_sys_addons_config`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hg_sys_addons_install`
--
ALTER TABLE `hg_sys_addons_install`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hg_sys_attachment`
--
ALTER TABLE `hg_sys_attachment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件ID',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `hg_sys_blacklist`
--
ALTER TABLE `hg_sys_blacklist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '黑名单ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `hg_sys_config`
--
ALTER TABLE `hg_sys_config`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `hg_sys_cron`
--
ALTER TABLE `hg_sys_cron`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hg_sys_cron_group`
--
ALTER TABLE `hg_sys_cron_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务分组ID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hg_sys_dict_data`
--
ALTER TABLE `hg_sys_dict_data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典数据ID',AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `hg_sys_dict_type`
--
ALTER TABLE `hg_sys_dict_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典类型ID',AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `hg_sys_ems_log`
--
ALTER TABLE `hg_sys_ems_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hg_sys_gen_codes`
--
ALTER TABLE `hg_sys_gen_codes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '生成ID',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `hg_sys_gen_curd_demo`
--
ALTER TABLE `hg_sys_gen_curd_demo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hg_sys_gen_tree_demo`
--
ALTER TABLE `hg_sys_gen_tree_demo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `hg_sys_log`
--
ALTER TABLE `hg_sys_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID';
--
-- AUTO_INCREMENT for table `hg_sys_login_log`
--
ALTER TABLE `hg_sys_login_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID';
--
-- AUTO_INCREMENT for table `hg_sys_serve_license`
--
ALTER TABLE `hg_sys_serve_license`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '许可ID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hg_sys_serve_log`
--
ALTER TABLE `hg_sys_serve_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID';
--
-- AUTO_INCREMENT for table `hg_sys_sms_log`
--
ALTER TABLE `hg_sys_sms_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hg_test_category`
--
ALTER TABLE `hg_test_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--------------------------------new pay--------------------------------

--
-- 表的结构 `hg_pay_channel_apply`
--

CREATE TABLE IF NOT EXISTS `hg_pay_channel_apply` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `member_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '申请人ID',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '网站域名',
  `channel_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '申请渠道类型(1-微信个人支付, 2-支付宝个人支付)',
  `channel_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '申请费用',
  `id_card_name` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `id_card_number` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `id_card_front` varchar(255) DEFAULT NULL COMMENT '身份证正面照片',
  `id_card_back` varchar(255) DEFAULT NULL COMMENT '身份证反面照片',
  `bank_card_number` varchar(30) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `bank_name` varchar(100) NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账户姓名',
  `apply_reason` varchar(500) DEFAULT NULL COMMENT '申请理由',
  `audit_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态(1-待审核, 2-审核通过, 3-审核拒绝)',
  `audit_reason` varchar(500) DEFAULT NULL COMMENT '审核理由',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT '审核人ID',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(1-正常, 2-禁用)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付渠道申请表';

--
-- Indexes for table `hg_pay_channel_apply`
--
ALTER TABLE `hg_pay_channel_apply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `channel_type` (`channel_type`),
  ADD KEY `audit_status` (`audit_status`),
  ADD KEY `status` (`status`);

--
-- AUTO_INCREMENT for table `hg_pay_channel_apply`
--
ALTER TABLE `hg_pay_channel_apply`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID';