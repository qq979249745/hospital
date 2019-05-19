/*挂号预约系统主要包括基础数据管理、预约管理、查询与统计分析三个子系统,具体要求如下。
1 基础数据管理子系统
    基础数据管理子系统主要包括医生、患者、科室、诊室、号源池、医生排班、预约时段等信息管理。
系统用户按权限分为三种,即管理员、医生和患者。不同的用户拥有不同的权限,各自完成各自的管理功能,不同的用户看到不同的系统功能。
管理员：
（1）	登录功能：通过前台验证用户密码,验证成功后可以登录。
（2）	医生信息管理：具体包括医生信息进行维护。
（3）	患者信息管理：对患者信息进行维护。
（4）	科室信息管理：对医生所在科室进行维护。
（5）	诊室选课管理：对医生所在诊室信息进行维护。
（6）	号源池管理：对医生可预约的号源进行维护。
（7）	医生排班管理：对医生排班信息进行维护。
（8）	预约时段管理：对预约的时段信息进行维护
（9）	查询功能：登录后可查询到以上相应信息。
（10）	修改个人密码功能。
医生：
（1）	登录功能
（2）	基本信息查询：可以对本人信息、本人号源信息以及排班信息进行查询。
（3）	调班管理：可以申请调整排班（例如请假等,即停诊处理）。
（4）	患者队列查询：对患者的预约队列情况进行查询。
2预约管理子系统
本子系统主要针对患者角色。
预约管理具体内容如下：
（1）	信息查询：可以按多种方式对医生、科室的号源情况进行查询。
（2）	挂号预约：进行预约操作。
（3）	取消预约：可以对已经预约的挂号进行取消操作。
（4）	修改预约：可以调整预约信息（例如时段或者医生等）
（5）	诚信度查询：可以查看个人预约信誉度（医院要建立相应的诚信度机制）
3查询与统计分析子系统
（1）	不同角色可以根据相应的角色权限对相应信息进行查询操作。
（2）	管理员可以对患者的预约情况进行相应统计及分析操作,以便制定相应的排班策略。
（3）	能够将统计及分析结果生成相应报表,提供打印功能。*/

drop database if exists hospital;
create database if not exists hospital;
use hospital;
create table if not exists admin (account char(16) primary key ,
                        password char(16),
                        name char(16));
insert into admin values('admin','admin','管理员');
create table if not exists doctor (did int primary key auto_increment,
                        account char(16) ,
                        password char(16),
                        dname char(16),
                        fee int comment '医生出诊费',
                        gender char(2),
                        age tinyint,
                        office char(16),
                        room char(16),
                        career char(8),
                        description varchar(255),
                        picpath varchar(64));


create table if not exists workday (wid int primary key auto_increment,
                        did int comment '医生id',
                        worktime  char(4) comment '医生工作日，星期几',
                        ampm char(4) comment '医生工作日的上午或下午',
                        nsnum int  comment '医生这天上午或下午的号源数',
                        orderednum int  comment '已预约人数',
                        state char(8) comment '状态：已满，预约，停诊，暂无排班',
                        foreign key(did) references doctor(wid));
/*上午8.30-12.30 4*60=240
下午1.30-5.30 4*/
/*create table if not exists numsource (wid int primary key auto_increment,
                        workdayid int comment '工作日id',
                        serialnumber int comment '就诊序号',
                        nstime  time comment '号源时间',
                        state char(8) comment '状态：已被预约，可预约。锁号',
                        foreign key(workdayid) references workday(wid));*/
 create table if not exists recode (rid int primary key auto_increment,
                        pid int comment '病人id',
                        wid int comment '号源id',
                        did int comment '医生id',
                        serialnumber int comment '就诊序号',
                        visittime  datetime comment '就诊时间',
                        ordertime  datetime comment '预约记录的时间',
                        state char(8) comment '预约状态：成功，取消，完成，爽约',
                        foreign key(pid) references patient(wid),
                        foreign key(did) references doctor(wid),
                        foreign key(wid) references workday(wid));

/*
select patient.name as pname,recode.ordertime,recode.state, recode.wid as rid,numsource.serialnumber,numsource.nstime,workday.worktime
from workday,numsource,recode,patient where
workday.did=1 and workday.wid=numsource.workdayid and numsource.wid=recode.nid and recode.pid=patient.wid
order by ordertime desc ;*/
-- insert into numsource  (wid ,workdayid ,serialnumber ,nstime ,state) select null,wid as workdayid, 1,'8:30','可预约' from workday where wid=2;
/*select numsource.wid,numsource.serialnumber,numsource.nstime,numsource.state
from numsource,workday,doctor
where numsource.wid=11 and numsource.workdayid=workday.wid and doctor.wid=workday.did;*/

