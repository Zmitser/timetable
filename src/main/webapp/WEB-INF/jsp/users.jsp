<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="<c:url value="/resources/lib/webcomponentsjs/webcomponents-lite.min.js"/>"></script>
    <link rel="import" href="<c:url value="/resources/lib/vaadin-core-elements/vaadin-core-elements.html"/>"/>
    <c:import url="fragments/head.jsp"/>
</head>
<body>
<c:import url="fragments/header.jsp"/>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="row">
        <div class="col offset-s5">
            <a class="waves-effect waves-light btn-large" id="add">Добавить пользователя</a>
        </div>
    </div>
</sec:authorize>
<vaadin-grid id="sort" selection-mode="multi">
    <table>
        <!-- Define the columns and their mapping to data properties. -->
        <col name="id" hidden/>
        <col name="email" sortable="true"/>
        <col name="role" sortable="true"/>
        <col/>
        <col/>
        <col/>
        <thead>
        <tr>
            <th></th>
            <th>Email</th>
            <th>Role</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
    </table>
</vaadin-grid>

<div id="modal1" class="modal">
    <form id="detailsForm" method="post" class="col s12">
        <div class="modal-content">
            <h4><spring:message code="app.student_edit"/></h4>
            <div class="row">
                <input value="Имя студента" id="id" name="id" type="hidden" class="validate">
                <div class="row">
                    <div class="input-field col s12">
                        <input value="email" id="email" name="email" type="text"
                               class="validate">
                        <label for="email"><spring:message code="app.email"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input value="role" id="password" name="password" type="password" class="validate">
                        <label for="password"><spring:message code="app.password"/></label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn"><spring:message code="app.save"/></button>
        </div>
    </form>
</div>

<c:import url="fragments/emailSender.jsp"/>
<c:import url="fragments/footer.jsp"/>
<script src="<c:url value="/resources/js/usersTable.js"/>"></script>
<c:import url="fragments/reformal.jsp"/>
</body>
</html>