package servlet.admin;

import bean.Doctor;
import bean.Office;
import bean.Pages;
import dao.DoctorDao;
import dao.OfficeDao;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/doctorManage")
public class DoctorManage extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String office = Util.nullToString(req.getParameter("office"));
        String name = Util.nullToString(req.getParameter("doctor"));
        String action = Util.nullToString(req.getParameter("action"));
        if("add".equals(action)){
            String message="增加医生失败！";
            DoctorDao doctorDao = new DoctorDao();
            System.out.println(req.getParameter("account"));
            List<Doctor> doctors = doctorDao.query("where account=? ",new Object[]{Util.nullToString(req.getParameter("account"))});
            if(doctors.size()==0){
                Doctor doctor=new Doctor();
                doctor.setAccount(req.getParameter("account"));
                doctor.setPassword(req.getParameter("password"));
                doctor.setDname(req.getParameter("name"));
                doctor.setFee(req.getParameter("fee"));
                doctor.setGender(req.getParameter("gender"));
                doctor.setAge(req.getParameter("age"));
                doctor.setOffice(req.getParameter("office1"));
                doctor.setRoom(req.getParameter("room"));
                doctor.setCareer(req.getParameter("career"));
                doctor.setDescription(req.getParameter("description"));
                doctor.setPicpath(req.getContextPath()+"/images/docpic/default.jpg");
                if(doctorDao.insert(doctor)){
                    message="添加"+req.getParameter("name")+"医生成功!";
                }
            }else {
                message=req.getParameter("account")+"账号已存在！";
            }
            req.setAttribute("message",message);
        }
        int start = Util.nullToZero(req.getParameter("start"));
        DoctorDao doctorDao=new DoctorDao();
        String where="where office like ? and dname like ? ";
        int total=doctorDao.getDoctorCount(where,new Object[]{Util.toLike(office),Util.toLike(name)});
        Pages pages = new Pages(start , total, 6);
        where+="limit "+((pages.getCurrentPage()-1)*6)+",6";
        List<Doctor> doctors = doctorDao.query(where, new Object[]{Util.toLike(office),Util.toLike(name)});
        req.setAttribute("doctors",doctors);
        req.setAttribute("pages",pages);
        req.setAttribute("doctor",name);
        //OfficeDao officeDao=new OfficeDao();
        //List<Office> offices = officeDao.query("officename", office, "");
        req.setAttribute("office",office);
        req.getRequestDispatcher("doctorManage.jsp").forward(req,resp);
    }
}
