package servlet.admin;

import bean.Doctor;
import dao.DoctorDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/doctorInfo")
public class DoctorInfo extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*String id = req.getParameter("id");
        DoctorDao doctorDao = new DoctorDao();
        List<Doctor> doctors = doctorDao.query(" where id=?", new Object[]{id});
        if(doctors.size()>0){
            req.setAttribute("doctor",doctors.get(1));
        }
        req.getRequestDispatcher(req.getContextPath()+"/admin/scheduleManage.jsp").forward(req,resp);*/
    }
}
