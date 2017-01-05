package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created by theendcomplete on 19.12.2016.
 */
@WebServlet(name = "OrderConfirmServlet")
public class OrderConfirmServlet extends HttpServlet {
    public static String decodeGetParameter(String parameter) throws UnsupportedEncodingException {
        return new String(parameter.getBytes("ISO-8859-1"), "UTF8");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

//        HttpServletRequest req = new HttpServletRequest();
//        PrintWriter out = response.getWriter();
//        out.println("order_confirm_post");

//        String name = decodeGetParameter(request.getParameter("name"));
        String name = request.getParameter("name");
        request.setAttribute("name", name);

//        String last_name = request.getParameter("last_name");
//        request.setAttribute("last_name", last_name);

        String target = (request.getParameter("target"));
        request.setAttribute("target", target);

        String date_deadline = (request.getParameter("date_deadline"));
        request.setAttribute("date_deadline", date_deadline);

        String address = (request.getParameter("address"));
        request.setAttribute("address", address);

        String comment = (request.getParameter("comment"));
        request.setAttribute("comment", comment);

        String sum = (request.getParameter("sum"));
        request.setAttribute("sum", sum);

        String parking = (request.getParameter("parking"));
        request.setAttribute("parking", parking);


        String heat = (request.getParameter("heat"));
        request.setAttribute("heat", heat);

        String putevoi = (request.getParameter("putevoi"));
        request.setAttribute("putevoi", putevoi);


        String we_pay = (request.getParameter("we_pay"));
        request.setAttribute("we_pay", we_pay);


        String big = (request.getParameter("big"));
        request.setAttribute("big", big);

        String kontragent = (request.getParameter("kontragent"));
        request.setAttribute("kontragent", kontragent);

        String boxes = (request.getParameter("boxes"));
        request.setAttribute("boxes", boxes);
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");

        request.getRequestDispatcher("order_confirm.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
    }
}
