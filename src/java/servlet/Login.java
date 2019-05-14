package servlet;

import bean.Admin;
import bean.Doctor;
import bean.Patient;
import dao.AdminDao;
import dao.DoctorDao;
import dao.PatientDao;
import dao.impl.IAdminimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String accounttype = req.getParameter("accounttype");
        req.getSession().removeAttribute("message");
//        System.out.println(url);
        switch (accounttype){
            case "管理员":
                AdminDao adminDao=new IAdminimpl();
                List<Admin> admins = adminDao.getAdmin(account);
                if(admins.size()>0){
                    Admin admin = admins.get(0);
                    if(admin.getPassword().equals(password)){
                        req.getSession().setAttribute("admin",admin);
                        resp.sendRedirect("admin/index.jsp");
                    }
                }
                break;
            case "医生":
                DoctorDao doctorDao=new DoctorDao();
                String where="where account =?";
                List<Doctor> doctors = doctorDao.query(where, new Object[]{account});
                if(doctors.size()>0){
                    Doctor doctor = doctors.get(0);
                    if(doctor.getPassword().equals(password)){
                        req.getSession().setAttribute("doctor",doctor);
                        resp.sendRedirect("doctor");
                        return;
                    }
                }
                req.getSession().setAttribute("message","用户名或密码错误！！");
                req.getRequestDispatcher("doctor/login.jsp").forward(req,resp);
                break;
            case "患者":
                PatientDao patientDao=new PatientDao();
                List<Patient> patients = patientDao.query("account",account);
                if(patients.size()>0){
                    Patient patient = patients.get(0);
                    if(patient.getPassword().equals(password)){
                        req.getSession().setAttribute("patient",patient);
                        String url= (String) req.getSession().getAttribute("url");
                        if(url==null)
                            url="index.jsp";
                        resp.sendRedirect(url);
                        return;
                    }
                }
                req.getSession().setAttribute("message","用户名或密码错误！！");
                resp.sendRedirect("login.jsp");
                break;
        }
    }
}
