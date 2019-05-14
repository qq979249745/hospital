package servlet.admin;

import bean.Doctor;
import bean.WorkDay;
import dao.DoctorDao;
import dao.WorkDayDao;
import util.DBUtil;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/scheduleManage")
public class ScheduleManage extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = Util.nullToString(req.getParameter("action"));
        String did = Util.nullToString(req.getParameter("did"));
        DoctorDao doctorDao = new DoctorDao();
        List<Doctor> doctors = doctorDao.query(" where did=?", new Object[]{did});
        if (doctors.size() > 0) {
            req.setAttribute("doctor", doctors.get(0));
        }
        WorkDayDao workDayDao = new WorkDayDao();
        String where = "";
        //修改排班
        if ("alter".equals(action)) {
            String wid = req.getParameter("wid");
            String state = req.getParameter("state");
            String nsnum = req.getParameter("nsnum");

            where = " set state=? , nsnum=? where wid=? ";
            workDayDao.update(where, new Object[]{state, nsnum, wid});
           /* if (workDays1.size() == 0) {
                WorkDay workDay = new WorkDay("", did, worktime, ampm, ordernum, "0", "预约");
                if (workDayDao.insert(workDay)) {
                    message = "添加排班成功!";
                    String sql = "insert into numsource (id ,workdayid ,serialnumber ,nstime ,state) select null,id as workdayid, ?,?,? from workday where worktime=? and ampm=? and doctorid=?";
                    DBUtil.Batch(sql);
                    Calendar calendar=Calendar.getInstance();
                    if("上午".equals(ampm)){
                        calendar.set(Calendar.HOUR_OF_DAY,8);
                    }else {
                        calendar.set(Calendar.HOUR_OF_DAY,13);
                    }
                    calendar.set(Calendar.MINUTE,30);
                    calendar.set(Calendar.SECOND,0);
                    int size=4*60/Integer.valueOf(ordernum);
                    for (int i = 1; i <= Integer.valueOf(ordernum); i++) {
                        String nstime=calendar.get(Calendar.HOUR_OF_DAY)+":"+calendar.get(Calendar.MINUTE);
                        DBUtil.addBatch(new Object[]{i,nstime,"可预约",worktime, ampm, did});
                        calendar.add(Calendar.MINUTE,size);
                    }
                    DBUtil.executeBatch();
                } else {
                    message = "添加排班失败!";
                }
            } else {
                message = worktime + ampm + "已经有排班了!";
            }
            req.setAttribute("message", message);*/
        }
        where =" where did=? order by worktime asc";
        List<WorkDay> workDays = workDayDao.query(where,new Object[]{did});
        req.setAttribute("workDays", workDays);
        req.getRequestDispatcher("scheduleManage.jsp").forward(req, resp);
    }
}
