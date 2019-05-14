package bean;

public class WorkDay {
   /* create table if not exists workday (wid int primary key auto_increment,
                        did int comment '医生id',
                        worktime  char(4) comment '医生工作日，星期几',
                        ampm char(4) comment '医生工作日的上午或下午',
                        nsnum int  comment '医生这天上午或下午的号源数',
                        orderednum int  comment '已预约人数',
                        state char(8) comment '状态：已满，预约，停诊，暂无排班',
                        foreign key(did) references doctor(did));*/
   private String wid;
   private String did;
   private String worktime;
   private String ampm;
   private String nsnum;
   private String state;

    public WorkDay() {

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

    public String getWorktime() {
        return worktime;
    }

    public void setWorktime(String worktime) {
        this.worktime = worktime;
    }

    public String getAmpm() {
        return ampm;
    }

    public void setAmpm(String ampm) {
        this.ampm = ampm;
    }

    public String getNsnum() {
        return nsnum;
    }

    public void setNsnum(String nsnum) {
        this.nsnum = nsnum;
    }


    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }



    public WorkDay(String wid, String did, String worktime, String ampm, String nsnum, String state) {
        this.wid = wid;
        this.did = did;
        this.worktime = worktime;
        this.ampm = ampm;
        this.nsnum = nsnum;
        this.state = state;
    }
}
