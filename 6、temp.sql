select concat(Pf_OrgShortName(Pf_UsrMainOrgID(ProcessedBy)),' / ',Pf_UsrcName(ProcessedBy)) Processor,
	Pf_BizName(Pf_BizCodeByBizSeq(BizSeq)) BizName,Pf_BizTitle(BizSeq) BizTitle,
    JxTj_TimeoutTime(ProcessedBy,BizSeq) TimeoutTime,JxTj_RejectCnt(ProcessedBy,BizSeq) RejectCnt
from (    
  select distinct ProcessedBy,BizSeq
  from Pf_A_BizProcRcd w
  where exists(select 1 from Pf_M_BizNode where ID=w.CurrNode and BizCode in (9,27,28) and Name in ('起草','法律合规部审核'))
  ) t 
order by Pf_OrgBigOrd(Pf_UsrMainOrgID(ProcessedBy)),Pf_UsrOrdInMainOrg(ProcessedBy),BizSeq;

select concat(Pf_OrgShortName(Pf_UsrMainOrgID(ProcessedBy)),' / ',Pf_UsrcName(ProcessedBy)) Processor,COUNT(BizSeq) WorkCnt
from (
  select distinct ProcessedBy,BizSeq
  from Pf_A_BizProcRcd w
  where exists(select 1 from Pf_M_BizNode where ID=w.CurrNode and BizCode in (9,27,28) and Name in ('起草','法律合规部审核'))
	) t
group by ProcessedBy; 

select concat(Pf_OrgShortName(Pf_UsrMainOrgID(ProcessedBy)),' / ',Pf_UsrcName(ProcessedBy)) Processor,sum(TimeoutTime) TimeoutTime
from (
  select ProcessedBy,
    case when ProcTimeLimit=0 then 0 else case when Pf_WorkHoursBetween(ProcessedBy,ArrivedTs,ifnull(SubmitTs,now()))>ProcTimeLimit then 
    Pf_WorkHoursBetween(ProcessedBy,ArrivedTs,ifnull(SubmitTs,now()))-ProcTimeLimit else 0 end end TimeoutTime
  from Pf_A_BizProcRcd w
  where exists(select 1 from Pf_M_BizNode where ID=w.CurrNode and BizCode in (9,27,28) and Name in ('起草','法律合规部审核'))
	) t
group by ProcessedBy; 

select concat(Pf_OrgShortName(Pf_UsrMainOrgID(ProcessedBy)),' / ',Pf_UsrcName(ProcessedBy)) Processor,sum(RejectCnt) RejectCnt
from (
  select ProcessedBy,BizSeq,CurrNode,count(*)-1 RejectCnt
  from Pf_A_BizProcRcd w
  where exists(select 1 from Pf_M_BizNode where ID=w.CurrNode and BizCode in (9,27,28) and Name in ('起草','法律合规部审核'))
  group by ProcessedBy,BizSeq,CurrNode
	) t
group by ProcessedBy; 


