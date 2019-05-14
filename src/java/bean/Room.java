package bean;

public class Room {
    /*icreate table if not exists room (id int primary key auto_increment,
                        officename char(16),
                        roomname char(16),
                        doctornum int,
                        foreign key(officename) references office(officename));*/
    private String id;
    private String officename;
    private String roomname;
    private int doctornum;

    public Room() {
    }

    public Room(String id, String officename, String roomname, int doctornum) {
        this.id = id;
        this.officename = officename;
        this.roomname = roomname;
        this.doctornum = doctornum;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOfficename() {
        return officename;
    }

    public void setOfficename(String officename) {
        this.officename = officename;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public int getDoctornum() {
        return doctornum;
    }

    public void setDoctornum(int doctornum) {
        this.doctornum = doctornum;
    }
}
