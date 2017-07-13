-- ----------------------------
-- 医院科室专家表设计
-- ----------------------------

-- ----------------------------
-- 医院所属组织类别表
-- ----------------------------
CREATE TABLE `yl_organization`(
	`id` int(10) NOT NULL auto_increment,
	`name` varchar(50) NOT NULL,
	`remark` varchar(500),
	PRIMARY KEY  (`id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `yl_organization` VALUES ('1','旗直医疗卫生机构','');
INSERT INTO `yl_organization` VALUES ('2','基层卫生院','');
INSERT INTO `yl_organization` VALUES ('3','社区卫生服务中心','');
INSERT INTO `yl_organization` VALUES ('4','企业医院和私立医院','');
INSERT INTO `yl_organization` VALUES ('5','门诊部','鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('6','中医类','鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('7','藏医类','鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('8','蒙医类','鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('9','西医类','鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('10','口腔类','鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('11','医务室','鄂托克前旗个体诊所');
INSERT INTO `yl_organization` VALUES ('12','按摩所','鄂托克前旗个体诊所');

-- ----------------------------
-- 医院表
-- ----------------------------

CREATE TABLE `yl_hospital`(
	`id` int(10) NOT NULL auto_increment,
	`name` varchar(50) NOT NULL,
	`principal` varchar(10) NOT NULL,
	`address` varchar(100),
	`businessScope` varchar(500),
	`phone` varchar(20),
	`mobile` varchar(20),
	`orgId` int (10) NOT NULL,
	`remark` varchar(500),
	PRIMARY KEY  (`id`)
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `yl_hospital` VALUES ('1', '鄂托克前旗人民医院', '朱旭丽','敖镇莎日塔拉东街','西医综合、中医、蒙医','7627815','','1','');
INSERT INTO `yl_hospital` VALUES ('2', '鄂托克前旗蒙医医院', '阿日斯楞','敖镇苏力迪西街','蒙医综合，五疗，肝胆','7627224','','1','');
INSERT INTO `yl_hospital` VALUES ('3', '鄂托克前旗妇幼保健所', '计新兰','敖镇陶伦南街','内外妇儿蒙医肛肠，妇幼保健','7628937','','1','');
INSERT INTO `yl_hospital` VALUES ('4', '鄂托克前旗疾病预防控制中心', '高胜东','敖镇莎日塔拉东街','地方病防治、职业病防治、儿童计划免疫、传染病预防治','7622242','','1','');
INSERT INTO `yl_hospital` VALUES ('5', '鄂托克前旗卫生监督所（与疾病预防控制中心合署办公）', '高胜东','敖镇莎日塔拉东街','食品安全风险监测、职业卫生监管、公共场所和生活饮用水监督、学校卫生监督、医疗卫生监管','7622242','','1','');
INSERT INTO `yl_hospital` VALUES ('6', '鄂托克前旗城川镇中心卫生院', '姚科','城川镇','全科医学，外妇、内儿、中医、蒙医、口腔','','','2','');
INSERT INTO `yl_hospital` VALUES ('7', '鄂托克前旗昂素镇中心卫生院', '阿拉腾都西','昂素镇','全科医学、外妇、内儿、中医、蒙医','','15804774196','2','');
INSERT INTO `yl_hospital` VALUES ('8', '鄂托克前旗三段地卫生院', '田步芳','三段地社区','全科医学，外妇、内儿、中医、蒙医','','13604772369','2','');
INSERT INTO `yl_hospital` VALUES ('9', '鄂托克前旗布拉格卫生院', '阿日雅扎布','布拉格','全科医学，内儿、蒙医','','15134842220','2','');
INSERT INTO `yl_hospital` VALUES ('10', '鄂托克前旗珠和卫生院', '白忠','珠和','全科医学，内儿、中医、蒙医','','15604779310','2','');
INSERT INTO `yl_hospital` VALUES ('11', '鄂托克前旗二道川卫生院', '曹东鹏','二道川','全科医学，内儿、中医','','13904773946','2','');
INSERT INTO `yl_hospital` VALUES ('12', '鄂托克前旗毛盖图卫生院', '乌云格日乐','毛盖图','全科医学，内儿、蒙医','','15947636821','2','');
INSERT INTO `yl_hospital` VALUES ('13', '鄂托克前旗敖镇社区卫生服务中心', '白生荣','敖镇','全科医学，内儿、中医、蒙医','','13947776226','3','');
INSERT INTO `yl_hospital` VALUES ('14', '鄂托克前旗上海庙社区卫生服务中心', '郭占雄','上海庙镇','全科医学，外妇、内儿、中医、蒙医','','13384775151','3','');
INSERT INTO `yl_hospital` VALUES ('15', '新汶矿业集团有限责任公司中心医院内蒙古能源分院', '夏振建','鄂托克前旗上海庙镇','内、外、妇、儿科、眼科、耳鼻喉科、口腔科','','18653868895','4','');
INSERT INTO `yl_hospital` VALUES ('16', '鄂托克前旗济生中医医院', '童世民','敖镇苏力迪大街','中医内、外、妇、儿科中西医结合科、针灸、推拿、按摩理疗、康复、急诊、检验、影像、预防保健、西医内科、外科、妇产科、B超科','','13847727871','4','');
INSERT INTO `yl_hospital` VALUES ('17', '鄂托克前旗仁爱中西医门诊部', '吴国发','敖镇珠和东街（中智佳苑底商）','许可经营项目：中西医结合内、外、妇科；肛肠科、不孕不育科、预防保健科、耳鼻喉科、功能科、检验科、B超室服务。','','18647174297','5','');
INSERT INTO `yl_hospital` VALUES ('18', '鄂托克前旗白占祥中医诊所', '白占祥','敖镇沙日特拉西街','中医内科服务。 ','','13947711069','6','');
INSERT INTO `yl_hospital` VALUES ('19', '鄂托克前旗刘占东中医诊所', '刘占东','敖镇毛盖图西街（石油公司集资楼）','中医内科服务。 ','','13847753693','6','');
INSERT INTO `yl_hospital` VALUES ('20', '鄂托克前旗张双林中医诊所', '张双林','敖镇毛盖图西街（石油公司家属区）','中医内科服务。 ','7621649','13704772350','6','');
INSERT INTO `yl_hospital` VALUES ('21', '鄂托克前旗沈志舜中医诊所', '沈志舜','敖镇乌兰新区（市场南侧）','许可经营项目：中医内科服务。','','13947786110','6','');
INSERT INTO `yl_hospital` VALUES ('22', '鄂托克前旗张贵中医诊所', '张贵','敖镇毛盖图东街（北市场南侧）','中医内科服务。','','13734833276','6','');
INSERT INTO `yl_hospital` VALUES ('23', '马锦川中医诊所', '马锦川','敖镇珠和东街','中医内科服务。','7627213','13948479131','6','');
INSERT INTO `yl_hospital` VALUES ('24', '鄂前旗李艳梅中医诊所', '李艳梅','鄂前旗敖勒召其镇','中医内科服务。','','13947750312','6','');
INSERT INTO `yl_hospital` VALUES ('25', '鄂前旗聂智藏医诊所', '聂智','敖镇布拉格西街满都拉社区','　藏医内科','','18347745566','7','');
INSERT INTO `yl_hospital` VALUES ('26', '鄂托克前旗巴音格西格蒙医诊疗所', '巴音格西格','敖镇玛拉迪东街','蒙医服务','','13947374905','8','');
INSERT INTO `yl_hospital` VALUES ('27', '鄂托克前旗其木格蒙医诊所', '其木格达丽','敖镇查汉陶勒盖西街（畜牧局家属区）','蒙医内科服务。','','13848574995','8','');
INSERT INTO `yl_hospital` VALUES ('28', '鄂托克前旗美丽明花蒙医诊所', '美丽明花','敖镇苏力迪西街（邮政储蓄对面）','蒙医内科。','','13904779309','8','');
INSERT INTO `yl_hospital` VALUES ('29', '鄂托克前旗巴图孟克蒙医诊所', '巴图孟克','敖镇其巴嘎图东街','蒙医内科。','','13134883039','8','');
INSERT INTO `yl_hospital` VALUES ('30', '鄂托克前旗敖镇南迪娜诊所', '南迪娜','敖镇玛拉迪西街','蒙医内科。','','15047392409','8','');
INSERT INTO `yl_hospital` VALUES ('31', '鄂托克前旗莫日根西医诊所', '莫日根','敖镇查干陶勒盖西街','西医内科服务','','13624875410','9','');
INSERT INTO `yl_hospital` VALUES ('32', '鄂托克前旗李大印西医诊所', '李大印','敖镇南环东路','西医内科服务。','7627783','13234846138','9','');
INSERT INTO `yl_hospital` VALUES ('33', '鄂托克前旗贾志艳西医诊所', '贾志艳','敖镇玛拉迪西街','内科、儿科、妇科服务（除母婴保健专项技术外）。','7622544','13947791289','9','');
INSERT INTO `yl_hospital` VALUES ('34', '鄂托克前旗刘裕义西医诊所', '刘裕义','敖镇新区大街三段地信用社南侧','西医诊所。','7622965','13327064325','9','');
INSERT INTO `yl_hospital` VALUES ('35', '鄂托克前旗杨海军西医诊所', '杨海军','敖镇新区大街','西医内科服务。','7627966','18904776568','9','');
INSERT INTO `yl_hospital` VALUES ('36', '鄂托克前旗王静西医诊所', '王静','敖镇苏力迪东街（检察院家属区）','西医内科服务','','13847759298','9','');
INSERT INTO `yl_hospital` VALUES ('37', '鄂托克前旗刘桂英西医诊所', '刘桂英','敖镇玛拉迪西街文化局集资楼','西医内科服务','','15949496484','9','');
INSERT INTO `yl_hospital` VALUES ('38', '鄂托克前旗韦玉山西医诊疗所', '韦玉山','敖镇新区大街','西医内科服务','','15847715758','9','');
INSERT INTO `yl_hospital` VALUES ('39', '鄂托克前旗贺海彪口腔诊所', '贺海彪','敖镇沙日塔拉西街（政府宾馆对面）','口腔内科专业、正畸专业、口腔修复专业服务','','13847971897','10','');
INSERT INTO `yl_hospital` VALUES ('40', '鄂托克前旗高树文口腔诊所', '高树文','敖镇沙日塔拉东街','口腔内科专业、正畸专业、口腔修复专业服务','7622781','13604772387','10','');
INSERT INTO `yl_hospital` VALUES ('41', '崔芳云镶牙馆', '崔芳云','敖镇沙日塔拉西街','口腔修复专业服务','','13754178229','10','');
INSERT INTO `yl_hospital` VALUES ('42', '长庆油田第三采气厂医务室', '王炳彦','昂素镇昂素嘎查','西医内科服务','','13904773140','11','');
INSERT INTO `yl_hospital` VALUES ('43', '鄂托克前旗上海庙福城矿业医务室', '皇甫俊','前旗上海庙富城矿业','西医内科服务','','18853897333','11','');
INSERT INTO `yl_hospital` VALUES ('44', '上海庙矿业有限责任公司行上海庙镇一号煤矿医务室', '丁鑫','鄂前旗上海庙镇','西医内科服务','','18747729009','11','');
INSERT INTO `yl_hospital` VALUES ('45', '榆树井煤矿筹建处医务室', '许登明','鄂旗上海庙镇榆树井煤矿','西医内科服务','','189063540517','11','');
INSERT INTO `yl_hospital` VALUES ('46', '贾东则盲人医疗按摩所', '贾东则','沙日塔拉西街','按摩','','13604774323','12','');

-- ----------------------------
-- 科室表
-- ----------------------------
CREATE TABLE `yl_department`(
	`id` int(10) NOT NULL auto_increment,
	`name` varchar(50) NOT NULL,
	`hospitalId` int(10) NOT NULL,
	`remark` varchar(500),
	PRIMARY KEY  (`id`)
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `yl_department` VALUES ('1', '院办', '1','');
INSERT INTO `yl_department` VALUES ('2', '内科', '1','');
INSERT INTO `yl_department` VALUES ('3', '眼耳鼻喉科', '1','');
INSERT INTO `yl_department` VALUES ('4', '外科', '1','');
INSERT INTO `yl_department` VALUES ('5', '妇产科', '1','');
INSERT INTO `yl_department` VALUES ('6', '中医科', '1','');
INSERT INTO `yl_department` VALUES ('7', '五官科', '1','');
INSERT INTO `yl_department` VALUES ('8', '皮肤科', '1','');
INSERT INTO `yl_department` VALUES ('9', '急诊科', '1','');
INSERT INTO `yl_department` VALUES ('10', '方便门诊', '1','');
INSERT INTO `yl_department` VALUES ('11', '放射科', '1','');
INSERT INTO `yl_department` VALUES ('12', 'B超室', '1','');
INSERT INTO `yl_department` VALUES ('13', '药械科', '1','');
INSERT INTO `yl_department` VALUES ('14', '内科', '2','');
INSERT INTO `yl_department` VALUES ('15', '妇产科', '2','');
INSERT INTO `yl_department` VALUES ('16', '肛肠科', '2','');
INSERT INTO `yl_department` VALUES ('17', '五疗科', '2','');
INSERT INTO `yl_department` VALUES ('18', '药剂科', '2','');
INSERT INTO `yl_department` VALUES ('19', '妇产科', '3','');
INSERT INTO `yl_department` VALUES ('20', '肛肠科', '3','');
INSERT INTO `yl_department` VALUES ('21', '外科', '3','');
INSERT INTO `yl_department` VALUES ('22', '儿科', '3','');
INSERT INTO `yl_department` VALUES ('23', 'B超室', '3','');
INSERT INTO `yl_department` VALUES ('24', '蒙医科', '3','');
INSERT INTO `yl_department` VALUES ('25', '办公室', '4','');
INSERT INTO `yl_department` VALUES ('26', '地病科', '4','');
INSERT INTO `yl_department` VALUES ('27', '稽查科', '4','');


-- ----------------------------
-- 卫生专家表
-- ----------------------------

CREATE TABLE `yl_specialist`(
	`id` int(10) NOT NULL auto_increment,
	`name` varchar(50) NOT NULL,
	`department` int(10),
	`hospitalId` int(10) NOT NULL,
	`title` varchar(20),
	`phone` varchar(20),
	`mobile` varchar(20),
	`address` varchar(500),
	`remark` varchar(500),
	PRIMARY KEY  (`id`)
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `yl_specialist` VALUES ('1', '朱旭丽', '1','1','副主任检验师','','','','');
INSERT INTO `yl_specialist` VALUES ('2', '陈丽芬', '1','1','副主任护师','','','','');
INSERT INTO `yl_specialist` VALUES ('3', '侯再明', '2','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('4', '邬文彬', '3','1','主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('5', '郝安礼', '2','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('6', '杜丽芳', '2','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('7', '冯择', '4','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('8', '米虎成', '5','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('9', '沙茹拉其其格', '5','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('10', '冯治字', '5','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('11', '张相改', '5','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('12', '丛爱明', '6','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('13', '程凤成', '6','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('14', '贺慧珍', '7','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('15', '张金和', '8','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('16', '刘丽娟', '9','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('17', '李万明', '10','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('18', '王高升', '11','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('19', '张旭升', '11','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('20', '黄怀仁', '12','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('21', '美日更高娃', '13','1','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('22', '金巴图', '14','2','蒙医主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('23', '乌兰巴雅尔', '14','2','蒙医主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('24', '哈斯格日勒', '15','2','蒙医主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('25', '额日德尼达来', '14','2','蒙医副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('26', '斯琴图雅', '16','2','蒙医副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('27', '苏雅拉其其格', '17','2','蒙医副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('28', '白秀芳', '15','2','蒙医副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('29', '巴德玛吉亚', '18','2','蒙医副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('30', '乌云', '19','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('31', '图娜拉', '19','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('32', '查汗东', '19','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('33', '王苏雅拉', '19','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('34', '那顺其木格', '19','3','蒙医副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('35', '朝勒孟', '20','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('36', '白卫国', '21','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('37', '宝音', '22','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('38', '唐革命', '20','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('39', '马树霞', '23','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('40', '哈斯', '24','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('41', '贺希格', '24','3','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('42', '徐敏', '25','4','预防医学主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('43', '张金华', null,'8','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('44', '阿日雅扎布', null,'9','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('45', '白忠', null,'10','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('46', '阿拉腾其其格', null,'10','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('47', '巴德玛格日乐', null,'7','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('48', '斯日吉宁布', null,'7','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('49', '额登其劳', null,'12','副主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('50', '张建军', '25','4','中医主任医师','','','','');
INSERT INTO `yl_specialist` VALUES ('51', '闫玉生', '26','4','副主任检验师','','','','');
INSERT INTO `yl_specialist` VALUES ('52', '赵亮', '26','4','副主任检验师','','','','');
INSERT INTO `yl_specialist` VALUES ('53', '张浩', '27','4','公卫副主任医师','','','','');




select * from yl_organization o LEFT JOIN yl_hospital h ON o.id = h.orgId LEFT JOIN yl_department d ON h.id = d.hospitalId LEFT JOIN yl_specialist s ON d.id = s.dpartment WHERE o.id=1
select * from yl_hospital h LEFT JOIN yl_department d ON h.id = d.hospitalId LEFT JOIN yl_specialist s ON d.id = s.department where h.id=1;
Sql: SELECT b.bm id,b.mc text FROM SYS_XX_DICT A,SYS_XX_DICT_DETAIL B WHERE A.BM=? AND A.ID=B.DICT_ID AND B.QYBZ='Y' ORDER BY B.ORDER_ID

