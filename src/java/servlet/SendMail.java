package servlet;

import bean.Patient;
import util.MyMail;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

@WebServlet("/sendmail")
public class SendMail extends HttpServlet {
    @Override
    protected void service(final HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String action = req.getParameter("action");
        switch (action){
            case "checkCode":
                if(Util.isEmail(email)){
                    int code=Util.getCode();
                    if(MyMail.sendMail(email,codeContent(code))){
                        req.getSession().setAttribute("checkCode",code+"");
                        try {
                            //TimerTask实现5分钟后从session中删除checkCode
                            final Timer timer=new Timer();
                            timer.schedule(new TimerTask() {
                                @Override
                                public void run() {
                                    if(req.getSession().getAttribute("checkCode")!=null){
                                        req.getSession().removeAttribute("checkCode");
                                        System.out.println("checkCode删除成功");
                                    }
                                    timer.cancel();
                                }
                            },5*60*1000);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        resp.getWriter().write("发送成功！");
                    }else {
                        resp.getWriter().write("发送失败！");
                    }
                }
                break;
            case "confirm":
                int code=Util.getCode();
                Patient patient = (Patient) req.getSession().getAttribute("patient");
                if(patient!=null){
                    if(MyMail.sendMail(patient.getEmail(),codeConfirm(code))){
                        req.getSession().setAttribute("codeConfirm",code+"");
                        try {
                            //TimerTask实现5分钟后从session中删除checkCode
                            final Timer timer=new Timer();
                            timer.schedule(new TimerTask() {
                                @Override
                                public void run() {
                                    if(req.getSession().getAttribute("codeConfirm")!=null){
                                        req.getSession().removeAttribute("codeConfirm");
                                        System.out.println("checkCode删除成功");
                                    }
                                    timer.cancel();
                                }
                            },5*60*1000);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        resp.getWriter().write("发送成功！");
                    }else {
                        resp.getWriter().write("发送失败！");
                    }
                }
                break;
        }

    }
    private String codeContent(int code){
        return "【在线预约挂号系统】验证码是："+code+"<br>您正在使用注册功能，该验证码仅用于注册验证，请勿泄露给他人使用。5分钟内有效！<br>";
    }
    private String codeConfirm(int code){
        return "【在线预约挂号系统】验证码是："+code+"<br>您正在使用预约功能，该验证码仅用于预约确认验证，请确定你的预约信息。<br>请勿泄露给他人使用。5分钟内有效！<br>";
    }
}
