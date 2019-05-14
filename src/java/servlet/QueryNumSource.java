package servlet;

import bean.NumSource;
import bean.Recode;
import bean.WorkDay;
import dao.NumSourceDao;
import dao.RecodeDao;
import dao.WorkDayDao;
import org.json.JSONArray;
import org.json.JSONObject;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet("/queryNumSource")
public class QueryNumSource extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String wid = req.getParameter("wid");
        String ampm = req.getParameter("ampm");
        String date = req.getParameter("date");
        if(wid!=null){
            String where="where wid=?";
            WorkDayDao workDayDao=new WorkDayDao();
            List<WorkDay> workDays = workDayDao.query(where, new Object[]{wid});
            WorkDay workDay = workDays.get(0);

            int nsnum = Integer.valueOf(workDay.getNsnum());
            int size=240/nsnum;
            Calendar calendar=Calendar.getInstance();
            calendar.set(Calendar.MINUTE,30);
            /*上午8.30-12.30 4*60=240
            下午1.30-5.30 4*/
            if("上午".equals(ampm)){
                calendar.set(Calendar.HOUR_OF_DAY,8);
            }else {
                calendar.set(Calendar.HOUR_OF_DAY,13);
            }
//            if(Integer.valueOf(workDay.getWorktime())+1==calendar.get(Calendar.DAY_OF_WEEK)){
//                System.out.println("今天");
//                if(calendar.get(Calendar.HOUR_OF_DAY)<){
//
//                }
//            }

            where=" where wid=? and visitdate=? and visitnoon=? and state='成功' order by serialnumber asc";
            RecodeDao recodeDao=new RecodeDao();
            List<Recode> recodes = recodeDao.query(where, new Object[]{wid, date, ampm});
            List<NumSource> list = new ArrayList<>();
            for (int i=1,j=0;i<=nsnum;i++){
                String time=calendar.get(Calendar.HOUR_OF_DAY)+":"+calendar.get(Calendar.MINUTE);
                NumSource numSource = new NumSource(i + "", date, ampm, time, "可预约");
                if(j<recodes.size()){
                    if(recodes.get(j).getSerialnumber().equals(i+"")){
                        numSource.setState("已被预约");j++;
                    }
                }
                calendar.add(Calendar.MINUTE,size);
                list.add(numSource);
            }
            JSONArray array=new JSONArray();
            for(NumSource o:list){
                JSONObject jsonObject=new JSONObject();
                jsonObject.put("date",o.getVisitdate());
                jsonObject.put("ampm",o.getVisitnoon());
                jsonObject.put("serialnumber",o.getSerialnumber());
                jsonObject.put("state",o.getState());
                jsonObject.put("time",o.getVisittime());
                array.put(jsonObject);
            }
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(array.toString());
        }
    }
}
