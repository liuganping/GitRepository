/*
董事	1
总经理	2
副总	3
部门经理	4
部门主管	5

11-信息发布
12-公司文件
13-请示签报
14-借款申请
15-还款记录
16-会议管理
17-请休假
18-报销申请
19-预付款审批
20-公司收文
21-立项申请
22-尽职调查材料审批
23-项目审查
24-实施方案审批
25-印章、证照使用审批
26-项目付款审批
*/

+ 角色【法律合规负责人】【风险管理负责人】【业务员】【运营管理部干事】【分管合规副总】

delete from Pf_M_CharCode where CodeType=26;
insert into Pf_M_CharCode values (26,'a','项目立项阶段',0); 
insert into Pf_M_CharCode values (26,'b','项目尽职调查及实施方案设计阶段',0);
insert into Pf_M_CharCode values (26,'c','项目审查阶段',0);
insert into Pf_M_CharCode values (26,'d','决策会审议阶段',0);
insert into Pf_M_CharCode values (26,'e','项目实施阶段',0);
insert into Pf_M_CharCode values (26,'f','项目后续管理及处置阶段',0);
insert into Pf_M_CharCode values (26,'g','项目完成结算、清算与退出阶段',0);
insert into Pf_M_CharCode values (26,'x','中止',0);
commit; 

insert into Pf_M_CodeType values (27,'C','印章种类');
insert into Pf_M_CharCode values (27,'a','公章',0); 
insert into Pf_M_CharCode values (27,'b','法人章',0);
insert into Pf_M_CharCode values (27,'c','财务章',0);
insert into Pf_M_CharCode values (27,'d','其他',0);    

insert into Pf_M_CodeType values (28,'C','证照种类');
insert into Pf_M_CharCode values (28,'a','营业执照',0); 
insert into Pf_M_CharCode values (28,'b','开户许可证',0);
insert into Pf_M_CharCode values (28,'c','法人身份证',0);
insert into Pf_M_CharCode values (28,'d','其他',0);    
commit; 

+ 专项办公表
+ XmDir_CalcSubDirCfsFatherFrom	XmDir_Del	XmDir_Up	XmDir_UpdMc	XmDir_UpdParent
+ ZxBg_XmMc 

insert into Pf_M_ErrCase values ('XmDir_Del_err1','项目目录下有文件！');
insert into Pf_M_ErrCase values ('XmDir_Del_err2','保留目录禁止删除！');
insert into Pf_M_ErrCase values ('XmDir_Up_err1','保留目录禁止调序！');
insert into Pf_M_ErrCase values ('XmDir_UpdMc_err1','保留目录禁止改名！');
insert into Pf_M_ErrCase values ('XmDir_UpdParent_err1','保留目录禁止改变从属！');
insert into Pf_M_ErrCase values ('XmDir_UpdParent_err2','目标父目录不能是修改目录本身或其下级目录！');
insert into Pf_M_ErrCase values ('XmDir_UpdParent_err3','移动目录引发最大目录层级超过10层限制！');
commit;

* Pf_A_AttachInfo_11
+ UpdNodeOfBiz21	FillIndexForBiz21	UpdNodeOfBiz22	FillIndexForBiz22	UpdNodeOfBiz23	FillIndexForBiz23	UpdNodeOfBiz24	FillIndexForBiz24	UpdNodeOfBiz25	FillIndexForBiz25
insert into Pf_M_ErrCase values ('UpdNodeOfBiz21_err1','从【立项归档】向下流转前，<立项会召开时间><参会人员><立项会结果>必填！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz21_err2','从【立项归档】向下流转前，须生成立项申请表线上签字文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz21_err3','结束流程前，须标明业务状态，不能是“待定”！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz23_err1','结束流程前，须标明业务状态，不能是“待定”！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz23_err2','结束流程前，须标明审查结果！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz23_err3','结束流程前，须生成经营决策委员会成本效益审查表线上签字文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz23_err4','结束流程前，须生成经营决策委员会决策项目方案审核表线上签字文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz24_err1','结束流程前，须标明业务状态，不能是“待定”！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz24_err2','结束流程前，须生成经营决策委员会实施方案审批表线上签字文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz25_err1','结束流程前，须生成印章、证照使用审批单线上签字文件！');
commit;

+ Pf_ProcUsrIDOfBizNode UpdNodeOfBiz26	FillIndexForBiz26
insert into Pf_M_ErrCase values ('UpdNodeOfBiz26_err1','呈相关领导线上签字前，须标明资金到位时间！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz26_err2','呈相关领导线上签字前，须生成项目付款审批单线上签字文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz26_err3','项目付款审批结束的流程不能撤回！');
commit;

* PsnSel_CalcA
+ Pf_LastProcNoteOfBizNode

insert into Pub_M_BookMark values ('B21_XmDw','项目单位',21);
insert into Pub_M_BookMark values ('B21_XmMc','项目名称',21);
insert into Pub_M_BookMark values ('B21_XmJeD','项目金额',21);
insert into Pub_M_BookMark values ('B21_SqBm','申请部室',21);
insert into Pub_M_BookMark values ('B21_XmFzr','项目经理',21);
insert into Pub_M_BookMark values ('B21_XmJj','项目简介',21);
insert into Pub_M_BookMark values ('B21_SqBmFzrSpYj','申请部室负责人意见',21);
insert into Pub_M_BookMark values ('B21_SqBmFzrSpRq','申请部室负责人审批时间',21);
insert into Pub_M_BookMark values ('B21_SqBmFgLdSpYj','申请部室分管副总意见',21);
insert into Pub_M_BookMark values ('B21_SqBmFgLdSpRq','申请部室分管副总审批时间',21);
insert into Pub_M_BookMark values ('B21_FwSpYj','法律合规部意见',21);
insert into Pub_M_BookMark values ('B21_FwSpRq','法律合规部审批时间',21);
insert into Pub_M_BookMark values ('B21_CwSpYj','财务部意见',21);
insert into Pub_M_BookMark values ('B21_CwSpRq','财务部审批时间',21);
insert into Pub_M_BookMark values ('B21_JchZrSpYj','决策会主任委员意见',21);
insert into Pub_M_BookMark values ('B21_JchZrSpRq','决策会主任委员审批时间',21);
commit;

+ 模板：06、立项申请审批表
+ XmGk_SfGdDir

菜单调整：
	*简易印章管理 > 印章管理
	+印章客户端

insert into Pub_M_BookMark values ('B14_SqSj','申请时间',14);
insert into Pub_M_BookMark values ('B15_SqSj','申请时间',15);
insert into Pub_M_BookMark values ('B18_SqSj','申请时间',18);

印章标签： 
14-借款申请		S14Sqr S14BmFzr S14Cn S14CwShr S14Zjl
15-还款记录 	S15Jkr S15Cn
18-报销申请		S18BmFzr S18Zjl S18CwFzr S18CwShr S18Cn
19-预付款审批	S19Zjl S19CwFzr S19CwShr S19BmFzr S19Cn
21-立项申请 	S21BmFzr S21FgFz S21Hgb S21Cwb S21JchZr

* PsnSel_CalcA
ALTER TABLE `Pf_M_Ent` ADD COLUMN `ZoomSealSvrURL` VARCHAR(100) DEFAULT NULL COMMENT '电子印章服务网址';

+ZxBg_M_QyGs ZxBg_M_XmBhNdFp
*ZxBg_M_XmXx
ALTER TABLE `ZxBg_M_XmXx` ADD COLUMN `QyGsID` TINYINT(3) UNSIGNED DEFAULT NULL AFTER `XmDwID`;
ALTER TABLE `ZxBg_M_XmXx` MODIFY COLUMN `QyGsID` TINYINT(3) UNSIGNED DEFAULT NULL COMMENT '签约公司';
ALTER TABLE `ZxBg_M_XmXx` ADD COLUMN `XmBh` VARCHAR(20) DEFAULT NULL UNIQUE COMMENT '项目编号' AFTER `QyGsID`;

*ZxBg_A_LxSq
ALTER TABLE `ZxBg_A_LxSq` ADD COLUMN `QyGsID` TINYINT(3) UNSIGNED DEFAULT NULL COMMENT '签约公司';

+ZxBg_QyGsDm ZxBg_QyGsMc

*UpdNodeOfBiz21 FillIndexForBiz21
delete from Pf_M_ErrCase where Code='UpdNodeOfBiz21_err1';
insert into Pf_M_ErrCase values ('UpdNodeOfBiz21_err1','从【立项归档】向下流转前，<立项会召开时间><参会人员><立项会结果><签约公司>必填！');

*#31字符编码表 R > F
*#13整型编码表

3.18后的更新
+JkBx_M_JkYe ZxBg_M_Skf JkBx_A_Jk JkBx_A_Hk
*JkBx_A_Bx JkBx_A_BxZs JkBx_A_BxBg>JkBx_A_BxQt

delete from Pf_M_ErrCase where Code='JkBx_A_RcJk_11_err1';
delete from Pf_M_ErrCase where Code='JkBx_A_RcJk_11_err2';
delete from Pf_M_ErrCase where Code='JkBx_A_RcJk_13_err1';
delete from Pf_M_ErrCase where Code='JkBx_A_RcJk_13_err2';

delete from Pf_M_ErrCase where Code='JkBx_A_CcJk_11_err1';
delete from Pf_M_ErrCase where Code='JkBx_A_CcJk_11_err2';
delete from Pf_M_ErrCase where Code='JkBx_A_CcJk_11_err3';
delete from Pf_M_ErrCase where Code='JkBx_A_CcJk_13_err1';
delete from Pf_M_ErrCase where Code='JkBx_A_CcJk_13_err2';
delete from Pf_M_ErrCase where Code='JkBx_A_CcJk_13_err3';

delete from Pf_M_ErrCase where Code='UpdNodeOfBiz14_Err1';
delete from Pf_M_ErrCase where Code='UpdNodeOfBiz14_Err2';
delete from Pf_M_ErrCase where Code='UpdNodeOfBiz14_Err3';
delete from Pf_M_ErrCase where Code='UpdNodeOfBiz14_Err4';
delete from Pf_M_ErrCase where Code='UpdNodeOfBiz14_Err5';

delete from Pf_M_ErrCase where Code='UpdNodeOfBiz18_Err2';

insert into Pf_M_ErrCase values ('JkBx_A_Jk_11_err1','借款周期必须大于0！');
insert into Pf_M_ErrCase values ('JkBx_A_Jk_11_err2','借款金额必须大于0！');
insert into Pf_M_ErrCase values ('JkBx_A_Jk_13_err1','借款周期必须大于0！');
insert into Pf_M_ErrCase values ('JkBx_A_Jk_13_err2','借款金额必须大于0！');

insert into Pf_M_ErrCase values ('UpdNodeOfBiz14_err1','从【出纳放款】向下流转前，须生成借款申请表线上签字文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz14_Err2','流程结束后不能撤回！');

insert into Pf_M_ErrCase values ('UpdNodeOfBiz18_err2','从【报销结清】向下流转前，须生成报销申请表线上签字文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz18_err3','从【报销结清】向下流转前，费用报销项的预算科目必须标注！');

insert into Pf_M_ErrCase values ('JkBx_A_BxTx_11_err4','费用发生时间不能大于当前时间！');
insert into Pf_M_ErrCase values ('JkBx_A_BxTx_13_err4','费用发生时间不能大于当前时间！');

delete from Pf_M_ErrCase where Code='JkBx_A_BxTx_11_err1';
insert into Pf_M_ErrCase values ('JkBx_A_BxTx_11_err1','费用月段无效（顺序无效或末月不是当前月份之前的月）！');

delete from Pf_M_ErrCase where Code='JkBx_A_BxTx_13_err1';
insert into Pf_M_ErrCase values ('JkBx_A_BxTx_13_err1','费用月段无效（顺序无效或末月不是当前月份之前的月）！');

insert into Pf_M_ErrCase values ('JkBx_A_Hk_11_err1','还款额超过借款余额！');
insert into Pf_M_ErrCase values ('JkBx_A_Hk_13_err1','还款额超过借款余额！');

*Pf_A_AttachInfo_11	FillIndexForBiz14 UpdNodeOfBiz14 JkBx_A_BxZs_21 JkBx_A_BxZs_23 JkBx_A_BxZs_22 JkBx_A_BxBg_??>JkBx_A_BxQt_?? FillIndexForBiz18 UpdNodeOfBiz18
-FillIndexForBiz15 UpdNodeOfBiz15 BxSq_JkIDName
+UpdNodeOfBiz15 FillIndexForBiz15 UpdNodeOfBiz19 FillIndexForBiz19

insert into Pub_M_BookMark values ('B14_JkBh',	'借款编号',14);
insert into Pub_M_BookMark values ('B14_JkrBm',	'借款人部门',14);
insert into Pub_M_BookMark values ('B14_JkSy',	'借款事由',14);
insert into Pub_M_BookMark values ('B14_JkZq',	'借款周期',14);
insert into Pub_M_BookMark values ('B14_JkAmt',	'借款金额小写',14);
insert into Pub_M_BookMark values ('B14_JkAmtDx',	'借款金额大写',14);

insert into Pub_M_BookMark values ('B14Qm_Jkr',	'借款人签名',14);
insert into Pub_M_BookMark values ('B14Qm_BmFzr',	'部门负责人签名',14);
insert into Pub_M_BookMark values ('B14Qm_Kj',	'会计签名',14);
insert into Pub_M_BookMark values ('B14Qm_CwFzr',	'财务负责人签名',14);
insert into Pub_M_BookMark values ('B14Qm_Zjl',	'总经理签名',14);
commit;

insert into Pub_M_BookMark values ('B15_FqBm',	'发起部门',15);
insert into Pub_M_BookMark values ('B15_FqRq',	'发起日期',15);
insert into Pub_M_BookMark values ('B15_HkDx',	'还款大写',15);
insert into Pub_M_BookMark values ('B15_HkXx',	'还款小写',15);
insert into Pub_M_BookMark values ('B15_QkSm',	'情况说明',15);
commit;

insert into Pub_M_BookMark values ('B18_SfDwFk','是否对外付款',18);
insert into Pub_M_BookMark values ('B18_SfCdJk','是否核销备用金',18);
insert into Pub_M_BookMark values ('B18_BxrBm','报销人部门',18);
insert into Pub_M_BookMark values ('B18_TjRq','提交日期',18);
insert into Pub_M_BookMark values ('B18_Bxr','报销人',18);
insert into Pub_M_BookMark values ('B18_Txrs','同行人',18);
insert into Pub_M_BookMark values ('B18_CcSy','出差事由',18);

insert into Pub_M_BookMark values ('B18_FyRq1','费用日期1',18);
insert into Pub_M_BookMark values ('B18_FyRq2','费用日期2',18);
insert into Pub_M_BookMark values ('B18_FyRq3','费用日期3',18);
insert into Pub_M_BookMark values ('B18_FyRq4','费用日期4',18);
insert into Pub_M_BookMark values ('B18_FyRq5','费用日期5',18);
insert into Pub_M_BookMark values ('B18_FyRq6','费用日期6',18);
insert into Pub_M_BookMark values ('B18_FyRq7','费用日期7',18);
insert into Pub_M_BookMark values ('B18_FyRq8','费用日期8',18);
insert into Pub_M_BookMark values ('B18_FyRq9','费用日期9',18);
insert into Pub_M_BookMark values ('B18_FyRq10','费用日期10',18);
insert into Pub_M_BookMark values ('B18_FyRq11','费用日期11',18);
insert into Pub_M_BookMark values ('B18_FyRq12','费用日期12',18);
insert into Pub_M_BookMark values ('B18_FyRq13','费用日期13',18);
insert into Pub_M_BookMark values ('B18_FyRq14','费用日期14',18);
insert into Pub_M_BookMark values ('B18_FyRq15','费用日期15',18);
insert into Pub_M_BookMark values ('B18_FyRq16','费用日期16',18);
insert into Pub_M_BookMark values ('B18_FyRq17','费用日期17',18);
insert into Pub_M_BookMark values ('B18_FyRq18','费用日期18',18);
insert into Pub_M_BookMark values ('B18_FyRq19','费用日期19',18);
insert into Pub_M_BookMark values ('B18_FyRq20','费用日期20',18);

insert into Pub_M_BookMark values ('B18_FyLb1','费用类别1',18);
insert into Pub_M_BookMark values ('B18_FyLb2','费用类别2',18);
insert into Pub_M_BookMark values ('B18_FyLb3','费用类别3',18);
insert into Pub_M_BookMark values ('B18_FyLb4','费用类别4',18);
insert into Pub_M_BookMark values ('B18_FyLb5','费用类别5',18);
insert into Pub_M_BookMark values ('B18_FyLb6','费用类别6',18);
insert into Pub_M_BookMark values ('B18_FyLb7','费用类别7',18);
insert into Pub_M_BookMark values ('B18_FyLb8','费用类别8',18);
insert into Pub_M_BookMark values ('B18_FyLb9','费用类别9',18);
insert into Pub_M_BookMark values ('B18_FyLb10','费用类别10',18);
insert into Pub_M_BookMark values ('B18_FyLb11','费用类别11',18);
insert into Pub_M_BookMark values ('B18_FyLb12','费用类别12',18);
insert into Pub_M_BookMark values ('B18_FyLb13','费用类别13',18);
insert into Pub_M_BookMark values ('B18_FyLb14','费用类别14',18);
insert into Pub_M_BookMark values ('B18_FyLb15','费用类别15',18);
insert into Pub_M_BookMark values ('B18_FyLb16','费用类别16',18);
insert into Pub_M_BookMark values ('B18_FyLb17','费用类别17',18);
insert into Pub_M_BookMark values ('B18_FyLb18','费用类别18',18);
insert into Pub_M_BookMark values ('B18_FyLb19','费用类别19',18);
insert into Pub_M_BookMark values ('B18_FyLb20','费用类别20',18);

