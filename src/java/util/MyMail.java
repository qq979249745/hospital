package util;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public  class MyMail {
    private static final String from="1104764154@qq.com";
    private static final String host = "smtp.qq.com";
    private static final String password = "xemdikbeholzjifc";
    public static boolean sendMail(String to, String content){
        Properties prop = new Properties();
        prop.setProperty("mail.host", host);
        prop.setProperty("mail.smtp.auth", "true");
        prop.setProperty("mail.transport.protocol", "smtp");
        // 开启SSL加密，否则会失败
        try {
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            prop.put("mail.smtp.ssl.enable", "true");
            prop.put("mail.smtp.ssl.socketFactory", sf);
            Session session = Session.getInstance(prop);
            Transport ts = session.getTransport();
            // 连接邮件服务器：邮箱类型，帐号，授权码代替密码（更安全）
            ts.connect(host,from, password);//后面的字符是授权码，用qq密码反正我是失败了（用自己的，别用我的，这个号是我瞎编的，为了。。。。）
            // 创建邮件对象
            MimeMessage message = new MimeMessage(session);
            // 指明邮件的发件人
            message.setFrom(new InternetAddress(from));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 邮件的标题
            message.setSubject("在线预约挂号系统");
            // 邮件的文本内容
            /*int code=100000+(int)(899999*Math.random());
            System.out.println(code);*/
            message.setContent(content, "text/html;charset=UTF-8");
            // 发送邮件
            ts.sendMessage(message, message.getAllRecipients());
            ts.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
