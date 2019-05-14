package servlet.admin;

import bean.Room;
import dao.RoomDao;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/room")
public class RoomManage extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String officename = req.getParameter("officename");
        String roomname = req.getParameter("roomname");
        String message="";
        RoomDao roomDao=new RoomDao();
        List<Room> rooms;
        System.out.println(action);
        System.out.println(officename);
        switch (action){
            case "add":
                rooms= roomDao.query("roomname", roomname);
                if(rooms.size()==0){
                    Room office = new Room("",officename, roomname, 0);
                    if(roomDao.insert(office)){
                        message=roomname+"添加成功！";
                    }else {
                        message=roomname+"添加失败！";
                    }
                }else {
                    message=roomname+"已存在！";
                }
                req.setAttribute("message",message);
                req.getRequestDispatcher("admin/room.jsp").forward(req,resp);
                break;
            case "query":
                rooms = roomDao.query("officename", officename);
                JSONArray array=new JSONArray();
                for(Room room:rooms){
                    JSONObject jsonObject=new JSONObject();
                    jsonObject.put("id",room.getId());
                    jsonObject.put("officename",room.getOfficename());
                    jsonObject.put("roomname",room.getRoomname());
                    jsonObject.put("doctornum",room.getDoctornum());
                    array.put(jsonObject);
                }
                resp.setContentType("application/json; charset=utf-8");
                resp.getWriter().write(array.toString());
        }
    }
}
