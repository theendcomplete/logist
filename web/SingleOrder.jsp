<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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

//    java.sql.Connection connection = DriverManager.getConnection("jdbc:mysql://glassfish:3306/logist?useUnicode=true&characterEncoding=utf8", "root", "Slayer123");
    java.sql.Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.32.92:3306/logist?useUnicode=true&characterEncoding=utf8", "root", "Slayer123");
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
    <form action="${pageContext.request.contextPath}/save" method="POST" accept-charset="UTF-8">
        <TR>
            <TD>
                ID
                <%--//id--%>
            </TD>
            <TD>
                <%= resultset.getString("id") %>
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
                <%= resultset.getString("name") %>
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
                <%= resultset.getString("address") %>
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
                <%= resultset.getString("target") %>
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
                <%= resultset.getString("status") %>
                <%--//id--%>
            </TD>

            <TD>

                <select name="status">
                    <option value="new">Новая</option>
                    <option value="delegated">В работе</option>
                    <option value="done">Завершена</option>
                    <option value="cancelled">Отменена</option>
                </select>


            </TD>
        </TR>


        <TR>
            <TD>
                Просили на дату:
                <%--//id--%>
            </TD>
            <TD>
                <%= resultset.getString("date_deadline") %>
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
                <%= resultset.getString("date_appointment") %>
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
                <%= resultset.getString("boxes") %>
                <%--//id--%>
            </TD>

            <TD>

            </TD>
        </TR>

        <TR>
            <TD>
                Путевой лист:
                <%--//id--%>
            </TD>
            <TD>
                <%
                    String put = "НЕТ";
                    if (resultset.getString("putevoi") != null) {
                        if (put.equals("1")) {
                            put = "ДА";
                        } else {
                            put = "НЕТ";
                        }
                    }

                %>
                <%=put%>
                <%--//id--%>
            </TD>

            <TD>

            </TD>
        </TR>

        <TR>
            <TD>
                Платный въезд\парковка:
                <%--//id--%>
            </TD>
            <TD>
                <%
                    String parking = "НЕТ";
                    if (resultset.getString("parking") != null) {
                        if (parking.equals("1")) {
                            parking = "ДА";
                        } else {
                            parking = "НЕТ";
                        }
                    }

                %>
                <%=parking%>
                <%--//id--%>
            </TD>

            <TD>

            </TD>
        </TR>

        <TR>
            <TD>
                Отправлять теплом:
                <%--//id--%>
            </TD>
            <TD>
                <%
                    String heat = "НЕТ";
                    if (resultset.getString("heat") != null) {
                        if (heat.equals("1")) {
                            heat = "ДА";
                        } else {
                            heat = "НЕТ";
                        }
                    }

                %>
                <%=heat%>
                <%--//id--%>
            </TD>

            <TD>

            </TD>
        </TR>

        <TR>
            <TD>
                Оплата за наш счёт:
                <%--//id--%>
            </TD>
            <TD>
                <%
                    String we_pay = "НЕТ";
                    if (resultset.getString("we_pay") != null) {
                        if (we_pay.equals("1")) {
                            we_pay = "ДА";
                        } else {
                            we_pay = "НЕТ";
                        }
                    }

                %>
                <%=we_pay%>
                <%--//id--%>
            </TD>

            <TD>

            </TD>
        </TR>

        <TR>
            <TD>
                Габаритный груз:
                <%--//id--%>
            </TD>
            <TD>
                <%
                    String big = "НЕТ";
                    if (resultset.getString("big") != null) {
                        if (big.equals("1")) {
                            big = "ДА";
                        } else {
                            big = "НЕТ";
                        }
                    }

                %>
                <%=big%>
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
                <%= resultset.getString("driver") %>
                <%--//id--%>
            </TD>


            <TD>
                <select name="driver">
                    <option value="Андрей">Андрей</option>
                    <option value="Владимир">Владимир</option>
                    <option value="Евгений">Евгений</option>
                    <option value="Сергей">Сергей</option>
                    <option value="Константин">Константин</option>
                </select>
            </TD>


        </TR>


        <TR>
            <TD>
                Комментарий:
                <%--//id--%>
            </TD>
            <TD>
                <%= resultset.getString("comment") %>
                <%--//id--%>
            </TD>

            <TD>

            </TD>
        </TR>
        <TR>
            <TD>

            </TD>
            <TD>

            </TD>
            <td>
                <input type="hidden" name="id" value="<%=resultset.getString(1)%>">
                <%--<input type="hidden" name="status" value="delegated">--%>
                <input type="hidden" name="status" value=${pageContext.getAttribute("status")}>
                <%--${pageScope.get("status")}--%>
                <% DateFormat dateFormat = new SimpleDateFormat("yy.MM.dd hh:mm:ss");
                    Date date = new Date();
                    String stringDate = dateFormat.format(date);
                %>
                <input type="hidden" name="date_changed" value='<%=stringDate%>'>
                <%--<input type="hidden" name="date_appontment" value='<%=stringDate%>'>--%>
                <input type="hidden" name="driver" value=${pageContext.getAttribute("driver")}>
                <%--${pageScope.get("driver")}--%>
                <input type="submit" value="Сохранить"/>
            </td>
    </form>
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
