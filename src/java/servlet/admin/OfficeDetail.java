package servlet.admin;

import bean.Office;
import bean.Room;
import dao.OfficeDao;
import dao.RoomDao;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/officeDetail")
public class OfficeDetail extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String office = Util.nullToString(req.getParameter("office"));
        String action =req.getParameter("action");

        OfficeDao officeDao=new OfficeDao();
        List<Office> list = officeDao.query("officename", office, "");
        RoomDao roomDao=new RoomDao();
        String message = null;
        String roomname =Util.nullToString(req.getParameter("roomname"));
        if("add".equals(action)){

            List<Room> rooms = roomDao.query("roomname", roomname);
            if(rooms.size()==0){
                Room room = new Room("",office, roomname, 0);
                if(roomDao.insert(room)){
                    message=roomname+"添加成功！";
                }else {
                    message=roomname+"添加失败！";
                }
            }else {
                message=roomname+"已存在！";
            }
        }else if("delete".equals(action)){
            if(roomDao.delete(roomname)){
                message="删除成功";
            }else {
                message="删除失败";
            }
        }
        req.setAttribute("message",message);
        List<Room> list1 = roomDao.query("officename", office);
        req.setAttribute("office",list.get(0));
        req.setAttribute("list1",list1);
        req.getRequestDispatcher("officeDetail.jsp").forward(req,resp);
    }
}
