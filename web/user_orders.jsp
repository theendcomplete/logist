<%--
  Created by IntelliJ IDEA.
  User: theendcomplete
  Date: 02.01.2017
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
>

<html>
<head>
    <title>История заявок</title>
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

<BODY>

<H3>Выберите параметры отчета</H3>

<form action="${pageContext.request.contextPath}/logist" method="POST">
    <p>


        <%--<select name="driver">--%>
        <%--<option value="Андрей">Андрей</option>--%>
        <%--<option value="Владимир">Владимир</option>--%>
        <%--<option value="Евгений">Евгений</option>--%>
        <%--<option value="Константин">Константин</option>--%>
        <%--</select>--%>

        <%--<select name="status">--%>
        <%--<option value="new">Новые</option>--%>
        <%--<option value="delegated">В работе</option>--%>
        <%--<option value="done">Завершенные</option>--%>
        <%--</select>--%>


        <input type="text" id="date_begin" name="date_begin" placeholder="дата начала отчета (дд.мм.гг)"></p>
    <input type="text" id="date_end" name="date_end" placeholder="дата конца отчета (дд.мм.гг)"></p>
    </p>


    <p>
        <input type="submit" value="Показать"/>
    </p>


</form>


<H3>Список заявок</H3>
<%
    final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
//    Class.forName("com.mysql.jdbc.Driver");
    Class.forName(JDBC_DRIVER);
//    Connection connection = DriverManager.getConnection("jdbc:mysql://glassfish:3306/logist?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=MSK&characterEncoding=utf8", "root", "Slayer123");
    Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.32.92:3306/logist?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&characterEncoding=utf8", "root", "Slayer123");
//    Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.32.92:3306/logist", "root", "Slayer123");
    Statement statement = connection.createStatement();
    statement.execute("SET CHARACTER SET utf8");
    statement.execute("SET NAMES utf8");
    String id = request.getParameter("id");
    String author = request.getParameter("author");
    String status = request.getParameter("status");
    ResultSet resultset =
            statement.executeQuery("SELECT * FROM ORDERS WHERE status = '" + status + "' AND name ='" + author + "'  ORDER BY (`date_deadline`) ASC ");

%>
<TABLE BORDER="1">
    <TR>
        <TH>ID</TH>
        <TH>Заказал</TH>
        <TH>Адрес</TH>
        <TH>Цель поездки</TH>
        <TH>Статус</TH>
        <TH>Исполнить до:</TH>
        <%--<TH>Создана:</TH>--%>
        <%--<TH>Изменена:</TH>--%>
        <%--<TH>Исполнена:</TH>--%>
        <TH>Тарные места</TH>
        <TH>Контрагент</TH>
        <TH>Водитель:</TH>
        <TH>Комментарий:</TH>
        <%--<TH>Комментарий:</TH>--%>

        <%--<TH>Назначить водителя:</TH>--%>
        <%--<TH>Назначить дату :</TH>--%>
    </TR>

    <%

        if (resultset == null) {
            out.println("Извините, ничего не найдено ");
            connection.close();
        } else {
            while (resultset.next()) {
    %>


    <TR>

        <form action="${pageContext.request.contextPath}/singleorder" method="POST" accept-charset="UTF-8">
            <TD>
                <%= resultset.getString(1) %>
                <%--//id--%>
            </TD>
            <TD>
                <%= resultset.getString(2) %>
                <%--//имя--%>
            </TD>
            <TD>
                <%= resultset.getString(3) %>
                <%--//Адрес--%>
            </TD>
            <TD>
                <%= resultset.getString(4) %>
                <%--//Цель/--%>
            </TD>
            <TD>
                <%= resultset.getString(5) %>
                <%--//Статус--%>
            </TD>
            <TD>
                <%= resultset.getString(6) %>
                <%--//дедлайн--%>
            </TD>
            <%--<TD>--%>
            <%--<%= resultset.getString(7) %> //Создана--%>
            <%--</TD>--%>
            <%--<TD>--%>
            <%--<%= resultset.getString(8) %> //Изменена--%>
            <%--</TD>--%>
            <%--<TD>--%>
            <%--<%= resultset.getString(9) %> //Исполнена--%>
            <%--</TD>--%>
            <TD>
                <%= resultset.getString(10) %>
                <%--//тарные места--%>
            </TD>
            <TD>
                <%= resultset.getString(11) %>
                <%--//Контрагент--%>
            </TD>
            <TD>
                <%= resultset.getString(12) %>
                <%--//Водитель--%>
            </TD>
            <TD>
                <%= resultset.getString(13) %>
                <%--//Комментарий--%>
            </TD>
            <%--<td>--%>
            <%--<select name="driver">--%>
            <%--<option value="Андрей">Андрей</option>--%>
            <%--<option value="Владимир">Владимир</option>--%>
            <%--<option value="Евгений">Евгений</option>--%>
            <%--<option value="Константин">Константин</option>--%>
            <%--</select>--%>
            <%--</td>--%>
            <%--<td>--%>
            <%--<input type="text" placeholder="Назначить дату" name="date_appointment" id="date_appointment">--%>


            <%--</td>--%>
            <%
                if (resultset.getString(5).equals("new")) {
            %>

            <%--<td><input type="hidden" name="id" value="<%=resultset.getString(1)%>">--%>
            <%--&lt;%&ndash;<input type="hidden" name="status" value="delegated">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<% DateFormat dateFormat = new SimpleDateFormat("yy.MM.dd hh:mm:ss");&ndash;%&gt;--%>
            <%--&lt;%&ndash;Date date = new Date();&ndash;%&gt;--%>
            <%--&lt;%&ndash;String stringDate = dateFormat.format(date);&ndash;%&gt;--%>
            <%--&lt;%&ndash;%>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<input type="hidden" name="date_changed" value='<%=stringDate%>'>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<input type="hidden" name="driver" value="<%driver;%>">&ndash;%&gt;--%>
            <%--<input type="submit" value="Обработать"/></td>--%>
            <%
                }
            %>
        </form>

    </TR>


    <%
        }
    %>
</TABLE>
<BR>
<%
    }
%>
<% connection.close();%>
</BODY>

</html>
