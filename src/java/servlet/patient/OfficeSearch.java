package servlet.patient;

import bean.Office;
import bean.Pages;
import dao.OfficeDao;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchOffice")
public class OfficeSearch extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String office= Util.nullToString(req.getParameter("office"));
        int start=Util.nullToZero(req.getParameter("start"));
        OfficeDao officeDao=new OfficeDao();

        Pages p = new Pages(start , officeDao.getOfficeCount("officename", office),10);
        String limit="limit "+((p.getCurrentPage()-1)*10)+",10";
        List<Office> offices = officeDao.query("officename", office,limit);
        req.setAttribute("offices",offices);
        req.setAttribute("office",office);
        req.setAttribute("pages",p);
        req.getRequestDispatcher("orderOffice.jsp").forward(req,resp);
    }
}
