package util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {
    private static final String format="MM-dd";
    private static final String[] days={"星期天","星期一","星期二","星期三","星期四","星期五","星期六"};
    private static final SimpleDateFormat sdf=new SimpleDateFormat(format);
    public static int getCode(){
        return 100000+(int)(899999*Math.random());
    }
    public static boolean isEmail(String string) {
        if (string == null)
            return false;
        String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern p;
        Matcher m;
        p = Pattern.compile(regEx1);
        m = p.matcher(string);
        if (m.matches())
            return true;
        else
            return false;
    }
    public static String nullToString(String s){
        return s==null?"":s;
    }
    public static int nullToZero(String s){
        return s==null||"".equals(s)?0:Integer.valueOf(s);
    }
    public static String toLike(String s){
        return "%"+s+"%";
    }
    public static String getDate(int day){
        Calendar calendar=Calendar.getInstance();
        int day0fWeek = calendar.get(Calendar.DAY_OF_WEEK)-1;//Calender中星期数是从1开始，星期天是1，星期一是2
        if(day0fWeek>day)//传入的数比今天小
            calendar.add(Calendar.DATE,7);//如期加7天
        calendar.set(Calendar.DAY_OF_WEEK,day+1);
        return calendar.get(Calendar.YEAR)+"-"+(calendar.get(Calendar.MONTH)+1)+"-"+calendar.get(Calendar.DAY_OF_MONTH);
    }
    public static String getMonth(int day){
        Calendar calendar=Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH,day);
        return sdf.format(calendar.getTime());
    }
    public static String getWeek(int day){
        Calendar calendar=Calendar.getInstance();
        int weekday = calendar.get(Calendar.DAY_OF_WEEK)-1;
        if(day==weekday){
            return "今天";
        }else if(day==weekday+1){
            return "明天";
        }
        return days[day];
    }
    public static void main(String[] args) {
        for (int i = 0; i <7; i++) {
            System.out.println(getDate(i));
        }
    }
}
