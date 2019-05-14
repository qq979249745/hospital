package dao;

import bean.Patient;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class PatientDao {
    public boolean update(String set, Object[] o){

        String sql="update patient "+set;
        return DBUtil.executeUpdate(sql,o);

    }
    public boolean insert(Patient patient){
        String sql="insert into patient values(null,?,?,?,?,?)";
        return DBUtil.executeUpdate(sql,new Object[]{patient.getAccount(),
                patient.getEmail(),
                patient.getPassword(),
                patient.getName(),
                patient.getIntegrity()});
    }
    public List<Patient> query(String clounm, String where){
        List<Patient> lists=new ArrayList<>();
        String sql="select * from patient where "+clounm+"=?";
        ResultSet rs=DBUtil.executeQuery(sql,new Object[]{where});
        try {
            while (rs.next()){
                lists.add(new Patient(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeAll();
        }
        return lists;
    }
    public ArrayList<HashMap<String, String>> patientList(String did){
         /*serialnumber int comment '就诊序号',
                visitdate  date comment '就诊日期',
                visitnoon  char(4) comment '就诊上午或下午',
                visittime  time comment '就诊时间',*/
        String sql="select patient.pid, patient.name as pname,recode.ordertime,recode.state, recode.rid,recode.serialnumber,recode.visitdate,recode.visitnoon,recode.visittime " +
                "from recode,patient where " +
                "recode.did=? and recode.pid=patient.pid " +
                "order by ordertime desc";
        ArrayList<HashMap<String, String>> list = DBUtil.getHashmap(sql, new Object[]{did});
        return list;
    }
}
