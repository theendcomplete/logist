<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%--
  Created by IntelliJ IDEA.
  User: theendcomplete
  Date: 27.12.2016
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Отправить в работу</title>


    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#date_appointment").datepicker({
                dateFormat: "dd.mm.yy"
            });
        });
    </script>


</head>
<body>


<%

    final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    Class.forName("com.mysql.jdbc.Driver");

    java.sql.Connection connection = DriverManager.getConnection("jdbc:mysql://glassfish:3306/logist?useUnicode=true&characterEncoding=utf8", "root", "Slayer123");
//    Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.32.92:3306/logist", "root", "Slayer123");

    Statement statement = connection.createStatement();

    statement.execute("SET CHARACTER SET utf8");
    statement.execute("SET NAMES utf8");

    String id = request.getParameter("id");
    System.out.println(id);

    String sql = "SELECT * FROM ORDERS WHERE id = '" + id + "'";
//    PreparedStatement stt = connection.prepareStatement(sql);
//    stt.setInt(1, Integer.parseInt(id));
    ResultSet resultset = statement.executeQuery(sql);
%>
<TABLE BORDER="1">
    <TR>


        <TH>Поле</TH>
        <TH>В заявке сейчас</TH>
        <TH>Изменить на</TH>
    </TR>

    <%

        if (!resultset.next()) {
            out.println("Sorry, could not find that publisher. ");
            connection.close();
        } else {
//            while (resultset.next()) {
    %>
    <TR>
        <TD>
            ID
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(1) %>
            <%--//id--%>
        </TD>
        <TD>

        </TD>

    </TR>

    <TR>
        <TD>
            Заказал
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(2) %>
            <%--//id--%>
        </TD>
        <TD>

        </TD>

    </TR>

    <TR>
        <TD>
            Адрес назначения:
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(3) %>
            <%--//id--%>
        </TD>

        <TD>

        </TD>
    </TR>


    <TR>
        <TD>
            Цель поездки:
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(4) %>
            <%--//id--%>
        </TD>

        <TD>

        </TD>
    </TR>

    <TR>
        <TD>
            Статус:
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(5) %>
            <%--//id--%>
        </TD>

        <TD>

        </TD>
    </TR>


    <TR>
        <TD>
            Просили на дату:
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(6) %>
            <%--//id--%>
        </TD>

        <TD>

        </TD>
    </TR>

    <TR>
        <TD>
            Когда поедет:
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(14) %>
            <%--//id--%>
        </TD>

        <TD>
            <input type="text" placeholder="Назначить дату" name="date_appointment" id="date_appointment">

        </TD>
    </TR>

    <TR>
        <TD>
            Тарные места:
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(10) %>
            <%--//id--%>
        </TD>

        <TD>

        </TD>
    </TR>


    <TR>
        <TD>
            Водитель:
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(12) %>
            <%--//id--%>
        </TD>

        <TD>

        </TD>
    </TR>


    <TR>
        <TD>
            Комментарий:
            <%--//id--%>
        </TD>
        <TD>
            <%= resultset.getString(13) %>
            <%--//id--%>
        </TD>

        <TD>

        </TD>
    </TR>


    <%
        }
    %>
</TABLE>
<BR>
<%
    //    }
%>
<% connection.close();%>
</BODY>
</html>