-- --存储过程 查询号源详情 传入号源id
drop procedure if exists myproc;
delimiter $$
  create  procedure myproc(in s int)
    BEGIN
      select numsource.wid,numsource.serialnumber,date_format(numsource.nstime,'%H:%i') as nstime,numsource.state,
      workday.ampm,date_format(workday.worktime,'%Y年%m月%d日') as worktime,workday.fee,
      doctor.name,doctor.phonenum,doctor.office,doctor.room,doctor.wid as did
      from numsource,workday,doctor
      where numsource.wid=s and numsource.workdayid=workday.wid and doctor.wid=workday.did;
    END
    $$
delimiter ;
-- --使用
SET @s=11;
CALL myproc(@s);
SELECT @s;

-- --查询预约记录时间降序,根据病人id查询
drop procedure if exists myproc1;
delimiter $$
  create  procedure myproc1(in s int)
    BEGIN
      select recode.wid as rid,recode.ordertime,recode.state,
       numsource.serialnumber,date_format(numsource.nstime,'%H:%i') as nstime,
      workday.ampm,date_format(workday.worktime,'%Y年%m月%d日') as worktime,workday.fee,workday.wid as wid,
      doctor.name,doctor.office,doctor.room,doctor.picpath,doctor.wid as did
      from recode,numsource,workday,doctor
      where recode.pid=s and recode.nid=numsource.wid and numsource.workdayid=workday.wid and doctor.wid=workday.did
      order by recode.ordertime desc;
    END
    $$
delimiter ;


create table if not exists patient (wid int primary key auto_increment,
                        account char(16),
                        email char(32) ,
                        password char(32),
                        name char(16),
                        integrity tinyint);
create table if not exists integrity(wid int primary key auto_increment,
                        pid int comment '病人id',
                        dname char(16) comment '医生名字',
                        office char(16) comment '科室名字',
                        time  datetime comment '诚信记录的时间',
                        reason char(32) comment '原因',
                        score tinyint comment '分值',
                        foreign key(pid) references patient(wid));
-- insert into integrity.jsp values (null,1,'ew','123',now(),'jia1fen',-2);
drop trigger if exists setintegrity;
delimiter $$
create trigger setintegrity after insert on integrity for each row
begin
    declare s1 int;
    declare s2 int;
    set s1 = (select integrity from patient where wid=new.pid);
    set s2= s1+new.score;
    if s2>=100 then
      set s2=100;
    end if;
    update patient set integrity=s2 where wid =new.pid;
end $$
delimiter ;

create table if not exists recode (wid int primary key auto_increment,
                        pid int comment '病人id',
                        nid int comment '号源id',
                        ordertime  datetime comment '预约记录的时间',
                        state char(8) comment '预约状态：成功，取消，完成，爽约',
                        foreign key(pid) references patient(wid),
                        foreign key(nid) references numsource(wid));

create table if not exists office (officename char(16) primary key,
                        description varchar(255),
                        doctornum int
                        );
insert into office values ('心血管内科','暂无描述',0);
insert into office values ('内分泌科','暂无描述',0);
insert into office values ('神经内科','暂无描述',0);
insert into office values ('呼吸内科','暂无描述',0);
insert into office values ('血液科','暂无描述',0);
insert into office values ('消化内科','暂无描述',0);
insert into office values ('泌尿外科','暂无描述',0);
insert into office values ('外科','暂无描述',0);
insert into office values ('心胸外科','暂无描述',0);
insert into office values ('神经外科','暂无描述',0);
insert into office values ('肛肠外科','暂无描述',0);
insert into office values ('肝胆胃肠外科','暂无描述',0);
insert into office values ('血管外科','暂无描述',0);
insert into office values ('新生儿专科','暂无描述',0);
insert into office values ('儿科神经内科','暂无描述',0);
insert into office values ('儿童哮喘专科','暂无描述',0);
insert into office values ('儿科泌尿专科','暂无描述',0);
insert into office values ('儿童康复专科','暂无描述',0);
insert into office values ('骨外科','暂无描述',0);
create table if not exists room (wid int primary key auto_increment,
                        officename char(16),
                        roomname char(16),
                        doctornum int,
                        foreign key(officename) references office(officename));

drop trigger fulled;
delimiter $$
create trigger fulled before update on workday for each row
begin
    if new .state!='停诊' then
      if new.orderednum>=new.nsnum   then
        set new.state='已满' ;
      else
        set new.state='预约' ;
      end if;
    end if;
end $$
delimiter ;




