insert into Pub_M_BookMark values ('B18_FyMs1','费用描述1',18);
insert into Pub_M_BookMark values ('B18_FyMs2','费用描述2',18);
insert into Pub_M_BookMark values ('B18_FyMs3','费用描述3',18);
insert into Pub_M_BookMark values ('B18_FyMs4','费用描述4',18);
insert into Pub_M_BookMark values ('B18_FyMs5','费用描述5',18);
insert into Pub_M_BookMark values ('B18_FyMs6','费用描述6',18);
insert into Pub_M_BookMark values ('B18_FyMs7','费用描述7',18);
insert into Pub_M_BookMark values ('B18_FyMs8','费用描述8',18);
insert into Pub_M_BookMark values ('B18_FyMs9','费用描述9',18);
insert into Pub_M_BookMark values ('B18_FyMs10','费用描述10',18);
insert into Pub_M_BookMark values ('B18_FyMs11','费用描述11',18);
insert into Pub_M_BookMark values ('B18_FyMs12','费用描述12',18);
insert into Pub_M_BookMark values ('B18_FyMs13','费用描述13',18);
insert into Pub_M_BookMark values ('B18_FyMs14','费用描述14',18);
insert into Pub_M_BookMark values ('B18_FyMs15','费用描述15',18);
insert into Pub_M_BookMark values ('B18_FyMs16','费用描述16',18);
insert into Pub_M_BookMark values ('B18_FyMs17','费用描述17',18);
insert into Pub_M_BookMark values ('B18_FyMs18','费用描述18',18);
insert into Pub_M_BookMark values ('B18_FyMs19','费用描述19',18);
insert into Pub_M_BookMark values ('B18_FyMs20','费用描述20',18);

insert into Pub_M_BookMark values ('B18_BxAmt1','报销金额1',18);
insert into Pub_M_BookMark values ('B18_BxAmt2','报销金额2',18);
insert into Pub_M_BookMark values ('B18_BxAmt3','报销金额3',18);
insert into Pub_M_BookMark values ('B18_BxAmt4','报销金额4',18);
insert into Pub_M_BookMark values ('B18_BxAmt5','报销金额5',18);
insert into Pub_M_BookMark values ('B18_BxAmt6','报销金额6',18);
insert into Pub_M_BookMark values ('B18_BxAmt7','报销金额7',18);
insert into Pub_M_BookMark values ('B18_BxAmt8','报销金额8',18);
insert into Pub_M_BookMark values ('B18_BxAmt9','报销金额9',18);
insert into Pub_M_BookMark values ('B18_BxAmt10','报销金额10',18);
insert into Pub_M_BookMark values ('B18_BxAmt11','报销金额11',18);
insert into Pub_M_BookMark values ('B18_BxAmt12','报销金额12',18);
insert into Pub_M_BookMark values ('B18_BxAmt13','报销金额13',18);
insert into Pub_M_BookMark values ('B18_BxAmt14','报销金额14',18);
insert into Pub_M_BookMark values ('B18_BxAmt15','报销金额15',18);
insert into Pub_M_BookMark values ('B18_BxAmt16','报销金额16',18);
insert into Pub_M_BookMark values ('B18_BxAmt17','报销金额17',18);
insert into Pub_M_BookMark values ('B18_BxAmt18','报销金额18',18);
insert into Pub_M_BookMark values ('B18_BxAmt19','报销金额19',18);
insert into Pub_M_BookMark values ('B18_BxAmt20','报销金额20',18);

insert into Pub_M_BookMark values ('B18_BxAmtXx','报销金额小写',18);
insert into Pub_M_BookMark values ('B18_BxAmtDx','报销金额大写',18);
insert into Pub_M_BookMark values ('B18_PjCnt','票据张数',18);

insert into Pub_M_BookMark values ('B18_SkZhMc','账户名',18);
insert into Pub_M_BookMark values ('B18_SkZhKhh','开户行',18);
insert into Pub_M_BookMark values ('B18_SkZhNo','账号',18);
commit;

insert into Pub_M_BookMark values ('B19_SqBm','申请部门',19);
insert into Pub_M_BookMark values ('B19_SqRq','申请日期',19);
insert into Pub_M_BookMark values ('B19_Sqr', '申请人',  19);
insert into Pub_M_BookMark values ('B19_SqSm','申请说明',19);
insert into Pub_M_BookMark values ('B19_SkrMc','收款方',19);
insert into Pub_M_BookMark values ('B19_Khh', '开户银行',19);
insert into Pub_M_BookMark values ('B19_AcctNo','帐号',19);
insert into Pub_M_BookMark values ('B19_FkAmt','申请付款金额',19);
insert into Pub_M_BookMark values ('B19_LastYfYe','前期预付款余额',19);
insert into Pub_M_BookMark values ('B19_YfZe','本次付款后余额',19);
insert into Pub_M_BookMark values ('B19_YfZeDx','本次付款后余额大写',19);
insert into Pub_M_BookMark values ('B19_FjCnt','附件张数',19);
insert into Pub_M_BookMark values ('B19_Bz','备注',19);
commit;

公文：上传 > 上传word格式正文 ok

【立项会召开时间】容错	ok

项目审查 
	+项目资料查看	ok
	取消【运营管理部分管副总审查】，【决策办委员审查】改单层并发	pending
	
取消归档文件线上签名	完成方案例子-借款申请
	* Pf_M_Usr_22
insert into Pub_M_BookMark values ('B14Qm_Jkr',	'借款人签名',14);
insert into Pub_M_BookMark values ('B14Qm_BmFzr',	'部门负责人签名',14);
insert into Pub_M_BookMark values ('B14Qm_Kj',	'会计签名',14);
insert into Pub_M_BookMark values ('B14Qm_CwFzr',	'财务负责人签名',14);
insert into Pub_M_BookMark values ('B14Qm_Zjl',	'总经理签名',14);
commit;
	
+#33类字符编码表
insert into Pf_M_CodeType values (33,'C','发文/收文区分');
insert into Pf_M_CharCode values (33,'F','发文',0);
insert into Pf_M_CharCode values (33,'S','收文',0);
commit;

ALTER TABLE `GsWj_M_BhYs` ADD COLUMN `YtQf` CHAR(1) NOT NULL DEFAULT 'F' COMMENT '发文/收文区分';

+GsSw_A_Zt
*Pf_A_AttachInfo_11 Pub_A_ClosedBizViewTs_21
+业务：20-公司收文
+FillIndexForBiz20 UpdNodeOfBiz20 GsSw_WhByID
insert into Pf_M_ErrCase values ('UpdNodeOfBiz20_err1','公司收文不公开，而分发范围又没有定义！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz20_err2','在收文【登记】环节，须上传收文正文文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz20_err3','公司收文传阅/办理前要编号！');
commit;                       

insert into Pf_M_HomePageInfoBlock values (5,'最新公司收文','GsSw');    
commit;  

+#34类字符编码表
insert into Pf_M_CodeType values (34,'C','收文密级');
insert into Pf_M_CharCode values (34,'a','绝密',0);
insert into Pf_M_CharCode values (34,'b','机密',0);
insert into Pf_M_CharCode values (34,'c','普密',0);
commit;

ALTER TABLE `GsSw_A_Zt` ADD COLUMN `LwDwID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '来文单位ID' AFTER `LwWh`;
ALTER TABLE `GsSw_A_Zt` ADD COLUMN `WjMj` CHAR(1) NOT NULL COMMENT '文件密级' AFTER `LwDwID`;
ALTER TABLE `GsSw_A_Zt` ADD COLUMN `WjFs` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '份数' AFTER `WjMj`;
ALTER TABLE `GsSw_A_Zt` ADD COLUMN `SwSj` DATE NOT NULL COMMENT '收文时间' AFTER `WjFs`;

* FillIndexForBiz20

2018-04-19 得到确认全面取消归档文件线上签字

1、置所有【线上归档文件签字】环节无效；

2、置去/出【线上归档文件签字】环节分支无效；

3、签名标签
# 18-报销申请
insert into Pub_M_BookMark values ('B18Qm_BmFzr',	'部门负责人签名',18);
insert into Pub_M_BookMark values ('B18Qm_Zjl',	'总经理签名',18);
insert into Pub_M_BookMark values ('B18Qm_CwFzr',	'财务负责人签名',18);
insert into Pub_M_BookMark values ('B18Qm_CwShr',	'财务审核人签名',18);
insert into Pub_M_BookMark values ('B18Qm_Cn',	'出纳签名',18);

# 15-还款记录
insert into Pub_M_BookMark values ('B15Qm_Jkr',	'借款人签名',15);
insert into Pub_M_BookMark values ('B15Qm_Cn',	'出纳签名',15);

# 19-预付款审批
insert into Pub_M_BookMark values ('B19Qm_Zjl',	'总经理签名',19);
insert into Pub_M_BookMark values ('B19Qm_CwFzr',	'财务负责人签名',19);
insert into Pub_M_BookMark values ('B19Qm_Kj',	'会计签名',19);
insert into Pub_M_BookMark values ('B19Qm_BmFzr',	'部门负责人签名',19);
insert into Pub_M_BookMark values ('B19Qm_Cn',	'出纳签名',19);

# 21-立项申请
insert into Pub_M_BookMark values ('B21Qm_SqBmFzr',	'申请部室负责人签字',21);
insert into Pub_M_BookMark values ('B21Qm_SqBmFgLd',	'申请部室分管副总签字',21);
insert into Pub_M_BookMark values ('B21Qm_HgFgLd',	'法律合规签字',21);
insert into Pub_M_BookMark values ('B21Qm_CwFgLd',	'财务签字',21);
insert into Pub_M_BookMark values ('B21Qm_JchLd',	'决策会主任委员签字',21);

# 23-项目审查
insert into Pub_M_BookMark values ('B23Qm_Kj',	'会计签字',23);
insert into Pub_M_BookMark values ('B23Qm_CwFzr',	'财务部负责人签字',23);
insert into Pub_M_BookMark values ('B23Qm_CwFgLd',	'分管财务副总签字',23);

insert into Pub_M_BookMark values ('B23Qm_SqBmFzr',	'申请部室负责人签字',23);
insert into Pub_M_BookMark values ('B23Qm_SqBmFgLd',	'申请部室分管副总签字',23);
insert into Pub_M_BookMark values ('B23Qm_HgFgLd',	'法律合规签字',23);
insert into Pub_M_BookMark values ('B23Qm_YgFzr',	'运营管理部负责人签字',23);
insert into Pub_M_BookMark values ('B23Qm_YgFgLd',	'运营管理部分管副总签字',23);
insert into Pub_M_BookMark values ('B23Qm_JchLd',	'决策会主任委员签字',23);

# 24-实施方案审批
insert into Pub_M_BookMark values ('B24Qm_JchLd',	'决策会主任委员签字',24);
insert into Pub_M_BookMark values ('B24Qm_Dsz',	'董事长签字',24);

# 25-印章、证照使用审批
insert into Pub_M_BookMark values ('B25Qm_SqBmFzr',	'申请部室负责人签字',25);
insert into Pub_M_BookMark values ('B25Qm_SqBmFgLd',	'申请部室分管副总签字',25);
insert into Pub_M_BookMark values ('B25Qm_HgFgLd',	'法律合规签字',25);
insert into Pub_M_BookMark values ('B25Qm_Dsz',	'董事长签字',25);

# 26-项目付款审批
insert into Pub_M_BookMark values ('B26Qm_SqBmFzr',	'申请部室负责人签字',26);
insert into Pub_M_BookMark values ('B26Qm_SqBmFgLd',	'申请部室分管副总签字',26);
insert into Pub_M_BookMark values ('B26Qm_HgFgLd',	'法律合规签字',26);
insert into Pub_M_BookMark values ('B26Qm_Kj',	'会计签字',26);
insert into Pub_M_BookMark values ('B26Qm_CwFzr',	'财务部负责人签字',26);
insert into Pub_M_BookMark values ('B26Qm_CwFgLd',	'分管财务副总签字',26);
insert into Pub_M_BookMark values ('B26Qm_Zjl',	'总经理签字',26);

commit;

4、*JkBx_A_BxZsCy_11 ok

5、+ZxBg_A_YfkSp_13 

6、*UpdNodeOfBiz19

7、+Pf_ToRMB

2018-04-25

ALTER TABLE `ZxBg_A_YzZzSq` ADD COLUMN `YyFs` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用印份数';
ALTER TABLE `ZxBg_A_YzZzSq` ADD COLUMN `YyHtID` INTEGER(11) UNSIGNED DEFAULT NULL COMMENT '用印合同ID';
ALTER TABLE `ZxBg_A_YzZzSq` ADD INDEX  (`YyHtID`);

ALTER TABLE `ZxBg_M_XmXx` ADD COLUMN `LjFkAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '累计付款金额' AFTER `FkSj`;

+ZxBg_A_HtSp ZxBg_M_XmHt 
ALTER TABLE `ZxBg_A_YzZzSq` ADD CONSTRAINT `ZxBg_A_YzZzSq_fk2` FOREIGN KEY (`YyHtID`) REFERENCES `ZxBg_M_XmHt` (`ID`);

ALTER TABLE `ZxBg_A_FkSp` ADD COLUMN `YjLb` CHAR(1) NOT NULL COMMENT '依据类别' AFTER `BizStatus`;
ALTER TABLE `ZxBg_A_FkSp` DROP FOREIGN KEY `ZxBg_A_FkSp_fk2`;
ALTER TABLE `ZxBg_A_FkSp` CHANGE COLUMN `XmID` `YjID` INTEGER(11) UNSIGNED NOT NULL COMMENT '依据ID(项目/合同)';

*Pf_A_AttachInfo_11 ZxBg_A_YzZzSq_22 

insert into Pf_M_ErrCase values ('UpdNodeOfBiz25_err2','提交印章、证照使用审批前，须上传用印文本/法律合规附件！');
commit;

insert into Pub_M_BookMark values ('B25_YyFs','用印份数',25);
commit;

*UpdNodeOfBiz21

+ZxBg_A_HtSp_22 UpdNodeOfBiz27 FillIndexForBiz27 ZxBg_HtSpCl

insert into Pf_M_ErrCase values ('UpdNodeOfBiz27_err1','发起合同审批前须上传合同原版未盖章的扫描件件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz27_err2','合同获批，结束流程前须编号！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz27_err3','合同获批，结束流程前须生成合同审批单归档文件！');
commit;

应用控制台：
增加“合同审批”功能、业务（27-合同审批）、业务环节、流程：合同审批流程201805 

insert into Pub_M_BookMark values ('B27_HtBh','合同编号',27);
insert into Pub_M_BookMark values ('B27_XmDw','项目单位',27);
insert into Pub_M_BookMark values ('B27_XmMc','项目名称',27);
insert into Pub_M_BookMark values ('B27_HtJe','合同金额',27);
insert into Pub_M_BookMark values ('B27_YwBm','业务部门',27);
insert into Pub_M_BookMark values ('B27_XmJl','项目经理',27);
insert into Pub_M_BookMark values ('B27_XmJj','项目简介',27);
insert into Pub_M_BookMark values ('B27_HtMc','合同名称',27);
insert into Pub_M_BookMark values ('B27_HtFj','合同附件',27);
insert into Pub_M_BookMark values ('B27_YwBmFzrYj','业务部负责人审批意见',27);
insert into Pub_M_BookMark values ('B27_YwBmFzrSj','业务部负责人审批时间',27);
insert into Pub_M_BookMark values ('B27_YwBmFgFzYj','业务部分管副总审批意见',27);
insert into Pub_M_BookMark values ('B27_YwBmFgFzSj','业务部分管副总审批时间',27);
insert into Pub_M_BookMark values ('B27_HgFzrYj','合规部负责人审批意见',27);
insert into Pub_M_BookMark values ('B27_HgFzrSj','合规部负责人审批时间',27);
insert into Pub_M_BookMark values ('B27Qm_YwBmFzr','业务部负责人签名',27);
insert into Pub_M_BookMark values ('B27Qm_YwBmFgFz','业务部分管副总签名',27);
insert into Pub_M_BookMark values ('B27Qm_HgFzr','合规部负责人签名',27);
commit;

企业管理员改应用模板名：去掉数字前缀，+合同审批单

+ZxBg_HtMc ZxBg_XmIDByHtID
*UpdNodeOfBiz22 UpdNodeOfBiz23 UpdNodeOfBiz24 UpdNodeOfBiz25 FillIndexForBiz25 FillIndexForBiz26 UpdNodeOfBiz26
+流程： 项目审查流程201805 印章证照使用审批流程201805

delete from Pf_M_ErrCase where Code='UpdNodeOfBiz26_err1';
delete from Pf_M_ErrCase where Code='UpdNodeOfBiz26_err2';
insert into Pf_M_ErrCase values ('UpdNodeOfBiz26_err1','付款流程结束前，须标明资金到位时间！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz26_err2','付款流程结束前，须生成项目付款审批单线上签字文件！');
commit;

CREATE ALGORITHM=UNDEFINED DEFINER=CURRENT_USER SQL SECURITY DEFINER VIEW `v_ZxBg_A_FkSp`
AS
select a.ID,xm.XmMc,Pf_EntAppCodeVal(xm.XmDwID) XmDw,xm.XmJe,'-' HtMc,a.DjCnt,a.SkrMc,a.Khh,a.AcctNo,a.FkAmt,a.ZfFs,a.FkSy,a.HtQdRq,a.ZjDwRq,xm.SqLxSj,xm.XmJj,xm.QqFyYn,
	xm.LxhZkSj,xm.LxhChRyIDs,xm.LxhJgMs,xm.JzDcXzCyIDs,xm.XmScJgMs,xm.JchSqSj,xm.JchZkSj,xm.ChTpCnt,xm.PassCnt,xm.RejectCnt,xm.SsYj,a.InitOrgName
