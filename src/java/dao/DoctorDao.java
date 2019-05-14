package dao;

import bean.Doctor;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoctorDao {
    public boolean insert(Doctor doctor){
        Object[] o=new Object[]{doctor.getAccount(),
                doctor.getPassword(),
                doctor.getDname(),
                doctor.getFee(),
                doctor.getGender(),
                doctor.getAge(),
                doctor.getOffice(),
                doctor.getRoom(),
                doctor.getCareer(),
                doctor.getDescription(),
                doctor.getPicpath()};
        String sql="insert into doctor values(null,?,?,?,?,?,?,?,?,?,?,?)";
        return DBUtil.executeUpdate(sql,o);
    }
    public List<Doctor> query(String where, Object[] o){
        List<Doctor> doctors=new ArrayList<>();
        String sql="select * from doctor "+where;
        ResultSet rs=DBUtil.executeQuery(sql,o);
        try {
            while (rs.next()){
                doctors.add(new Doctor(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeAll();
        }
        return doctors;
    }

    public int getDoctorCount(String where, Object[] o){
        String sql="select count(*) from doctor "+where;
        return DBUtil.getCount(sql,o);
    }
    public boolean update(String set, Object[] o){

        String sql="update doctor "+set;
        return DBUtil.executeUpdate(sql,o);

    }
}
