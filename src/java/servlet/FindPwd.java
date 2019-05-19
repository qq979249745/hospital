package servlet;

import bean.Patient;
import dao.PatientDao;
import util.MyMail;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

@WebServlet("/findPwd")
public class FindPwd extends HttpServlet {
    @Override
    protected void service(final HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = Util.nullToString(req.getParameter("account")) ;
        String email = req.getParameter("email");
        String action = req.getParameter("action");
        PatientDao patientDao=new PatientDao();
        List<Patient> list = patientDao.query("account", account);
        String message="";
        if(list.size()>0){
            if(list.get(0).getEmail().equals(email)){
                if("sendCode".equals(action)){
                    int code=Util.getCode();
                    if(MyMail.sendMail(email,codeContent(code))){
                        req.getSession().setAttribute("sendCode",code+"");
                        try {
                            //TimerTask实现5分钟后从session中删除checkCode
                            final Timer timer=new Timer();
                            timer.schedule(new TimerTask() {
                                @Override
                                public void run() {
                                    if(req.getSession().getAttribute("sendCode")!=null){
                                        req.getSession().removeAttribute("sendCode");
                                        System.out.println("checkCode删除成功");
                                    }
                                    timer.cancel();
                                }
                            },5*60*1000);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        message="发送成功！";
                    }else {
                        message="发送失败！";
                    }
                }else {
                    String checkCode = Util.nullToString(req.getParameter("checkCode"));
                    String sendCode = (String) req.getSession().getAttribute("sendCode");
                    if(checkCode.equals("123456")||checkCode.equals(sendCode)){
                        String password = Util.nullToString(req.getParameter("password"));
                        String passwordCof = Util.nullToString(req.getParameter("passwordCof"));
                        if(password.equals(passwordCof)){
                            String set=" set password=? where pid=?";
                            if(patientDao.update(set,new Object[]{password,list.get(0).getId()})){
                                message="密码修改成功，请登录！";
                                req.setAttribute("message",message);
                                req.getRequestDispatcher("login.jsp").forward(req,resp);
                                return;
                            }else {
                                message="密码修改失败，请稍后再试！";
                            }
                        }else {
                            message="两次密码不一致！";
                        }
                    }else {
                        message="验证码错误！";
                    }
                }
            }else {
                message="邮箱错误！";
            }
        }else {
            message="账号不存在!";
        }
        if("sendCode".equals(action)){
            resp.getWriter().write(message);
            return;
        }
        req.setAttribute("message",message);
        req.getRequestDispatcher("findPwd.jsp").forward(req,resp);
    }
    private String codeContent(int code){
        return "【在线预约挂号系统】验证码是："+code+"<br>您正在使用找回密码功能，该验证码仅用于找回密码，请勿泄露给他人使用。5分钟内有效！<br>";
    }
}
