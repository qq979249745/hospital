package servlet.patient;

import bean.Patient;
import bean.Recode;
import dao.RecodeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/orderList")
public class OrderList extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Patient patient= (Patient) req.getSession().getAttribute("patient");
        RecodeDao recodeDao = new RecodeDao();
        /*String where="where pid=? order by ordertime desc";
        List<Recode> list = recodeDao.query(where, new Object[]{patient.getId()});*/
        List<HashMap<String, String>> list = recodeDao.orderList(patient.getId());
        req.setAttribute("list",list);
        req.getRequestDispatcher("orderList.jsp").forward(req,resp);
    }
}
