package bean;

public class NumSource {
    /*上午8.30-12.30 4*60=240
    下午1.30-5.30 4
    create table if not exists numsource (id int primary key auto_increment,
                        workdayid int comment '工作日id',
                        serialnumber int comment '就诊序号',
                        serialnumber int comment '就诊序号',
                        visittime  datetime comment '就诊时间',
                        state char(8) comment '状态：已被预约，可预约',
                        foreign key(workdayid) references workday(id));
                         create table if not exists recode (rid int primary key auto_increment,
                        pid int comment '病人id',
                        wid int comment '工作日id',
                        did int comment '医生id',
                        serialnumber int comment '就诊序号',
                        visitdate  date comment '就诊日期',
                        visitnoon  date comment '就诊上午或下午',
                        visittime  time comment '就诊时间',
                        ordertime  datetime comment '预约记录的时间',
                        state char(8) comment '预约状态：成功，取消，完成，爽约',
                        foreign key(pid) references patient(pid),
                        foreign key(did) references doctor(did),
                        foreign key(wid) references workday(wid));*/
    private String serialnumber;
    private String visitdate;
    private String visitnoon;
    private String visittime;
    private String state;

    public NumSource(String serialnumber, String visitdate, String visitnoon, String visittime, String state) {
        this.serialnumber = serialnumber;
        this.visitdate = visitdate;
        this.visitnoon = visitnoon;
        this.visittime = visittime;
        this.state = state;
    }

    public String getSerialnumber() {
        return serialnumber;
    }

    public void setSerialnumber(String serialnumber) {
        this.serialnumber = serialnumber;
    }

    public String getVisitdate() {
        return visitdate;
    }

    public void setVisitdate(String visitdate) {
        this.visitdate = visitdate;
    }

    public String getVisitnoon() {
        return visitnoon;
    }

    public void setVisitnoon(String visitnoon) {
        this.visitnoon = visitnoon;
    }

    public String getVisittime() {
        return visittime;
    }

    public void setVisittime(String visittime) {
        this.visittime = visittime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
