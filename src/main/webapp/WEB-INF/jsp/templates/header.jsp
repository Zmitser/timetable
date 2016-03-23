<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <form action="<c:url value="/j_spring_security_logout"/>">
                <sec:authorize access="isAuthenticated()">
                    <li><a href="<c:url value="/"/>"><spring:message key="app.home"/></a></li>
                    <li><a href="<c:url value="/teachers"/>"><spring:message key="app.teachers"/></a></li>
                    <li><a href="<c:url value="/students"/>"><spring:message key="app.students"/> </a></li>
                    <li><a href="<c:url value="/timetable"/>"><spring:message key="app.timetable"/></a></li>
                    <li><a href="<c:url value="/progress"/>"><spring:message key="app.progress"/> </a></li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a href="<c:url value="/users"/>">Users</a></li>
                    </sec:authorize>
                    <button type="submit" class="waves-effect waves-teal btn-flat">Logout</button>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <li><a id="demo02" href="#modal-02">README</a></li>
                </sec:authorize>
                <li><a class="dropdown-button" data-activates="dropdown">${pageContext.response.locale}<i
                        class="material-icons right">arrow_drop_down</i></a></li>
                <ul id='dropdown' class='dropdown-content'>
                    <li><a onclick="show('en')">English</a></li>
                    <li class="divider"></li>
                    <li><a onclick="show('ru')">Русский</a></li>
                </ul>
            </form>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <form action="<c:url value="/j_spring_security_logout"/>">
                <sec:authorize access="isAuthenticated()">
                    <li><a href="<c:url value="/"/>"><spring:message key="app.home"/></a></li>
                    <li><a href="<c:url value="/teachers"/>"><spring:message key="app.teachers"/></a></li>
                    <li><a href="<c:url value="/students"/>"><spring:message key="app.students"/> </a></li>
                    <li><a href="<c:url value="/timetable"/>"><spring:message key="app.timetable"/></a></li>
                    <li><a href="<c:url value="/progress"/>"><spring:message key="app.progress"/> </a></li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a href="<c:url value="/users"/>">Users</a></li>
                    </sec:authorize>
                    <button type="submit" class="waves-effect waves-teal btn-flat">Logout</button>
                </sec:authorize>
                <li><a class="dropdown-button" data-activates="dropdown1">${pageContext.response.locale}<i
                        class="material-icons right">arrow_drop_down</i></a></li>
                <ul id='dropdown1' class='dropdown-content'>
                    <li><a onclick="show('en')">English</a></li>
                    <li class="divider"></li>
                    <li><a onclick="show('ru')">Русский</a></li>
                </ul>
            </form>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>
<script type="text/javascript">
    function show(lang) {
        window.location.href = window.location.href.split('?')[0] + '?lang=' + lang;
    }
</script>