from ZxBg_A_FkSp a, ZxBg_M_XmXx xm 
where a.YjLb='a' and a.YjID=xm.ID 
union 
select a.ID,xm.XmMc,Pf_EntAppCodeVal(xm.XmDwID) XmDw,xm.XmJe,ht.HtMc, a.DjCnt,a.SkrMc,a.Khh,a.AcctNo,a.FkAmt,a.ZfFs,a.FkSy,a.HtQdRq,a.ZjDwRq,xm.SqLxSj,xm.XmJj,xm.QqFyYn,
	xm.LxhZkSj,xm.LxhChRyIDs,xm.LxhJgMs,xm.JzDcXzCyIDs,xm.XmScJgMs,xm.JchSqSj,xm.JchZkSj,xm.ChTpCnt,xm.PassCnt,xm.RejectCnt,xm.SsYj,a.InitOrgName
from ZxBg_A_FkSp a, ZxBg_M_XmHt ht,ZxBg_M_XmXx xm 
where a.YjLb='b' and a.YjID=ht.ID and ht.XmID=xm.ID;

模板：13、项目付款审批单.docx 更新

改流程：
select Seq from Pf_A_Biz where BizCode=18 order by Seq;

call Pf_DelBiz(43);
call Pf_DelBiz(44);
call Pf_DelBiz(45);
call Pf_DelBiz(75);
call Pf_DelBiz(88);

commit;

印章、证照使用审批
+环节： 分管财务领导意见 总经理意见
+角色： 分管财务副总 注意加人
*调整角色顺序
*调整流程： 增加分支条件
*前台：
	src/com/infohold/EntApps/YzZzSq/Handle.java
	src/com/infohold/EntApps/YzZzSq/HandleSave.java

信息发布接驳网络爬虫
select Seq from Pf_A_Biz where BizCode=11 order by Seq;

call Pf_DelBiz(4);
call Pf_DelBiz(14);
call Pf_DelBiz(15);
call Pf_DelBiz(16);
commit;

删除11类企业编码、#1整型#11应用种类
+XxFb_M_Lm

insert into Pf_M_ErrCase values ('XxFb_M_Lm_11_err1','无效栏目下不能增加子栏目！');
insert into Pf_M_ErrCase values ('XxFb_M_Lm_13_err1','无效状态的栏目恢复为有效的前提是其父栏目必须有效！');
commit;

删除 XxFb_A_Zt_fk1
ALTER TABLE `XxFb_A_Zt` ADD CONSTRAINT `XxFb_A_Zt_fk2` FOREIGN KEY (`GsLmID`) REFERENCES `XxFb_M_Lm` (`ID`);

+XxFb_LmBigOrd XxFb_IfLm1UnderLm2 XxFb_LmFullPathName XxFb_LmFPNsOfLmIDs XxFb_IfLeafLm 
+XxFb_CalcLmCfsFatherFrom XxFb_DelLm XxFb_InvalidateLm XxFb_UpdLmMc XxFb_UpdLmCs XxFb_UpLm

insert into Pf_M_ErrCase values ('XxFb_UpdLmCs_err1','目标父栏目不能是修改栏目本身或其子栏目！');
insert into Pf_M_ErrCase values ('XxFb_UpdLmCs_err2','移动栏目引发最大栏目层级超过10层限制！');
commit;

*FillIndexForBiz11

*<企业应用设置>功能链接： ../FileMaster/ZxSz/XxLm/main.jsp 手动更新全体用户菜单

配置流程
1、修改老流程，增加适配条件： <WebCrawler>N</WebCrawler>
2、增加流程：爬虫采编信息发布 适配条件： <WebCrawler>Y</WebCrawler> 仅一条分支： 自动发布

+【制度汇编人】
+ZdHb_M_Zt FillIndexForZdHb ZdHb_ReadFlag
*Ft_FillIndexContentOfBizAppIDs Ft_FillIndexOfAllToCmdList

insert into Pf_M_HomePageInfoBlock values (11,'最新公司制度文件','ZdWj');
insert into Pf_M_HomePageInfoBlock values (12,'员工最新办结报销','TqBjBx');
insert into Pf_M_HomePageInfoBlock values (13,'员工最新办结用印','TqBjYy');
insert into Pf_M_HomePageInfoBlock values (14,'员工最新办结付款','TqBjFk');
commit;

*UpdNodeOfBiz25 UpdNodeOfBiz18 UpdNodeOfBiz26 

设置董事长：全部地域分管、业务特权角色成员

ALTER TABLE `ZxBg_A_YzZzSq` ADD COLUMN `SfDcYy` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '是否带出用印';
+ZxBg_YyCl

insert into Pub_M_BookMark values ('B25_SfDcYy','是否申请外携用印',25);
insert into Pub_M_BookMark values ('B25Qm_Sqr','用印人',25);
insert into Pub_M_BookMark values ('B25Qm_Jyr','监印人',25);
insert into Pub_M_BookMark values ('B25_YyCl','用印材料',25);
commit;

*UpdNodeOfBiz27

+++++++++++++ 接驳JEECMS，爬取信息发布到OA +++++++++++++++++++++++++++++++++++++  Pending
在JEECMS库 > 未更新
	+Pf_Abbre +ExportedRcd
	
在OA库 > 已更新
+XxFb_ToBeReplace
ALTER TABLE `Pf_M_Ent` ADD COLUMN `WebCrawlerPath` VARCHAR(100) DEFAULT NULL COMMENT '网爬服务器路径';

/*
+Pf_M_SplitCntDicTab Pf_FillSplitCntDicTab
call Pf_FillSplitCntDicTab();
commit;
*/

*设置<信息发布>待办不强制提醒

前台：
WebRoot/admin/ent/edit.jsp

src/com/infohold/admin/ent/*
src/com/infohold/db/DbBean2.java

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ OK
+功能： 督查督办 ../FileApp/DcDb/entry0.jsp

+业务： 10 督查督办 DcDb_A_Zt 
../../FileApp/DcDb/handle.jsp?ToDoWorkItem= 
../../FileApp/DcDb/view.jsp?BizID=

+流程选人： 108 下一步处理人是督查督办承办人

+字符编码： 39-督办反馈周期

+DcDb_A_Zt DcDb_A_Fk UpdNodeOfBiz10 FillIndexForBiz10 Pf_IfAppMainHasAttach Pf_UsrMobileNum

*Pf_A_AttachInfo_11 PsnSel_CalcA

insert into Pf_M_ErrCase values ('DcDb_A_Zt_13_err1','【开始时间】在【要求完成时间】之前！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz10_err1','申请延期，【申请延期的原因】【申请延期完成时间】必填！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz10_err2','批复延期申请，须明确【是否同意延期】！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz10_err3','【督查督办】流程结束前，须生成【督办单】归档文件！');
insert into Pf_M_ErrCase values ('DcDb_A_Fk_11_err1','前条不确认不能增加新的反馈!');
insert into Pf_M_ErrCase values ('DcDb_A_Fk_13_err1','已存在后续反馈，当前反馈不能取消确认！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz10_err4','反馈内容提交督办人审核前须确认！');
commit;

insert into Pub_M_BookMark values ('B10_Dbr','督办人',10);
insert into Pub_M_BookMark values ('B10_Bh','督办编号',10);
insert into Pub_M_BookMark values ('B10_Sy','督办事由',10);
insert into Pub_M_BookMark values ('B10_Nr','督办内容',10);
insert into Pub_M_BookMark values ('B10_DbKsSj','要求开始时间',10);
insert into Pub_M_BookMark values ('B10_DbWcSj','要求完成时间',10);
insert into Pub_M_BookMark values ('B10_Cbr','承办人',10);
insert into Pub_M_BookMark values ('B10_SqYqSj','申请延期时间',10);
insert into Pub_M_BookMark values ('B10_YqWcSj','延期完成时限',10);
insert into Pub_M_BookMark values ('B10_Fk','督办结果反馈',10);
insert into Pub_M_BookMark values ('B10_LdPs','领导批示',10);
insert into Pub_M_BookMark values ('B10_Bz','备注',10);
commit;

注册模板： 督办单

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ OK
读书角
+Dsj_M_Book Dsj_A_Xd Dsj_A_XdYdRcd FillIndexForDsXd DsXd_Del

insert into Pf_M_ErrCase values ('Dsj_M_Book_13_err1','<限期阅读时间>是将来的时间！');
insert into Pf_M_ErrCase values ('Dsj_M_Book_13_err2','<限期阅读时间>是登记时间之后的时间！');
insert into Pf_M_ErrCase values ('Dsj_M_Book_13_err3','有人阅读取消无效！');
insert into Pf_M_ErrCase values ('Dsj_A_Xd_13_err1','已有人看了你的心得，取消发表无效！');
commit;

*Pf_A_AttachInfo_11 Ft_FillIndexOfAllToCmdList Ft_FillIndexContentOfBizAppIDs
+【综合人员/行政/图书管理员】

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
1、所有费用记录加“税率”、“进项税”、“发票号码”、“发票代码”
2、交通票票据张数不限制1张

+流程选人方式	
	21 从起草人部门副职选1人 ok
*PsnSel_CalcLM ok

+【部门副理审批】环节 ok
+流程定义：
	一般报销审批流程			ok
	部门两级报销审批流程	ok

分配以上两流程到正确的部门 ok

/* OK	
delete from Pf_M_IntCode where CodeType=13;
commit;

insert into Pf_M_IntCode values (13,20,	'员工成本-工资',0);
insert into Pf_M_IntCode values (13,21,	'员工成本-奖金',0);
insert into Pf_M_IntCode values (13,22,	'员工成本-劳务费',0);
insert into Pf_M_IntCode values (13,23,	'员工成本-津贴、补贴',0);
insert into Pf_M_IntCode values (13,24,	'员工成本-福利费-食堂费',0);
insert into Pf_M_IntCode values (13,25,	'员工成本-福利费-防暑降温',0);
insert into Pf_M_IntCode values (13,26,	'员工成本-福利费-职工取暖',0);
insert into Pf_M_IntCode values (13,27,	'员工成本-福利费-探亲',0);
insert into Pf_M_IntCode values (13,28,	'员工成本-福利费-体检',0);
insert into Pf_M_IntCode values (13,29,	'员工成本-福利费-工作餐',0);
insert into Pf_M_IntCode values (13,30,	'员工成本-福利费-服装',0);
insert into Pf_M_IntCode values (13,31,	'员工成本-福利费-非货币福利',0);
insert into Pf_M_IntCode values (13,32,	'员工成本-社会保险费-基本养老',0);
insert into Pf_M_IntCode values (13,33,	'员工成本-社会保险费-补充养老',0);
insert into Pf_M_IntCode values (13,34,	'员工成本-社会保险费-基本医疗',0);
insert into Pf_M_IntCode values (13,35,	'员工成本-社会保险费-补充医疗',0);
insert into Pf_M_IntCode values (13,36,	'员工成本-社会保险费-失业',0);
insert into Pf_M_IntCode values (13,37,	'员工成本-社会保险费-工伤',0);
insert into Pf_M_IntCode values (13,38,	'员工成本-社会保险费-生育',0);
insert into Pf_M_IntCode values (13,39,	'员工成本-住房公积金',0);
insert into Pf_M_IntCode values (13,40,	'员工成本-职工教育经费',0);
insert into Pf_M_IntCode values (13,41,	'员工成本-工会经费',0);
insert into Pf_M_IntCode values (13,42,	'员工成本-培训费',0);
insert into Pf_M_IntCode values (13,43,	'员工成本-劳动保护费',0);
insert into Pf_M_IntCode values (13,44,	'员工成本-市内交通费',0);
insert into Pf_M_IntCode values (13,45,	'员工成本-其他',0);
insert into Pf_M_IntCode values (13,1	,	'办公费',0);
insert into Pf_M_IntCode values (13,2	,	'文具费',0);
insert into Pf_M_IntCode values (13,3	,	'印刷费',0);
insert into Pf_M_IntCode values (13,4	,	'通讯费',0);
insert into Pf_M_IntCode values (13,5	,	'邮递费',0);
insert into Pf_M_IntCode values (13,6	,	'差旅费（交通、住宿、出差餐费、补助）',0);
insert into Pf_M_IntCode values (13,7	,	'图书资料费',0);
insert into Pf_M_IntCode values (13,8	,	'会议费',0);
insert into Pf_M_IntCode values (13,9	,	'车辆费-路桥',0);
insert into Pf_M_IntCode values (13,46,	'车辆费-油气',0);
insert into Pf_M_IntCode values (13,47,	'车辆费-修理',0);
insert into Pf_M_IntCode values (13,48,	'车辆费-停车',0);
insert into Pf_M_IntCode values (13,10,	'水电费',0);
insert into Pf_M_IntCode values (13,11,	'租赁费',0);
insert into Pf_M_IntCode values (13,12,	'运输费',0);
insert into Pf_M_IntCode values (13,13,	'电脑耗材',0);
insert into Pf_M_IntCode values (13,14,	'软件服务',0);
insert into Pf_M_IntCode values (13,15,	'证照费',0);
insert into Pf_M_IntCode values (13,16,	'业务招待费',0);
insert into Pf_M_IntCode values (13,17,	'行政收费-残保金',0);
insert into Pf_M_IntCode values (13,49,	'行政收费-水资源费',0);
insert into Pf_M_IntCode values (13,50,	'行政收费-垃圾处理',0);
insert into Pf_M_IntCode values (13,51,	'行政收费-消防费',0);
insert into Pf_M_IntCode values (13,52,	'行政收费-公共设施费',0);
insert into Pf_M_IntCode values (13,53,	'行政收费-其它',0);
insert into Pf_M_IntCode values (13,18,	'保险费-财产险',0);
insert into Pf_M_IntCode values (13,54,	'折旧费用',0);
insert into Pf_M_IntCode values (13,55,	'摊销费用-专利权',0);
insert into Pf_M_IntCode values (13,56,	'摊销费用-非专利技术',0);
insert into Pf_M_IntCode values (13,57,	'摊销费用-商标权',0);
insert into Pf_M_IntCode values (13,58,	'摊销费用-独家经营权',0);
insert into Pf_M_IntCode values (13,59,	'摊销费用-软件',0);
insert into Pf_M_IntCode values (13,60,	'佣金支出',0);
insert into Pf_M_IntCode values (13,19,	'专业机构费用-审计费',0);
insert into Pf_M_IntCode values (13,61,	'专业机构费用-非审计费用-法律服务',0);
insert into Pf_M_IntCode values (13,62,	'专业机构费用-非审计费用-诉讼',0);
insert into Pf_M_IntCode values (13,63,	'专业机构费用-非审计费用-技术咨询',0);
insert into Pf_M_IntCode values (13,64,	'专业机构费用-非审计费用-顾问',0);
insert into Pf_M_IntCode values (13,65,	'专业机构费用-非审计费用-事务所非审计服务',0);
insert into Pf_M_IntCode values (13,66,	'专业机构费用-非审计费用-评估',0);
insert into Pf_M_IntCode values (13,67,	'专业机构费用-非审计费用-其它',0);
insert into Pf_M_IntCode values (13,68,	'安保服务费',0);
insert into Pf_M_IntCode values (13,69,	'交易手续费',0);
insert into Pf_M_IntCode values (13,70,	'其它',0);
commit;
*/

+Pf_M_OrgBizFlow

