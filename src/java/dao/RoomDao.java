package dao;

import bean.Room;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDao {
    /*private String id;
    private String officename;
    private String roomname;
    private int doctornum;*/
    public boolean insert(Room room){
        Object[] o=new Object[]{
                room.getOfficename(),
                room.getRoomname(),
                room.getDoctornum()};
        String sql="insert into room values(null,?,?,?)";
        return DBUtil.executeUpdate(sql,o);
    }
    public List<Room> query(String clounm, String where){
        List<Room> offices=new ArrayList<>();
        String sql="select * from room where "+clounm+" like ? order by doctornum desc";
        ResultSet rs=DBUtil.executeQuery(sql,new Object[]{"%"+where+"%"});
        try {
            while (rs.next()){
                offices.add(new Room(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //DBUtil.closeAll();
        }
        return offices;
    }
    public boolean delete(String roomname){
        String sql =" delete from room where roomname=?";
        return DBUtil.executeUpdate(sql, new Object[]{roomname});
    }
}
