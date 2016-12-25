<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>

<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <meta http-equiv="X-RU-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


    <title>Подтвердите заявку</title>
</head>
<body>
<%--${params['name']}--%>

<H1>Подтвердите заявку</H1>

<p>
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");


    %>
    <%
        String name = (String) request.getAttribute("name");
        out.print("Ваше имя: " + name);
    %>
</p>

<%--<p>--%>
<%--<%--%>
<%--String last_name = (String) request.getAttribute("last_name");--%>
<%--out.print("last name name " + last_name);--%>
<%--%>--%>
<%--</p>--%>
<%--${pageContext.getAttribute()['target']}--%>

<p>
    <%
        String target = (String) request.getAttribute("target");
        out.print("Цель поездки: " + target);
    %>
</p>

<p>
    <%
        String boxes = (String) request.getAttribute("boxes");
        out.print("Количество тарных мест: " + boxes);
    %>
</p>

<p>
    <%
        String date_deadline = (String) request.getAttribute("date_deadline");
        out.print("Исполнить до: " + date_deadline);
    %>
</p>

<p>
    <%
        String address = (String) request.getAttribute("address");
        out.print("Адрес: " + address);
    %>
</p>

<p>
    <%
        String comment = (String) request.getAttribute("comment");
        out.print("Комментарий: " + comment);
    %>
</p>

<p>
    <%
        String kontragent = (String) request.getAttribute("kontragent");
        out.print("Контрагент: " + kontragent);
    %>
</p>

<%--<form action="${pageContext.request.contextPath}/save" method="POST">--%>
<form action="${pageContext.request.contextPath}/save" method="POST">
    <input type="hidden" name="name" value="<%=name%>">
    <input type="hidden" name="target" value="<%=target%>">
    <input type="hidden" name="date_deadline" value="<%=date_deadline%>">
    <input type="hidden" name="address" value="<%=address%>">
    <input type="hidden" name="comment" value="<%=comment%>">
    <input type="hidden" name="kontragent" value="<%=kontragent%>">
    <input type="hidden" name="boxes" value="<%=boxes%>">
    <input type="hidden" name="status" value="new">
    <input type="submit" value="SAVE"/>
</form>
</body>
</html>
