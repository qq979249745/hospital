package servlet.patient;

import bean.Doctor;
import bean.NumSource;
import bean.Patient;
import bean.Recode;
import dao.DoctorDao;
import dao.NumSourceDao;
import dao.RecodeDao;
import util.DBUtil;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

@WebServlet("/order")
public class Order extends HttpServlet {
    private HttpServletRequest req;
    private HttpServletResponse resp;
    private RecodeDao recodeDao = new RecodeDao();
    private NumSourceDao numSourceDao = new NumSourceDao();
    Patient patient;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.req = req;
        this.resp = resp;
        patient = (Patient) req.getSession().getAttribute("patient");

        String wid = req.getParameter("wid");//工作日id
        String did = req.getParameter("did");//工作日id
        String action = req.getParameter("action");
        String checkcode = Util.nullToString(req.getParameter("checkcode"));
        String rid = req.getParameter("rid");//记录的id
        String data = Util.nullToString(req.getParameter("data"));//就诊序号
        String[] strings = data.split(",");
        switch (action) {
            case "checkcode"://预约验证码
                String codeConfirm = (String) req.getSession().getAttribute("codeConfirm");
                //resp.setContentType("application/json; charset=utf-8");
                if (checkcode.equals("123456") || checkcode.equals(codeConfirm)) {
                    resp.getWriter().write("true");
                } else {
                    resp.getWriter().write("false");
                }
                break;
            case "order"://准备预约
                NumSource numSource = new NumSource(strings[0], strings[1], strings[2], strings[3], wid);
                //HashMap<String, String> hashMap = recodeDao.confirm(id);
                DoctorDao doctorDao=new DoctorDao();
                List<Doctor> doctors = doctorDao.query(" where did=?", new Object[]{did});
                req.getSession().setAttribute("numSource", numSource);
                req.setAttribute("doctor", doctors.get(0));
                req.getRequestDispatcher("confirmOrder.jsp").forward(req, resp);
                break;
            case "confirm"://完成预约
                if(Integer.valueOf(patient.getIntegrity())<=70){
                    req.getSession().setAttribute("message", "预约失败，你的诚信度低于70分！");
                    req.getRequestDispatcher("orderList").forward(req, resp);
                }else {
                    confirm(did);
                }
                break;
            case "alter"://修改预约
                String set =" set serialnumber=? , visittime=? , ordertime=now() where rid=?";

                System.out.println(recodeDao.update(set,new Object[]{strings[0],strings[3],rid}));
                /*String sql = "update numsource set state='可预约' where id=?";//id,rid
                DBUtil.executeUpdate(sql, new Object[]{wid});
                sql = "update recode set nid=?, ordertime=now() where id=?";
                DBUtil.executeUpdate(sql, new Object[]{wid, rid});*/
                req.getRequestDispatcher("orderList").forward(req, resp);
                break;
            case "cancel":
                String set1 =" set state='取消' where rid=?";
                recodeDao.update(set1,new Object[]{rid});
                /*String sql = "update numsource set state='可预约' where id=?";//id,rid
                DBUtil.executeUpdate(sql, new Object[]{wid});
                sql = "update recode set nid=?, ordertime=now() where id=?";
                DBUtil.executeUpdate(sql, new Object[]{wid, rid});*/

                req.getRequestDispatcher("orderList").forward(req, resp);
                break;
        }


    }

    private void confirm(String did) throws ServletException, IOException {
        NumSource numSource = (NumSource) req.getSession().getAttribute("numSource");
        String where = "where wid=? and visitdate=? and visitnoon=? and visittime=? and state='成功'";
        RecodeDao recodeDao = new RecodeDao();
        List<Recode> list = recodeDao.query(where, new Object[]{numSource.getState(),numSource.getVisitdate(),numSource.getVisitnoon(),numSource.getVisittime()});
        //String did = Util.nullToString(req.getParameter("did"));//医生id

        if (list.size() == 0) {
            //new Recode("",patient.getId(),numSource.getState(),did,numSource)
            if(numSourceDao.order(patient.getId(), did,numSource)){
                req.getSession().setAttribute("message", "预约成功！");
                req.getRequestDispatcher("orderList").forward(req, resp);
            } else {
                req.getSession().setAttribute("message", "预约失败！");
                req.getRequestDispatcher("showWeek?did=" + did).forward(req, resp);
            }
        } else {
            req.getSession().setAttribute("message", "号源已被预约！");
            req.getRequestDispatcher("showWeek?did=" + did).forward(req, resp);
        }
    }

    private void cancel(String rid) {
        /*String sql="update recode  set state='取消' where id="+rid;
        recodeDao.update(set,new Object[]{rid});
        sql="update  numcource  set state ='可预约' where id="+id;
        numSourceDao.update(set,new Object[]{id});
        sql="update workday set orderednum=orderednum-1 where id=(select workdayid from numsource where id='"+id+"')";*/
        Connection conn = DBUtil.createConn();
        Statement statement = null;
        String sql = "update recode  set state='取消' where id=" + rid;
        try {
            statement = conn.createStatement();
            statement.addBatch(sql);
            sql = "update  numsource  set state ='可预约' where id=(select nid from recode where id='" + rid + "')";
            statement.addBatch(sql);
            sql = "update workday set orderednum=orderednum-1 where id=(select workdayid from numsource where id=(select nid from recode where id='" + rid + "'))";
            statement.addBatch(sql);
            statement.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                statement.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
