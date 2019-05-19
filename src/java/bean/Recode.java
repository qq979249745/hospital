package bean;

public class Recode {
    /*create table if not exists recode (rid int primary key auto_increment,
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
    private String rid;
    private String pid;
    private String wid;
    private String did;
    private String serialnumber;
    private String visitdate;
    private String visitnoon;
    private String visittime;
    private String ordertime;
    private String state;

    public Recode(String rid, String pid, String wid, String did, String serialnumber, String visitdate, String visitnoon, String visittime, String ordertime, String state) {
        this.rid = rid;
        this.pid = pid;
        this.wid = wid;
        this.did = did;
        this.serialnumber = serialnumber;
        this.visitdate = visitdate;
        this.visitnoon = visitnoon;
        this.visittime = visittime;
        this.ordertime = ordertime;
        this.state = state;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getWid() {
        return wid;
    }

    public void setWid(String wid) {
        this.wid = wid;
    }

    public String getDid() {
        return did;
    }

    public void setDid(String did) {
        this.did = did;
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

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
