<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>

<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <title>Создание заявки на транспортировку</title>
    <meta http-equiv="X-RU-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


    <%--<!-- this should go after your </body> -->--%>
    <%--<link rel="stylesheet" type="text/css" href="/build/jquery.datetimepicker.css"/>--%>
    <%--<script src="/jquery.js"></script>--%>
    <%--<script src="/build/jquery.datetimepicker.full.min.js"></script>--%>


    <%--//---Рабочий--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#date_deadline").datepicker({
                dateFormat: "dd.mm.yy"
            });
        });
    </script>
    <%--//---Рабочий />--%>
</head>
<body>
<H2>История заявок</H2>
<form action="${pageContext.request.contextPath}/user_orders.jsp" method="POST">
    <input type="text" name="author" placeholder="Введите имя для просмотра истории заявок" value=""
           align="right"/>
    <select name="status">
        <option value="new">Новые</option>
        <option value="delegated">В работе</option>
        <option value="done">Завершенные</option>
    </select>
    <input type="submit" value="Посмотреть заявки"/>
</form>


<H1>Создание заявки на транспортировку</H1>
телефон отдела логистики: 1922 <br>
<%--e-mail: logist@dances.ru--%>
e-mail:<a href="mailto:logist@dances.ru">logist@dances.ru</a>


<form action="${pageContext.request.contextPath}/confirm" method="POST">
    <%--<form action="/save" method="POST">--%>

    <p>
    <h3>
        Ваше имя:</h3>


    <input type="text" name="name" placeholder="Василий Пупкин" value=""/>

    <p>


    </p>


    </p>

    <h3>
        Цель транспортировки:
    </h3>

    <p>
        <select name="target">
            <option value="Доставка клиенту">Доставка клиенту</option>
            <option value="Забрать товар">Забрать товар</option>
            <option value="Другое">Другое</option>
        </select>
    </p>


    <h3>
        Крайний срок:
    </h3>

    <p>
        <input type="text" placeholder="Выберите дату" name="date_deadline" id="date_deadline">


    </p>


    <h3>
        Адрес
    </h3>
    <p>
        <input type="text" id="address" name="address" placeholder="Введите алрес"></p>
    <h3>
        Количество коробок:
    </h3>

    <p>
        <input type="text" id="boxes" name="boxes" placeholder="1" value="1">
    </p>
    <h3>
        Сумма:
    </h3>

    <p>
        <input type="text" id="sum" name="sum" placeholder="0" value="0">
    </p>

    <h3>
        Сумма:
    </h3>
    <p>
        <input type="checkbox" name="putevoi" id="putevoi"> Путевой лист
        <input type="checkbox" name="parking" id="parking"> Платный въезд\парковка
        <input type="checkbox" name="heat" id="heat"> Тепло <BR>
        <input type="checkbox" name="we_pay" id="we_pay"> Отправка за наш счет
        <input type="checkbox" name="big" id="big"> Габаритный груз
    </p>
    <h3>
        Комментарий
    </h3>
    <p>

        <input type="text" id="comment" name="comment" placeholder="Введите комментарий"></p>

    <h3>
        Контрагент:
    </h3>
    <p>
        <input type="text" id="kontragent" name="kontragent" placeholder="Введите имя контрагента\название фирмы"
        >
    </p>

    <p>
        <input type="submit" value="Создать заявку"/>
    </p>
</form>
</body>


</html>
