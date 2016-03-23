<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <h5 class="white-text"><spring:message key="app.our_university"/></h5>
                <p class="grey-text text-lighten-4"><spring:message key="app.dream_spark"/></p>
            </div>
            <div class="col l6 s12 right">
                <h5 class="white-text"><spring:message key="app.sitemap"/></h5>
                <ul>
                    <li><a href="<c:url value="/"/>"><spring:message key="app.home"/></a></li>
                    <li><a href="<c:url value="/teachers"/>"><spring:message key="app.teachers"/></a></li>
                    <li><a href="<c:url value="/students"/>"><spring:message key="app.students"/> </a></li>
                    <li><a href="<c:url value="/timetable"/>"><spring:message key="app.timetable"/></a></li>
                    <li><a href="#"><spring:message key="app.progress"/></a></li>
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
<script src="<c:url value="/webjars/pickadate.js/3.5.6/compressed/picker.js"/>"></script>
<script src="<c:url value="/webjars/pickadate.js/3.5.6/compressed/picker.date.js"/>"></script>



