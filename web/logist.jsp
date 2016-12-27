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
    <title>Управление заявками</title>
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
<%
    //if(request.getParameter("buttonName") != null) {
    if (request.getParameterNames() != null) {
%>
You clicked
<%= request.getParameter("buttonName") %>
<%
    }
%>


<FORM NAME="form1" METHOD="POST">
    <INPUT TYPE="HIDDEN" NAME="buttonName">
    <INPUT TYPE="BUTTON" VALUE="Button 1" ONCLICK="button1()">
    <INPUT TYPE="BUTTON" VALUE="Button 2" ONCLICK="button2()">
</FORM>

<SCRIPT LANGUAGE="JavaScript">
    <!--
    function button1() {
        document.form1.buttonName.value = "button 1"
//        document.close();
        form1.submit()
    }
    function button2() {
        document.form1.buttonName.value = "button 2"
        form1.submit()
    }
    //     -->
</SCRIPT>

<H3>Новые заявки</H3>

<%

    final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    Class.forName("com.mysql.jdbc.Driver");

    Connection connection = DriverManager.getConnection("jdbc:mysql://glassfish:3306/logist?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=MSK&characterEncoding=utf8", "root", "Slayer123");
//    Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.32.92:3306/logist", "root", "Slayer123");

    Statement statement = connection.createStatement();

    statement.execute("SET CHARACTER SET utf8");
    statement.execute("SET NAMES utf8");

    String id = request.getParameter("id");

    ResultSet resultset =
            statement.executeQuery("SELECT * FROM ORDERS WHERE status = 'new' ORDER BY (`date_deadline`) ASC ");

%>
<TABLE BORDER="1">
    <TR>
        <TH>ID</TH>
        <TH>Заказал</TH>
        <TH>Адрес</TH>
        <TH>Цель поездки</TH>
        <TH>Статус</TH>
        <TH>Испольнить до:</TH>
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

        if (!resultset.next()) {
            out.println("Sorry, could not find that publisher. ");
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
            <td><input type="hidden" name="id" value="<%=resultset.getString(1)%>">
                <%--<input type="hidden" name="status" value="delegated">--%>
                <%--<% DateFormat dateFormat = new SimpleDateFormat("yy.MM.dd hh:mm:ss");--%>
                <%--Date date = new Date();--%>
                <%--String stringDate = dateFormat.format(date);--%>
                <%--%>--%>
                <%--<input type="hidden" name="date_changed" value='<%=stringDate%>'>--%>
                <%--<input type="hidden" name="driver" value="<%driver%>">--%>
                <input type="submit" value="Обработать"/></td>
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
