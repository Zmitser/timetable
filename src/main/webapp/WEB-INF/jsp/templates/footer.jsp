<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dimka
  Date: 05.03.2016
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="page-footer teal">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Наш университет является одним из участников международной программы DreamSpark
                    Premium</h5>
                <p class="grey-text text-lighten-4">

                    DreamSpark — это программа Майкрософт по поддержке технического образования путем предоставления
                    доступа к программному обеспечению Майкрософт для учебных, преподавательских и исследовательских
                    целей (подробная информация на сайте).

                    Цель программы — бесплатный доступ к профессиональным средствам разработки и проектирования для
                    учащихся и преподавателей в некоммерческих целях для учебы и научно-исследовательской работы.

            </div>
            <div class="col l6 s12 right">
                <h5 class="white-text">Settings</h5>
                <ul>
                    <li><a class="white-text" href="<c:url value="/"/> ">Главная</a></li>
                    <li><a class="white-text" href="<c:url value="/teachers"/>">Преподаватели</a></li>
                    <li><a class="white-text" href="<c:url value="/students"/>">Студенты</a></li>
                    <li><a class="white-text" href="#!">Расписание</a></li>
                    <li><a class="white-text" href="#!">Успеваемость</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            Made by <a class="brown-text text-lighten-3" href="http://materializecss.com">Dmitry Borysovets</a>
        </div>
    </div>
</footer>
<!--  Scripts-->
<script src="<c:url value="/webjars/jquery/2.2.1/jquery.min.js"/> "></script>
<script src="<c:url value="/webjars/materializecss/0.97.5/js/materialize.min.js"/>"></script>
<script src="<c:url value="/resources/js/init.js"/>"></script>
<script src="<c:url value="/resources/js/path.min.js"/>"></script>

