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
import java.util.Date;

/**
 * Created by theendcomplete on 20.12.2016.
 */
@WebServlet(name = "SaveDataServlet")
public class SaveDataServlet extends HttpServlet {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    //    static final String DB_URL = "jdbc:mysql://glassfish:3306/logist";
//    static final String DB_URL = "jdbc:mysql://glassfish:3306/logist?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=MSK&characterEncoding=utf8";
//    static final String DB_URL = "jdbc:mysql://192.168.32.92:3306/logist?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&characterEncoding=utf8";
    static final String DB_URL = "jdbc:mysql://192.168.32.92:3306/logist?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&characterEncoding=utf8";
//    static final String DB_URL = "jdbc:mysql://192.168.32.92:3306/logist?useUnicode=true&characterEncoding=utf8";
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

        java.util.Date date = new Date();
        String sql = "";
        String dateSql = "";
//        SimpleDateFormat sqlFormat = new SimpleDateFormat("yy.MM.dd hh:mm:ss");
        SimpleDateFormat sqlFormat = new SimpleDateFormat("yy.MM.dd");
        if ((request.getParameter("date_deadline") != null)) {
            date = new SimpleDateFormat("dd.MM.yy").parse(request.getParameter("date_deadline"));
//            sqlFormat = new SimpleDateFormat("yy.mm.dd");
            dateSql = sqlFormat.format((date));
//            date = new SimpleDateFormat("yy.MM.dd hh:mm:ss").parse(dateSql);
        } else if (request.getParameter("id") == null) {
            System.out.println("deadline is null!");
            PrintWriter outError = response.getWriter();
            outError.println("Дата отправки'\'поставки не может быть пустой!!");
        }

        request.setCharacterEncoding("UTF-8");
        try {
            //STEP 2: Register JDBC driver
//            Class.forName("com.mysql.jdbc.Driver");
            Class.forName(JDBC_DRIVER);
//            Class.forName("org.postgresql.Driver");
            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            //STEP 4: Execute a query
            System.out.println("Creating database...");
            stmt = conn.createStatement();
            stmt.execute("SET CHARACTER SET utf8");
            stmt.execute("SET NAMES utf8");
            if (request.getParameter("id") == null) { //создаем новую запись
                sql = ("INSERT into ORDERS(name,address,target,status,comment,sum,date_deadline,boxes,parking,heat,putevoi,we_pay,big,kontragent) " +
                        "VALUES ('"
                        + (String.valueOf(request.getParameter("name")) + "','"
                        + request.getParameter("address"))) + "','"
                        + (request.getParameter("target")) + "','"
                        + (request.getParameter("status")) + "','"
                        + (request.getParameter("comment")) + "','"
                        + (request.getParameter("sum")) + "','"
//                        + ((date).toString()) + "','"
                        + ((dateSql)) + "','"
                        + Integer.parseInt(request.getParameter("boxes")) + "','"
                        + convertStringToInt((request.getParameter("parking"))) + "','"
                        + convertStringToInt((request.getParameter("heat"))) + "','"
                        + convertStringToInt((request.getParameter("putevoi"))) + "','"
                        + convertStringToInt((request.getParameter("we_pay"))) + "','"
                        + convertStringToInt((request.getParameter("big"))) + "','"
//                        + convertStringToInt((request.getParameter("parking"))) + "','"
                        + (request.getParameter("kontragent")) + "')";
//                + ((request.getParameter("date_deadline"))) + "','"
            } else {//изменяем существующую
                date = new SimpleDateFormat("yy.mm.dd").parse(request.getParameter("date_changed"));
                Date dateApp = new SimpleDateFormat("dd.MM.yy").parse(request.getParameter("date_appointment"));
                String dateAppString = sqlFormat.format(dateApp);
                sql = "UPDATE ORDERS set " +
                        "driver =  '" + request.getParameter("driver") + "', " +
                        "status='" + request.getParameter("status") + "', " +
                        "date_changed = '" + sqlFormat.format(date) + "', " +
//                        "date_appointment='" + request.getParameter("date_appointment") + "' " +
                        "date_appointment='" + sqlFormat.format(dateApp) + "' " +
                        "where id =  " + Integer.parseInt(request.getParameter("id"));
            }
//stmt.
//            PreparedStatement preparedStatement = conn.
            stmt.executeUpdate(sql);
            PrintWriter out = response.getWriter();
            out.println("Сохранение данных в базу...");
            System.out.println("Сохранение данных в базу....!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("ОШИБКА ДРАЙВЕРА БАЗЫ ДАННЫХ!  " + e);


        } catch (SQLException e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("ОШИБКА SQL " + e);

        } finally {
//            System.out.println("Закончено!");
            PrintWriter out = response.getWriter();
            out.println("");
            try {
                conn.close();
                System.out.println("connection closed!");
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("error closing connection!");
                PrintWriter outError = response.getWriter();
                outError.println("error closing connection! " + e);
            }
        }

        System.out.println("Goodbye!");
        PrintWriter out = response.getWriter();
        out.println("Сохранение завершено!");

//        request.getAttribute("javax.servlet.forward.request_uri");
//        try {
//            System.out.println("sleeping!");
//            Thread.sleep(4000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        response.sendRedirect(request.getHeader("referer"));

    }

    public static String decodeGetParameter(String parameter) throws UnsupportedEncodingException {
        return new String(parameter.getBytes("ISO-8859-1"), "UTF8");
    }

    public static int convertStringToInt(String param) {
        if (param != null) {
            if (param.equals("on"))
                return 1;
            else return 0;
        } else
            return 0;

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
//        out.println("save_data_post" + request.getParameterMap());
//        request.setCharacterEncoding("Cp1251");
        try {
            InsertData(request, response);
        } catch (ParseException e) {
            e.printStackTrace();
            out.println("Ошибка при сохранении в базу: " + e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
    }

    private String reTurnRequestParameter(HttpServletRequest request, String parameter) {
        if (request.getParameter(parameter) != null) {

            return request.getParameter(parameter);
        } else
            return "";
    }
}

