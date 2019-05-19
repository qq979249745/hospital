package servlet.doctor;

import bean.Doctor;
import bean.Integrity;
import dao.IntegrityDao;
import dao.PatientDao;
import dao.RecodeDao;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/doctor/patientList")
public class PatientList extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = Util.nullToString(req.getParameter("action"));
        Doctor doctor = (Doctor) req.getSession().getAttribute("doctor");
        String rid = Util.nullToString(req.getParameter("rid"));
        String pid = Util.nullToString(req.getParameter("pid"));
        RecodeDao recodeDao = new RecodeDao();
        IntegrityDao integrityDao = new IntegrityDao();
        Integrity integrity;
        String set;
        switch (action){
            case "finish":
                set = "set state ='完成' where rid=?";
                recodeDao.update(set,new Object[]{rid});
                integrity = new Integrity("", pid, doctor.getDname(), doctor.getOffice(), "", "完成预约", "10");
                integrityDao.insert(integrity);
                break;
            case "sy":
                set = "set state ='爽约' where rid=?";
                recodeDao.update(set,new Object[]{rid});
                integrity = new Integrity("", pid, doctor.getDname(), doctor.getOffice(), "", "爽约", "-10");
                integrityDao.insert(integrity);
                break;
        }
        PatientDao patientDao = new PatientDao();

        ArrayList<HashMap<String, String>> list = patientDao.patientList(doctor.getDid());
        req.setAttribute("list",list);
        req.getRequestDispatcher("patientList.jsp").forward(req,resp);
    }
}
