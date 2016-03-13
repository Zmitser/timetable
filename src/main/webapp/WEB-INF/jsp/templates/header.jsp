<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <a id="logo-container" href="#" class="brand-logo"><spring:message key="app.brand"/></a>
        <ul class="right hide-on-med-and-down">
            <li><a href="<c:url value="/"/>"><spring:message key="app.home"/></a></li>
            <li><a href="<c:url value="/teachers"/>"><spring:message key="app.teachers"/></a></li>
            <li><a href="<c:url value="/students"/>"><spring:message key="app.students"/> </a></li>
            <li><a href="<c:url value="/timetable"/>"><spring:message key="app.timetable"/></a></li>
            <li><a href="<c:url value="/progress"/>"><spring:message key="app.progress"/> </a></li>
            <li><a class="dropdown-button" data-activates="dropdown1">${pageContext.response.locale}<i class="material-icons right">arrow_drop_down</i></a></li>
            <ul id='dropdown1' class='dropdown-content'>
                <li><a onclick="show('en')">English</a></li>
                <li class="divider"></li>
                <li><a onclick="show('ru')">Русский</a></li>
            </ul>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a href="<c:url value="/"/>"><spring:message key="app.home"/></a></li>
            <li><a href="<c:url value="/teachers"/>"><spring:message key="app.teachers"/></a></li>
            <li><a href="<c:url value="/students"/>"><spring:message key="app.students"/> </a></li>
            <li><a href="<c:url value="/timetable"/>"><spring:message key="app.timetable"/></a></li>
            <li><a href="#"><spring:message key="app.progress"/></a></li>
            <li><a class="dropdown-button" data-activates="dropdown2">${pageContext.response.locale}<i class="material-icons right">arrow_drop_down</i></a></li>
            <ul id='dropdown2' class='dropdown-content'>
                <li><a onclick="show('en')">English</a></li>
                <li class="divider"></li>
                <li><a onclick="show('ru')">Русский</a></li>
            </ul>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>
<script type="text/javascript">
    function show(lang) {
        window.location.href = window.location.href.split('?')[0] + '?lang=' + lang;
    }
</script>