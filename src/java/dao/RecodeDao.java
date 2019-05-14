package dao;

import bean.Recode;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class RecodeDao {
    public HashMap<String, String> confirm(String id){
        HashMap<String, String> hashMap = new HashMap<>();
        String sql="call myproc(?)";
        ResultSet rs = DBUtil.executeQuery(sql, new Object[]{id});
        try { //id | serialnumber | nstime | state  | ampm | worktime       | fee  | name   | phonenum | office | room
            if(rs.next()){
                hashMap.put("id",rs.getString("id"));
                hashMap.put("did",rs.getString("did"));
                hashMap.put("serialnumber",rs.getString("serialnumber"));
                hashMap.put("nstime",rs.getString("nstime"));
                hashMap.put("state",rs.getString("state"));
                hashMap.put("ampm",rs.getString("ampm"));
                hashMap.put("worktime",rs.getString("worktime"));
                hashMap.put("fee",rs.getString("fee"));
                hashMap.put("name",rs.getString("name"));
                hashMap.put("phonenum",rs.getString("phonenum"));
                hashMap.put("office",rs.getString("office"));
                hashMap.put("room",rs.getString("room"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeAll();
        }
        return hashMap;
    }
    public List<HashMap<String, String>> orderList(String patientid){
        List<HashMap<String, String>> list=new ArrayList<>();
        String sql="call orderList(?)";
        return   DBUtil.getHashmap(sql, new Object[]{patientid});
    }
    public boolean update(String set, Object[] o){
        String sql="update recode "+set;
        return DBUtil.executeUpdate(sql,o);
    }
    public List<Recode> query (String where, Object[] o) {
        String sql ="select * from recode "+where;
        ResultSet rs = DBUtil.executeQuery(sql, o);
        List<Recode> list=new ArrayList<>();
        try {
            while (rs.next()){
                list.add(new Recode(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                        ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeAll();
        }
        return list;
    }
}