ALTER TABLE `JkBx_A_Bx` ADD COLUMN `JtTaxAmt` DECIMAL(7,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '交通费进项税' AFTER `JtAmt`;
ALTER TABLE `JkBx_A_Bx` ADD COLUMN `ZdTaxAmt` DECIMAL(7,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '招待费进项税' AFTER `ZdAmt`;
ALTER TABLE `JkBx_A_Bx` ADD COLUMN `TxTaxAmt` DECIMAL(7,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '通讯费进项税' AFTER `TxAmt`;
ALTER TABLE `JkBx_A_Bx` ADD COLUMN `QtTaxAmt` DECIMAL(7,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '其它费进项税' AFTER `QtAmt`;
*JkBx_A_Bx_13

ALTER TABLE `JkBx_A_BxJt` ADD COLUMN `TaxAmt` DECIMAL(7,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '进项税' AFTER `HfAmt`;
ALTER TABLE `JkBx_A_BxJt` ADD COLUMN `TaxRate` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '税率' AFTER `HfAmt`;
ALTER TABLE `JkBx_A_BxJt` ADD COLUMN `InvNum` VARCHAR(20) NOT NULL DEFAULT '0' COMMENT '发票号码' AFTER `TaxAmt`;
ALTER TABLE `JkBx_A_BxJt` ADD COLUMN `InvCode` VARCHAR(20) NOT NULL DEFAULT '0' COMMENT '发票代码' AFTER `InvNum`;
*JkBx_A_BxJt_11 JkBx_A_BxJt_13 JkBx_A_BxJt_21 JkBx_A_BxJt_22 JkBx_A_BxJt_23

ALTER TABLE `JkBx_A_BxZs` ADD COLUMN `TaxRate` TINYINT(2) UNSIGNED NOT NULL DEFAULT 6 COMMENT '税率' AFTER `HfAmt`;
ALTER TABLE `JkBx_A_BxZs` ADD COLUMN `InvNum` VARCHAR(20) NOT NULL DEFAULT '0' COMMENT '发票号码' AFTER `TaxAmt`;
ALTER TABLE `JkBx_A_BxZs` ADD COLUMN `InvCode` VARCHAR(20) NOT NULL DEFAULT '0' COMMENT '发票代码' AFTER `InvNum`;
*JkBx_A_BxZs_11 JkBx_A_BxZs_13 

ALTER TABLE `JkBx_A_BxTx` ADD COLUMN `TaxRate` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '税率' AFTER `HfAmt`;
ALTER TABLE `JkBx_A_BxTx` ADD COLUMN `TaxAmt` DECIMAL(7,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '进项税' AFTER `TaxRate`;
ALTER TABLE `JkBx_A_BxTx` ADD COLUMN `InvNum` VARCHAR(20) NOT NULL DEFAULT '0' COMMENT '发票号码' AFTER `TaxAmt`;
ALTER TABLE `JkBx_A_BxTx` ADD COLUMN `InvCode` VARCHAR(20) NOT NULL DEFAULT '0' COMMENT '发票代码' AFTER `InvNum`;
*JkBx_A_BxTx_11 JkBx_A_BxTx_13 JkBx_A_BxTx_21 JkBx_A_BxTx_22 JkBx_A_BxTx_23

ALTER TABLE `JkBx_A_BxQt` ADD COLUMN `TaxRate` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '税率';
ALTER TABLE `JkBx_A_BxQt` ADD COLUMN `TaxAmt` DECIMAL(7,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '进项税';
ALTER TABLE `JkBx_A_BxQt` ADD COLUMN `InvNum` VARCHAR(20) NOT NULL DEFAULT '0' COMMENT '发票号码';
ALTER TABLE `JkBx_A_BxQt` ADD COLUMN `InvCode` VARCHAR(20) NOT NULL DEFAULT '0' COMMENT '发票代码';
*JkBx_A_BxQt_11 JkBx_A_BxQt_13 JkBx_A_BxQt_21 JkBx_A_BxQt_22 JkBx_A_BxQt_23

+JkBx_A_BxCf
insert into Pf_M_ErrCase values ('JkBx_A_BxCf_11_err1','发生时间不能大于当前时间！');
insert into Pf_M_ErrCase values ('JkBx_A_BxCf_11_err2','差旅餐费必须大于0！');
insert into Pf_M_ErrCase values ('JkBx_A_BxCf_13_err1','发生时间不能大于当前时间！');
insert into Pf_M_ErrCase values ('JkBx_A_BxCf_13_err2','差旅餐费必须大于0！');
commit;

*FillIndexForBiz18

insert into Pub_M_BookMark values ('B18_BxTaxAmt1',	'进项税1',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt2',	'进项税2',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt3',	'进项税3',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt4',	'进项税4',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt5',	'进项税5',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt6',	'进项税6',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt7',	'进项税7',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt8',	'进项税8',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt9',	'进项税9',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt10',	'进项税10',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt11',	'进项税11',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt12',	'进项税12',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt13',	'进项税13',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt14',	'进项税14',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt15',	'进项税15',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt16',	'进项税16',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt17',	'进项税17',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt18',	'进项税18',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt19',	'进项税19',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt20',	'进项税20',18);
commit;

模板更新

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ OK
1、督办模板中“领导意见”套【反馈报告审核与归档】环节意见（之前是套立项审批意见+延期审批意见）；
2、【立项】环节不显示延期相关栏

WebRoot/FileApp/DcDb/handle.jsp

src/com/infohold/FileApp/DcDb/GenGdWord.java

作废以下分支：
	提交立项审批
	呈公司领导审批
	
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
【督查督办】点击“完成督办事项，提交督办人审核”分支增加提示；
取消所有业务附件必须看了才能往下流转的限制；
给董事长增加【特权全业务监控】功能；            
insert into Pf_M_HomePageInfoBlock values (15,'特权全业务监控','TqBizMonitor');
commit;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
9-非业务类合同管理
+WjHq_A_Zt UpdNodeOfBiz09 FillIndexForBiz09
*Pf_A_AttachInfo_11
开功能、业务、业务环节、流程

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
11-信息发布
整理角色<是否保留> ok
增加角色【运营管理部分管副总】 ok
调整环节 ok
新开流程： 公司信息发布流程 ok
设置栏目的<爬虫系统栏目ID> ok
*
src/com/infohold/FileApp/XxFb/ListA/Insert.java ok
src/com/infohold/FileApp/XxFb/Handle.java		ok

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
12-公司文件
【部门审批】> 【部门主管审批】 ok
+【运营管理部分管副总审批】	ok
【领导签发】>【总经理审批】	ok
+流程： 公司文件发文流程201806	ok
*
src/com/infohold/FileApp/GsWj/GetThData.java	ok
src/com/infohold/FlowProc/SubmitFromHandle.java ok
WebRoot/FileApp/GsWj/handle.jsp	ok

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
登录
WebRoot/PortalFiles/images/*.*
WebRoot/login.jsp
src/com/infohold/Login.java

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
会议管理
select Seq from Pf_A_Biz where BizCode=16 order by Seq;
call Pf_DelBiz(18);
call Pf_DelBiz(251);
commit;
删除流程定义分支、流程定义

编辑流程业务编码定义： *主体表名 > HyGl_A_Zt
调整业务环节
+流程选人方式 102-下一步处理人是会议发起指定记录人
+流程选人方式 103-下一步处理人是会议发起指定参会人
传输流程

ALTER TABLE `Hy_A_Zt` RENAME AS `HyGl_A_Zt`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `Bh`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `SyQkFk`;
ALTER TABLE `HyGl_A_Zt` DROP FOREIGN KEY `Hy_A_Zt_fk3`;
ALTER TABLE `HyGl_A_Zt` DROP FOREIGN KEY `Hy_A_Zt_fk2`;
ALTER TABLE `HyGl_A_Zt` DROP INDEX `ZcrUsrID`;
ALTER TABLE `HyGl_A_Zt` DROP INDEX `CdID`;
ALTER TABLE `HyGl_A_Zt` DROP INDEX `InitUsrID_2`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `CdID`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `ZcrUsrID`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `QtYq`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `HyDjCodes`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `ZxtXms`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `HyBt`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `ChRs`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `WbChRyZj`;
ALTER TABLE `HyGl_A_Zt` DROP COLUMN `WbChRs`;
ALTER TABLE `HyGl_A_Zt` CHANGE COLUMN `HeBt` `Mc` VARCHAR(100) COLLATE utf8_general_ci NOT NULL COMMENT '会议名称';
ALTER TABLE `HyGl_A_Zt` CHANGE COLUMN `Nr` `Yt` VARCHAR(400) COLLATE utf8_general_ci NOT NULL COMMENT '会议内容';
ALTER TABLE `HyGl_A_Zt` ADD COLUMN `RcdUsrID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '记录人ID';
ALTER TABLE `HyGl_A_Zt` ADD COLUMN `Jy` VARCHAR(400) DEFAULT NULL COMMENT '会议决议';
ALTER TABLE `HyGl_A_Zt` ADD UNIQUE INDEX `HyGl_A_Zt_uk` (`Mc`, `ZkSj`);
ALTER TABLE `HyGl_A_Zt` ADD INDEX  (`RcdUsrID`);
ALTER TABLE `HyGl_A_Zt` ADD CONSTRAINT `HyGl_A_Zt_fk2` FOREIGN KEY (`RcdUsrID`) REFERENCES `Pf_M_Usr` (`ID`);
ALTER TABLE `HyGl_A_Zt` ADD COLUMN `DdID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '会议地点ID' AFTER `Yt`;

*Pf_A_AttachInfo_11

DROP TRIGGER `Hy_A_Zt_22`;
CREATE DEFINER = 'root'@'%' TRIGGER `HyGl_A_Zt_22` AFTER DELETE ON `HyGl_A_Zt`
  FOR EACH ROW
BEGIN
	update Pf_A_AttachInfo set DelTag='Y' where PrimaryName IN ('HyGl_A_Zt1','HyGl_A_Zt2','HyGl_A_Zt2C') and PrimaryID=old.ID;
END;

delete from Pf_M_ErrCase where Code in ('Hy_A_Zt_11_err1','Hy_A_Zt_11_err2','Hy_A_Zt_11_err3','Hy_A_Zt_11_err4');
commit;

DROP TRIGGER `Hy_A_Zt_11`;
CREATE DEFINER = 'root'@'%' TRIGGER `HyGl_A_Zt_11` BEFORE INSERT ON `HyGl_A_Zt`
  FOR EACH ROW
label1:
BEGIN
 	if new.ZkSj>=new.BmSj then
 		call HyGl_A_Zt_11_err1(); # 召开时间不能大于闭幕时间！
 		LEAVE label1;
 	end if;
END;

insert into Pf_M_ErrCase values ('HyGl_A_Zt_11_err1','召开时间不能大于闭幕时间！');
commit;

delete from Pf_M_ErrCase where Code in ('Hy_A_Zt_13_err1','Hy_A_Zt_13_err4','Hy_A_Zt_13_err2');
commit;

DROP TRIGGER `Hy_A_Zt_13`;
CREATE DEFINER = 'root'@'%' TRIGGER `HyGl_A_Zt_13` BEFORE UPDATE ON `HyGl_A_Zt`
  FOR EACH ROW
label1:
BEGIN
 	if new.ZkSj>=new.BmSj then
 		call Hy_A_Zt_13_err1(); # 召开时间不能大于闭幕时间！
 		LEAVE label1;
 	end if;
END;

insert into Pf_M_ErrCase values ('HyGl_A_Zt_13_err1','召开时间不能大于闭幕时间！');
commit;

delete from Pf_M_ErrCase where Code = 'UpdNodeOfBiz16_err1';
commit;

*UpdNodeOfBiz16 FillIndexForBiz16 PsnSel_CalcA Pf_IfUsrHasBizViewPower
+Pf_LastToDoArrivedTsOfBizNode

前台
WebRoot/FileMaster/ZxSz/*
WebRoot/FileApp/HyGl/*

src/com/infohold/FileMaster/ZxSz/Top.java
src/com/infohold/FileApp/HyGl/*
src/com/infohold/FlowProc/SubmitFromHandle.java
src/com/infohold/FrameApp/HomePage/HyGlFb.java
src/com/infohold/FrameApp/HomePage/HyGlTz.java

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
7-档案交接 8-档案借阅
增加角色【档案管理员】挂在“综合人员/行政/”下，放人
手动加模块、功能
	模块： 
		档案交接借阅 6 档案交接、借阅
	功能： 
		档案交接 ../EntApps/DaJj/entry0.jsp 档案交接 1
		档案借阅 ../EntApps/DaJy/entry0.jsp 档案借阅 3
		
业务、业务环节、流程 程序化增加
	档案交接流程
	档案借阅流程

+Da_A_Jj Da_A_Jy
*Pf_A_AttachInfo_11
+UpdNodeOfBiz07 FillIndexForBiz07 UpdNodeOfBiz08 FillIndexForBiz08

WebRoot/EntApps/DaJj/*
WebRoot/EntApps/DaJy/*
src/com/infohold/EntApps/DaJj/*
src/com/infohold/EntApps/DaJy/*
src/com/infohold/FramePub/web/action/qwjs/qwjsAction.java 解决全文检索翻页问题

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
报销业务调整
	*费用报销凭证 模板
	*部门两级报销审批流程、一般报销审批流程	俩流程【报销结清】环节处理人改申请人自己

	*UpdNodeOfBiz18
delete from Pf_M_ErrCase where Code = 'UpdNodeOfBiz18_err3';
insert into Pf_M_ErrCase values ('UpdNodeOfBiz18_err3','发起报销申请向下流转前，费用报销项的预算科目必须标注！');
commit;

	WebRoot/FrameApp/AddrList/edit.jsp 个人签名图片放大到20k
	WebRoot/FileApp/BxSq/handle1.jsp	费用科目申请人选
	src/com/infohold/FileApp/BxSq/Handle1Save.java 费用科目申请人选

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
报销模板调整
* src/com/infohold/FileApp/BxSq/ListA/Insert.java 发起初始化收款账户
* 增加到30M一次上传容量
WebRoot/EntApps/HtSp/handle.jsp
WebRoot/EntApps/YzZzSq/handle.jsp 

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
报销项发生时间到分
WebRoot/FileApp/BxSq/CfInsert.jsp
WebRoot/FileApp/BxSq/CfEdit.jsp
WebRoot/FileApp/BxSq/QtInsert.jsp
WebRoot/FileApp/BxSq/QtEdit.jsp
WebRoot/FileApp/BxSq/TxInsert.jsp
WebRoot/FileApp/BxSq/TxEdit.jsp

src/com/infohold/FileApp/BxSq/Handle1.java
src/com/infohold/FileApp/BxSq/CfEdit.java
src/com/infohold/FileApp/BxSq/QtEdit.java
src/com/infohold/FileApp/BxSq/TxEdit.java
	
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
+【合同审查】业务 
*【用印】业务增加【财务主管备案】环节，相应改流程 
*【合同审批】流程，不询问了，分管直接提交合规 
*【非业务合同审批】流程结束接续用印

>>>	
用印流程增加【财务主管备案】环节、流程调整
合同审批流程调整

+功能： 合同审查 ../EntApps/HtSc/entry0.jsp 未正式立项的项目需要签署合同 5
+业务： 28-合同审查 ZxBg_A_HtSc 	../../EntApps/HtSc/handle.jsp?ToDoWorkItem= 	../../EntApps/HtSc/view.jsp?BizID=
+流程： 合同审查流程

ALTER TABLE `ZxBg_A_YzZzSq` ADD COLUMN `YyHtScID` INTEGER UNSIGNED DEFAULT NULL COMMENT '用印合同审查ID' AFTER `YyHtID`;
ALTER TABLE `ZxBg_A_YzZzSq` ADD COLUMN `YyWjHqID` INTEGER UNSIGNED DEFAULT NULL COMMENT '用印非业务合同审批ID' AFTER `YyHtScID`;

*UpdNodeOfBiz09 UpdNodeOfBiz27 FillIndexForBiz27 Pf_A_AttachInfo_11 FillIndexForBiz25 UpdNodeOfBiz25 ZxBg_YyCl
+ZxBg_M_LsXm ZxBg_LsXmMc ZxBg_A_HtSc UpdNodeOfBiz28 FillIndexForBiz28 ZxBg_YyHtMc ZxBg_HtScCl

delete from Pf_M_ErrCase where Code='UpdNodeOfBiz25_err1';
insert into Pf_M_ErrCase values ('UpdNodeOfBiz25_err1','提交财务主管备案前，须生成印章、证照使用审批单线上签字文件！');
commit;

insert into Pf_M_ErrCase values ('UpdNodeOfBiz28_err1','发起合同审查前须上传合同原版未盖章的扫描件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz28_err2','合同获批，结束流程前须编号！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz28_err3','合同获批，结束流程前须生成合同审查单归档文件！');
commit;	

insert into Pub_M_BookMark
select replace(Code,'27','28') Code,Name,28 BizCode 
from Pub_M_BookMark 
where BizCode=27;
commit;

“合同审查单”模板上传

增加到40M一次上传容量

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ OK
待办短信 >>>

+Pf_D_PromptSm Pf_D_PromptSmTo Pf_SmSend Pf_MailSend
*Pf_D_ToDoLink_21

WebRoot/FrameApp/AddrList/edit.jsp
WebRoot/FrameApp/Admin12Maintain/usr/edit.jsp
WebRoot/FrameApp/Admin12Maintain/usr/insert.jsp

src/com/infohold/FrameApp/PollingCycle1.java
src/com/infohold/FrameApp/PollingCycle5.java
src/com/infohold/FrameApp/PollingCycleListener.java
src/com/infohold/FramePub/util/SMSUtil.java

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ok
1、改ckeditor，内嵌图片按文件流水显示（方便将来迁移系统） 
2、信息评论改html格式
3、公司论坛
>>>
ALTER TABLE `XxFb_A_Pl` MODIFY COLUMN `PlNr` MEDIUMTEXT COLLATE utf8_general_ci NOT NULL;
*Pf_A_AttachInfo_11 XxFb_PlrXm XxFb_A_Pl_22 XxFb_A_Pl_11
ALTER TABLE `XxFb_A_Pl` DROP INDEX `XxFb_A_Pl_idx1`;
+XxFb_SfPlGjFj XxFb_A_Zt_12
delete from Pf_M_ErrCase where Code='XxFb_A_Pl_11_err1';
commit;

+GsLt_A_Zt GsLt_A_Pl GsLt_A_Tp UpdNodeOfBiz06 FillIndexForBiz06 GsLt_PlrXm GsLt_SfPlGjFj v_GsLt_A_Tp
insert into Pf_M_ErrCase values ('UpdNodeOfBiz06_err01','参与范围类别不是公司全员，而参与范围又没有定义！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz06_err02','已发生评论或投票，“发起议题讨论或投票”动作不能撤回！');
insert into Pf_M_HomePageInfoBlock values (16,'最新开放议题','GsLt');
commit;
*Pf_IfUsrHasBizViewPower

+在通用办公下增加功能
	公司论坛 ../FileApp/GsLt/entry0.jsp 发起议题、评论、投票、关闭议题
+业务 
	6-公司论坛 GsLt_A_Zt 	../../FileApp/GsLt/handle.jsp?ToDoWorkItem= 	../../FileApp/GsLt/view.jsp?BizID=

+++++++++++++++++++++++++++ 报销录入项更新 20180725 ++++++++++++++++++++++++++++++++++++ OK
#开发环境删除方式
select Seq from Pf_A_Biz where BizCode=18;

call Pf_DelBiz(94);
call Pf_DelBiz(286);
call Pf_DelBiz(288);
call Pf_DelBiz(297);
call Pf_DelBiz(298);
call Pf_DelBiz(299);
call Pf_DelBiz(300);
commit;
/
#生产环境用管理员手动删避免悬挂索引

ALTER TABLE `JkBx_A_Bx` DROP COLUMN `JtTaxAmt`;
ALTER TABLE `JkBx_A_Bx` DROP COLUMN `ZsTaxAmt`;
ALTER TABLE `JkBx_A_Bx` DROP COLUMN `ZdTaxAmt`;
ALTER TABLE `JkBx_A_Bx` DROP COLUMN `TxTaxAmt`;
ALTER TABLE `JkBx_A_Bx` DROP COLUMN `QtTaxAmt`;
ALTER TABLE `JkBx_A_Bx` ADD COLUMN `TaxAmt` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '进项税总额' AFTER `BxAmt`;
ALTER TABLE `JkBx_A_Bx` MODIFY COLUMN `TaxAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '进项税总额';

删除 [应用种类]编码 17-未正式立项项目
增加 [应用种类]编码 17-货物或应税劳务 18-服务名称

ALTER TABLE `JkBx_A_BxJt` ADD COLUMN `InvType` CHAR(1) NOT NULL COMMENT '发票种类' AFTER `HfSm`;
调整【发票号码】字段顺序，紧跟【发票种类】之后
ALTER TABLE `JkBx_A_BxJt` ADD COLUMN `HwYsLwID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '货物或应税劳务' AFTER `InvNum`;
ALTER TABLE `JkBx_A_BxJt` ADD COLUMN `FwMcID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '服务名称' AFTER `HwYsLwID`;
ALTER TABLE `JkBx_A_BxJt` DROP COLUMN `TaxRate`;
ALTER TABLE `JkBx_A_BxJt` DROP COLUMN `InvCode`;
ALTER TABLE `JkBx_A_BxJt` ADD COLUMN `PricePlusTax` DECIMAL(7,2) UNSIGNED NOT NULL COMMENT '价税合计' AFTER `TaxAmt`;
ALTER TABLE `JkBx_A_BxJt` MODIFY COLUMN `JtFs` TINYINT(3) UNSIGNED NOT NULL COMMENT '交通方式';
ALTER TABLE `JkBx_A_BxJt` ADD INDEX  (`HwYsLwID`);
ALTER TABLE `JkBx_A_BxJt` ADD CONSTRAINT `JkBx_A_BxJt_fk2` FOREIGN KEY (`HwYsLwID`) REFERENCES `Pf_M_EntAppCode` (`ID`);
ALTER TABLE `JkBx_A_BxJt` ADD INDEX  (`FwMcID`);
ALTER TABLE `JkBx_A_BxJt` ADD CONSTRAINT `JkBx_A_BxJt_fk3` FOREIGN KEY (`FwMcID`) REFERENCES `Pf_M_EntAppCode` (`ID`);

ALTER TABLE `JkBx_A_BxZs` ADD COLUMN `InvType` CHAR(1) NOT NULL COMMENT '发票种类' AFTER `Rc`;
调整【发票号码】字段顺序，紧跟【发票种类】之后
ALTER TABLE `JkBx_A_BxZs` ADD COLUMN `HwYsLwID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '货物或应税劳务' AFTER `InvNum`;
ALTER TABLE `JkBx_A_BxZs` ADD COLUMN `FwMcID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '服务名称' AFTER `HwYsLwID`;
ALTER TABLE `JkBx_A_BxZs` DROP COLUMN `TaxRate`;
ALTER TABLE `JkBx_A_BxZs` ADD COLUMN `PricePlusTax` DECIMAL(7,2) UNSIGNED NOT NULL COMMENT '价税合计' AFTER `TaxAmt`;
ALTER TABLE `JkBx_A_BxZs` DROP COLUMN `InvCode`;
ALTER TABLE `JkBx_A_BxZs` ADD INDEX  (`HwYsLwID`);
ALTER TABLE `JkBx_A_BxZs` ADD CONSTRAINT `JkBx_A_BxZs_fk2` FOREIGN KEY (`HwYsLwID`) REFERENCES `Pf_M_EntAppCode` (`ID`);
ALTER TABLE `JkBx_A_BxZs` ADD INDEX  (`FwMcID`);
ALTER TABLE `JkBx_A_BxZs` ADD CONSTRAINT `JkBx_A_BxZs_fk3` FOREIGN KEY (`FwMcID`) REFERENCES `Pf_M_EntAppCode` (`ID`);

ALTER TABLE `JkBx_A_BxCf` ADD COLUMN `InvType` CHAR(1) NOT NULL COMMENT '发票种类' AFTER `HfSm`;
调整【发票号码】字段顺序，紧跟【发票种类】之后
ALTER TABLE `JkBx_A_BxCf` ADD COLUMN `HwYsLwID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '货物或应税劳务' AFTER `InvNum`;
ALTER TABLE `JkBx_A_BxCf` ADD COLUMN `FwMcID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '服务名称' AFTER `HwYsLwID`;
ALTER TABLE `JkBx_A_BxCf` DROP COLUMN `TaxRate`;
ALTER TABLE `JkBx_A_BxCf` ADD COLUMN `PricePlusTax` DECIMAL(7,2) UNSIGNED NOT NULL COMMENT '价税合计' AFTER `TaxAmt`;
ALTER TABLE `JkBx_A_BxCf` DROP COLUMN `InvCode`;
ALTER TABLE `JkBx_A_BxCf` ADD INDEX  (`HwYsLwID`);
ALTER TABLE `JkBx_A_BxCf` ADD CONSTRAINT `JkBx_A_BxCf_fk2` FOREIGN KEY (`HwYsLwID`) REFERENCES `Pf_M_EntAppCode` (`ID`);
ALTER TABLE `JkBx_A_BxCf` ADD INDEX  (`FwMcID`);
ALTER TABLE `JkBx_A_BxCf` ADD CONSTRAINT `JkBx_A_BxCf_fk3` FOREIGN KEY (`FwMcID`) REFERENCES `Pf_M_EntAppCode` (`ID`);

ALTER TABLE `JkBx_A_BxTx` ADD COLUMN `InvType` CHAR(1) NOT NULL COMMENT '发票种类' AFTER `HfSm`;
调整【发票号码】字段顺序，紧跟【发票种类】之后
ALTER TABLE `JkBx_A_BxTx` ADD COLUMN `HwYsLwID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '货物或应税劳务' AFTER `InvNum`;
ALTER TABLE `JkBx_A_BxTx` ADD COLUMN `FwMcID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '服务名称' AFTER `HwYsLwID`;
ALTER TABLE `JkBx_A_BxTx` DROP COLUMN `TaxRate`;
ALTER TABLE `JkBx_A_BxTx` ADD COLUMN `PricePlusTax` DECIMAL(7,2) UNSIGNED NOT NULL COMMENT '价税合计' AFTER `TaxAmt`;
ALTER TABLE `JkBx_A_BxTx` DROP COLUMN `InvCode`;
ALTER TABLE `JkBx_A_BxTx` ADD INDEX  (`HwYsLwID`);
ALTER TABLE `JkBx_A_BxTx` ADD CONSTRAINT `JkBx_A_BxTx_fk2` FOREIGN KEY (`HwYsLwID`) REFERENCES `Pf_M_EntAppCode` (`ID`);
ALTER TABLE `JkBx_A_BxTx` ADD INDEX  (`FwMcID`);
ALTER TABLE `JkBx_A_BxTx` ADD CONSTRAINT `JkBx_A_BxTx_fk3` FOREIGN KEY (`FwMcID`) REFERENCES `Pf_M_EntAppCode` (`ID`);

ALTER TABLE `JkBx_A_BxQt` ADD COLUMN `InvType` CHAR(1) NOT NULL COMMENT '发票种类' AFTER `HfSm`;
调整【发票号码】字段顺序，紧跟【发票种类】之后
ALTER TABLE `JkBx_A_BxQt` ADD COLUMN `HwYsLwID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '货物或应税劳务' AFTER `InvNum`;
ALTER TABLE `JkBx_A_BxQt` ADD COLUMN `FwMcID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '服务名称' AFTER `HwYsLwID`;
ALTER TABLE `JkBx_A_BxQt` DROP COLUMN `TaxRate`;
ALTER TABLE `JkBx_A_BxQt` ADD COLUMN `PricePlusTax` DECIMAL(7,2) UNSIGNED NOT NULL COMMENT '价税合计' AFTER `TaxAmt`;
ALTER TABLE `JkBx_A_BxQt` DROP COLUMN `InvCode`;
ALTER TABLE `JkBx_A_BxQt` ADD INDEX  (`HwYsLwID`);
ALTER TABLE `JkBx_A_BxQt` ADD CONSTRAINT `JkBx_A_BxQt_fk2` FOREIGN KEY (`HwYsLwID`) REFERENCES `Pf_M_EntAppCode` (`ID`);
ALTER TABLE `JkBx_A_BxQt` ADD INDEX  (`FwMcID`);
ALTER TABLE `JkBx_A_BxQt` ADD CONSTRAINT `JkBx_A_BxQt_fk3` FOREIGN KEY (`FwMcID`) REFERENCES `Pf_M_EntAppCode` (`ID`);

*JkBx_A_Bx_13 

#以下执行 《报销更新20180728.sql》
*JkBx_A_BxJt_11 JkBx_A_BxJt_13 JkBx_A_BxJt_21 JkBx_A_BxJt_22 JkBx_A_BxJt_23
*JkBx_A_BxZs_11 JkBx_A_BxZs_13 JkBx_A_BxZs_21 JkBx_A_BxZs_22 JkBx_A_BxZs_23
*JkBx_A_BxCf_11 JkBx_A_BxCf_13 JkBx_A_BxCf_21 JkBx_A_BxCf_22 JkBx_A_BxCf_23
*JkBx_A_BxTx_11 JkBx_A_BxTx_13 JkBx_A_BxTx_21 JkBx_A_BxTx_22 JkBx_A_BxTx_23
*JkBx_A_BxQt_11 JkBx_A_BxQt_13 JkBx_A_BxQt_21 JkBx_A_BxQt_22 JkBx_A_BxQt_23
#

*FillIndexForBiz18

insert into Pub_M_BookMark values ('B18_TaxAmtXx','税额小写',18);
insert into Pub_M_BookMark values ('B18_TaxAmtDx','税额大写',18);
commit;
替换模板

+++++++++++++++++++++++++++ 报销录入项更新 20180730 ++++++++++++++++++++++++++++++++++++ OK
*流程选人
	【财务复核】环节执行人改【分管财务副总】角色
*凭证内容
	除了交通、住宿票，时间精确到日期，去掉时分
	差旅单摘要只记录时间、地点、天数
*增加2号位应用特征字，允许改票据总张数

+++++++++++++++++++++++++++ 考勤 ++++++++++++++++++++++++++++++++++++	OK	
+Gz_M_FfMx ZxBg_M_YzZz KqPd_A_Lj KqPd_A_Mx Gz_A_Zt Gz_A_FfMx Pf_DirectLeader KqPd_InitDaily

insert into Pf_M_ErrCase values ('Gz_A_Zt_11_err1','发放年份不能大于当前年！');
insert into Pf_M_ErrCase values ('Gz_A_Zt_11_err2','发放月份不能在当前月之后！');
commit;

增加功能：
	考勤评定 ../FileApp/KqPd/entry0.jsp 系统每日按出勤记录考勤，上司据实修改考勤记录 8

+++++++++++++++++++++++++++ 报销补丁：对外付款冲抵供应商预付余额（以“供应商名称”为UK进行更新） ++++++++++++++++++++++++++++++++++++	OK	
ALTER TABLE `ZxBg_M_Skf` MODIFY COLUMN `AcctNo` VARCHAR(50) COLLATE utf8_general_ci NOT NULL COMMENT '最新帐号';
*ZxBg_A_YfkSp_11
insert into Pf_M_ErrCase values ('UpdNodeOfBiz18_err4','<是否对外付款><是否核销备用金>互斥！');
commit;
*JkBx_A_Bx_13 UpdNodeOfBiz18

*前端页面
WebRoot/FileApp/BxSq/handle1.jsp
WebRoot/FileApp/BxSq/handle2.jsp
WebRoot/FileApp/BxSq/view.jsp

将“预付款审批”隶属到通用办公模组，与借款并列

+++++++++++++++++++++++++++ 工资 ++++++++++++++++++++++++++++++++++++	OK	
*Pf_A_AttachInfo_11
+UpdNodeOfBiz05 FillIndexForBiz05 Pf_UniAppAttachFileSeq
insert into Pf_M_ErrCase values ('UpdNodeOfBiz05_err1','工资发放审核流程结束不能撤回！');
commit;

实施：
	增加功能：
	工资发放 ../FileApp/GzFf/entry0.jsp 工资发放作业 非公共功能 22 通用办公 董事长，总经理，财务人员/财务经理，财务人员/出纳，综合人员/人事/人资主管
	个人工资条 ../FileApp/Gzt/main.jsp 个人工资条查询 公共功能 23
	
	增加业务：
	5 工资发放 Gz_A_Zt ../../FileApp/GzFf/handle1.jsp?ToDoWorkItem= ../../FileApp/GzFf/view1.jsp?BizID=
	
+++++++++++++++++++++++++++ 报销扩大金额位数到15位 ++++++++++++++++++++++++++++++++++++	OK	
ALTER TABLE `JkBx_A_Bx` MODIFY COLUMN `JtAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '交通报销金额';
ALTER TABLE `JkBx_A_Bx` MODIFY COLUMN `ZsAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '住宿费报销金额';
ALTER TABLE `JkBx_A_Bx` MODIFY COLUMN `ZdAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '招待费报销金额';
ALTER TABLE `JkBx_A_Bx` MODIFY COLUMN `TxAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '通讯费报销金额';

ALTER TABLE `JkBx_A_BxJt` MODIFY COLUMN `HfAmt` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '花费金额';
ALTER TABLE `JkBx_A_BxJt` MODIFY COLUMN `TaxAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '进项税';
ALTER TABLE `JkBx_A_BxJt` MODIFY COLUMN `PricePlusTax` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '价税合计';

ALTER TABLE `JkBx_A_BxZs` MODIFY COLUMN `HfAmt` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '花费金额';
ALTER TABLE `JkBx_A_BxZs` MODIFY COLUMN `TaxAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '进项税';
ALTER TABLE `JkBx_A_BxZs` MODIFY COLUMN `PricePlusTax` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '价税合计';

ALTER TABLE `JkBx_A_BxCf` MODIFY COLUMN `TaxAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '进项税';
ALTER TABLE `JkBx_A_BxCf` MODIFY COLUMN `PricePlusTax` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '价税合计';

ALTER TABLE `JkBx_A_BxTx` MODIFY COLUMN `HfAmt` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '花费金额';
ALTER TABLE `JkBx_A_BxTx` MODIFY COLUMN `TaxAmt` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '进项税';
ALTER TABLE `JkBx_A_BxTx` MODIFY COLUMN `PricePlusTax` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '价税合计';

ALTER TABLE `JkBx_A_BxQt` MODIFY COLUMN `TaxAmt` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '进项税';
ALTER TABLE `JkBx_A_BxQt` MODIFY COLUMN `PricePlusTax` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '价税合计';

+++++++++++++++++++++++++++ 工资条查询增加查询密码 ++++++++++++++++++++++++++ OK	
ALTER TABLE `Pf_M_UsrPwd` ADD COLUMN `Password2` VARCHAR(20) NOT NULL DEFAULT 'MTIzNDU2' COMMENT '密码2' AFTER `Password`;
+Pf_M_UsrPwd_11 Pf_M_UsrPwd_13 Pf_D_Pwd2UsedTs Pf_RcdPwd2UsedTs

insert into Pf_M_ErrCase values ('Pf_M_UsrPwd_11_err1','登录密码不能与工资条查询密码一样！');
insert into Pf_M_ErrCase values ('Pf_M_UsrPwd_13_err1','登录密码不能与工资条查询密码一样！');
insert into Pf_M_ErrCase values ('Pf_RcdPwd2UsedTs_err1','查询密码对不上！');
commit;

调整功能“个人工资条”从属模块，移到“个人事务”

+++++++++++++++++++++++++++ 工资管理增列、自动计算 ++++++++++++++++++++++++++ OK	
ALTER TABLE `Gz_M_FfMx` ADD COLUMN `SbTz` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '社保调整' AFTER `QyNj`;
ALTER TABLE `Gz_A_FfMx` ADD COLUMN `SbTz` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '社保调整' AFTER `QyNj`;

*Gz_A_FfMx_11 Gz_A_FfMx_21 Gz_A_FfMx_22 Gz_A_FfMx_23 UpdNodeOfBiz05
+Gz_A_FfMx_13

+++++++++++++++++++++++ 2018-08-13 临时更新 ++++++++++++++++++++++++++++ ok
*UpdNodeOfBiz19
src/com/infohold/UsrChk.java 

调整【19-预付款审批】流程：
1、环节【出纳放款】改【付款凭证打印】；
2、流程分支<着出纳放款>改<着经办人打印付款凭证>
3、换22.xml流程图
4、替换【预付款审批单】模板

+++++++++++++++++++++++ 2018-08-14 临时更新 ++++++++++++++++++++++++++++ ok
WebRoot/FileApp/BxSq/GenGdWord.jsp
src/com/infohold/FileApp/BxSq/GenGdWord.java

insert into Pub_M_BookMark values ('B18_HfAmt1','花费金额1',18);
insert into Pub_M_BookMark values ('B18_HfAmt2','花费金额2',18);
insert into Pub_M_BookMark values ('B18_HfAmt3','花费金额3',18);
insert into Pub_M_BookMark values ('B18_HfAmt4','花费金额4',18);
insert into Pub_M_BookMark values ('B18_HfAmt5','花费金额5',18);
insert into Pub_M_BookMark values ('B18_HfAmt6','花费金额6',18);
insert into Pub_M_BookMark values ('B18_HfAmt7','花费金额7',18);
insert into Pub_M_BookMark values ('B18_HfAmt8','花费金额8',18);
insert into Pub_M_BookMark values ('B18_HfAmt9','花费金额9',18);
insert into Pub_M_BookMark values ('B18_HfAmt10','花费金额10',18);
insert into Pub_M_BookMark values ('B18_HfAmt11','花费金额11',18);
insert into Pub_M_BookMark values ('B18_HfAmt12','花费金额12',18);
insert into Pub_M_BookMark values ('B18_HfAmt13','花费金额13',18);
insert into Pub_M_BookMark values ('B18_HfAmt14','花费金额14',18);
insert into Pub_M_BookMark values ('B18_HfAmt15','花费金额15',18);
insert into Pub_M_BookMark values ('B18_HfAmt16','花费金额16',18);
insert into Pub_M_BookMark values ('B18_HfAmt17','花费金额17',18);
insert into Pub_M_BookMark values ('B18_HfAmt18','花费金额18',18);
insert into Pub_M_BookMark values ('B18_HfAmt19','花费金额19',18);
insert into Pub_M_BookMark values ('B18_HfAmt20','花费金额20',18);
insert into Pub_M_BookMark values ('B18_HfAmtXx','花费金额小写',18);
commit;

模板更新：
	差旅报销凭证
	费用报销凭证
	
+++++++++++++++++++++++++++ 采购申请 ++++++++++++++++++++++++++++++++++++++++++++++++++++ OK	
insert into Pf_M_CodeType values (29,'C','采购类型');

insert into Pf_M_CharCode values (29,'a','低值易耗品（￥伍仟以内、使用期3个月以上）',0);
insert into Pf_M_CharCode values (29,'b','固定资产（￥伍仟以上、使用期一年以上）',0);
insert into Pf_M_CharCode values (29,'c','大额购买（￥叁万以上）',0);
commit;

ALTER TABLE `ZxBg_M_Skf` MODIFY COLUMN `Khh` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL COMMENT '开户银行';
ALTER TABLE `ZxBg_M_Skf` MODIFY COLUMN `AcctNo` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL COMMENT '最新帐号';
ALTER TABLE `ZxBg_M_Skf` MODIFY COLUMN `YfYe` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0;

+CgSq_A_Zt CgSq_A_Mx UpdNodeOfBiz04 FillIndexForBiz04
*Pf_A_AttachInfo_11

insert into Pf_M_ErrCase values ('UpdNodeOfBiz04_err1','流程结束前，须生成归档签字文件！');
commit;

+功能
	采购申请 ../EntApps/CgSq/entry0.jsp 采购申请流程 14 通用办公
+业务 
	4-采购申请
+流程
	采购申请审批流程

insert into Pub_M_BookMark values ('B4_SqBm','申请部门',4);
insert into Pub_M_BookMark values ('B4_SqSj','申请时间',4);
insert into Pub_M_BookMark values ('B4_Bt','采购标题',4);
insert into Pub_M_BookMark values ('B4_Sqr','申请人',4);
insert into Pub_M_BookMark values ('B4_CgLx','采购类型',4);
insert into Pub_M_BookMark values ('B4_TotalAmt','采购总额',4); 

insert into Pub_M_BookMark values ('B4Qm_Zjl','总经理签字',4);
insert into Pub_M_BookMark values ('B4Qm_CwFg','财务分管签字',4);
insert into Pub_M_BookMark values ('B4Qm_HgFg','合规分管签字',4);
insert into Pub_M_BookMark values ('B4Qm_YyFg','运营分管签字',4);
insert into Pub_M_BookMark values ('B4Qm_BmZz','部门正职签字',4);

insert into Pub_M_BookMark values ('B4_Cgx1','货物/服务名1',4);
insert into Pub_M_BookMark values ('B4_Cgx2','货物/服务名2',4);
insert into Pub_M_BookMark values ('B4_Cgx3','货物/服务名3',4);
insert into Pub_M_BookMark values ('B4_Cgx4','货物/服务名4',4);
insert into Pub_M_BookMark values ('B4_Cgx5','货物/服务名5',4);
insert into Pub_M_BookMark values ('B4_Cgx6','货物/服务名6',4);
insert into Pub_M_BookMark values ('B4_Cgx7','货物/服务名7',4);
insert into Pub_M_BookMark values ('B4_Cgx8','货物/服务名8',4);
insert into Pub_M_BookMark values ('B4_Cgx9','货物/服务名9',4);
insert into Pub_M_BookMark values ('B4_Cgx10','货物/服务名10',4);

insert into Pub_M_BookMark values ('B4_QtyDw1','数量单位1',4);
insert into Pub_M_BookMark values ('B4_QtyDw2','数量单位2',4);
insert into Pub_M_BookMark values ('B4_QtyDw3','数量单位3',4);
insert into Pub_M_BookMark values ('B4_QtyDw4','数量单位4',4);
insert into Pub_M_BookMark values ('B4_QtyDw5','数量单位5',4);
insert into Pub_M_BookMark values ('B4_QtyDw6','数量单位6',4);
insert into Pub_M_BookMark values ('B4_QtyDw7','数量单位7',4);
insert into Pub_M_BookMark values ('B4_QtyDw8','数量单位8',4);
insert into Pub_M_BookMark values ('B4_QtyDw9','数量单位9',4);
insert into Pub_M_BookMark values ('B4_QtyDw10','数量单位10',4);

insert into Pub_M_BookMark values ('B4_CpXh1','型号1',4);
insert into Pub_M_BookMark values ('B4_CpXh2','型号2',4);
insert into Pub_M_BookMark values ('B4_CpXh3','型号3',4);
insert into Pub_M_BookMark values ('B4_CpXh4','型号4',4);
insert into Pub_M_BookMark values ('B4_CpXh5','型号5',4);
insert into Pub_M_BookMark values ('B4_CpXh6','型号6',4);
insert into Pub_M_BookMark values ('B4_CpXh7','型号7',4);
insert into Pub_M_BookMark values ('B4_CpXh8','型号8',4);
insert into Pub_M_BookMark values ('B4_CpXh9','型号9',4);
insert into Pub_M_BookMark values ('B4_CpXh10','型号10',4);

insert into Pub_M_BookMark values ('B4_UnitPrice1','单价1',4);
insert into Pub_M_BookMark values ('B4_UnitPrice2','单价2',4);
insert into Pub_M_BookMark values ('B4_UnitPrice3','单价3',4);
insert into Pub_M_BookMark values ('B4_UnitPrice4','单价4',4);
insert into Pub_M_BookMark values ('B4_UnitPrice5','单价5',4);
insert into Pub_M_BookMark values ('B4_UnitPrice6','单价6',4);
insert into Pub_M_BookMark values ('B4_UnitPrice7','单价7',4);
insert into Pub_M_BookMark values ('B4_UnitPrice8','单价8',4);
insert into Pub_M_BookMark values ('B4_UnitPrice9','单价9',4);
insert into Pub_M_BookMark values ('B4_UnitPrice10','单价10',4);

insert into Pub_M_BookMark values ('B4_Qty1','数量1',4);
insert into Pub_M_BookMark values ('B4_Qty2','数量2',4);
insert into Pub_M_BookMark values ('B4_Qty3','数量3',4);
insert into Pub_M_BookMark values ('B4_Qty4','数量4',4);
insert into Pub_M_BookMark values ('B4_Qty5','数量5',4);
insert into Pub_M_BookMark values ('B4_Qty6','数量6',4);
insert into Pub_M_BookMark values ('B4_Qty7','数量7',4);
insert into Pub_M_BookMark values ('B4_Qty8','数量8',4);
insert into Pub_M_BookMark values ('B4_Qty9','数量9',4);
insert into Pub_M_BookMark values ('B4_Qty10','数量10',4);

insert into Pub_M_BookMark values ('B4_TotalAmt1','总价1',4);
insert into Pub_M_BookMark values ('B4_TotalAmt2','总价2',4);
insert into Pub_M_BookMark values ('B4_TotalAmt3','总价3',4);
insert into Pub_M_BookMark values ('B4_TotalAmt4','总价4',4);
insert into Pub_M_BookMark values ('B4_TotalAmt5','总价5',4);
insert into Pub_M_BookMark values ('B4_TotalAmt6','总价6',4);
insert into Pub_M_BookMark values ('B4_TotalAmt7','总价7',4);
insert into Pub_M_BookMark values ('B4_TotalAmt8','总价8',4);
insert into Pub_M_BookMark values ('B4_TotalAmt9','总价9',4);
insert into Pub_M_BookMark values ('B4_TotalAmt10','总价10',4);

insert into Pub_M_BookMark values ('B4_SkrMc1','供货商1',4);
insert into Pub_M_BookMark values ('B4_SkrMc2','供货商2',4);
insert into Pub_M_BookMark values ('B4_SkrMc3','供货商3',4);
insert into Pub_M_BookMark values ('B4_SkrMc4','供货商4',4);
insert into Pub_M_BookMark values ('B4_SkrMc5','供货商5',4);
insert into Pub_M_BookMark values ('B4_SkrMc6','供货商6',4);
insert into Pub_M_BookMark values ('B4_SkrMc7','供货商7',4);
insert into Pub_M_BookMark values ('B4_SkrMc8','供货商8',4);
insert into Pub_M_BookMark values ('B4_SkrMc9','供货商9',4);
insert into Pub_M_BookMark values ('B4_SkrMc10','供货商10',4);

insert into Pub_M_BookMark values ('B4_SyBm1','使用部门1',4);
insert into Pub_M_BookMark values ('B4_SyBm2','使用部门2',4);
insert into Pub_M_BookMark values ('B4_SyBm3','使用部门3',4);
insert into Pub_M_BookMark values ('B4_SyBm4','使用部门4',4);
insert into Pub_M_BookMark values ('B4_SyBm5','使用部门5',4);
insert into Pub_M_BookMark values ('B4_SyBm6','使用部门6',4);
insert into Pub_M_BookMark values ('B4_SyBm7','使用部门7',4);
insert into Pub_M_BookMark values ('B4_SyBm8','使用部门8',4);
insert into Pub_M_BookMark values ('B4_SyBm9','使用部门9',4);
insert into Pub_M_BookMark values ('B4_SyBm10','使用部门10',4);

insert into Pub_M_BookMark values ('B4_Bgr1','保管人1',4);
insert into Pub_M_BookMark values ('B4_Bgr2','保管人2',4);
insert into Pub_M_BookMark values ('B4_Bgr3','保管人3',4);
insert into Pub_M_BookMark values ('B4_Bgr4','保管人4',4);
insert into Pub_M_BookMark values ('B4_Bgr5','保管人5',4);
insert into Pub_M_BookMark values ('B4_Bgr6','保管人6',4);
insert into Pub_M_BookMark values ('B4_Bgr7','保管人7',4);
insert into Pub_M_BookMark values ('B4_Bgr8','保管人8',4);
insert into Pub_M_BookMark values ('B4_Bgr9','保管人9',4);
insert into Pub_M_BookMark values ('B4_Bgr10','保管人10',4);

commit;

+模板
	采购申请审批单
	
+++++++++++++++++++++++++++ 【用印申请】改造 +++++++++++++++++++++++++++ ok
+ZxBg_M_YzZz_11 ZxBg_M_YzZz_13 ZxBg_A_YzZzSqMx ZxBg_A_YzZzSq_13
*UpdNodeOfBiz25

insert into Pf_M_ErrCase values ('ZxBg_M_YzZz_11_err1','<印章种类><证照种类>不能同时为空！');
insert into Pf_M_ErrCase values ('ZxBg_M_YzZz_11_err2','<印章种类><证照种类>不能同时不空！');
insert into Pf_M_ErrCase values ('ZxBg_M_YzZz_13_err1','<印章种类><证照种类>不能同时为空！');
insert into Pf_M_ErrCase values ('ZxBg_M_YzZz_13_err2','<印章种类><证照种类>不能同时不空！');
insert into Pf_M_ErrCase values ('ZxBg_A_YzZzSq_13_err1','具体申请印章与申请种类不符！');
insert into Pf_M_ErrCase values ('ZxBg_A_YzZzSq_13_err2','具体申请证照与申请种类不符！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz25_err3','流程结束前，须生成印章、证照使用审批单归档签字文件！');
insert into Pf_M_ErrCase values ('UpdNodeOfBiz25_err4','申请的印章或证照他人在用！');
insert into Pf_M_ErrCase values ('ZxBg_A_YzZzSqMx_11_err1','具体申请印章/证照与申请种类不符！');
commit;

+环节：
	公司用印管理员发放
	印章、证照归还
+流程：
	印章证照使用审批流程201808
	
+++++++++++++++++++++++++++ 公司文件加流程选择，发文后不隐藏处理记录 +++++++++++++++++++++++++++ OK
WebRoot/FileApp/GsWj/ListA/insert.jsp
src/com/infohold/FileApp/GsWj/ListA/Insert.java
src/com/infohold/FileApp/GsWj/ListA/FlowInit.java
src/com/infohold/FileApp/GsWj/GetThData.java

+环节：
	董事长审批
+流程：
	公司任命发文流程201808
	
+++++++++++++++++++++++++++ 付款申请改造，增加临时项目、临时项目合同、无项目依据付款场景、增加付款方自动维护与检索式选取 +++++++++++++++++++++++++++ OK
+ZxBg_M_DeSkf ZxBg_M_DeSkfZh ZxBg_LsXmHtMc ZxBg_LsXmIDByHtScID

ALTER TABLE `ZxBg_A_FkSp` MODIFY COLUMN `YjLb` CHAR(1) COLLATE utf8_general_ci DEFAULT NULL COMMENT '依据类别';
ALTER TABLE `ZxBg_A_FkSp` MODIFY COLUMN `YjID` INTEGER(11) UNSIGNED DEFAULT NULL COMMENT '依据ID(项目/合同)';
ALTER TABLE `ZxBg_A_FkSp` ADD INDEX  (`AcctNo`);
ALTER TABLE `ZxBg_A_FkSp` ADD CONSTRAINT `ZxBg_A_FkSp_fk2` FOREIGN KEY (`AcctNo`) REFERENCES `ZxBg_M_DeSkfZh` (`AcctNo`);
ALTER TABLE `ZxBg_A_FkSp` MODIFY COLUMN `HtQdRq` DATE DEFAULT NULL COMMENT '业务合同签订时间';

*v_ZxBg_A_FkSp UpdNodeOfBiz26 FillIndexForBiz26

模板： 项目付款审批单

流程修改
	项目付款审批流程
	
+++++++++++++++++++++++++++ 钱小写转大写、禁止四舍五入 +++++++++++++++++++++++++++ OK
src/com/infohold/FramePub/MoneyOperate/MoneyFormat.java
src/com/infohold/EntApps/CgSq/*
src/com/infohold/EntApps/FkSp/*
src/com/infohold/EntApps/LxSq/*
src/com/infohold/EntApps/YfkSp/*
src/com/infohold/FileApp/BxSq/*
src/com/infohold/FileApp/GzFf/*
src/com/infohold/FileApp/Hk/*
src/com/infohold/FileApp/Jk/*

+++++++++++++++++++++++++++ 合同审批、审查业务的合同文本加水印、盖普通章、盖骑缝章 +++++++++++++++++++++++++++	OK
src/com/infohold/FramePub/FileOperate/EditFile.java
WebRoot/FramePub/FileOperate/EditFile.jsp
WebRoot/WEB-INF/lib/sealsetup.exe

+++++++++++++++++++++++++++ *工资发放 +++++++++++++++++++++++++++ OK
ALTER TABLE `Gz_A_FfMx` MODIFY COLUMN `JbGz` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '工资总额';
ALTER TABLE `Gz_A_FfMx` DROP COLUMN `GwGz`;
ALTER TABLE `Gz_A_FfMx` DROP COLUMN `ZfBt`;
ALTER TABLE `Gz_A_FfMx` DROP COLUMN `JtBt`;
ALTER TABLE `Gz_A_FfMx` DROP COLUMN `TxBt`;
ALTER TABLE `Gz_A_FfMx` DROP COLUMN `JxJj`;
ALTER TABLE `Gz_A_FfMx` CHANGE COLUMN `YlBx1` `Pension1` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '养老保险（企业承担）';
ALTER TABLE `Gz_A_FfMx` CHANGE COLUMN `SyBx` `UnEmployed1` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '失业保险（企业承担）';
ALTER TABLE `Gz_A_FfMx` CHANGE COLUMN `YlBx2` `Health1` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '医疗保险（企业承担）';
#调整顺序 UnEmployed1 Health1
ALTER TABLE `Gz_A_FfMx` ADD COLUMN `Industrial1` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '工伤保险（企业承担）' AFTER `Health1`;
ALTER TABLE `Gz_A_FfMx` ADD COLUMN `Birth1` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '生育保险（企业承担）' AFTER `Industrial1`;
ALTER TABLE `Gz_A_FfMx` CHANGE COLUMN `ZfGjj` `ZfGjj1` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '住房公积金（企业承担）';
ALTER TABLE `Gz_A_FfMx` CHANGE COLUMN `QyNj` `WxYjQyJfXj` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五险一金企业缴费小计';
ALTER TABLE `Gz_A_FfMx` CHANGE COLUMN `SbTz` `Pension2` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '养老保险（个人承担）';
ALTER TABLE `Gz_A_FfMx` ADD COLUMN `UnEmployed2` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失业保险（个人承担）' AFTER `Pension2`;
ALTER TABLE `Gz_A_FfMx` ADD COLUMN `Health2` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '医疗保险（个人承担）' AFTER `UnEmployed2`;
ALTER TABLE `Gz_A_FfMx` ADD COLUMN `ZfGjj2` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '住房公积金（个人承担）' AFTER `Health2`;
ALTER TABLE `Gz_A_FfMx` ADD COLUMN `SxYjGrJfXj` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三险一金个人缴费小计' AFTER `ZfGjj2`;

ALTER TABLE `Gz_M_FfMx` DROP COLUMN `GwGz`;
ALTER TABLE `Gz_M_FfMx` DROP COLUMN `ZfBt`;
ALTER TABLE `Gz_M_FfMx` DROP COLUMN `JtBt`;
ALTER TABLE `Gz_M_FfMx` DROP COLUMN `TxBt`;
ALTER TABLE `Gz_M_FfMx` DROP COLUMN `JxJj`;
ALTER TABLE `Gz_M_FfMx` CHANGE COLUMN `YlBx1` `Pension1` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '养老保险（企业承担）';
ALTER TABLE `Gz_M_FfMx` CHANGE COLUMN `SyBx` `UnEmployed1` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '失业保险（企业承担）';
ALTER TABLE `Gz_M_FfMx` CHANGE COLUMN `YlBx2` `Health1` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '医疗保险（企业承担）';
#调整顺序 UnEmployed1 Health1
ALTER TABLE `Gz_M_FfMx` ADD COLUMN `Industrial1` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '工伤保险（企业承担）' AFTER `Health1`;
ALTER TABLE `Gz_M_FfMx` ADD COLUMN `Birth1` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '生育保险（企业承担）' AFTER `Industrial1`;
ALTER TABLE `Gz_M_FfMx` CHANGE COLUMN `ZfGjj` `ZfGjj1` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '住房公积金（企业承担）';
ALTER TABLE `Gz_M_FfMx` CHANGE COLUMN `QyNj` `WxYjQyJfXj` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五险一金企业缴费小计';
ALTER TABLE `Gz_M_FfMx` CHANGE COLUMN `SbTz` `Pension2` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '养老保险（个人承担）';
ALTER TABLE `Gz_M_FfMx` ADD COLUMN `UnEmployed2` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失业保险（个人承担）' AFTER `Pension2`;
ALTER TABLE `Gz_M_FfMx` ADD COLUMN `Health2` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '医疗保险（个人承担）' AFTER `UnEmployed2`;
ALTER TABLE `Gz_M_FfMx` ADD COLUMN `ZfGjj2` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '住房公积金（个人承担）' AFTER `Health2`;
ALTER TABLE `Gz_M_FfMx` ADD COLUMN `SxYjGrJfXj` DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三险一金个人缴费小计' AFTER `ZfGjj2`;

*Gz_A_FfMx_11 Gz_A_FfMx_21 Gz_A_FfMx_13 Gz_A_FfMx_23 Gz_A_FfMx_22 UpdNodeOfBiz05

+++++++++++++++++++++++++++ 待办批处理 +++++++++++++++++++++++++++ OK
+Pf_FillBatchHandleBranch

+++++++++++++++++++++++++++ 在费用报销单中报销交通票 +++++++++++++++++++++++++++ OK
+JkBx_A_BxQtXcd BxSq_QtXcdMs
*JkBx_A_BxJt_11 JkBx_A_BxJt_13 FillIndexForBiz18 UpdNodeOfBiz18

insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_11_err0','<内部乘机/车人>、<外部乘机/车人>不能都不填！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_11_err1','出发时间不能大于到达时间！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_11_err2','到达时间在当前时间之前！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_11_err3','出发时间和到达时间差值不能超过24小时！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_11_err4','有同一行程人，当前机/车票行程单（费用）行程时段与历史差旅报销单交通票的重叠！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_11_err5','有行程人，当前机/车票行程单（费用）行程时段与历史的重叠！');

insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_13_err0','<内部乘机/车人>、<外部乘机/车人>不能都不填！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_13_err1','出发时间不能大于到达时间！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_13_err2','到达时间在当前时间之前！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_13_err3','出发时间和到达时间差值不能超过24小时！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_13_err4','有同一行程人，当前机/车票行程单（费用）行程时段改得与历史差旅报销单交通票的重叠！');
insert into Pf_M_ErrCase values ('JkBx_A_BxQtXcd_13_err5','有行程人，当前机/车票行程单（费用）行程时段改得与历史的重叠！');

insert into Pf_M_ErrCase values ('JkBx_A_BxJt_11_err6','报销人当前交通票发生时段与历史机/车票行程单（费用）行程时段重叠！');
insert into Pf_M_ErrCase values ('JkBx_A_BxJt_13_err6','报销人当前交通票发生时段改得与历史机/车票行程单（费用）行程时段重叠！');

insert into Pf_M_ErrCase values ('UpdNodeOfBiz18_err5','机/车票费科目的费用报销项的行程单必须录入！');
commit;

修改13-报销预算科目整型码71码名 机/车票费

+++++++++++++++++++++++++++ 费用报销单20条扩到30条 +++++++++++++++++++++++++++ OK
insert into Pub_M_BookMark values ('B18_FyRq21','费用日期21',18);
insert into Pub_M_BookMark values ('B18_FyRq22','费用日期22',18);
insert into Pub_M_BookMark values ('B18_FyRq23','费用日期23',18);
insert into Pub_M_BookMark values ('B18_FyRq24','费用日期24',18);
insert into Pub_M_BookMark values ('B18_FyRq25','费用日期25',18);
insert into Pub_M_BookMark values ('B18_FyRq26','费用日期26',18);
insert into Pub_M_BookMark values ('B18_FyRq27','费用日期27',18);
insert into Pub_M_BookMark values ('B18_FyRq28','费用日期28',18);
insert into Pub_M_BookMark values ('B18_FyRq29','费用日期29',18);
insert into Pub_M_BookMark values ('B18_FyRq30','费用日期30',18);

insert into Pub_M_BookMark values ('B18_FyLb21','费用类别21',18);
insert into Pub_M_BookMark values ('B18_FyLb22','费用类别22',18);
insert into Pub_M_BookMark values ('B18_FyLb23','费用类别23',18);
insert into Pub_M_BookMark values ('B18_FyLb24','费用类别24',18);
insert into Pub_M_BookMark values ('B18_FyLb25','费用类别25',18);
insert into Pub_M_BookMark values ('B18_FyLb26','费用类别26',18);
insert into Pub_M_BookMark values ('B18_FyLb27','费用类别27',18);
insert into Pub_M_BookMark values ('B18_FyLb28','费用类别28',18);
insert into Pub_M_BookMark values ('B18_FyLb29','费用类别29',18);
insert into Pub_M_BookMark values ('B18_FyLb30','费用类别30',18);

insert into Pub_M_BookMark values ('B18_FyMs21','费用描述21',18);
insert into Pub_M_BookMark values ('B18_FyMs22','费用描述22',18);
insert into Pub_M_BookMark values ('B18_FyMs23','费用描述23',18);
insert into Pub_M_BookMark values ('B18_FyMs24','费用描述24',18);
insert into Pub_M_BookMark values ('B18_FyMs25','费用描述25',18);
insert into Pub_M_BookMark values ('B18_FyMs26','费用描述26',18);
insert into Pub_M_BookMark values ('B18_FyMs27','费用描述27',18);
insert into Pub_M_BookMark values ('B18_FyMs28','费用描述28',18);
insert into Pub_M_BookMark values ('B18_FyMs29','费用描述29',18);
insert into Pub_M_BookMark values ('B18_FyMs30','费用描述30',18);

insert into Pub_M_BookMark values ('B18_BxAmt21','报销金额21',18);
insert into Pub_M_BookMark values ('B18_BxAmt22','报销金额22',18);
insert into Pub_M_BookMark values ('B18_BxAmt23','报销金额23',18);
insert into Pub_M_BookMark values ('B18_BxAmt24','报销金额24',18);
insert into Pub_M_BookMark values ('B18_BxAmt25','报销金额25',18);
insert into Pub_M_BookMark values ('B18_BxAmt26','报销金额26',18);
insert into Pub_M_BookMark values ('B18_BxAmt27','报销金额27',18);
insert into Pub_M_BookMark values ('B18_BxAmt28','报销金额28',18);
insert into Pub_M_BookMark values ('B18_BxAmt29','报销金额29',18);
insert into Pub_M_BookMark values ('B18_BxAmt30','报销金额30',18);

insert into Pub_M_BookMark values ('B18_HfAmt21','花费金额21',18);
insert into Pub_M_BookMark values ('B18_HfAmt22','花费金额22',18);
insert into Pub_M_BookMark values ('B18_HfAmt23','花费金额23',18);
insert into Pub_M_BookMark values ('B18_HfAmt24','花费金额24',18);
insert into Pub_M_BookMark values ('B18_HfAmt25','花费金额25',18);
insert into Pub_M_BookMark values ('B18_HfAmt26','花费金额26',18);
insert into Pub_M_BookMark values ('B18_HfAmt27','花费金额27',18);
insert into Pub_M_BookMark values ('B18_HfAmt28','花费金额28',18);
insert into Pub_M_BookMark values ('B18_HfAmt29','花费金额29',18);
insert into Pub_M_BookMark values ('B18_HfAmt30','花费金额30',18);

insert into Pub_M_BookMark values ('B18_BxTaxAmt21',	'进项税21',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt22',	'进项税22',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt23',	'进项税23',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt24',	'进项税24',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt25',	'进项税25',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt26',	'进项税26',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt27',	'进项税27',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt28',	'进项税28',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt29',	'进项税29',18);
insert into Pub_M_BookMark values ('B18_BxTaxAmt30',	'进项税30',18);

commit;

调费用报销单模板

WebRoot/FileApp/BxSq/GenGdWord.jsp

+++++++++++++++++++++++++++ 项目档案自动时间特权更改、关联归档表重新生成 +++++++++++++++++++++++++++ OK
立项（业务员新增） > 尽调（业务员选择） > 项目审查（业务员选择） > 项目实施方案审议（运营组织干事选择）
> 合同审批（业务员新增）、合同用印（业务员自动待办接续）、依据正式立项合同付款（业务员新增）

*UpdNodeOfBiz25 UpdNodeOfBiz27
+ZxBg_XmScLb ZxBg_GdSrcBizID ZxBg_XmZxLb

+++++++++++++++++++++++++++ 包名com.infohold改com.ieds +++++++++++++++++++++++++++ OK
web.xml 不替换，但com.infohold 改 com.ieds
compass.cfg.xml 不替换

+++++++++++++++++++++++++++ 取消机票行程单录入，改为上传附件说明 +++++++++++++++++++++++++++ OK
* Pf_A_AttachInfo_11 JkBx_A_BxQt_22 FillIndexForBiz18 UpdNodeOfBiz18  
+ JkBx_A_Bx_12

++++++++++++++++++++++++++ 图片展示jsp替换为servlet、导出excel文件jsp替换为servlet ++++++++++++++++++++++++++++++++++++++++ OK
+ 
src/com/ieds/FramePub/FileOperate/PopImage.java
src/com/ieds/FrameApp/AddrList/ImpExp.java
src/com/ieds/admin/ent/AddrEmailImpExp.java

-
src/com/ieds/FramePub/FileOperate/ShowAppImage.java
src/com/ieds/FramePub/FileOperate/ShowMasterImage.java
src/com/ieds/FrameApp/AddrList/ExpForImp.java
src/com/ieds/FrameApp/AddrList/OrgUsrExp.java

WebRoot/FramePub/FileOperate/ShowAppImage.jsp
WebRoot/FramePub/FileOperate/ShowMasterImage.jsp
WebRoot/FrameApp/AddrList/CommExp.jsp
WebRoot/FrameApp/AddrList/ExpForImp.jsp
WebRoot/admin/ent/PopOrgUsrsXlsTemplate.jsp
WebRoot/admin/ent/OrgUsrExp.jsp ??
WebRoot/ckeditor/uploader/showImage.jsp

*
web.xml
src/com/ieds/FrameApp/PollingCycleListener.java  	//去除用户数发送
src/com/ieds/FrameApp/PollingCycle2.java			//去除用户数发送
src/com/ieds/FrameApp/AddrList/CommExp.java

WebRoot/admin/ent/edit.jsp
WebRoot/FileApp/Dsj/ListA/edit.jsp
WebRoot/FileApp/Dsj/ListA/list.jsp
WebRoot/FileApp/Dsj/ListB/edit.jsp
WebRoot/FrameApp/AddrList/edit.jsp
WebRoot/FrameApp/AddrList/RightList.jsp
WebRoot/FrameApp/top.jsp
WebRoot/ckeditor/uploader/upload.jsp

施工：
表XxFb_A_Zt.Nr字段替换 ShowAppImage.jsp ckeditor > src="/coaqy/PopImage?MA=A&ImgFileIDSeq=409"


+++++++++++++++++++++ 庆源OA需求与变更单20190214~20190225.doc ++++++++ OK

*功能
	-工作周报 公司论坛 会议管理
	*实施方案审批 > 项目审批
*角色
	法律合规专工 > 法律合规审核人
	+风险管理审核人 分管风险副总
*业务
	实施方案审批 > 项目审批
	
*首页	
	delete from Pf_M_HomePageInfoBlock where cName in ('给我的工作汇报','会议通知','会议纪要发布','最新开放议题');
	update Pf_M_HomePageInfoBlock set cName='待审批项目' where cName='待审议项目';
	commit;

登记模板：
	insert into Pub_M_BookMark values ('B27Tp_2DC','审批合同二维码',27);
	insert into Pub_M_BookMark values ('B28Tp_2DC','审查合同二维码',28);
	insert into Pub_M_BookMark values ('B09Tp_2DC','非业务合同二维码',9);
	commit;
	带二维码插入标签的非业务类合同模板
	带二维码插入标签的审查合同模板
	带二维码插入标签的审批合同模板
	insert into Pub_M_Template values (null,'带二维码插入标签的非业务类合同模板',9);
	insert into Pub_M_Template values (null,'带二维码插入标签的审查合同模板',28);
	insert into Pub_M_Template values (null,'带二维码插入标签的审批合同模板',27);
	commit;
	
* 
	Pf_A_AttachInfo_11 
	主体整体删除，级联删除主体附件的派生附件> WjHq_A_Zt_22 ZxBg_A_HtSp_22 ZxBg_A_HtSc_22 
	
+
	删除单一附件独立过程> Pf_DelAttach 

*合同审查
	*【审批单归档】
	+【盖章封印】
	*<合同审查流程>

*非业务合同审批
	*【法律合规部审批】
	+【排版归档】
	+【盖章封印】
	+<非业务类合同审签流程2019>

*立项申请：
	关闭以下环节：法律合规部审查、风险管理部审查、财务部审查、决策部主任批示
	*立项归档，应用特征字改YN > Y
	+环节： 运营管理部审核 总裁审批
	
	*Pf_Abbre UpdNodeOfBiz21 FillIndexForBiz21
	
	ALTER TABLE `ZxBg_A_LxSq` DROP FOREIGN KEY `ZxBg_A_LxSq_fk3`;
	ALTER TABLE `ZxBg_A_LxSq` DROP COLUMN `XmDwID`;
	ALTER TABLE `ZxBg_A_LxSq` DROP COLUMN `XmJe`;
	ALTER TABLE `ZxBg_A_LxSq` DROP COLUMN `LxhZkSj`;
	ALTER TABLE `ZxBg_A_LxSq` DROP COLUMN `ChRyIDs`;
	ALTER TABLE `ZxBg_A_LxSq` DROP COLUMN `JgMs`;
	
	ALTER TABLE `ZxBg_M_XmXx` DROP FOREIGN KEY `ZxBg_M_XmXx_fk1`;
	ALTER TABLE `ZxBg_M_XmXx` DROP COLUMN `XmDwID`;
	ALTER TABLE `ZxBg_M_XmXx` DROP COLUMN `LxhZkSj`;
	ALTER TABLE `ZxBg_M_XmXx` DROP COLUMN `LxhJgMs`;
	ALTER TABLE `ZxBg_M_XmXx` DROP COLUMN `LxhChRyIDs`;
	ALTER TABLE `ZxBg_M_XmXx` ADD COLUMN `DiscardCnt` TINYINT(3) UNSIGNED DEFAULT NULL COMMENT '弃权数' AFTER `RejectCnt`;

	ALTER TABLE `ZxBg_A_LxSq` ADD COLUMN `XmBh` CHAR(10) DEFAULT NULL COMMENT '项目编号';
	update Pf_M_ErrCase set ErrPrompt='从【立项归档】向下流转前，<签约公司>必选！' where Code='UpdNodeOfBiz21_err1';
	commit;
	
	insert into Pub_M_BookMark values ('B21_XmBh','立项编号',21);
	insert into Pub_M_BookMark values ('B21_GdSj','填表时间',21);
	insert into Pub_M_BookMark values ('B21_YwBmZz','部门负责人',21);
	insert into Pub_M_BookMark values ('B21_SqRq','申请日期',21);
	insert into Pub_M_BookMark values ('B21_YyFgSpYj','运营分管副总意见',21);
	insert into Pub_M_BookMark values ('B21_YyFgSpRq','运营分管副总审批时间',21);
	insert into Pub_M_BookMark values ('B21Qm_YyFg','运营分管副总签字',21);
	insert into Pub_M_BookMark values ('B21_ZcSpYj','总裁意见',21);
	insert into Pub_M_BookMark values ('B21_ZcSpRq','总裁审批时间',21);
	insert into Pub_M_BookMark values ('B21Qm_Zc','总裁签字',21);
	delete from Pub_M_BookMark 
	where Code in ('B21Qm_CwFgLd','B21Qm_HgFgLd','B21Qm_JchLd','B21_CwSpRq','B21_CwSpYj','B21_FwSpRq','B21_FwSpYj','B21_JchZrSpRq','B21_JchZrSpYj','B21_XmDw','B21_XmJeD');
	commit;
	
	*模板> 06、立项申请审批表.docx
	
	*26-项目阶段
		c	项目审查审议阶段*
		d	决策会审批阶段*
		
*项目审查
	关闭：【申请部室负责人审查】【申请部室分管副总审查】
	调序：【运营管理部审查/归档】【法律合规部审查】
	+：【法律合规部负责人意见】【法律合规部分管副总意见】【风险管理部审查】【风险管理部负责人意见】【风险管理部分管副总意见】
	*：【决策办委员审查】 > 【决策会主任委员审定】
	+：<项目审查流程2019>
	*ZxBg_A_XmSc_22 UpdNodeOfBiz23 ZxBg_XmScLb
	update Pf_M_ErrCase set ErrPrompt='结束流程前，须生成《项目法律合规审查意见表》线上签字文件！' where Code='UpdNodeOfBiz23_err3';
	update Pf_M_ErrCase set ErrPrompt='结束流程前，须生成《项目风险审查意见表》线上签字文件！' where Code='UpdNodeOfBiz23_err4';
	insert into Pf_M_ErrCase values ('UpdNodeOfBiz23_err5','结束流程前，须生成《项目财务审查意见表》线上签字文件！');
	commit;
	
	delete from Pub_M_BookMark 
	where Code in ('B23_XmDw','B23_XmJeD','B23Qm_JchLd','B23Qm_SqBmFgLd','B23Qm_SqBmFzr','B23Qm_YgFgLd','B23Qm_YgFzr','B23_JcbWyScRq','B23_JcbWyScYj','B23_XmSqr',
		'B23_SqBsFgFzScRq','B23_SqBsFgFzScYj','B23_SqBsFzrScRq','B23_SqBsFzrScYj','B23_YyGlbFgFzScRq','B23_YyGlbFgFzScYj','B23_YyGlbScRq','B23_YyGlbScYj','B23_XmJj');
	insert into Pub_M_BookMark values ('B23_XmBh','项目编号',23);
	insert into Pub_M_BookMark values ('B23_TbSj','填表时间',23);
	insert into Pub_M_BookMark values ('B23_YwBmFzr','部门负责人',23);
	update Pub_M_BookMark set Name='法律合规分管副总签字' where Code='B23Qm_HgFgLd';
	insert into Pub_M_BookMark values ('B23Qm_HgScr','合规审查人签字',23);
	insert into Pub_M_BookMark values ('B23Qm_HgBmFzr','合规部门负责人签字',23);
	insert into Pub_M_BookMark values ('B23_HgBmFzrRq','合规部门负责人时间',23);
	insert into Pub_M_BookMark values ('B23_HgBmFzrYj','合规部门负责人意见',23);
	insert into Pub_M_BookMark values ('B23_HgFgLdRq','合规分管领导时间',23);
	insert into Pub_M_BookMark values ('B23_HgFgLdYj','合规分管领导意见',23);
	insert into Pub_M_BookMark values ('B23Qm_FxScr','风险审查人签字',23);
	insert into Pub_M_BookMark values ('B23_FxScrRq','风险审查人时间',23);
	insert into Pub_M_BookMark values ('B23_FxScrYj','风险审查人意见',23);
	insert into Pub_M_BookMark values ('B23Qm_FxBmFzr','风险部门负责人签字',23);
	insert into Pub_M_BookMark values ('B23_FxBmFzrRq','风险部门负责人时间',23);
	insert into Pub_M_BookMark values ('B23_FxBmFzrYj','风险部门负责人意见',23);
	insert into Pub_M_BookMark values ('B23Qm_FxFgLd','风险分管领导签字',23);
	insert into Pub_M_BookMark values ('B23_FxFgLdRq','风险分管领导时间',23);
	insert into Pub_M_BookMark values ('B23_FxFgLdYj','风险分管领导意见',23);

	insert into Pub_M_BookMark values ('B23_XmJe','项目金额',23);
	commit;
	
	ALTER TABLE `ZxBg_A_XmSc` ADD COLUMN `XmJe` DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '项目金额（万元）' AFTER `XmID`;
	+Pf_UsrDeptManagerPsnID
	-原业务模板，+：
	07、项目法律合规审查意见表.docx
	07、项目风险审查意见表.docx
	07、项目财务审查意见表.docx
	insert into Pub_M_Template values (null,'项目法律合规审查意见表',23);
	insert into Pub_M_Template values (null,'项目风险审查意见表',23);
	insert into Pub_M_Template values (null,'项目财务审查意见表',23);
	commit;
		
*项目审批
	+#40-表决意见 P-赞成，R-反对，D-弃权
	*按新设计注册流程环节
	+<项目审批流程2019>
	+流程选人： 109-从项目审批决策会出席人员多选

	ALTER TABLE `ZxBg_A_FaSp` ADD COLUMN `ZcrID` SMALLINT(5) UNSIGNED NOT NULL COMMENT '主持人ID' AFTER `JchZkSj`;
	ALTER TABLE `ZxBg_A_FaSp` ADD COLUMN `CxIDs` VARCHAR(100) NOT NULL COMMENT '出席IDs' AFTER `ZcrID`;
	ALTER TABLE `ZxBg_A_FaSp` ADD COLUMN `LxIDs` VARCHAR(100) DEFAULT NULL COMMENT '列席IDs' AFTER `CxIDs`;
	ALTER TABLE `ZxBg_A_FaSp` ADD COLUMN `DiscardCnt` TINYINT(3) UNSIGNED NOT NULL COMMENT '弃权数' AFTER `RejectCnt`;
	ALTER TABLE `ZxBg_A_FaSp` MODIFY COLUMN `SsYj` VARCHAR(1000) COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目实施要件';
	ALTER TABLE `ZxBg_A_FaSp` ADD INDEX  (`ZcrID`);
	ALTER TABLE `ZxBg_A_FaSp` ADD CONSTRAINT `ZxBg_A_FaSp_fk3` FOREIGN KEY (`ZcrID`) REFERENCES `Pf_M_Usr` (`ID`);
	
	+ZxBg_A_FaSpBj ZxBg_XmSpPRD ZxBg_XmSpLb
	*ZxBg_A_FaSp_22 UpdNodeOfBiz24 FillIndexForBiz24 PsnSel_CalcLM
	
	delete from Pf_M_ErrCase where Code in ('ZxBg_A_FaSp_11_err1','ZxBg_A_FaSp_13_err1');
	commit;
	
	DROP TRIGGER `ZxBg_A_FaSp_11`;
	DROP TRIGGER `ZxBg_A_FaSp_13`;
	
	update Pf_M_ErrCase
	set ErrPrompt='结束流程前，须生成《项目表决结果》线上签字文件和《决策会会议纪要》！'
	where Code='UpdNodeOfBiz24_err2';
	insert into Pf_M_ErrCase values ('UpdNodeOfBiz24_err3','发起项目审批决策会前，请先生成《决策会会议通知》！');
	commit;
	
	模板：
	-经营决策委员会实施方案审批表
	+决策会会议通知 项目表决结果表 决策会会议纪要
	insert into Pub_M_Template values (null,'决策会会议通知',24);
	insert into Pub_M_Template values (null,'项目表决结果表',24);
	insert into Pub_M_Template values (null,'决策会会议纪要',24);
	commit;

	delete from Pub_M_BookMark 
	where BizCode=24 and Code not in ('B24_XmMc','B24_JchZkSjD','B24_ChTpCnt','B24_PassCnt','B24_RejectCnt');
	
	insert into Pub_M_BookMark values ('B24_Zcr','主持人',24);    
	insert into Pub_M_BookMark values ('B24_JchSqSjD','申请日期',24);    
	
	insert into Pub_M_BookMark values ('B24_BjrXm1','表决人1',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm2','表决人2',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm3','表决人3',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm4','表决人4',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm5','表决人5',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm6','表决人6',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm7','表决人7',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm8','表决人8',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm9','表决人9',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm10','表决人10',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm11','表决人11',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm12','表决人12',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm13','表决人13',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm14','表决人14',24);    
	insert into Pub_M_BookMark values ('B24_BjrXm15','表决人15',24);    
	
	insert into Pub_M_BookMark values ('B24_BjP1','表决赞成1',24);    
	insert into Pub_M_BookMark values ('B24_BjP2','表决赞成2',24);    
	insert into Pub_M_BookMark values ('B24_BjP3','表决赞成3',24);    
	insert into Pub_M_BookMark values ('B24_BjP4','表决赞成4',24);    
	insert into Pub_M_BookMark values ('B24_BjP5','表决赞成5',24);    
	insert into Pub_M_BookMark values ('B24_BjP6','表决赞成6',24);    
	insert into Pub_M_BookMark values ('B24_BjP7','表决赞成7',24);    
	insert into Pub_M_BookMark values ('B24_BjP8','表决赞成8',24);    
	insert into Pub_M_BookMark values ('B24_BjP9','表决赞成9',24);    
	insert into Pub_M_BookMark values ('B24_BjP10','表决赞成10',24);    
	insert into Pub_M_BookMark values ('B24_BjP11','表决赞成11',24);    
	insert into Pub_M_BookMark values ('B24_BjP12','表决赞成12',24);    
	insert into Pub_M_BookMark values ('B24_BjP13','表决赞成13',24);    
	insert into Pub_M_BookMark values ('B24_BjP14','表决赞成14',24);    
	insert into Pub_M_BookMark values ('B24_BjP15','表决赞成15',24);    
	
	insert into Pub_M_BookMark values ('B24_BjR1','表决反对1',24);    
	insert into Pub_M_BookMark values ('B24_BjR2','表决反对2',24);    
	insert into Pub_M_BookMark values ('B24_BjR3','表决反对3',24);    
	insert into Pub_M_BookMark values ('B24_BjR4','表决反对4',24);    
	insert into Pub_M_BookMark values ('B24_BjR5','表决反对5',24);    
	insert into Pub_M_BookMark values ('B24_BjR6','表决反对6',24);    
	insert into Pub_M_BookMark values ('B24_BjR7','表决反对7',24);    
	insert into Pub_M_BookMark values ('B24_BjR8','表决反对8',24);    
	insert into Pub_M_BookMark values ('B24_BjR9','表决反对9',24);    
	insert into Pub_M_BookMark values ('B24_BjR10','表决反对10',24);    
	insert into Pub_M_BookMark values ('B24_BjR11','表决反对11',24);    
	insert into Pub_M_BookMark values ('B24_BjR12','表决反对12',24);    
	insert into Pub_M_BookMark values ('B24_BjR13','表决反对13',24);    
	insert into Pub_M_BookMark values ('B24_BjR14','表决反对14',24);    
	insert into Pub_M_BookMark values ('B24_BjR15','表决反对15',24);    
	
	insert into Pub_M_BookMark values ('B24_BjD1','表决弃权1',24);    
	insert into Pub_M_BookMark values ('B24_BjD2','表决弃权2',24);    
	insert into Pub_M_BookMark values ('B24_BjD3','表决弃权3',24);    
	insert into Pub_M_BookMark values ('B24_BjD4','表决弃权4',24);    
	insert into Pub_M_BookMark values ('B24_BjD5','表决弃权5',24);    
	insert into Pub_M_BookMark values ('B24_BjD6','表决弃权6',24);    
	insert into Pub_M_BookMark values ('B24_BjD7','表决弃权7',24);    
	insert into Pub_M_BookMark values ('B24_BjD8','表决弃权8',24);    
	insert into Pub_M_BookMark values ('B24_BjD9','表决弃权9',24);    
	insert into Pub_M_BookMark values ('B24_BjD10','表决弃权10',24);    
	insert into Pub_M_BookMark values ('B24_BjD11','表决弃权11',24);    
	insert into Pub_M_BookMark values ('B24_BjD12','表决弃权12',24);    
	insert into Pub_M_BookMark values ('B24_BjD13','表决弃权13',24);    
	insert into Pub_M_BookMark values ('B24_BjD14','表决弃权14',24);    
	insert into Pub_M_BookMark values ('B24_BjD15','表决弃权15',24);    
	
	insert into Pub_M_BookMark values ('B24Qm_Bjr1','表决人签名1',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr2','表决人签名2',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr3','表决人签名3',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr4','表决人签名4',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr5','表决人签名5',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr6','表决人签名6',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr7','表决人签名7',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr8','表决人签名8',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr9','表决人签名9',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr10','表决人签名10',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr11','表决人签名11',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr12','表决人签名12',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr13','表决人签名13',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr14','表决人签名14',24);    
	insert into Pub_M_BookMark values ('B24Qm_Bjr15','表决人签名15',24);    
	
	insert into Pub_M_BookMark values ('B24_ChCnt','参会人数',24);    
	insert into Pub_M_BookMark values ('B24_DiscardCnt','弃权人数',24);    
	insert into Pub_M_BookMark values ('B24_XmMc2','项目名称2',24);    
	
	insert into Pub_M_BookMark values ('B24_Cx','出席',24);    
	insert into Pub_M_BookMark values ('B24_Lx','列席',24);    
	insert into Pub_M_BookMark values ('B24_Jl','记录',24); 
	insert into Pub_M_BookMark values ('B24_DqRq','当前日期',24);    
	commit;
	
*合同审批
	*【审批单归档】应用特征字Y > YN
	+环节【盖章封印】
	+<合同审批流程2019>
	*FillIndexForBiz27
	delete from Pub_M_BookMark where Code='B27_XmDw';
	insert into Pub_M_BookMark values ('B27_XmBh','项目编号',27);  
	commit;
	*模板 合同审批单

*用印
	*ZxBg_YyCl
			
*项目付款审批
	*恢复【业务部门分管副总审批】【分管财务副总审批】	
	*【出纳放款】特征字YN > Y
	+<项目付款审批流程2019>
	*v_ZxBg_A_FkSp
	+ZxBg_XmBh
	insert into Pub_M_BookMark values ('B26_XmBh','项目编号',26);  
	commit;	
	
+++++++++++++++++++++ 借款单补申请人<收款账户名><收款账户开户行><收款账号> +++++++++++++++++++++		OK
ALTER TABLE `JkBx_A_Jk` ADD COLUMN `SkZhMc` VARCHAR(100) NOT NULL DEFAULT '-' COMMENT '收款账户名';
ALTER TABLE `JkBx_A_Jk` ADD COLUMN `SkZhKhh` VARCHAR(100) NOT NULL DEFAULT '-' COMMENT '收款账户开户行';
ALTER TABLE `JkBx_A_Jk` ADD COLUMN `SkZhNo` VARCHAR(50) NOT NULL DEFAULT '-' COMMENT '收款账号';
*FillIndexForBiz14

+++++++++++++++++++++ 增加<请示签报>通用流程，允许发起人在现有流程与新流程之间选择 +++++++++++++++++++++ OK
1、改【公司会签】模式为“多人顺序”；
2、增加流程<一般请示签报流程2019>；

+++++++++++++++++++++ 庆源OA需求与变更单20190410.doc +++++++++++++++++++++++++++++ ok~
1、非业务合同审批业务（9）
	1.1、后台；
ALTER TABLE `WjHq_A_Zt` ADD COLUMN `HtBh` VARCHAR(40) DEFAULT NULL COMMENT '合同编号';
ALTER TABLE `WjHq_A_Zt` ADD COLUMN `SfDfTgHt` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '是否对方提供合同';
*UpdNodeOfBiz09 FillIndexForBiz09
insert into Pf_M_ErrCase values ('UpdNodeOfBiz09_err1','提交法律合规部审批前应先对合同编号！');
commit;
	
	1.2、【合同起草】改【起草】，增加【法律合规部审核】环节，按最新设计文件设置环节应用特征字；
	
	1.3、新开流程<非业务类合同审签流程201904> 
	
2、合同审查（28）
	2.1、后台	
ALTER TABLE `ZxBg_A_HtSc` ADD COLUMN `SfDfTgHt` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '是否对方提供合同';
*UpdNodeOfBiz28
update Pf_M_ErrCase set ErrPrompt='发起合同审查前须上传未盖章合同原版文件！' where Code='UpdNodeOfBiz28_err1';
update Pf_M_ErrCase set ErrPrompt='提交法律合规部门负责人审批前应先对合同编号！' where Code='UpdNodeOfBiz28_err2';
commit;
	
	2.2、增加【法律合规部审核】环节，按最新设计文件设置环节应用特征字；
	
	2.3、新开流程<合同审查流程201904>
	
3、合同审批（27）	
	3.1、后台
ALTER TABLE `ZxBg_A_HtSp` ADD COLUMN `SfDfTgHt` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '是否对方提供合同';
*UpdNodeOfBiz27
update Pf_M_ErrCase set ErrPrompt='发起合同审批前须上传未盖章合同原版文件！' where Code='UpdNodeOfBiz27_err1';
update Pf_M_ErrCase set ErrPrompt='提交法律合规部门负责人审批前应先对合同编号！' where Code='UpdNodeOfBiz27_err2';
commit;
	
	3.2、增加【法律合规部审核】环节，按最新设计文件设置环节应用特征字；
	
	3.3、新开流程<合同审批流程201904>

4、*用印申请
delete from Pf_M_ErrCase where Code='UpdNodeOfBiz25_err1';
commit;

*UpdNodeOfBiz25
	
5、*档案交接（7）
	5.1、后台
insert into Pf_M_CodeType values (41,'C','交档来源');

insert into Pf_M_CharCode values (41,'A','无系统来源',0);	
insert into Pf_M_CharCode values (41,'B','非业务合同',0);	
insert into Pf_M_CharCode values (41,'C','临时项目审查合同',0);	
insert into Pf_M_CharCode values (41,'D','正式立项项目',0);	

insert into Pf_M_ErrCase values ('UpdNodeOfBiz07_err1','交档不全，流程不能往下走！');

commit;

ALTER TABLE `Da_A_Jj` ADD COLUMN `JdLy` CHAR(1) NOT NULL DEFAULT 'A' COMMENT '交档来源';
ALTER TABLE `Da_A_Jj` ADD COLUMN `LyYwOrXmID` INTEGER UNSIGNED DEFAULT NULL COMMENT '来源业务/项目ID';
+Da_A_JjMx Da_A_Jj_21 DaJj_XmHtBhMc
*Pf_A_AttachInfo_21 Pf_A_AttachInfo_23 Da_A_Jj_22 UpdNodeOfBiz07 FillIndexForBiz07

# 历史交档明细补丁
insert into Da_A_JjMx
select now(),null,PrimaryID,Seq,'Y'
from Pf_A_AttachInfo
where PrimaryName='Da_A_Jj' and DelTag='N';	
commit;

ALTER TABLE `Pf_D_IndexContentOfAttach` DROP FOREIGN KEY `Pf_D_IndexContentOfAttach_FK1`;
	
	5.2、修改【档案接收】应用特征字为Y

6、绩效统计
+JxTj_TimeoutTime JxTj_RejectCnt JxTj_FillDataList	

2019-04-25 ok
*JxTj_TimeoutTime JxTj_RejectCnt JxTj_FillDataList
