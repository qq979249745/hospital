package servlet.admin;

import bean.Office;
import bean.Pages;
import dao.OfficeDao;
import org.json.JSONArray;
import org.json.JSONObject;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/admin/office")
public class OfficeManage extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = Util.nullToString(req.getParameter("action"));
        String message="";
        OfficeDao officeDao=new OfficeDao();
        List<Office> offices;
        switch (action){
            case "add":
                String officename = req.getParameter("officename");
                String description = req.getParameter("description");
                offices= officeDao.query("officename", officename,"");
                if(offices.size()==0){
                    Office office = new Office(officename, description, 0);
                    if(officeDao.insert(office)){
                        message=officename+"添加成功！";
                    }else {
                        message=officename+"添加失败！";
                    }
                }else {
                    message=officename+"已存在！";
                }
                req.setAttribute("message",message);
                //req.getRequestDispatcher("admin/office.jsp").forward(req,resp);
                break;
            case "query":
                offices = officeDao.query("officename", "","");
                JSONArray array=new JSONArray();
                for(Office office:offices){
                    JSONObject jsonObject=new JSONObject();
                    jsonObject.put("officename",office.getOfficename());
                    jsonObject.put("description",office.getDescription());
                    jsonObject.put("doctornum",office.getDoctornum());
                    array.put(jsonObject);
                }
                resp.setContentType("application/json; charset=utf-8");
                resp.getWriter().write(array.toString());
                return;
        }

        String office= Util.nullToString(req.getParameter("office"));
        int start=Util.nullToZero(req.getParameter("start"));
        Pages p = new Pages(start , officeDao.getOfficeCount("officename", office),10);
        String limit="limit "+((p.getCurrentPage()-1)*10)+",10";
        offices = officeDao.query("officename", office,limit);
        req.setAttribute("offices",offices);
        req.setAttribute("office",office);
        req.setAttribute("pages",p);
        req.getRequestDispatcher("office.jsp").forward(req,resp);
    }
}
