CREATE DEFINER = 'root'@'%' PROCEDURE `UpdNodeOfBiz25`(
        IN `pBizID` INTEGER UNSIGNED,
        IN `pBizNode1` SMALLINT,
        IN `pBizNode2` SMALLINT,
        IN `pDriveTag` CHAR(1),
        IN `pActionID` SMALLINT UNSIGNED
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT '【25-印章、证照使用审批】业务环节迁移过程'
label1:
BEGIN
 	declare vNode1Name,vNode2Name varchar(20);
 	declare vNode1TzSys1,vNode2TzSys1 char(1);
    declare vFlowBranchName VARCHAR(40);
    declare vCnt tinyint unsigned;
    
    declare vYyHtID,vYyHtScID,vYyWjHqID integer unsigned;
    declare vSfDcYy char;	#是否带出用印
	declare vSubmitTs datetime;
    declare vXmID smallint unsigned;
    declare vXmDirRootID integer unsigned;
        
    declare vAppUrl,vBizTitle varchar(100);
    declare vInitUsrID,vDszUsrID smallint unsigned;
    declare vPrompt varchar(1000);
    
    declare vHtBh VARCHAR(40); #合同编号
    declare vDaJjFlowDefID smallint unsigned;
    declare vDaJjInitNodeID smallint;
    declare vToDoWorkItem integer unsigned; # 必要的出参，不用
    
    declare vDaJjBizSeqToBeDel integer unsigned; #待删除档案交接

 	# >>>
 	set vNode1Name=Pf_BizNodeName(pBizNode1);
 	set vNode2Name=Pf_BizNodeName(pBizNode2);
 	set vNode1TzSys1=Pf_BizNodeSysBitByPt(pBizNode1,1);
 	set vNode2TzSys1=Pf_BizNodeSysBitByPt(pBizNode2,1);
 	set vFlowBranchName=Pf_BizFlowBranchName(pActionID);

	select YyHtID,YyHtScID,YyWjHqID,SfDcYy into vYyHtID,vYyHtScID,vYyWjHqID,vSfDcYy from ZxBg_A_YzZzSq where ID=pBizID;
   	select BizTitle,SubmitTs,InitUsrID into vBizTitle,vSubmitTs,vInitUsrID from Pf_A_Biz where BizCode=25 and BizID=pBizID;
    
    if vNode1TzSys1='S' and vNode2TzSys1!='S' and vYyHtID is null and vYyHtScID is null and vYyWjHqID is null then
    	select count(*) into vCnt from Pf_A_AttachInfo where PrimaryID=pBizID and PrimaryName in ('ZxBg_A_YzZzSq_1','ZxBg_A_YzZzSq_2') and DelTag='N';
 		if vCnt=0 then
 			call UpdNodeOfBiz25_err2(); # 提交印章、证照使用审批前，须上传用印文本/法律合规附件！
 			leave label1;
 		end if;
    end if;
    
    if vNode1Name='印章、证照归还' and vNode2Name='结束' then
    	# 约束
        select count(*) into vCnt from Pf_A_AttachInfo where PrimaryID=pBizID and PrimaryName='ZxBg_A_YzZzSq_Qz' and DelTag='N';
 		if vCnt=0 then
 			call UpdNodeOfBiz25_err3(); # 流程结束前，须生成印章、证照使用审批单归档签字文件！
 			leave label1;
 		end if;
    end if;

    if vNode1Name='公司用印管理员发放' and vNode2Name='印章、证照归还' then
    	# 约束
        select count(*) into vCnt from ZxBg_A_YzZzSqMx mx,ZxBg_M_YzZz m 
        where mx.ZtID=pBizID and mx.YzZzID=m.ID and m.SfZy='Y';
 		if vCnt>0 then
 			call UpdNodeOfBiz25_err4(); # 申请的印章或证照他人在用！
 			leave label1;
 		end if;
        
        #改申请印章/证照为在用
        update ZxBg_M_YzZz m,ZxBg_A_YzZzSqMx mx
        set m.SfZy='Y'
        where mx.ZtID=pBizID and mx.YzZzID=m.ID;
    end if;

    if vNode1Name='印章、证照归还' and vNode2Name='公司用印管理员发放' then #发放撤回
        #改申请印章/证照为可用
        update ZxBg_M_YzZz m,ZxBg_A_YzZzSqMx mx
        set m.SfZy='N'
        where mx.ZtID=pBizID and mx.YzZzID=m.ID;
    end if;

    if vNode1TzSys1!='E' and vNode2TzSys1='E' THEN
        # 相关更新
        # 0、流程结束、置业务可归档
        update Pf_A_Biz set IfToBeArchived='Y' where BizCode=25 and BizID=pBizID;
				
        #流程结束<业务状态>自动置“P”
		update ZxBg_A_YzZzSq set BizStatus='P' where ID=pBizID;
        
        #改申请印章/证照为可用
        update ZxBg_M_YzZz m,ZxBg_A_YzZzSqMx mx
        set m.SfZy='N'
        where mx.ZtID=pBizID and mx.YzZzID=m.ID;
        
		select AppUrl Into vAppUrl From Pf_M_Ent;
        
		if vYyWjHqID is null and vYyHtScID is null then #无接续档案交接
			# 发提醒给申请业务员
			set vPrompt=concat(Pf_UsrcName(vInitUsrID),'，你好！',Char(13),Char(10),
				'    【',vBizTitle,'】审批流程，已于：【',DATE_FORMAT(now(),'%Y-%m-%d %H:%i'),'】结束！详情见办公系统。',
				char(13),char(10),char(13),char(10),'办公系统访问地址是：',vAppUrl);
					  
			insert into Pf_D_PromptMail values (null, now(), '印章、证照使用审批流程结束提醒',vPrompt, now(), 'N');
			insert into Pf_D_PromptMailTo values (@@identity,Pf_UsrEmail(vInitUsrID),'Z');
		else
			# 依据非业务合同/审查合同（适用未正式立项项目）的用印申请流程结束，自动接续档案交接
			select max(ID) into vDaJjFlowDefID from Pf_M_BizFlow where BizCode=7 and IfValid='Y';
			select ID into vDaJjInitNodeID from Pf_M_BizNode where BizCode=7 and substr(TzSys,1,1)='S' and IfValid='Y';

			if vYyWjHqID is not null then
				select HtBh into vHtBh from WjHq_A_Zt where ID=vYyWjHqID;        
				insert into Da_A_Jj values (now(),null,vInitUsrID,Pf_OrgFullName(Pf_UsrMainOrgID(vInitUsrID)),CONCAT('非业务合同【',vHtBh,'】档案交接'),null,'B',vYyWjHqID);
				call Engine_InitBizFlow(7,@@identity,concat('<',Pf_UsrcName(vInitUsrID),'>非业务合同【',vHtBh,'】档案交接'),vDaJjFlowDefID,vDaJjInitNodeID,vInitUsrID,vToDoWorkItem);
					 
				# 发提醒给申请业务员
				set vPrompt=concat(Pf_UsrcName(vInitUsrID),'，你好！',Char(13),Char(10),
					'    依据非业务合同、标题为【',vBizTitle,'】的用印申请已于',DATE_FORMAT(now(),'%Y-%m-%d %H:%i'),'获批并归档，且自动发起了相应的档案交接！详情见办公系统。',
					char(13),char(10),char(13),char(10),'办公系统访问地址是：',vAppUrl);
						  
				insert into Pf_D_PromptMail values (null, now(), '依据非业务合同的用印申请获批后<档案交接>自动接续提醒',vPrompt, now(), 'N');
				insert into Pf_D_PromptMailTo values (@@identity,Pf_UsrEmail(vInitUsrID),'Z');
			end if;
			
			if vYyHtScID is not null then
				select HtBh into vHtBh from ZxBg_A_HtSc where ID=vYyHtScID;        
				insert into Da_A_Jj values (now(),null,vInitUsrID,Pf_OrgFullName(Pf_UsrMainOrgID(vInitUsrID)),CONCAT('审查合同【',vHtBh,'】档案交接'),null,'C',vYyHtScID);
				call Engine_InitBizFlow(7,@@identity,concat('<',Pf_UsrcName(vInitUsrID),'>审查合同【',vHtBh,'】档案交接'),vDaJjFlowDefID,vDaJjInitNodeID,vInitUsrID,vToDoWorkItem);
					 
				# 发提醒给申请业务员
				set vPrompt=concat(Pf_UsrcName(vInitUsrID),'，你好！',Char(13),Char(10),
					'    依据审查合同、标题为【',vBizTitle,'】的用印申请已于',DATE_FORMAT(now(),'%Y-%m-%d %H:%i'),'获批并归档，且自动发起了相应的档案交接！详情见办公系统。',
					char(13),char(10),char(13),char(10),'办公系统访问地址是：',vAppUrl);
						  
				insert into Pf_D_PromptMail values (null, now(), '依据审查合同的用印申请获批后<档案交接>自动接续提醒',vPrompt, now(), 'N');
				insert into Pf_D_PromptMailTo values (@@identity,Pf_UsrEmail(vInitUsrID),'Z');
			end if;
		end if;
		
        # 发提醒给董事长
        select MIN(UsrID) into vDszUsrID from Pf_M_RoleUsr where Pf_RoleName(RoleID)='董事长';
        set vPrompt=concat('董事长，您好！',Char(13),Char(10),
            '    ',Pf_UsrcName(vInitUsrID),'的用印申请【',vBizTitle,'】审批流程，已于：【',DATE_FORMAT(now(),'%Y-%m-%d %H:%i'),'】结束！详情见办公系统。',
            char(13),char(10),char(13),char(10),'办公系统访问地址是：',vAppUrl);
                  
        insert into Pf_D_PromptMail values (null, now(), '印章、证照使用审批流程结束提醒',vPrompt, now(), 'N');
        insert into Pf_D_PromptMailTo values (@@identity,Pf_UsrEmail(vDszUsrID),'Z');
    end if;

    if vNode1TzSys1='E' and vNode2TzSys1!='E' THEN #撤回结束的流程
    	update ZxBg_A_YzZzSq set BizStatus='W' where ID=pBizID;
        
        #改申请印章/证照为在用
        update ZxBg_M_YzZz m,ZxBg_A_YzZzSqMx mx
        set m.SfZy='Y'
        where mx.ZtID=pBizID and mx.YzZzID=m.ID;
        
        if vYyHtID is not null then #依据正式立项审批合同
        	select XmID into vXmID from ZxBg_M_XmHt where ID=vYyHtID;
            
        	#撤销文件归档
        	select ID into vXmDirRootID from ZxBg_M_XmDir where XmID=vXmID and Mc='项目文件' and UpDirID=0;
            
    		update Pf_M_AttachInfo set DelTag='Y'  
        	where PrimaryName ='ZxBg_M_XmDir' and instr(FileName,concat('[',pBizID,']',FileExt))>0 and exists(
        		select 1 from ZxBg_M_XmDir where XmID=vXmID and Mc=concat('e、',Pf_CodeValueByCharCode(26,'e')) and UpDirID=vXmDirRootID and 
            	Pf_M_AttachInfo.PrimaryID=ID);
        end if;
        
        if vYyWjHqID is not null then
        	#撤销接续的档案交接
            select Seq into vDaJjBizSeqToBeDel
            from Pf_A_Biz
            where BizCode=7 and exists(select 1 from Da_A_Jj where JdLy='B' and LyYwOrXmID=vYyWjHqID and ID=Pf_A_Biz.BizID);
            
            delete from Pf_A_Biz where Seq=vDaJjBizSeqToBeDel;
            delete from Da_A_Jj where JdLy='B' and LyYwOrXmID=vYyWjHqID;
        end if;
        
        if vYyHtScID is not null then
        	#撤销接续的档案交接
            select Seq into vDaJjBizSeqToBeDel
            from Pf_A_Biz
            where BizCode=7 and exists(select 1 from Da_A_Jj where JdLy='C' and LyYwOrXmID=vYyHtScID and ID=Pf_A_Biz.BizID);
            
            delete from Pf_A_Biz where Seq=vDaJjBizSeqToBeDel;
            delete from Da_A_Jj where JdLy='C' and LyYwOrXmID=vYyHtScID;
        end if;
    end if;
END;