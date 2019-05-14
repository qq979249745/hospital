package servlet;

import bean.Doctor;
import bean.Office;
import dao.DoctorDao;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/querydoctor")
public class QueryDoctor extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String column=req.getParameter("column");
        String where=req.getParameter("where");
        String pages=req.getParameter("pages");
        DoctorDao doctorDao=new DoctorDao();
        List<Doctor> doctors = doctorDao.query("where "+column+" like ?", new Object[]{"%"+where+"%"});

        JSONArray array=new JSONArray();
        for(Doctor o:doctors){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("gender",o.getGender());
            jsonObject.put("name",o.getDname());
            jsonObject.put("account",o.getAccount());
            jsonObject.put("fee",o.getFee());
            jsonObject.put("age",o.getAge());
            jsonObject.put("office",o.getOffice());
            jsonObject.put("room",o.getRoom());
            jsonObject.put("gender",o.getGender());
            jsonObject.put("career",o.getCareer());
            jsonObject.put("description",o.getDescription());
            jsonObject.put("picPath",o.getPicpath());
            array.put(jsonObject);
        }
        resp.setContentType("application/json; charset=utf-8");
        resp.getWriter().write(array.toString());

        /*req.setAttribute("doctors",doctors);
        req.getRequestDispatcher(req.getContextPath()+"/admin/doctor.jsp").forward(req,resp);*/
    }
}
