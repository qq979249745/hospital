package dao;

import bean.Office;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OfficeDao {
    public boolean insert(Office office){
        Object[] o=new Object[]{office.getOfficename(),
                office.getDescription(),
                office.getDoctornum()};
        String sql="insert into office values(?,?,?)";
        return DBUtil.executeUpdate(sql,o);
    }
    public List<Office> query(String clounm, String where,String limit){
        List<Office> offices=new ArrayList<>();
        String sql="select * from office where "+clounm+" like ? order by doctornum desc "+limit;
        ResultSet rs=DBUtil.executeQuery(sql,new Object[]{"%"+where+"%"});
        try {
            while (rs.next()){
                offices.add(new Office(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //DBUtil.closeAll();
        }
        return offices;
    }
    public int getOfficeCount(String clounm, String where){
        String sql="select count(*) from office where "+clounm+" like ? ";
        return DBUtil.getCount(sql,new Object[]{"%"+where+"%"});
    }
}
