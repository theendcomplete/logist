<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>

<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <title>Создание заявки на транспортировку</title>
    <meta http-equiv="X-RU-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
</head>
<body>


<H1>Создание заявки на транспортировку</H1>


<form action="${pageContext.request.contextPath}/confirm" method="POST">
    <%--<form action="/save" method="POST">--%>

    <p>
    <h3>
        Ваше имя:</h3>
    <input type="text" name="name" placeholder="Василий Пупкин" value=""/>
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
        Количество тарных мест:
    </h3>

    <p>
        <input type="text" id="boxes" name="boxes" placeholder="1" value="1">
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
