drop database if exists hospital;
create database if not exists hospital;
use hospital;
create table if not exists admin (account char(16) primary key ,
                        password char(16),
                        name char(16));
insert into admin values('admin','admin','管理员');

create table if not exists patient (pid int primary key auto_increment,
                        account char(16),
                        email char(32) ,
                        password char(32),
                        name char(16),
                        integrity tinyint);
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
/*insert into office values ('骨外科','暂无描述',0);
insert into room values (null,'骨外科','诊室名字',0);
insert into doctor values (null,'00001','123456','医生名字','医生出诊费','性别','年龄','科室','诊室','职称','描述','/hospital/images/docpic/1.png');*/
create table if not exists workday (wid int primary key auto_increment,
                        did int comment '医生id',
                        worktime  char(4) comment '医生工作日，星期几',
                        ampm char(4) comment '医生工作日的上午或下午',
                        nsnum int  comment '医生这天上午或下午的号源数',
                        state char(8) comment '状态：已满，预约，停诊',
                        foreign key(did) references doctor(did));

create table if not exists apply (aid int primary key auto_increment,
                        did int comment '医生id',
                        dname char(16),
                        wid int,
                        reason char(32) comment '原因',
                        applytime datetime  comment '医生这天上午或下午的号源数',
                        request char(8) comment '状态：申请出诊，申请停诊',
                        state char(8) comment '状态：等待处理，同意，拒绝',
                        foreign key(wid) references workday(wid),
                        foreign key(did) references doctor(did));
drop procedure if exists agreeApply;
delimiter $$
  create  procedure agreeApply(in s int,in aid1 int)
    BEGIN
      declare s1 char(32);
      declare wid1 int;
      set s1 = (select request from apply where aid=aid1);
      set wid1 = (select wid from apply where aid=aid1);
      if '申请出诊'=s1 then
        update workday set state='预约',nsnum=s where wid=wid1;
      end if;
      if '申请停诊'=s1 then
        update workday set state='停诊',nsnum=0 where wid=wid1;
      end if;
      update apply set state='同意' where aid=aid1;
    END
    $$
delimiter ;
 create table if not exists recode (rid int primary key auto_increment,
                        pid int comment '病人id',
                        wid int comment '工作日id',
                        did int comment '医生id',
                        serialnumber int comment '就诊序号',
                        visitdate  date comment '就诊日期',
                        visitnoon  char(4) comment '就诊上午或下午',
                        visittime  time comment '就诊时间',
                        ordertime  datetime comment '预约记录的时间',
                        state char(8) comment '预约状态：成功，取消，完成，爽约',
                        foreign key(pid) references patient(pid),
                        foreign key(did) references doctor(did),
                        foreign key(wid) references workday(wid));

select doctor.office,count(rid) from recode,doctor where date_format(ordertime,'%y-%m-%d')= DATE_SUB(curdate(),INTERVAL 0 day);
select doctor.office,count(doctor.did) from recode,doctor where recode.did=doctor.did group by doctor.office  ;
select doctor.office,count(doctor.did) from office,doctor where office.officename=doctor.office group by doctor.office  ;
select workday.worktime,count(recode.did) from recode,workday where workday.wid=recode.wid group by workday.worktime order by workday.worktime;

-- 显示预约记录
drop procedure if exists orderList;
delimiter $$
  create  procedure orderList(in pid int)
    BEGIN
      select recode.rid,recode.pid,recode.wid,recode.did,recode.serialnumber,recode.visitdate,recode.visitnoon,recode.visittime,recode.ordertime,recode.state,
      doctor.dname,doctor.office,doctor.room,doctor.picpath,doctor.fee
      from recode,doctor
      where recode.pid=pid  and doctor.did=recode.did
      order by recode.ordertime desc;
    END
    $$
delimiter ;
drop table if exists integrity;
create table if not exists integrity(integrityid int primary key auto_increment,
                        pid int comment '病人id',
                        dname char(16) comment '医生名字',
                        office char(16) comment '科室名字',
                        time  datetime comment '诚信记录的时间',
                        reason char(32) comment '原因',
                        score tinyint comment '分值',
                        foreign key(pid) references patient(pid));
-- insert into integrity.jsp values (null,1,'ew','123',now(),'jia1fen',-2);
drop trigger if exists setintegrity;
delimiter $$
create trigger setintegrity after insert on integrity for each row
begin
    declare s1 int;
    declare s2 int;
    set s1 = (select integrity from patient where pid=new.pid);
    set s2= s1+new.score;
    if s2>=100 then
      set s2=100;
    end if;
    update patient set integrity=s2 where pid =new.pid;
end $$
delimiter ;


create table if not exists office (officename char(16) primary key,
                        description varchar(255),
                        doctornum int
                        );

/*insert into office values ('心血管内科','暂无描述',0);
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
insert into office values ('骨外科','暂无描述',0);*/
create table if not exists room (id int primary key auto_increment,
                        officename char(16),
                        roomname char(16),
                        doctornum int,
                        foreign key(officename) references office(officename));
-- 触发器在添加医生后，自动添加默认的排班
drop trigger if exists scheduling;
delimiter $$
create trigger scheduling after insert on doctor for each row
begin
    update office set doctornum=doctornum+1 where officename=new.office;
    update room set doctornum=doctornum+1 where roomname=new.room;
    set @i=0;
    lp : loop
      insert into workday values (null,new.did,@i,'上午',10,'预约');
      insert into workday values (null,new.did,@i,'下午',0,'停诊');
      set @i=@i+1;
      if @i>6 then
        leave lp;
      end if;
    end loop;
end $$
delimiter ;


-- 触发器自动设置状态
/*drop trigger if exists fulled;
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
delimiter ;*/

















