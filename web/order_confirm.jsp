<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>

<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <meta http-equiv="X-EN-Compatible" content="IE=edge,chrome=1">
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
        String sum = (String) request.getAttribute("sum");
        out.print("Сумма: " + sum);
    %>
</p>

<p>
    <%
        String parking = "off";
        if (request.getAttribute("parking") != null) {
            parking = (String) request.getAttribute("parking");
            if (parking.equals("on")) {
                out.print("Платный въезд/парковка: ДА");
            } else {
                out.print("Платный въезд/парковка: НЕТ");
            }
        }

    %>
</p>

<p>
    <%
        String heat = "off";
        if (request.getAttribute("heat") != null) {
            heat = (String) request.getAttribute("heat");
            if (heat.equals("on")) {
                out.print("Отправлять теплом: ДА");
            } else {
                out.print("Отправлять теплом: НЕТ");
            }
        }

    %>
</p>


<p>
    <%
        String putevoi = "off";
        if (request.getAttribute("putevoi") != null) {
            putevoi = (String) request.getAttribute("putevoi");
            if (putevoi.equals("on")) {
                out.print("Путевой лист: ДА");
            } else {
                out.print("Путевой лист: НЕТ");
            }
        }

    %>
</p>


<p>
    <%
        String we_pay = "off";
        if (request.getAttribute("we_pay") != null) {
            we_pay = (String) request.getAttribute("we_pay");
            if (we_pay.equals("on")) {
                out.print("Отправка за нас счёт: ДА");
            } else {
                out.print("Отправка за нас счёт: НЕТ");
            }
        }

    %>
</p>

<p>
    <%
        String big = "off";
        if (request.getAttribute("big") != null) {
            big = (String) request.getAttribute("big");

            if (big.equals("on")) {
                out.print("Габаритный груз: ДА");
            } else {
                out.print("Габаритный груз: НЕТ");
            }
        }
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
    <input type="hidden" name="parking" value="<%=parking%>">
    <input type="hidden" name="heat" value="<%=heat%>">
    <input type="hidden" name="we_pay" value="<%=we_pay%>">
    <input type="hidden" name="big" value="<%=big%>">
    <input type="hidden" name="sum" value="<%=sum%>">
    <input type="hidden" name="status" value="new">
    <input type="submit" value="Отправить"/>
</form>
</body>
</html>
