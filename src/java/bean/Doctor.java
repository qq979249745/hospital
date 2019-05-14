package bean;

public class Doctor{
   /* create table if not exists doctor (did int primary key auto_increment,
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
                        picpath varchar(64));*/
   private String did;
   private String account;
   private String password;
   private String dname;
    private String fee;
    private String gender;
    private String age;
    private String office;
    private String room;
    private String career;
    private String description;
    private String picpath;

    public Doctor() {
    }

    public Doctor(String did, String account, String password, String dname, String fee, String gender, String age, String office, String room, String career, String description, String picpath) {
        this.did = did;
        this.account = account;
        this.password = password;
        this.dname = dname;
        this.fee = fee;
        this.gender = gender;
        this.age = age;
        this.office = office;
        this.room = room;
        this.career = career;
        this.description = description;
        this.picpath = picpath;
    }

    public String getDid() {
        return did;
    }

    public void setDid(String did) {
        this.did = did;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getFee() {
        return fee;
    }

    public void setFee(String fee) {
        this.fee = fee;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicpath() {
        return picpath;
    }

    public void setPicpath(String picpath) {
        this.picpath = picpath;
    }
}
