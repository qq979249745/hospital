package servlet.patient;

import bean.Patient;
import dao.IntegrityDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/integrity")
public class Integrity extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String where ="where pid=? order by time desc";
        Patient patient = (Patient) req.getSession().getAttribute("patient");
        IntegrityDao integrityDao=new IntegrityDao();
        List<bean.Integrity> integrities = integrityDao.query(where, new Object[]{patient.getId()});
        req.setAttribute("integrities",integrities);
        req.getRequestDispatcher("integrity.jsp").forward(req,resp);
    }
}
