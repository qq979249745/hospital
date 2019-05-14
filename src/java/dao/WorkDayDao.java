package dao;

import bean.WorkDay;
import util.DBUtil;
import util.Util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WorkDayDao {
    /* create table if not exists workday (id int primary key auto_increment,
                                        doctorid int comment '医生id',
                                        worktime  date comment '医生工作日',
                                        ampm char(4) comment '医生工作日的上午或下午',
    ordernum int  comment '医生这天上午或下午可预约人数',
    orderednum int  comment '已预约人数',
    state char(8) comment '状态：已满，预约，停诊',
    fee int comment '医生出诊费',
    foreign key(doctorid) references doctor(id));*/
    public boolean insert(WorkDay workDay) {
        Object[] o = new Object[]{
                workDay.getDid(),
                workDay.getWorktime(),
                workDay.getAmpm(),
                workDay.getNsnum(),
                workDay.getState()
        };
        String sql = "insert into workday values(null,?,?,?,?,?)";
        return DBUtil.executeUpdate(sql, o);
    }

    public List<WorkDay> query(String where, Object[] o) {
        List<WorkDay> workDays = new ArrayList<>();
        String sql = "select wid,did,worktime,ampm,nsnum,state from workday  " + where;
        ResultSet rs = DBUtil.executeQuery(sql, o);
        try {
            while (rs.next()) {
                workDays.add(new WorkDay(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll();
        }
        return workDays;
    }
/*
用于显示那个可预约表格的特殊查询方法
 */
    /*public List<WorkDay> queryWorkday(String id) {
        List<WorkDay> workDays = new ArrayList<>();
        String sql = "select wid,did,date_format(worktime,'%m-%d') as worktime,ampm,nsnum,orderednum,state,fee  from workday " +
                " where worktime=? and ampm=? and doctorid=? ";
        Object[] o = new Object[]{"", "", id};
        ResultSet rs=null;
        try {
            for (int i = 1; i <= 16; i++) {
                WorkDay workDay = new WorkDay();
                workDay.setState("暂无排班");
                if(i%2==1){
                    o[0] = Util.getDate(i/2+1);
                    o[1] = "上午";
                }else {
                    o[1] = "下午";
                }
                workDay.setWorktime(Util.getMonth((i-1)/2+1));
                workDay.setOrderednum("");
                workDay.setDid(id);
                workDay.setAmpm((String) o[1]);
                 rs= DBUtil.executeQuery(sql, o);
                if (rs.next()) {
                    workDays.add(new WorkDay(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7)));
                } else {
                    workDays.add(workDay);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll();
        }
        return workDays;
    }*/
    public List<WorkDay> queryWorkday1(String id) {
        List<WorkDay> workDays = new ArrayList<>();
        String sql = "select id,doctorid,date_format(worktime,'%m-%d') as worktime,ampm,ordernum,orderednum,state,fee  from workday " +
                " where worktime>=now() and doctorid=? order by worktime asc";
        Object[] o = new Object[]{id};
        ResultSet rs=null;
        try {
                rs= DBUtil.executeQuery(sql, o);
                while (rs.next()) {
                    workDays.add(new WorkDay(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6)));
                }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll();
        }
        return workDays;
    }
   public boolean update(String set, Object[] o){
        String sql="update workday "+set;
        return DBUtil.executeUpdate(sql,o);
   }

}
