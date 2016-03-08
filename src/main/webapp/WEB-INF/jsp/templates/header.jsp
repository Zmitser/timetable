<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dimka
  Date: 05.03.2016
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="teal" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">СтудКампус</a>
        <ul class="right hide-on-med-and-down">
            <li><a href="<c:url value="/"/>">Главная</a></li>
            <li><a href="<c:url value="/teachers"/>">Преподаватели</a></li>
            <li><a href="<c:url value="/students"/>">Студенты</a></li>
            <li><a href="<c:url value="/timetable"/>">Расписание</a></li>
            <li><a href="#">Успеваемость</a></li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a href="<c:url value="/"/>">Главная</a></li>
            <li><a href="<c:url value="/teachers"/>">Преподаватели</a></li>
            <li><a href="<c:url value="/students"/>">Студенты</a></li>
            <li><a href="<c:url value="/timetable"/>">Расписание</a></li>
            <li><a href="#">Успеваемость</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>