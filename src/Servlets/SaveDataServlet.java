package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by theendcomplete on 20.12.2016.
 */
@WebServlet(name = "SaveDataServlet")
public class SaveDataServlet extends HttpServlet {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    //    static final String DB_URL = "jdbc:mysql://glassfish:3306/logist";
    static final String DB_URL = "jdbc:mysql://glassfish:3306/logist?useUnicode=true&characterEncoding=utf8";
//    static final String DB_URL = "jdbc:mysql://glassfish:3306/logist?useUnicode=true&characterEncoding=ISO-8859-1";
//    static final String DB_URL = "jdbc:postgresql://server4:5432/logist";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "Slayer123";
    //  Database credentials
//    static final String USER = "postgres";
//    static final String PASS = "Slayer123";

    public static void InsertData(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        Connection conn = null;
        Statement stmt = null;
        String sql = "";
        java.util.Date date = new SimpleDateFormat("dd.mm.yy").parse(request.getParameter("date_deadline"));
        request.setCharacterEncoding("UTF-8");
        try {
            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
//            Class.forName("org.postgresql.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            //STEP 4: Execute a query
            System.out.println("Creating database...");
            stmt = conn.createStatement();
            stmt.execute("SET CHARACTER SET utf8");
            stmt.execute("SET NAMES utf8");


            if (request.getParameter("id") == null) {
                sql = ("INSERT into ORDERS(name,address,target,status,comment,date_deadline,boxes,kontragent) " +
                        "VALUES ('"
                        + (String.valueOf(request.getParameter("name")) + "','"
                        + request.getParameter("address"))) + "','"
                        + (request.getParameter("target")) + "','"
                        + (request.getParameter("status")) + "','"
                        + (request.getParameter("comment")) + "','"
                        + ((date).toString()) + "','"
                        + Integer.parseInt(request.getParameter("boxes")) + "','"
                        + (request.getParameter("kontragent")) + "')";

//                + ((request.getParameter("date_deadline"))) + "','"
            } else {
                sql = "UPDATE ORDERS set driver =  '" + request.getParameter("driver") + "', status='" + request.getParameter("status") + "' where id =  " + Integer.parseInt(request.getParameter("id"));
            }
//stmt.
//            PreparedStatement preparedStatement = conn.
            stmt.executeUpdate(sql);

            System.out.println("Goodbye!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("error" + e);


        } catch (SQLException e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("error" + e);

        } finally {
            System.out.println("fin!");
            PrintWriter out = response.getWriter();
            out.println("Done");
        }
        System.out.println("Goodbye!");

//        request.getAttribute("javax.servlet.forward.request_uri");
        response.sendRedirect(request.getHeader("referer"));

    }

    public static String decodeGetParameter(String parameter) throws UnsupportedEncodingException {
        return new String(parameter.getBytes("ISO-8859-1"), "UTF8");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.println("save_data_post" + request.getParameterMap());
//        request.setCharacterEncoding("Cp1251");
        try {
            InsertData(request, response);
        } catch (ParseException e) {
            e.printStackTrace();
            out.println("save_error: " + e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
    }
}