CREATE DEFINER = 'root'@'%' PROCEDURE `Ys_FillTmpFy`(
        IN `pYsZtID` INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT '用临时表技术展示带分组统计行的明细表。\r\n这里是部门预算（X）审批业务处理页用到的费用预算明细表。'
BEGIN
	DECLARE vFgOrgID SMALLINT(5);
    declare vOrgName varchar(200);
    declare vFyLbName varchar(30);
    declare vYsAmt DECIMAL(15,2);
    declare vYsSm varchar(100);
    declare vFyID int;
    declare vXj decimal(15,2);
    declare vZj decimal(15,2);
    
    declare vHc int;
    declare vLoop int DEFAULT 1;
    
    DECLARE done tinyint(1) DEFAULT 0;
    
    DECLARE c1 CURSOR FOR SELECT DISTINCT FgOrgID FROM Ys_A_Fy where ZtID=pYsZtID order by Pf_OrgBigOrd(FgOrgID);
        
    DECLARE c2 CURSOR FOR SELECT Pf_OrgFullName(FgOrgID),Pf_CodeValueByIntCode(13,FyLb),YsAmt,YsSm,ID from Ys_A_Fy where ZtID=PYsZtID and FgOrgID=vFgOrgID order by FyLb; 
               
    declare CONTINUE HANDLER for not found set done = 1;
	
    DROP TEMPORARY table if EXISTS Ys_T_Fy;
	create TEMPORARY table Ys_T_Fy (
      Hc int UNSIGNED not NULL,
      OrgName VARCHAR(200),
      FyLbName VARCHAR(50) not null,
      YsAmt DECIMAL(15,2),
      YsSm varchar(100),
      FyID int ,
      PRIMARY key (Hc)
	) ENGINE=memory
    CHARACTER set 'utf8' COLLATE 'utf8_general_ci';
    
	set vHc=1;
    open c1;
    c1_loop: loop
    	fetch c1 into vFgOrgID;
        if done=1 then 
        	leave c1_loop;
        end if;
		
        set vLoop=1;
        open c2;
    	c2_loop: LOOP
        	fetch c2 into vOrgName,vFyLbName,vYsAmt,vYsSm,vFyID;
            if done=1 then 
            	leave c2_loop;
            end if;
            if vLoop=1 then 
            	insert into Ys_T_Fy values (vHc,vOrgName,vFyLbName,vYsAmt,vYsSm,vFyID);
            else
            	insert into Ys_T_Fy values (vHc,'',vFyLbName,vYsAmt,vYsSm,vFyID); 
            end if;
            set vLoop=vLoop+1;
            set vHc=vHc+1;
    	end loop c2_loop;
        close c2;

        SELECT sum(YsAmt) into vXj from Ys_A_Fy where ZtID=PYsZtID and FgOrgID=vFgOrgID;
        insert into Ys_T_Fy values (vHc,'','小计：',vXj,'',0);
        set vHc=vHc+1;
        set done=0;
    end loop c1_loop;
    close c1;
    
    select sum(YsAmt) into vZj from Ys_A_Fy where ZtID=PYsZtID;
    if vZj is null then 
    	set vZj=0;
    end if;
    insert into Ys_T_Fy values (vHc,'','总计：',vZj,'',0);
END;

import java.awt.Font;
import java.awt.RenderingHints;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.data.general.DefaultPieDataset;

public class JfreeChartDemo 
{
	public static void main(String[] args) 
	{
		DefaultPieDataset dfp = new DefaultPieDataset();
  
		dfp.setValue("开发人员", 110);
		dfp.setValue("测试人员", 8);
		dfp.setValue("人事", 4);
		dfp.setValue("部门经理", 8);
		dfp.setValue("销售人员", 15);
		// 通用的中文问题解决方案
		StandardChartTheme theme = new StandardChartTheme("unicode") 
		{   
			public void apply(JFreeChart chart) 
			{   
				chart.getRenderingHints().put(RenderingHints.KEY_TEXT_ANTIALIASING,RenderingHints.VALUE_TEXT_ANTIALIAS_OFF);   
				super.apply(chart);   
			}   
		}; 
		
		theme.setExtraLargeFont(new Font("宋体", Font.PLAIN, 14));   
		theme.setLargeFont(new Font("宋体", Font.PLAIN, 14));   
		theme.setRegularFont(new Font("宋体", Font.PLAIN, 12));   
		theme.setSmallFont(new Font("宋体", Font.PLAIN, 10));   
		ChartFactory.setChartTheme(theme); 
		
		JFreeChart jfreeChart = ChartFactory.createPieChart("全景人员信息图", dfp,true, true, true);
		
		ChartFrame chartFrame = new ChartFrame("全景人员信息图", jfreeChart, true);
		chartFrame.pack();
		chartFrame.setVisible(true);
	}
}