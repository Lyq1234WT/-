
--  创建表开始

create table depart(
	did int primary key auto_increment,
	dname varchar(50) not null,
	duty varchar(255) not null,
	credate date not null,
	dstatus int not null
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

create table employee(
	eid int primary key auto_increment,
	ename varchar(50) not null,
	epass varchar(50) not null,
	realname varchar(50) not null,
	esex int not null,
	entrydate date not null,
	leavedate date,
	position int not null,
	sal int not null,
	estatus int not null,
	did int references depart(did),
	dname varchar(50) not null
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

create table note(
	nid int primary key auto_increment,
	title varchar(255) not null,
	context varchar(255) not null,
	startdate date not null,
	enddate date not null,
	length float not null,
	subdate date not null,
	estatus int not null,
	reldate date,
	eid int references employee(eid)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

--   创建表结束

--   插入测试数据开始
-- 部门表数据
insert into depart values(null, 'boss', '老板，统领全局', now(), 1);
insert into depart values(null, '行政部', '负责传达领导通知，反馈各部门问题，打杂', now(), 1);
insert into depart values(null, '人事部', '负责公司员工招聘，培训，员工管理', now(), 1);
insert into depart values(null, '开发部', '负责产品开发', now(), 1);
insert into depart values(null, '测试部', '负责产品测试', now(), 1);
insert into depart values(null, '市场部', '负责业务销售', now(), 1);
insert into depart values(null, '实施部', '负责产品部署和客户培训', now(), 1);

-- 员工表数据
INSERT INTO employee VALUES(NULL, 'he', '123456', '何猿猿', 0, NOW(), NULL, 0, 50000, 0,1, 'boss');
INSERT INTO employee VALUES(NULL, 'hjm', '123456', '黄佳敏', 0, NOW(), NULL, 1, 10000, 0,2, '行政部');
INSERT INTO employee VALUES(NULL, 'glx', '123456', '郭凌霞', 1, NOW(), NULL, 1, 10000, 0,3, '人事部');
INSERT INTO employee VALUES(NULL, 'cl', '123456', '成龙', 0, NOW(), NULL, 1, 10000, 0,4, '开发部');
INSERT INTO employee VALUES(NULL, 'ft', '123456', '符涛',  1, NOW(), NULL, 1, 10000,0, 5, '测试部');
INSERT INTO employee VALUES(NULL, 'yc', '123456', '余灿',0,  NOW(), NULL, 1, 10000, 0,6, '市场部');
INSERT INTO employee VALUES(NULL, 'lxf', '123456', '廖晓凤',  1, NOW(), NULL, 1, 10000,0, 7, '实施部');
INSERT INTO employee VALUES(NULL, 'cgr', '123456', '陈桂荣', 0, NOW(), NULL, 2, 10000, 0,2, '行政部');
INSERT INTO employee VALUES(NULL, 'csq', '123456', '陈树琦',  1, NOW(), NULL, 2, 10000, 0,2, '行政部');
INSERT INTO employee VALUES(NULL, 'hhh', '123456', '胡鸿华', 0, NOW(), NULL, 2, 10000,0, 2, '行政部');
INSERT INTO employee VALUES(NULL, 'llt', '123456', '雷龙腾', 1,  NOW(), NULL, 2, 10000, 0,3, '人事部');
INSERT INTO employee VALUES(NULL, 'pl', '123456', '彭雷', 0, NOW(), NULL, 2, 10000, 0,3, '人事部');
INSERT INTO employee VALUES(NULL, 'tyl', '123456', '谭延龙',  1, NOW(), NULL, 2, 10000, 0,3, '人事部');
INSERT INTO employee VALUES(NULL, 'wf', '123456', '王飞', 0, NOW(), NULL, 2, 10000,0, 4, '开发部');
INSERT INTO employee VALUES(NULL, 'wk', '123456', '王康', 1,  NOW(), NULL, 2, 10000, 0,4, '开发部');
INSERT INTO employee VALUES(NULL, 'zj', '123456', '曾捷', 0, NOW(), NULL, 2, 10000, 0,4, '开发部');
INSERT INTO employee VALUES(NULL, 'jl', '123456', '蒋靓',  1, NOW(), NULL, 2, 10000,0, 5, '测试部');
INSERT INTO employee VALUES(NULL, 'lw', '123456', '刘雯', 0, NOW(), NULL, 2, 10000, 0,5, '测试部');
INSERT INTO employee VALUES(NULL, 'wjy', '123456', '王嘉义', 1,  NOW(), NULL, 2, 10000, 0,5, '测试部');
INSERT INTO employee VALUES(NULL, 'wly', '123456', '文凌云', 0, NOW(), NULL, 2, 10000, 0,6, '市场部');
INSERT INTO employee VALUES(NULL, 'llf', '123456', '李念峰', 1,  NOW(), NULL, 2, 10000, 0,6, '市场部');
INSERT INTO employee VALUES(NULL, 'lb', '123456', '罗斌', 0, NOW(), NULL, 2, 10000,0, 6, '市场部');
INSERT INTO employee VALUES(NULL, 'lzy', '123456', '罗志勇',  1, NOW(), NULL, 2, 10000, 0,7, '实施部');
INSERT INTO employee VALUES(NULL, 'scb', '123456', '苏成博', 0, NOW(), NULL, 2, 10000,0, 7, '实施部');
INSERT INTO employee VALUES(NULL, 'sxw', '123456', '孙小炜',  1, NOW(), NULL, 2, 10000, 0,7, '实施部');·


--   插入测试数据结束