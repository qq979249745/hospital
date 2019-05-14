package util;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class DBUtil {
    private static  String url="jdbc:mysql://localhost:3306/hospital?characterEncoding=utf8&serverTimezone=UTC";
    private static final String user="root";
    private static final String password="root";
    private static Connection conn=null;
    private static PreparedStatement ps=null;
    private static ResultSet rs=null;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //init();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    private static void init(){
        String sql="create database if not exists hospital";
        executeUpdate(sql,null);
        url="jdbc:mysql://localhost:3306/hospital?characterEncoding=utf8&serverTimezone=UTC";
        /*sql="create table if not exists admin (account char(16) primary key ,password char(16) ,name char(16))";
        try {
           *//* ps=createConn().prepareStatement(sql);
            ps.execute();

            ps.executeBatch();*//*
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll();
        }*/
    }
    public static Connection createConn(){
        try {
            return DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static ResultSet executeQuery(String sql, Object[] params){
        conn=createConn();
        try {
            ps=conn.prepareStatement(sql);
            prepare(ps,params);
            rs=ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    public static boolean executeUpdate(String sql, Object[] params){
        conn=createConn();
        int i=0;
        try {
            ps=conn.prepareStatement(sql);
            prepare(ps,params);
            i=ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll();
        }
        if(i>0)
        return true;
        return false;
    }
    public static int getCount(String sql, Object[] params){
        conn=createConn();
        int i=0;
        try {
            rs=executeQuery(sql,params);
            if(rs.next()){
                i=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll();
        }
        return i;
    }
    public static void Batch(String sql){
        conn=createConn();
        try {
            ps=conn.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void addBatch(Object[] o){
        try {
            prepare(ps,o);
            ps.addBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void executeBatch(){
        try {
            ps.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll();
        }
    }
    private static void prepare(PreparedStatement ps, Object[] params) throws SQLException {
        if(params!=null){
            for(int i=0;i<params.length;i++){
                ps.setObject(i+1,params[i]);
            }
        }
    }
    public static void closeAll(){
        try {
            if(rs!=null)
                rs.close();
            if(ps!=null)
                ps.close();
            if(conn!=null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<HashMap<String, String>> getHashmap(String sql, Object[] params){
        ArrayList<HashMap<String,String>> list=new ArrayList<>();
        ResultSet rs = executeQuery(sql, params);
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while (rs.next()){
                HashMap<String, String> hashMap = new HashMap<>();
                for(int i=1;i<=columnCount;i++){
                    hashMap.put(rsmd.getColumnLabel(i),rs.getString(i));
                }
                list.add(hashMap);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll();
        }
        return list;
    }

    public static void main(String[] args) {
        String sql="select patient.name as pname,recode.ordertime,recode.state, recode.id as rid,numsource.serialnumber,numsource.nstime,workday.worktime\n" +
                "from workday,numsource,recode,patient where\n" +
                "workday.doctorid=? and workday.id=numsource.workdayid and numsource.id=recode.nid and recode.pid=patient.id\n" +
                "order by ordertime desc";
        ArrayList<HashMap<String, String>> hashmap = getHashmap(sql, new Object[]{"1"});
        for (int i=0;i<hashmap.size();i++){
            System.out.println(hashmap.get(i));
        }
    }
}
