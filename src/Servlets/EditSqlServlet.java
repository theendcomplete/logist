//package Servlets;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.sql.Statement;
//
///**
// * Created by theendcomplete on 23.12.2016.
// */
//@WebServlet(name = "EditSqlServlet")
//public class EditSqlServlet extends HttpServlet {
//
//    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
//    static final String DB_URL = "jdbc:mysql://glassfish:3306/logist?useUnicode=true&characterEncoding=utf8";
//    //  Database credentials
//    static final String USER = "root";
//    static final String PASS = "Slayer123";
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//
//
//        public static int EditRecord(HttpServletRequest request, HttpServletResponse response) throws IOException {
//            Connection conn = null;
//            Statement stmt = null;
//            request.setCharacterEncoding("UTF-8");
//            try {
//                //STEP 2: Register JDBC driver
//                Class.forName("com.mysql.jdbc.Driver");
//                //STEP 3: Open a connection
//                System.out.println("Connecting to database...");
//                conn = DriverManager.getConnection(DB_URL, USER, PASS);
//
//                //STEP 4: Execute a query
//                System.out.println("Creating database...");
//                stmt = conn.createStatement();
//                stmt.execute("SET CHARACTER SET utf8");
//                stmt.execute("SET NAMES utf8");
//
//
////            String sql = "insert into orders(name) VALUES (666)"; //+ request.getParameter("first_name")+")";
////            int boxes = Integer.parseInt(request.getParameter("boxes"));
//
//                String sql = "INSERT into ORDERS(name,address,target,status,comment,date_deadline,boxes,kontragent) VALUES ('"
//                        + (String.valueOf(request.getParameter("name")) + "','"
//                        + (request.getParameter("address"))) + "','"
//                        + (request.getParameter("target")) + "','"
//                        + (request.getParameter("status")) + "','"
//                        + (request.getParameter("comment")) + "','"
//                        + ((request.getParameter("date_deadline"))) + "','"
////                    + ((request.getParameter("boxes"))) + "','"
//                        + Integer.parseInt(request.getParameter("boxes")) + "','"
//                        + (request.getParameter("kontragent")) + "');";
//                stmt.executeUpdate(sql);
//
//                System.out.println("Goodbye!");
//            } catch (ClassNotFoundException e) {
//                e.printStackTrace();
//                PrintWriter out = response.getWriter();
//                out.println("error" + e);
//
//
//            } catch (SQLException e) {
//                e.printStackTrace();
//                PrintWriter out = response.getWriter();
//                out.println("error" + e);
//            } finally {
//                System.out.println("fin!");
//                PrintWriter out = response.getWriter();
//                out.println("Done");
//            }
//            System.out.println("Goodbye!");
//            return 0;
//
//
//    }
//}
