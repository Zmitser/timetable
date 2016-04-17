<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="page-footer teal">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text"><spring:message code="app.our_university"/></h5>
                <p class="grey-text text-lighten-4"><spring:message code="app.dream_spark"/></p>
            </div>
            <div class="col l6 s12 right">
                <h5 class="white-text"><spring:message code="app.sitemap"/></h5>
                <ul>
                    <li><a href="<spring:url value="/"/>"><spring:message code="app.home"/></a></li>
                    <li><a href="<spring:url value="/teachers"/>"><spring:message code="app.teachers"/></a></li>
                    <li><a href="<spring:url value="/students"/>"><spring:message code="app.students"/> </a></li>
                    <li><a href="<spring:url value="/timetable"/>"><spring:message code="app.timetable"/></a></li>
                    <li><a href="#"><spring:message code="app.progress"/></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            Made by <a class="brown-text text-lighten-3">Dmitry Borysovets</a>
        </div>
    </div>
</footer>
<!--  Scripts-->
<script src="<c:url value="/resources/lib/jquery-form-validator/form-validator/jquery.form-validator.min.js"/>"></script>
<script src="<c:url value="/resources/lib/moment/min/moment-with-locales.min.js"/>"></script>
<script src="<c:url value="/webjars/materializecss/0.97.5/js/materialize.min.js"/>"></script>
<script src="<c:url value="/resources/js/init.js"/>"></script>
<script src="<c:url value="/webjars/noty/2.3.7/js/noty/packaged/jquery.noty.packaged.min.js"/>"></script>
<script src="<c:url value="/resources/js/emailSend.js"/>"></script>




